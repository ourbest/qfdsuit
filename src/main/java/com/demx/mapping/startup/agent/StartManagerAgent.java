package com.demx.mapping.startup.agent;

import com.demx.cfg.AbstractManagerAgent;
import com.demx.cfg.AbstractParse;
import com.demx.cfg.exception.MappingException;
import com.demx.mapping.startup.vo.StartMappingable;
import com.demx.mapping.startup.vo.Startup;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class StartManagerAgent
        extends AbstractManagerAgent {
    private static final Logger log = Logger.getLogger(StartManagerAgent.class);
    private StartMappingable startable = null;

    public StartManagerAgent() {
        super();
    }

    public void parse()
            throws MappingException {
        AbstractParse parse = new StartMappingParse();
        parse.path = this.path;
        startable = (StartMappingable) parse.getResult();
    }

    /**
     * Adds a feature to the Cfg attribute of the CfgManagerAgent object
     */
    public void addRegistry() {
        registry.addDomain(registryName, startable);
    }

    /**
     * Gets the property attribute of the CfgManagerAgent object
     *
     * @param name Description of the Parameter
     * @return The property value
     */
    public Startup getStartup(String name) {
        startable = (StartMappingable) registry.getConfigDomain(registryName);
        Startup start = null;
        if (registry == null) {
            log.debug(" registry is null, please init registry with Registry.getRegistry() method ");
        }
        if (startable != null) {
//	    log.debug(sqlable);
            start = startable.getStartup(name);
        }
        return start;
    }

    public boolean isStart() {
        Object o = registry.getConfigDomain(registryName);
        if (o == null) {
            return false;
        }
        return true;
    }

    public List getStartupIterator(boolean flag) {
        List enstart = new ArrayList();
        Iterator tmp;
        startable = (StartMappingable) registry.getConfigDomain(registryName);
        if (startable != null) {
            tmp = startable.values().iterator();
            while (tmp.hasNext()) {
                Startup start = (Startup) tmp.next();
                if (start.isActived() == flag) {
                    enstart.add(start);
                }
            }
        }
        return enstart;
    }

//    public List getStartupIterator(boolean flag)
//    {
//        List enstart = new ArrayList();
//        Iterator tmp;
//        startable = (StartMappingable) registry.getConfigDomain(registryName);
//        if (startable != null)
//        {
//            tmp = startable.getValues().iterator();
//            while (tmp.hasNext())
//            {
//                Startup start = (Startup) tmp.next();
//                if (start.isActived() == flag)
//                {
//                    enstart.add(start);
//                }
//            }
//        }
//        return enstart;
//    }
}
