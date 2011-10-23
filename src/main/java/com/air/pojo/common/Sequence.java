package com.air.pojo.common;

import javax.persistence.Id;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class Sequence {
    @Id
    private String id;
    private long curVal;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public long getCurVal() {
        return curVal;
    }

    public void setCurVal(long curVal) {
        this.curVal = curVal;
    }
}
