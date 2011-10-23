package com.demx.cfg.mapping;

import com.demx.cfg.exception.MappingException;

import java.util.Map;

public class Mappings {
    //    private static Logger log = Logger.getLogger(Mappings.class);
    private final Map messeges;
    private final Map sqlqueries;

    Mappings(Map sqlqueries, Map messeges) {
        this.messeges = messeges;
        this.sqlqueries = sqlqueries;
    }

    public void addSQLQuery(String name, NamedSQLQuery query)
            throws MappingException {
        checkQueryExist(name);
        sqlqueries.put(name, query);
    }


    private void checkQueryExist(String name)
            throws MappingException {
        if (sqlqueries.containsKey(name)) {
            throw new MappingException("Duplicate query named: " + name);
        }
    }
}
