package com.air.web.bvo;

import com.air.web.util.FormDesc;

import java.util.List;

/**
 * create at: 11-8-4
 *
 * @author Yonghui Chen
 */
public class RowCategory {
    private String text;
    private int size;
    private List<FormDesc> rows;

    public RowCategory(String text, List<FormDesc> rows) {
        this.text = text;
        this.rows = rows;
        this.size = rows.size();
    }

    public RowCategory() {
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public List<FormDesc> getRows() {
        return rows;
    }

    public void setRows(List<FormDesc> rows) {
        this.rows = rows;
    }
}
