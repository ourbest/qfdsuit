package com.demx.cfg;

import com.demx.cfg.exception.MappingException;
import org.apache.log4j.Logger;

public final class ConfigurationFactory {

    private static Logger log = Logger.getLogger(ConfigurationFactory.class);

    private ConfigurationFactory() {
    }

    private static ConfigurationFactory factory = new ConfigurationFactory();

    private String startFile;


    public void setStartFile(String aStartFile) {
        startFile = aStartFile;
    }


    public static ConfigurationFactory getFactory() {
        if (factory == null) {
            factory = new ConfigurationFactory();
        }
        return factory;
    }


    private Configuration conf = Configuration.getConfig();


    public void initRegistry() {
        try {
            conf.setStartFile(startFile);
            conf.parseRegistry();
        } catch (MappingException ex) {
            log.error("the registry is init error", ex);
        }
    }

    public void reloadRegistry() {
        try {
            conf.setStartFile(startFile);
            conf.reloadRegistry();
        } catch (MappingException ex) {
            log.error("the registry is init error", ex);
        }
    }
}
