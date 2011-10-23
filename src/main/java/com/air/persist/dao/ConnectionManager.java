package com.air.persist.dao;

import com.air.persist.dao.mysql.MySQLSchemaChecker;
import com.air.persist.dao.oracle.OracleSchemaChecker;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * create at: 11-7-5
 *
 * @author Yonghui Chen
 */
public class ConnectionManager {
    static Properties prop = new Properties();
    private static SchemaChecker checker;

    static {
        InputStream in = ConnectionManager.class.getResourceAsStream("/jdbc.properties");
        try {
            prop.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            String d = prop.getProperty("driver");
            if(d.contains("mysql")) {
                checker = new MySQLSchemaChecker();
            } else if(d.contains("oracle")) {
                checker = new OracleSchemaChecker();
            }
            Class.forName(d);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        IOUtils.closeQuietly(in);
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(prop.getProperty("url"),
                prop.getProperty("user"), prop.getProperty("password"));
    }


    public static SchemaChecker getChecker() {
        return checker;
    }
}
