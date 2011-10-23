package com.air.persist.dao;

import com.air.persist.util.DBUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;

import java.lang.reflect.InvocationTargetException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

/**
 * create at: 11-7-4
 *
 * @author Yonghui Chen
 */
public class Update<T> extends Verb<T> {
    private Map<String, Object> values = new HashMap<String, Object>();
    private T object;
    private String[] columns;

    public Update() {
    }

    public Update(Class<T> table) {
        super(table);
    }

    @Override
    protected String buildSQL() throws SQLException {
        if (object != null) {
            try {
                if (table == null) table = (Class<T>) object.getClass();
                /*Map vals = BeanUtils.describe(object);
                if (columns.length == 0) {
                    values.putAll(vals);
                } else {
                    for (String column : columns) {
                        values.put(column, vals.get(column));
                    }
                }*/
                for (String column : columns) {
                    values.put(column, PropertyUtils.getProperty(object, column));
                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        if (filter == null) {
            List<String> keys = ClassParser.getPrimaryKeys(table);
            try {
                for (String s : keys) {
                    addFilter(s, PropertyUtils.getProperty(object, s));
                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }

        StringBuilder update = new StringBuilder("update " + getTableName() + " set ");
        List<String> cs = new ArrayList<String>();
        if (columns == null) {
            columns = values.keySet().toArray(new String[values.size()]);
        }
        for (String column : columns) {
            cs.add(DBUtils.propertyToDb(column) + "=?");
        }
        update.append(StringUtils.join(cs, ","));
        update.append(" where ").append(filter.toSQL(null));
        return update.toString();
    }

    @Override
    protected int setParameter(PreparedStatement pst, int offset, boolean isCount) throws SQLException {
        int pos = offset;
        for (String column : columns) {
            Object value = values.get(column);
            pos = setDBValue(pst, pos, value);
        }
        return super.setParameter(pst, pos, false);
    }


    public Update<T> setValue(String column, Object value) {
        values.put(column, value);
        return this;
    }

    public Update<T> setExample(T t, String... columns) {
        if (table == null) setTable((Class<T>) t.getClass());
        if (columns.length == 0) {
            try {
                Map map = PropertyUtils.describe(t);
                Collection<String> names = (Collection<String>) map.keySet();
                map.remove("class");
                this.columns = names.toArray(new String[names.size()]);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        } else {
            this.columns = columns;
        }
        //throw new IllegalArgumentException("必须指定列");
        object = t;
        return this;
    }

    public Update<T> setKeyFilter(T t) {
//        setTable((Class<T>) t.getClass());
        List<String> keys = ClassParser.getPrimaryKeys(table);
        for (String key : keys) {
            try {
                addFilter(key, PropertyUtils.getProperty(t, key));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        return this;
    }

    public Map<String, Object> getValues() {
        return values;
    }
}
