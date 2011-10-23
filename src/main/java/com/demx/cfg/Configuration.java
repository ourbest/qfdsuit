package com.demx.cfg;

import com.demx.cfg.exception.MappingException;
import com.demx.cfg.mapping.agent.CfgManagerAgent;
import com.demx.cfg.mapping.vo.Cfgable;
import com.demx.cfg.mapping.vo.Config;
import org.apache.log4j.Logger;

import java.util.Iterator;
import java.util.Set;

/**
 * Configuration是PTF3中Configuration的初始化工具<BR>
 * Configuration的目的以下<BR>
 * Configuration本身就是一个Configuration的Agent.<BR>
 * Configuration由程序指定的解析器来解析，而不是被配置的.<BR>
 * Configuration自己的解析器进行Configuration项的解析，并进行逐个注册Agent的解析工作
 */
class Configuration {

    /**
     * Log实例
     */
    private static Logger log = Logger.getLogger(Configuration.class);

    /**
     * 默认构造器
     */
    private Configuration() {
    }

    /**
     * 单子实例
     */
    private static Configuration instance = new Configuration();

    /**
     * 初始化并获得注册表
     */
    private static Registry registry = Registry.getRegistry();

    /**
     * 单子工厂方法
     *
     * @return Configuration
     */
    public static synchronized Configuration getConfig() {
        if (instance == null) {
            instance = new Configuration();
        }
        return instance;
    }

    private static String startFile;

    /**
     * @param aStartFile - the new value for startFile
     */
    public void setStartFile(String aStartFile) {
        startFile = aStartFile;
        /**
         * 初始化Configuration的Agent
         */
        try {
            initCfg();
        } catch (MappingException ex) {
            log.error("configuration init error", ex);
        }
    }

    /**
     * 按照Configuration所管理的Agent逐一解析和注册Domain到注册表
     *
     * @throws MappingException
     */
    public void parseRegistry()
            throws MappingException {
        String clazzname = "";
        String name = "";
        String path = "";
        boolean active = false;
        String inside = "";
        Cfgable cfgable = (Cfgable) registry.getDomain(CfgManagerAgent.REGISTRY_ALIAS);
        Set keys = cfgable.keySet();
        for (Iterator it = keys.iterator(); it.hasNext(); ) {
            clazzname = (String) it.next();
            name = ((Config) cfgable.get(clazzname)).getAlias();
            path = ((Config) cfgable.get(clazzname)).getPath();
            active = ((Config) cfgable.get(clazzname)).isActive();
            inside = ((Config) cfgable.get(clazzname)).getInside();
            if (active) {
                log.info(" ::装载属于[ " + inside + " ]组件的配置 <" + name + "> 项来自于文件 " + path + ":: ");
                log.info(" ::------此配置的装载器为 <" + clazzname + "> ::");
                try {
                    AbstractManagerAgent agent = (AbstractManagerAgent) Thread.currentThread().getContextClassLoader().loadClass(clazzname).newInstance();
                    agent.registryName = name;
                    agent.path = path;
                    agent.parse();
                    agent.addRegistry();
                } catch (ClassNotFoundException ex) {
                    log.error("ClassNotFoundException is throwed in Class" + clazzname);
                } catch (IllegalAccessException ex) {
                    log.error("IllegalAccessException is throwed in Class" + clazzname);
                } catch (InstantiationException ex) {
                    log.error("InstantiationException is throwed in Class" + clazzname);
                }
            } else {
                log.info(" :: ! 忽略装载属于[ " + inside + " ]组件的配置 <" + name + "> 项来自于路径 " + path + ":: ");
            }
        }
    }

    /**
     * 按照Configuration所管理的Agent逐一解析和注册Domain到注册表
     *
     * @throws MappingException
     */
    public void reloadRegistry()
            throws MappingException {
        String clazzname = "";
        String name = "";
        String path = "";
        boolean active = false;
        String inside = "";
        boolean reload = false;
        Cfgable cfgable = (Cfgable) registry.getDomain(CfgManagerAgent.REGISTRY_ALIAS);
        Set keys = cfgable.keySet();
        for (Iterator it = keys.iterator(); it.hasNext(); ) {
            clazzname = (String) it.next();
            name = ((Config) cfgable.get(clazzname)).getAlias();
            path = ((Config) cfgable.get(clazzname)).getPath();
            active = ((Config) cfgable.get(clazzname)).isActive();
            inside = ((Config) cfgable.get(clazzname)).getInside();
            reload = ((Config) cfgable.get(clazzname)).isReload();
            if (active && reload) {
                log.info(" ::【重新】装载属于[ " + inside + " ]组件的配置 <" + name + "> 项来自于文件 " + path + ":: ");
                log.info(" ::------此配置的装载器为 <" + clazzname + "> ::");
                try {
                    AbstractManagerAgent agent = (AbstractManagerAgent) Thread.currentThread().getContextClassLoader().loadClass(clazzname).newInstance();
                    agent.registryName = name;
                    agent.path = path;
                    agent.parse();
                    agent.addRegistry();
                } catch (ClassNotFoundException ex) {
                    throw new MappingException("ClassNotFoundException is throwed", ex);
                } catch (IllegalAccessException ex) {
                    throw new MappingException("IllegalAccessException is throwed", ex);
                } catch (InstantiationException ex) {
                    throw new MappingException("InstantiationException is throwed", ex);
                }
            } else {
                log.info(" :: ! 忽略【重新】装载属于[ " + inside + " ]组件的配置 <" + name + "> 项来自于路径 " + path + ":: ");
            }
        }
    }


    /**
     * 初始化Configuration的Agent
     *
     * @throws MappingException
     */
    public static void initCfg()
            throws MappingException {
        AbstractManagerAgent agent = new CfgManagerAgent();
        agent.setStartFile(startFile);
        agent.parse();
        agent.addRegistry();
    }
}
