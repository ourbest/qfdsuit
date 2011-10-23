package com.demx.mapping.startup.agent;

import com.demx.cfg.AbstractParse;
import com.demx.cfg.exception.MappingException;
import com.demx.mapping.startup.vo.StartMappingable;
import org.apache.log4j.Logger;

public class StartMappingParse
        extends AbstractParse {
    private static final Logger log = Logger.getLogger(StartMappingParse.class);

    public StartMappingParse() {
        super();
    }

    private StartMappingable startable;

    public Object getResult() {
        StartMappingLoad load = new StartMappingLoad();
        try {
            String filename = this.path;
            load.addFile(filename);
            startable = load.getStartable();
        } catch (MappingException ex) {
            ex.printStackTrace();
        }
        return startable;
    }
}
