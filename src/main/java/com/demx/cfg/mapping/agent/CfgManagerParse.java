package com.demx.cfg.mapping.agent;

import com.demx.cfg.AbstractParse;
import com.demx.cfg.exception.MappingException;
import com.demx.cfg.mapping.vo.Cfgable;

public class CfgManagerParse
        extends AbstractParse {
    public CfgManagerParse() {
        super();
    }

    private Cfgable cfgable;

    public Object getResult()
            throws MappingException {
        CfgMappingLoad load = new CfgMappingLoad();
        try {
            load.addFile(startFile);
            cfgable = load.getCfgable();
        } catch (MappingException ex) {
            ex.printStackTrace();
        }
//        this.parseCfgXML();
//        cfgable.addCfg(confs);
        return cfgable;
    }
//    private void parseCfgXML() throws MappingException
//    {
//
//	Digester digester = new Digester();
//	digester.setValidating( true );
//	try
//	{
//	    confs = new ConfigList();
//	    digester.addObjectCreate( "PTF-Configuration", ConfigList.class );
//
//	    digester.addObjectCreate( "PTF-Configuration/Configurations/config", Config.class );
//	    digester.addSetProperties( "PTF-Configuration/Configurations/config", "clazzname", "clazzname" );
//	    digester.addBeanPropertySetter( "PTF-Configuration/Configurations/config/alias" );
//	    digester.addBeanPropertySetter( "PTF-Configuration/Configurations/config/path" );
//	    digester.addBeanPropertySetter( "PTF-Configuration/Configurations/config/actived", "actived" );
//	    digester.addBeanPropertySetter( "PTF-Configuration/Configurations/config/inside" );
//	    digester.addSetNext( "PTF-Configuration/Configurations/config", "addConfig" );
//
//	    confs = ( ConfigList ) digester.parse( this.getInputStream() );
//	    log.debug( confs );
//
//	}
//	catch ( SAXException ex )
//	{
//	    throw new MappingException( " PTF Configuration parse error ", ex );
//	}
//	catch ( IOException ex )
//	{
//	    throw new MappingException( " PTF Configuration file is not founnd ", ex );
//	}
//    }
//
//    private InputStream getInputStream()
//    {
//	InputStream in = null;
//	in = Thread.currentThread().getContextClassLoader().getResourceAsStream( "ptfconf/demx-configs.xml" );
//	return in;
//    }
//    private void parseCfgXML()
//        throws MappingException
//    {
//
//
//        Digester digester = new Digester();
//        digester.setValidating(false);
//        try
//        {
//            confs = new ConfigList();
//            digester.addObjectCreate("demx-initialize", ConfigList.class);
//            digester.addObjectCreate("demx-initialize/configurations-config/config", Config.class);
//            digester.addSetProperties("demx-initialize/configurations-config/config", "clazzname", "clazzname");
//            digester.addBeanPropertySetter("demx-initialize/configurations-config/config/alias");
//            digester.addBeanPropertySetter("demx-initialize/configurations-config/config/path");
//            digester.addBeanPropertySetter("demx-initialize/configurations-config/config/actived", "actived");
//            digester.addBeanPropertySetter("demx-initialize/configurations-config/config/inside");
//            digester.addSetNext("demx-initialize/configurations-config/config", "addConfig");
//            confs = (ConfigList) digester.parse(this.getInputStream());
//            log.debug(confs);
//        }
//        catch (SAXException ex)
//        {
//            throw new MappingException(" PTF Configuration parse error ", ex);
//        }
//        catch (IOException ex)
//        {
//            throw new MappingException(" PTF Configuration file is not founnd ", ex);
//        }
//    }
//    private InputStream getInputStream()
//    {
//        InputStream in = null;
//        in = Thread.currentThread().getContextClassLoader().getResourceAsStream("startup.xml");
//        return in;
//    }
}
