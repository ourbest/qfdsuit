package com.air.persist.dao;

/**
 * create at: 11-7-7
 *
 * @author Yonghui Chen
 */
public class DBColumn {
    private String name;
    private Class<?> type;
    private int len;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Class<?> getType() {
        return type;
    }

    public void setType(Class<?> type) {
        this.type = type;
    }

    public int getLen() {
        return len;
    }

    public void setLen(int len) {
        this.len = len;
    }
}
