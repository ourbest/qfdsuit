package com.air.persist.dao.mysql;

import com.air.persist.dao.ConnectionManager;
import com.air.persist.dao.SchemaChecker;
import com.air.persist.dao.Verb;
import com.air.persist.util.DBUtils;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.*;
import java.util.*;
import java.util.Date;

/**
 * create at: 11-7-5
 *
 * @author Yonghui Chen
 */
public class MySQLSchemaChecker implements SchemaChecker {
    private Map<String, String> checked = new Hashtable<String, String>();

    public String checkTable(String tableName) throws SQLException {
        String ss = checked.get(tableName);
        if (ss == null) {
            ss = tableName;
            Connection con = ConnectionManager.getConnection();
            String tn = tableName;

            try {
                Map<String, String> oldTypes = new HashMap<String, String>();
                Class<?> klass = Class.forName(tableName);
                Entity entity = klass.getAnnotation(Entity.class);

                List<String> columns = new ArrayList<String>();
                List<Class<?>> types = new ArrayList<Class<?>>();
                Map<String, Column> cols = new HashMap<String, Column>();
                Collection<String> key = new ArrayList<String>();
                Method[] methods = klass.getMethods();
                if (entity != null && entity.name().length() > 0) {
                    tableName = entity.name();
                } else {
                    String[] strings = tableName.split("\\.");
                    if (strings.length >= 2) {
                        tableName = strings[strings.length - 2] + "_" + DBUtils.propertyToDb(strings[strings.length - 1]);
                    }
                }
                for (Method method : methods) {
                    String mn = method.getName();

                    if (mn.length() > 3 && mn.startsWith("set") && method.getParameterTypes().length == 1) {
                        String name = mn.substring(3);
                        name = Character.toLowerCase(name.charAt(0)) + name.substring(1);

                        columns.add(name);
                        types.add(method.getParameterTypes()[0]);

                        if (method.isAnnotationPresent(Id.class)) {
                            if (!key.contains("`" + DBUtils.propertyToDb(name) + "`"))
                                key.add("`" + DBUtils.propertyToDb(name) + "`");
                        }

                        if (method.isAnnotationPresent(Column.class)) {
                            cols.put(name, method.getAnnotation(Column.class));
                        }
                    }
                }

                Field[] fields = klass.getDeclaredFields();
                for (Field field : fields) {
                    if (field.isAnnotationPresent(Id.class)) {
                        if (!key.contains("`" + DBUtils.propertyToDb(field.getName()) + "`")) key.add("`" +
                                DBUtils.propertyToDb(field.getName()) + "`");
                    }
                }

                boolean hasTable = false;
                hasTable = checkTable(tableName, oldTypes, con, hasTable);

                String theQuery = null;

                if (key.isEmpty()) {
                    key.add(DBUtils.propertyToDb(columns.get(0)));
                }
                if (!hasTable) {
                    String pk = key.toString();
                    pk = pk.substring(1, pk.length() - 1);
                    theQuery = "create table `" + tableName + "` (";
                    boolean first = true;
                    int i = 0;
                    for (String column : columns) {
                        if (cols.containsKey(column)) {
                            Column cc = cols.get(column);
                            if (first) {
                                first = false;
                            } else {
                                theQuery += ", ";
                            }
                            theQuery += "`" + DBUtils.propertyToDb(column) + "` varchar" + "(" + cc.length() + ")";
                        } else {
                            Class<?> c = types.get(i);
                            String colName = "`" + DBUtils.propertyToDb(column) + "`";
                            int len = (key.contains(colName)) ? 64 : 255;

                            String type = getDBType(c, len);

                            if (first) {
                                first = false;
                            } else {
                                theQuery += ", ";
                            }
                            theQuery += "`" + DBUtils.propertyToDb(column) + "`" + type;
                        }
                        i++;
                    }

                    theQuery += ", primary key (" + pk + ")) default charset=utf8";
                } else if (oldTypes.size() > 0) {
                    if (getTableSize(con, tn) <= 1024 * 1024 * 100) {
                        boolean first = true;
                        int i = 0;
                        for (String column : columns) {
                            if (cols.containsKey(column)) {
                                if (first) {
                                    theQuery = "alter table `" + tableName + "`";
                                    first = false;
                                } else {
                                    theQuery += ",";
                                }
                                Column cc = cols.get(column);
                                theQuery += " add `" + cc.name() + "` " + " varchar" + "(" + cc.length() + ")";
                            } else {
                                Class<?> c = types.get(i);
                                String cname = DBUtils.propertyToDb(column);
                                String colName = "`" + cname + "`";
                                int len = (key.contains(colName)) ? 64 : 255;
                                String type = getDBType(c, len);
                                if (oldTypes.get(cname) != null) {
                                    if (!equals(type, oldTypes.get(cname))) {
                                        if (first) {
                                            theQuery = "alter table `" + tableName + "`";
                                            first = false;
                                        } else {
                                            theQuery += ",";
                                        }
                                        theQuery += " change `" + cname + "`" + " `" + cname + "`" + type;
                                    }
                                } else {
                                    if (first) {
                                        theQuery = "alter table `" + tableName + "`";
                                        first = false;
                                    } else {
                                        theQuery += ",";
                                    }
                                    theQuery += " add `" + cname + "`" + type;
                                }
                            }
                            i++;
                        }
                    }
                }

                if (theQuery != null) {
                    Statement stmt = con.createStatement();

                    if (Verb.showSQL) System.out.println(theQuery);
                    stmt.execute(theQuery);
                    stmt.close();
                }

                //key ignored
                checked.put(ss, tableName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (con != null) try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            return tableName;
        } else {
            return ss;
        }
    }

    private boolean checkTable(String tableName, Map<String, String> oldTypes, Connection con, boolean hasTable) {
        String query = "desc `" + tableName + "`";
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                String n = rs.getString(1);
                //columns.remove(n);   // change not implements
                oldTypes.put(n, rs.getString(2));
            }
            rs.close();
            hasTable = true;
            stmt.close();
        } catch (SQLException ignored) {

        }
        return hasTable;
    }

    private long getTableSize(Connection con, String tableName) {
        String query = "SHOW TABLE STATUS  WHERE NAME=?";
        long ret = 0;
        try {
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, tableName);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                ret = rs.getLong("data_length");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ret;
    }

    private String getDBType(Class<?> c, int len) {
        String type = " varchar(" + len + ")";
        if (Date.class.isAssignableFrom(c)) {
            type = " DateTime";
        } else if (Long.class.equals(c) || Long.TYPE.equals(c)) {
            type = " BIGINT";
        } else if (Integer.class.equals(c) || Integer.TYPE.equals(c)) {
            type = " INT";
        } else if (Boolean.class.equals(c) || Boolean.TYPE.equals(c)) {
            type = " TINYINT";
        } else if (c.isPrimitive()) {
            type = " NUMERIC";
        } else if (c.isArray()) {
            type = " LONGBLOB";
        }
        return type;
    }

    private boolean equals(String type, String type1) {
        type = type.trim();
        if (type.indexOf('(') != -1) {
            type = type.substring(0, type.indexOf('('));
        }
        type1 = type1.trim();
        if (type1.indexOf('(') != -1) {
            type1 = type1.substring(0, type1.indexOf('('));
        }


        return type1.contains("INT") && type.contains("INT")
                || type1.toLowerCase().contains("text")
                || type.toLowerCase().contains("text")
                || type.equalsIgnoreCase(type1);
    }
}
