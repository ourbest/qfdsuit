package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-24
 *
 * @author Yonghui Chen
 */
public class MatrixForm {
    @Id
    private String formId;
    private String rowId;
    private String colId;
    private String roofId;

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String getRowId() {
        return rowId;
    }

    public void setRowId(String rowId) {
        this.rowId = rowId;
    }

    public String getColId() {
        return colId;
    }

    public void setColId(String colId) {
        this.colId = colId;
    }

    public String getRoofId() {
        return roofId;
    }

    public void setRoofId(String roofId) {
        this.roofId = roofId;
    }
}
