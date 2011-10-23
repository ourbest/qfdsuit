package com.air.persist.dao;

import com.air.persist.util.DBUtils;
import com.air.persist.util.PagedList;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * create at: 11-7-4
 *
 * @author Yonghui Chen
 */
public class Query<T> extends Verb<T> {
    private int offset;
    private int size;
    private List<String> columns;
    private List<Join> joins;

    public Query() {
    }

    public Query(Class<T> table) {
        super(table);
    }

    public Query<T> limit(int size) {
        this.size = size;
        return this;
    }

    public Query<T> limit(int offset, int size) {
        this.offset = offset;
        this.size = size;
        return this;
    }

    public int getOffset() {
        return offset;
    }

    public int getSize() {
        return size;
    }

    public Query<T> setColumns(String... columns) {
        if (this.columns == null && columns.length > 0) {
            this.columns = Arrays.asList(columns);
        }
        return this;
    }

    public List<String> getColumns() {
        return columns;
    }

    public Query<T> leftJoin(Query query, String myProperty, String targetProperty) {
        return join(query, myProperty, targetProperty, Join.LEFT);
    }

    public Query<T> rightJoin(Query query, String myProperty, String targetProperty) {
        return join(query, myProperty, targetProperty, Join.RIGHT);
    }

    public Query<T> innerJoin(Query query, String myProperty, String targetProperty) {
        return join(query, myProperty, targetProperty, Join.INNER);
    }

    public Query<T> join(Query query, String myProperty, String targetProperty, int type) {
        Join join = new Join();
        join.setOther(query);
        join.setPropertySource(myProperty);
        join.setPropertyTarget(targetProperty);
        join.setType(type);
        if (joins == null) joins = new ArrayList<Join>();
        joins.add(join);
        return this;
    }

    public List<Join> getJoins() {
        return joins;
    }

    protected Object parseResult(ResultSet resultSet) throws SQLException {
        if (isJoin()) {
            List<Map<Class<?>, Object>> rows = new ArrayList<Map<Class<?>, Object>>();
            while (resultSet.next()) {
                rows.add((Map<Class<?>, Object>) rsToRow(resultSet));
            }
            return rows;
        } else {
            List<T> ret = new ArrayList<T>();
            while (resultSet.next()) {
                ret.add((T) rsToRow(resultSet));
            }
            return ret;
        }
    }

    private Map<String, Class<?>> aliasMap;

    protected Object rsToRow(ResultSet resultSet) throws SQLException {
//        ResultSetMetaData meta = resultSet.getMetaData();
        Map<Class<?>, Object> row = new HashMap<Class<?>, Object>();
        for (String column : rsColumns) {
            String cname = StringUtils.substringBefore(column, ".");
            Class<?> c = aliasMap.get(cname);
            Object o = row.get(c);
            if (o == null) {
                try {
                    o = c.newInstance();
                } catch (InstantiationException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
                row.put(c, o);
            }
            String key = StringUtils.substring(column, alias.length() + 1);
            try {
                Object object = resultSet.getObject(column);
                PropertyDescriptor descriptor = PropertyUtils.getPropertyDescriptor(o, DBUtils.dbToProperty(key));

                Method writeMethod = descriptor.getWriteMethod();
                Class<?> propertyType = descriptor.getPropertyType();
                if (Boolean.class == propertyType || Boolean.TYPE == propertyType) {
                    writeMethod.invoke(o, 1 == (Integer) object);
                } else {
                    if (writeMethod.getParameterTypes()[0].isPrimitive() && object == null) {
                        object = 0;
                    }
                    writeMethod.invoke(o, object);
                }
/*
                if(object instanceof Date) {
                }
                BeanUtils.setProperty(o, DBUtils.dbToProperty(key), resultSet.getString(column));
*/
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        return isJoin() ? row : row.get(table);
    }

    @Override
    public int count() throws SQLException {
        Connection con = ConnectionManager.getConnection();
        try {
            PreparedStatement st = con.prepareStatement(buildCountSQL());
            try {
                setParameter(st, 1, true);
                ResultSet rs = st.executeQuery();
                rs.next();
                int ret = rs.getInt(1);
                rs.close();
                return ret;
            } finally {
                st.close();
            }
        } finally {
            con.close();
        }
    }

    @Override
    public PagedList<T> asPagedList() throws SQLException {
        return new PagedList<T>(count(), offset, size, asList());
    }

    @Override
    protected int setParameter(PreparedStatement st, int offset, boolean isCount) throws SQLException {
        int i = filter == null ? 0 : filter.setParameters(st, offset);
        if (isJoin()) {
            for (Join join : joins) {
                i += join.getOther().setParameter(st, offset + i, false);
            }
        }
        if (!isCount && 0 == DBTYPE) {
            if (this.offset > 0) {
                st.setInt(offset + i++, this.offset);
            }
            if (this.size > 0) {
                st.setInt(offset + i++, this.size);
            }
        }
        return i;
    }

    private boolean isJoin() {
        return !CollectionUtils.isEmpty(joins);
    }

    private String alias;

    @Override
    public List<T> asList() throws SQLException {
        return (List<T>) execute();
    }

    private List<String> rsColumns;

    @Override
    protected String buildSQL() throws SQLException {
        aliasMap = new HashMap<String, Class<?>>();
        if (alias == null) {
            alias = "t0";
        }
        List<String> orders = toOrders();

        aliasMap.put(alias, table);

        rsColumns = makeColumn();

        int idx = 1;
        StringBuilder query = new StringBuilder();
        query.append(" from ").append(getTableName()).append(" ")
                .append(alias);
        if (isJoin()) {
            for (Join join : joins) {
                String s = "t" + idx++;
                Query<?> other = join.getOther();
                other.alias = s;
                query.append(join.getJoinStr());
                aliasMap.put(s, other.table);
                if (other.columns != null) {
                    rsColumns.addAll(other.makeColumn());
                }
                orders.addAll(other.toOrders());
            }
        }

        StringBuilder where = new StringBuilder();
        if (filter != null) {
            where.append(filter.toSQL(alias));
        }
        String w = where.toString();
        if (!StringUtils.isEmpty(w)) {
            query.append(" where ").append(w);
        }
        query.insert(0, "select " + StringUtils.join(rsColumns, ", "));

        if (!orders.isEmpty()) {
            query.append(" order by ").append(StringUtils.join(orders, ", "));
        }

        if (size > 0) {
            if (0 == DBTYPE) {
                query.append(" limit ?");
                if (offset > 0) query.append(",?");
            } else {
                String sql = query.toString();
                return "select * from (select a.*, rownum r from (" + sql + ") a " +
                        "where rownum <= " + (offset + size) + ") where r > " + offset;
            }
        }
        return query.toString();
    }

    private List<String> makeColumn() {
        rsColumns = new ArrayList<String>();

        if (columns == null || "*".equals(columns.get(0))) {
            List<DBColumn> dbColumns = ClassParser.parse(table);
            for (DBColumn column : dbColumns) {
                rsColumns.add(alias + "." + DBUtils.propertyToDb(column.getName()));
            }
        } else {
            for (String column : columns) {
                rsColumns.add(alias + "." + DBUtils.propertyToDb(column));
            }
        }
        return rsColumns;
    }

    protected String buildCountSQL() throws SQLException {
        int idx = 1;
        StringBuilder query = new StringBuilder();
        query.append(" from ").append(getTableName()).append(" ")
                .append(alias);
        if (isJoin()) {
            for (Join join : joins) {
                String s = "t" + idx++;
                Query<?> other = join.getOther();
                other.alias = s;
                query.append(join.getJoinStr());
            }
        }

        StringBuilder where = new StringBuilder();
        where.append(filter.toSQL(alias));
        String w = where.toString();
        if (!StringUtils.isEmpty(w)) {
            query.append(" where ").append(w);
        }
        query.insert(0, "select count(1)");
        return query.toString();
    }


    public String getAlias() {
        return alias;
    }


    protected Order order;

    public Query<T> order(String column) {
        if (order == null) order = Order.asc(column);
        else order.addAsc(column);
        return this;
    }

    public Query<T> orderDesc(String column) {
        if (order == null) order = Order.desc(column);
        else order.addDesc(column);
        return this;
    }

    public Order getOrder() {
        return order;
    }

    protected List<String> toOrders() {
        List<String> orders = new ArrayList<String>();
        Order o = order;
        while (o != null) {
            orders.add(alias + "." + DBUtils.propertyToDb(order.getColumn()) + ((order.getType() == Order.DESC) ? " desc" : ""));
            o = o.getNext();
        }
        return orders;
    }

    public PagedList<T> asPagedList(int offset, int size) throws SQLException {
        return limit(offset, size).asPagedList();
    }

    public Query<T> setOrder(Order order) {
        this.order = order;
        return this;
    }

    protected static int DBTYPE = 0; // 0 -- mysql, 1 -- oracle
}
