package com.air.web.form;

import com.air.web.util.FormDesc;

import java.util.List;

/**
 * create at: 11-7-25
 *
 * @author Yonghui Chen
 */
public class SimpleForm {
    private List<FormDesc> columns;
    private List<FormDesc> rows;

    public List<FormDesc> getColumns() {
        return columns;
    }

    public void setColumns(List<FormDesc> columns) {
        this.columns = columns;
    }

    public List<FormDesc> getRows() {
        return rows;
    }

    public void setRows(List<FormDesc> rows) {
        this.rows = rows;
    }
}
