package com.demx.mapping.startup.vo;

import org.apache.commons.collections.map.ListOrderedMap;

import java.io.Serializable;

public class StartMappingable
        extends ListOrderedMap implements Serializable {
    public StartMappingable() {
    }

    /**
     * @return the Startup value of startup.
     */
    public Startup getStartup(String name) {
        return (Startup) this.get(name);
    }

    /**
     * @param aStartup - the new value for startup
     */
    public void addStartup(String name, Startup aStartup) {
        this.put(name, aStartup);
    }
}
