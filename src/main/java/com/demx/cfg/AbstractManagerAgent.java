package com.demx.cfg;

import com.demx.cfg.exception.MappingException;

public abstract class AbstractManagerAgent {
    public String registryName = "";

    public String path = "";

    protected String startFile;

    public void setStartFile(String aStartFile) {
        startFile = aStartFile;
    }

    protected static Registry registry = Registry.getRegistry();

    public abstract void addRegistry();

    public abstract void parse()
            throws MappingException;
}
