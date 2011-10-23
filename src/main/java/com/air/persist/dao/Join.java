package com.air.persist.dao;

import com.air.persist.util.DBUtils;

import java.sql.SQLException;

/**
 * create at: 11-7-5
 *
 * @author Yonghui Chen
 */
public class Join {
    private String propertySource;
    private String propertyTarget;
    private Query<?> other;

    private int type;

    public static final int INNER = 0;
    public static final int LEFT = 1;
    public static final int RIGHT = 2;

    public String getPropertySource() {
        return propertySource;
    }

    public void setPropertySource(String propertySource) {
        this.propertySource = propertySource;
    }

    public String getPropertyTarget() {
        return propertyTarget;
    }

    public void setPropertyTarget(String propertyTarget) {
        this.propertyTarget = propertyTarget;
    }

    public Query<?> getOther() {
        return other;
    }

    public void setOther(Query<?> other) {
        this.other = other;
    }

    public int getType() {
        return type;
    }

    public String getJoinStr() throws SQLException {
        String str = "";
        switch (type) {
            case INNER:
                str = " inner join ";
                break;
            case LEFT:
                str = " left join ";
                break;
            case RIGHT:
                str = " right join ";
                break;
        }
        str += other.getTableName() + " " + other.getAlias() + " on t0." + DBUtils.propertyToDb(propertySource)
                + "=t1." + DBUtils.propertyToDb(propertyTarget);
        return str;
    }

    public void setType(int type) {
        this.type = type;
    }
}
