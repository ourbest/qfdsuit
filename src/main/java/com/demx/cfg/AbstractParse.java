package com.demx.cfg;

import com.demx.cfg.exception.MappingException;

public abstract class AbstractParse {

    protected String startFile;


    public void setStartFile(String aStartFile) {
        startFile = aStartFile;
    }


    public abstract Object getResult()
            throws MappingException;

    public String path = "";
}
