package com.demx.cfg.mapping;

public class NamedSQLQuery {
    private String query;
    private String[] returnAliases;
    private Class[] returnClasses;

    public NamedSQLQuery(String query, String[] aliases, Class[] clazz) {
        this.returnClasses = clazz;
        this.returnAliases = aliases;
        this.query = query;
    }

    public String[] getReturnAliases() {
        return returnAliases;
    }

    public Class[] getReturnClasses() {
        return returnClasses;
    }

    public String getQueryString() {
        return query;
    }
}
