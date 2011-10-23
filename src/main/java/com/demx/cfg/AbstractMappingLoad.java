package com.demx.cfg;

import com.demx.cfg.exception.MappingException;
import com.demx.cfg.util.XMLHelper;
import org.apache.log4j.Logger;
import org.xml.sax.InputSource;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;
import java.util.jar.JarFile;
import java.util.zip.ZipEntry;

/**
 * AbstractMappingLoad是Configuration中Mapping解析的Load程序接口<BR>
 * 本程序支持以下方法的文件访问.<BR>
 * 在压缩文件中所有文件.<BR>
 * 在物理目录中的所有文件<BR>
 * 单独文件<BR>
 * 单独文件流
 */
public abstract class AbstractMappingLoad {

    protected boolean valid;

    protected String descName;


    public AbstractMappingLoad() {
    }


    protected Registry registry = Registry.getRegistry();

    private static Logger log = Logger.getLogger(AbstractMappingLoad.class);

    public AbstractMappingLoad addJar(String resource)
            throws MappingException {
        return addJar(new File(
                Thread.currentThread().getContextClassLoader().getResource(resource).getFile()
        ));
    }

    public AbstractMappingLoad addJar(File jar)
            throws MappingException {
        log.info(" ::正在在JAR文件 <" + jar.getName() + "> 中遍历配置文件...::");
        final JarFile jarFile;
        try {
            jarFile = new JarFile(jar);
        } catch (IOException ioe) {
            throw new MappingException(" ::装载配置JAR文件 <" + jar.getName() + "> 错误::", ioe);
        }
        Enumeration enumer = jarFile.entries();
        while (enumer.hasMoreElements()) {
            ZipEntry ze = (ZipEntry) enumer.nextElement();
            String zeName = ze.getName();
            if (zeName.endsWith(descName)) {
                log.info(" ::在配置JAR文件中找到配置文件 <" + ze.getName() + "> ::");
                try {
                    if (descName.endsWith("xml")) {
                        addInputStream(jarFile.getInputStream(ze));
                    } else if (descName.endsWith("properties")) {
                        addPropsInputStream(zeName.substring(0, zeName.length() - descName.length()), jarFile.getInputStream(ze));
                    }
                } catch (MappingException me) {
                    throw me;
                } catch (Exception e) {
                    log.error("Could not configure file from jar", e);
                    throw new MappingException(e);
                }
            }
        }
        return this;
    }

    public AbstractMappingLoad addDirectory(File dir)
            throws MappingException {
        File[] files = dir.listFiles();
        for (int i = 0; i < files.length; i++) {
            if (files[i].isDirectory()) {
                addDirectory(files[i]);
            } else if (files[i].getName().endsWith(descName)) {
                addFile(files[i]);
            }
        }
        return this;
    }

    public AbstractMappingLoad addPropsInputStream(String name, InputStream in)
            throws MappingException {
        try {
            Properties props = new Properties();
            props.load(in);
            add(name, props);
        } catch (MappingException ex) {
            throw new MappingException("the Mapping parse error", ex);
        } catch (IOException ex) {
            throw new MappingException("the Mapping file not found", ex);
        }
        return this;
    }

    public AbstractMappingLoad addInputStream(InputStream xmlInputStream)
            throws MappingException {
        try {
            List errors = new ArrayList();
            add(XMLHelper.createSAXReader("XML InputStream", errors, valid).read(new InputSource(xmlInputStream)));
            if (errors.size() != 0) {
                throw new MappingException("invalid mapping", (Throwable) errors.get(0));
            }
        } catch (MappingException me) {
            throw me;
        } catch (Exception e) {
            log.error("Could not configure file from input stream", e);
            throw new MappingException(e);
        }
        return this;
    }

    public AbstractMappingLoad addProps(String propsFile)
            throws MappingException {
        try {
            InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream(propsFile);
            Properties props = new Properties();
            props.load(in);
            add(propsFile.substring(0, propsFile.length() - descName.length()), props);
        } catch (IOException ex) {
            throw new MappingException("Properties not found", ex);
        }
        return this;
    }

    public void add(String name, Properties props)
            throws MappingException {
    }

    public AbstractMappingLoad addFile(String xmlFile)
            throws MappingException {
        log.info("::------此配置解析来源文件为 " + xmlFile + "::");
        try {
            List errors = new ArrayList();
            add(XMLHelper.createSAXReader(xmlFile, errors, valid).read(Thread.currentThread().getContextClassLoader().getResourceAsStream(xmlFile)));
            if (errors.size() != 0) {
                throw new MappingException("invalid mapping", (Throwable) errors.get(0));
            }
            return this;
        } catch (Exception e) {
            log.error("Could not configure file from file: " + xmlFile, e);
            throw new MappingException(e);
        }
    }

    public AbstractMappingLoad addFile(File xmlFile)
            throws MappingException {
        log.info("Mapping file: " + xmlFile.getPath());
        try {
            addInputStream(new FileInputStream(xmlFile));
        } catch (Exception e) {
            log.error("Could not configure file from file: " + xmlFile.getPath(), e);
            throw new MappingException(e);
        }
        return this;
    }

    protected abstract void configure(org.dom4j.Document doc)
            throws MappingException;

    protected abstract void add(org.dom4j.Document doc)
            throws MappingException;
}
