package com.air.pojo.form;

import javax.persistence.Id;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class CellEditor {
    @Id
    private long formId;
    @Id
    private long rowId;
    @Id
    private long colId;
    private int type;
    private String param;

    public long getFormId() {
        return formId;
    }

    public void setFormId(long formId) {
        this.formId = formId;
    }

    public long getRowId() {
        return rowId;
    }

    public void setRowId(long rowId) {
        this.rowId = rowId;
    }

    public long getColId() {
        return colId;
    }

    public void setColId(long colId) {
        this.colId = colId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }
}
