package com.air.persist.dao;

import javax.persistence.Id;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * create at: 11-7-7
 *
 * @author Yonghui Chen
 */
public class ClassParser {

    public static List<DBColumn> parse(Class<?> klass) {
        List<DBColumn> columns = new ArrayList<DBColumn>();
        Method[] methods = klass.getMethods();
        for (Method method : methods) {
            String mn = method.getName();
            if (mn.length() > 3 && mn.startsWith("set") && method.getParameterTypes().length == 1) {
                String name = mn.substring(3);
                name = Character.toLowerCase(name.charAt(0)) + name.substring(1);

                DBColumn c = new DBColumn();
                c.setName(name);
                columns.add(c);
                c.setType(method.getParameterTypes()[0]);
            }
        }
        return columns;
    }

    public static List<String> getPrimaryKeys(Class<?> klass) {
        List<String> columns = new ArrayList<String>();
        Method[] methods = klass.getMethods();
        for (Method method : methods) {
            String mn = method.getName();
            if (mn.length() > 3 && mn.startsWith("set") && method.getParameterTypes().length == 1) {
                String name = mn.substring(3);
                name = Character.toLowerCase(name.charAt(0)) + name.substring(1);

                if (method.getAnnotation(Id.class) != null) {
                    columns.add(name);
                } else {
                    try {
                        Field f = klass.getDeclaredField(name);
                        if (f.getAnnotation(Id.class) != null) {
                            columns.add(name);
                        }
                    } catch (NoSuchFieldException ignored) {
                    }
                }
            }
        }
        return columns;
    }
}
