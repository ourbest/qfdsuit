package com.air.persist.dao;

import org.apache.commons.lang.StringUtils;

import java.sql.SQLException;

/**
 * create at: 11-7-4
 *
 * @author Yonghui Chen
 */
public class Delete<T> extends Verb<T> {
    public Delete() {
    }

    public Delete(Class<T> table) {
        super(table);
    }

    @Override
    protected String buildSQL() throws SQLException {
        String s = filter.toSQL(null);
        if (StringUtils.isBlank(s)) {
            return "TRUNCATE TABLE " + getTableName();
        }
        return "DELETE FROM " + getTableName() + " WHERE " + s;
    }
}
