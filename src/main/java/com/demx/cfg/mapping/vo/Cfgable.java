package com.demx.cfg.mapping.vo;

import org.apache.commons.collections.map.ListOrderedMap;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Set;

public class Cfgable
        extends ListOrderedMap implements Serializable {

    public Cfgable() {
        super();
    }

    public void addCfg(String clzzName, Config conf) {
        this.put(clzzName, conf);
    }


    public void addCfg(ConfigList confs) {
        if (confs != null) {
            for (Iterator it = confs.getConfigs().iterator(); it.hasNext(); ) {
                Config conf = (Config) it.next();
                this.put(conf.getClazzname(), conf);
            }
        }
    }

    public String getAlias(String clazzName) {
        String descName = null;
        descName = ((Config) this.get(clazzName)).getAlias();
        return descName;
    }

    public String getPath(String clazzName) {
        String path = null;

        path = ((Config) this.get(clazzName)).getPath();
        return path;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        Set key = this.keySet();
        for (Iterator it = key.iterator(); it.hasNext(); ) {
            String name = (String) it.next();
            String property = (String) this.get(name);
            sb.append("[ " + name + "=" + property + " ]");
        }
        return sb.toString();
    }
}
