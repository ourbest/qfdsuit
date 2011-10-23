package com.demx.cfg;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class Registry
        implements Serializable {
    private static Registry registry = new Registry();

    private Registry() {
        reset();
    }


    private static Map configContext;

    public Set getContextKeySet() {
        return configContext.keySet();
    }

    public Object getConfigDomain(String registry) {
        if (configContext == null) {
            return null;
        }
        return configContext.get(registry);
    }

    public static synchronized Registry getRegistry() {
        if (registry == null) {
            return new Registry();
        } else {
            return registry;
        }
    }

    private static void reset() {
        configContext = new LinkedHashMap();
    }


    public void addDomain(String domainName, Map domain) {
        configContext.put(domainName, domain);
    }


    public Map getDomain(Class clazz) {
        String classname = clazz.getPackage() + "." + clazz.getName();
        Map domain = (Map) configContext.get(getBindName(classname));
        return domain;
    }

    public Map getDomain(String clazzname) {
        Map domain = (Map) configContext.get(getBindName(clazzname));
        return domain;
    }


    private static String getBindName(String classname) {
        return classname;
    }
}
