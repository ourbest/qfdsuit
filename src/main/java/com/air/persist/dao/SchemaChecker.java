package com.air.persist.dao;

import java.sql.SQLException;

/**
 * create at: 11-7-5
 *
 * @author Yonghui Chen
 */
public interface SchemaChecker {
    public String checkTable(String className) throws SQLException;
}
