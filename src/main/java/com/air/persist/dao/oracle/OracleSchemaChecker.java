package com.air.persist.dao.oracle;

import com.air.persist.dao.SchemaChecker;
import com.air.persist.util.DBUtils;

import javax.persistence.Entity;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Map;

/**
 * create at: 11-7-9
 *
 * @author Yonghui Chen
 */
public class OracleSchemaChecker implements SchemaChecker {
    private Map<String, String> checked = new Hashtable<String, String>();

    @Override
    public String checkTable(String className) throws SQLException {
        String ss = checked.get(className);
        if (ss == null) {
            Entity entity = null;
            try {
                Class<?> klass = Class.forName(className);
                entity = klass.getAnnotation(Entity.class);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            if (entity != null && entity.name().length() > 0) {
                ss = entity.name();
            } else {
                String[] strings = className.split("\\.");
                if (strings.length >= 2) {
                    ss = strings[strings.length - 2] + "_" + DBUtils.propertyToDb(strings[strings.length - 1]);
                }
            }
            checked.put(className, ss);
        }
        return ss;
    }
}
