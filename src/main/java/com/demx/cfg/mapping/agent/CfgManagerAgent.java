package com.demx.cfg.mapping.agent;

import com.demx.cfg.AbstractManagerAgent;
import com.demx.cfg.AbstractParse;
import com.demx.cfg.exception.MappingException;
import com.demx.cfg.mapping.vo.Cfgable;
import org.apache.log4j.Logger;

/**
 * Configuration��Agent
 */
public class CfgManagerAgent
        extends AbstractManagerAgent {
    private static Logger log = Logger.getLogger(CfgManagerAgent.class);

    public static final String REGISTRY_ALIAS = "configurations";


    public CfgManagerAgent() {
        super();
        //������Agent��ע��Domain
        registryName = REGISTRY_ALIAS;
    }


    private Cfgable cfgable = null;


    public void parse()
            throws MappingException {
        AbstractParse parse = new CfgManagerParse();
        parse.setStartFile(startFile);
        cfgable = (Cfgable) parse.getResult();
    }

    public void addRegistry() {
        registry.addDomain(registryName, cfgable);
    }

    public String getAlias(String name) {
        cfgable = (Cfgable) registry.getConfigDomain(registryName);
        if (registry == null) {
            log.debug(" registry is null, please init registry with Registry.getRegistry() method ");
        }
        String alias = null;
        if (cfgable != null) {
//	    log.debug(cfgable);
            alias = cfgable.getAlias(name);
        }
        return alias;
    }

    public String getPath(String name) {
        String mypath = null;
        cfgable = (Cfgable) registry.getConfigDomain(registryName);
        if (registry == null) {
            log.debug(" registry is null, please init registry with Registry.getRegistry() method ");
        }
        if (cfgable != null) {
//	    log.debug(cfgable);
            mypath = cfgable.getPath(name);
        }
        return mypath;
    }
}
