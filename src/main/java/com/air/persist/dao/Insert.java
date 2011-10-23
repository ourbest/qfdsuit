package com.air.persist.dao;

import com.air.persist.util.DBUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * create at: 11-7-7
 *
 * @author Yonghui Chen
 */
@SuppressWarnings("unchecked")
public class Insert<T> extends Verb<T> {
    private List<T> beans;
    private boolean replace;

    public Insert(T... beans) {
        this.beans = Arrays.asList(beans);
    }

    public Insert(List<T> beans) {
        this.beans = beans;
    }

    public Insert setReplace(boolean replace) {
        this.replace = replace;
        return this;
    }

    @Override
    public Object execute() throws SQLException {
        Connection con = ConnectionManager.getConnection();
        setTable((Class<T>) beans.get(0).getClass());
        try {
            String sql = buildSQL();
            if(showSQL) System.out.println(sql);
            PreparedStatement st = con.prepareStatement(sql);
            try {
                for (T bean : beans) {
                    try {
                        setParameter(st, bean);
                        st.addBatch();
                    } catch (InvocationTargetException e) {
                        e.printStackTrace();
                    } catch (NoSuchMethodException e) {
                        e.printStackTrace();
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    }
                }
                int[] ints = st.executeBatch();
                if (ints.length == 1) return ints[0];
                return ints;
            } finally {
                st.close();
            }
        } finally {
            con.close();
        }
    }

    private void setParameter(PreparedStatement st, T bean) throws InvocationTargetException,
            NoSuchMethodException, IllegalAccessException, SQLException {
        int idx = 1;
        for (String column : columns) {
            setDBValue(st, idx++, PropertyUtils.getProperty(bean, DBUtils.dbToProperty(column)));
        }
    }

    private List<String> columns;

    @Override
    protected String buildSQL() throws SQLException {
        List<DBColumn> dbColumns = ClassParser.parse(table);
        columns = new ArrayList<String>(dbColumns.size());
        List<String> q = new ArrayList<String>();
        for (DBColumn dbColumn : dbColumns) {
            columns.add(DBUtils.propertyToDb(dbColumn.getName()));
            q.add("?");
        }
        // todo oracle
        StringBuilder query = new StringBuilder(!replace?"insert into ":"replace into ")
                .append(getTableName()).append(" (");
        query.append(StringUtils.join(columns, ",")).append(") values (").append(StringUtils.join(q, ",")).append(")");
        return query.toString();
    }
}
