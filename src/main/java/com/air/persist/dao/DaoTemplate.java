package com.air.persist.dao;

import com.air.persist.util.PagedList;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.ArrayUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.*;

/**
 * create at: 11-7-4
 *
 * @author Yonghui Chen
 */
@SuppressWarnings({"unchecked"})
public class DaoTemplate<T> {
    private Class<T> clazz;

    public DaoTemplate() {
        Type type = getClass().getGenericSuperclass();
        if (type instanceof ParameterizedType) {
            ParameterizedType paramType = (ParameterizedType) type;
            Type[] actualTypes = paramType.getActualTypeArguments();
            for (Type aType : actualTypes) {
                if (aType instanceof Class) {
                    clazz = (Class<T>) aType;
                }
            }
        }
    }

    public DaoTemplate(Class<T> clazz) {
        this.clazz = clazz;
    }

    protected Object generateId() {
        return UUID.randomUUID().toString();
    }

    public T get(String id) throws SQLException { // get 仅限单一主键表
        return createQuery().addFilter(getFirstKey(), id).queryOne();
    }

    public T get(long id) throws SQLException {
        return createQuery().addFilter(getFirstKey(), id).queryOne();
    }

    public T get(T key) throws SQLException {
        List<String> keys = ClassParser.getPrimaryKeys(clazz);
        Query<T> query = createQuery();
        try {
            for (String s : keys) {
                query.addFilter(s, PropertyUtils.getProperty(key, s));
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return query.queryOne();
    }

    public boolean delete(T t) throws SQLException {
        Delete<T> delete = createDelete();
        List<String> keys = ClassParser.getPrimaryKeys(clazz);

        try {
            for (String s : keys) {
                delete.addFilter(s, PropertyUtils.getProperty(t, s));
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return 1 == (Integer) delete.execute();
    }

    public boolean delete(String key) throws SQLException {
        return 1 == createDelete().addFilter(getFirstKey(), key).executeUpdate();
    }

    public boolean delete(long key) throws SQLException {
        return 1 == createDelete().addFilter(getFirstKey(), key).executeUpdate();
    }

    public Query<T> createQuery() {
        return new Query<T>(clazz);
    }

    public Delete<T> createDelete() {
        return new Delete<T>(clazz);
    }

    public Update<T> createUpdate() {
        return new Update<T>(clazz);
    }

    public int insert(T bean) throws SQLException {
        List<String> primaryKeys = ClassParser.getPrimaryKeys(bean.getClass());
        Object keyVo = null;
        try {
            for (String primaryKey : primaryKeys) {
                Object v = PropertyUtils.getProperty(bean, primaryKey);
                if (v == null && primaryKeys.size() == 1) {
                    PropertyUtils.setProperty(bean, primaryKey, generateId());
                } else if (primaryKeys.size() > 1) {
/*
                    if (keyVo == null) {
                        keyVo = generateId();
                    }

                    PropertyUtils.setProperty(bean, primaryKey, PropertyUtils.getProperty(keyVo, primaryKey));
*/
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return (Integer) new Insert(bean).execute();
    }

    public int[] insert(T... beans) throws SQLException {
        return (int[]) new Insert(beans).execute();
    }

    public List<Integer> insert(List<T> beans) throws SQLException {
        if(beans == null || beans.isEmpty()) {
            return Arrays.asList(0);
        }
        Object execute = new Insert(beans).execute();
        int[] ints;
        if (execute instanceof Integer) {
            ints = new int[1];
            ints[0] = (Integer) execute;
        } else {
            ints = (int[]) execute;
        }

        return Arrays.asList(ArrayUtils.toObject(ints));
    }

    public int update(T bean) throws SQLException {
        return new Update().setExample(bean).executeUpdate();
    }

    private String getFirstKey() {
        List<String> primaryKeys = ClassParser.getPrimaryKeys(clazz);
        return !primaryKeys.isEmpty() ? primaryKeys.get(0) : null;
    }

    public int countAll() throws SQLException {
        return createQuery().count();
    }

    public int truncate() throws SQLException {
        return (Integer) createDelete().execute();
    }

    public List<T> listAll() throws SQLException {
        return createQuery().asList();
    }

    public List<T> listAll(Order order) throws SQLException {
        Query<T> q = createQuery();
        q.order = order;
        return q.asList();
    }

    public Map<String, T> mget(String... keys) throws SQLException {
        String key = getFirstKey();
        List<T> ts = createQuery().addFilter(key, keys).asList();
        Map<String, T> result = new HashMap<String, T>(ts.size());
        for (T t : ts) {
            try {
                result.put((String) PropertyUtils.getProperty(t, key), t);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public Map<Long, T> mget(Long... keys) throws SQLException {
        String key = getFirstKey();
        List<T> ts = createQuery().addFilter(key, keys).asList();
        Map<Long, T> result = new HashMap<Long, T>(ts.size());
        for (T t : ts) {
            try {
                result.put((Long) PropertyUtils.getProperty(t, key), t);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public Map<Integer, T> mget(Integer... keys) throws SQLException {
        String key = getFirstKey();
        List<T> ts = createQuery().addFilter(key, keys).asList();
        Map<Integer, T> result = new HashMap<Integer, T>(ts.size());
        for (T t : ts) {
            try {
                result.put((Integer) PropertyUtils.getProperty(t, key), t);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public List<T> filter(String column, Object... value) throws SQLException {
        return createQuery().addFilter(column, value).asList();
    }

    public int delete(String column, Object... value) throws SQLException {
        return createDelete().addFilter(column, value).executeUpdate();
    }

    public List<T> filter(String column, Order order, Object... value) throws SQLException {
        return createQuery().setOrder(order).addFilter(column, value).asList();
    }

    public int delete(T example, String... columns) throws SQLException {
        Delete<T> delete = createDelete();
        try {
            for (String column : columns) {
                delete.addFilter(column, PropertyUtils.getProperty(example, column));
            }
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException(e);
        } catch (InvocationTargetException e) {
            throw new IllegalArgumentException(e);
        } catch (NoSuchMethodException e) {
            throw new IllegalArgumentException(e);
        }
        return delete.executeUpdate();
    }

    public int update(String column, Object to, String filterCol, Object... filterVal) throws SQLException {
        Update<T> update = createUpdate();
        update.setValue(column, to);
        update.addFilter(filterCol, filterVal);
        return update.executeUpdate();
    }

    public int update(T filterExample, String[] filterCols, T valueExample, String[] valueCols) throws SQLException {
        Update<T> update = createUpdate();
        try {
            for (String filterCol : filterCols) {
                update.addFilter(filterCol, PropertyUtils.getProperty(filterExample, filterCol));
            }

            update.setExample(valueExample, valueCols);
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException(e);
        } catch (InvocationTargetException e) {
            throw new IllegalArgumentException(e);
        } catch (NoSuchMethodException e) {
            throw new IllegalArgumentException(e);
        }

        return update.executeUpdate();
    }

    public List<T> filter(T example, Order order, String... column) throws SQLException {
        try {
            Query<T> query = createQuery();
            query.setOrder(order);
            for (String s : column) {
                query.addFilter(s, PropertyUtils.getProperty(example, s));
            }
            return query.asList();
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException(e);
        } catch (InvocationTargetException e) {
            throw new IllegalArgumentException(e);
        } catch (NoSuchMethodException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public List<T> filter(T example, String... column) throws SQLException {
        return filter(example, null, column);
    }

    public PagedList<T> filter(T example, Order order, int offset, int size, String... column) throws SQLException {
        try {
            Query<T> query = createQuery().setOrder(order);
            for (String s : column) {
                query.addFilter(s, PropertyUtils.getProperty(example, s));
            }
            return query.asPagedList(offset, size);
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException(e);
        } catch (InvocationTargetException e) {
            throw new IllegalArgumentException(e);
        } catch (NoSuchMethodException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public PagedList<T> filter(String column, int offset, int size, Object... value) throws SQLException {
        return createQuery().addFilter(column, value).asPagedList(offset, size);
    }

    public PagedList<T> filter(String column, Order order, int offset, int size, Object... value) throws SQLException {
        return createQuery().setOrder(order).addFilter(column, value).asPagedList(offset, size);
    }
}
