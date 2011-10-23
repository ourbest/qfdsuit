package com.air.persist.dao;

import com.air.persist.util.PagedList;

import java.sql.*;
import java.util.List;
import java.util.Map;

/**
 * create at: 11-7-4
 *
 * @author Yonghui Chen
 */
public abstract class Verb<T> {
    protected Class<T> table;
    protected Filter filter;

    public Verb() {

    }


    public void setTable(Class<T> table) {
        this.table = table;
    }

    public Verb(Class<T> table) {
        this.table = table;
    }


    public int executeUpdate() throws SQLException {
        return (Integer) execute();
    }

    public static boolean showSQL = false;

    public Object execute() throws SQLException {
        Connection con = ConnectionManager.getConnection();
        try {
            String sql = buildSQL();
            if (showSQL) System.out.println(sql);
            PreparedStatement st = con.prepareStatement(sql);
            try {
                setParameter(st, 1, false);
                boolean b = st.execute();
                if (b) {
                    return parseResult(st.getResultSet());
                } else {
                    return st.getUpdateCount();
                }
            } finally {
                st.close();
            }
        } finally {
            con.close();
        }
    }

    protected int setParameter(PreparedStatement st, int offset, boolean isCount) throws SQLException {
        return filter.setParameters(st, offset);
    }

    protected Object parseResult(ResultSet resultSet) throws SQLException {
        return null;
    }

    public List<Map<Class, Object>> query() throws SQLException {
        throw new UnsupportedOperationException();
    }

    public T queryOne() throws SQLException {
        Query q = (Query) this;
        q.limit(1);
        List<T> list = asList();
        return list.size() == 1 ? list.get(0) : null;
    }

    public List<T> asList() throws SQLException {
        throw new UnsupportedOperationException();
    }

    public PagedList<T> asPagedList() throws SQLException {
        throw new UnsupportedOperationException();
    }

    public int count() throws SQLException {
        throw new UnsupportedOperationException();
    }

    public Verb<T> addFilter(String column, List<?> values) {
        return addFilter(column, values == null ? null : values.toArray(new Object[values.size()]));
    }

    public Verb<T> addFilter(String column, Operator op, Object values) {
        Filter filter = new Filter();
        filter.setValue(new Object[]{values});
        filter.setColumn(column);
        filter.setOp(op);
        this.filter = (this.filter == null) ? filter : this.filter.and(filter);
        return this;
    }

    public Verb<T> addFilter(String column, Object... values) {
        if (values != null && values.length == 0) return this;

        Filter filter = new Filter();
//        filter.setBody("= ?");
        filter.setColumn(column);
        filter.setValue(values);
        filter.setOp(Operator.eq);
        this.filter = (this.filter == null) ? filter : this.filter.and(filter);
        return this;
    }

    protected String getTableName() throws SQLException {
        return ConnectionManager.getChecker().checkTable(table.getName());
    }

    @Override
    public String toString() {
        try {
            return buildSQL();
        } catch (SQLException e) {
            return e.getLocalizedMessage();
        }
    }

    protected abstract String buildSQL() throws SQLException;

    protected int setDBValue(PreparedStatement pst, int pos, Object value) throws SQLException {
        if (value == null) {
            pst.setNull(pos++, Types.VARCHAR);
        } else {
            if (Number.class.isAssignableFrom(value.getClass())) {
                pst.setLong(pos++, Long.parseLong(value.toString()));
            } else if (java.util.Date.class.isAssignableFrom(value.getClass())) {
                pst.setTimestamp(pos++, new Timestamp(((java.util.Date) value).getTime()));
            } else if (Boolean.class.isAssignableFrom(value.getClass())) {
                pst.setInt(pos++, ((Boolean) value) ? 1 : 0);
            } else {
                pst.setString(pos++, value.toString());
            }
        }
        return pos;
    }

    public PagedList<T> asPagedList(int offset, int size) throws SQLException {
        throw new UnsupportedOperationException();
    }
}
