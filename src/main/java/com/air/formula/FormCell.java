package com.air.formula;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * create at: 11-7-29
 *
 * @author Yonghui Chen
 */
public class FormCell {
    private String formCode;
    private String column;
    private int row;

    public FormCell(String formCode, String column, int row) {
        this.formCode = formCode;
        this.column = column;
        this.row = row;
    }

    public String getFormCode() {
        return formCode;
    }

    public void setFormCode(String formCode) {
        this.formCode = formCode;
    }

    public String getColumn() {
        return column;
    }

    public void setColumn(String column) {
        this.column = column;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this).
                append("formCode", formCode).
                append("column", column).
                append("row", row).
                toString();
    }
}
