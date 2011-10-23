package com.demx.cfg.mapping.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


public class ConfigList
        implements Serializable {
    private List configs = new ArrayList();


    public ConfigList() {
    }


    public List getConfigs() {
        return configs;
    }

    public void addConfig(Config config) {
        configs.add(config);
    }
}
