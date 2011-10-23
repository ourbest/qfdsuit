package com.air.pojo.form;

import javax.persistence.Id;

/**
 * create at: 11-9-14
 *
 * @author Yonghui Chen
 */
public class CellRelation {
    @Id
    private String reId;
    private long formId;
    private long rowId;
    private long colId;
    private long rFormId;
    private long rRowId;
    private long rColId;

    private long formulaId;

    public String getReId() {
        return reId;
    }

    public void setReId(String reId) {
        this.reId = reId;
    }

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

    public long getRFormId() {
        return rFormId;
    }

    public void setRFormId(long rFormId) {
        this.rFormId = rFormId;
    }

    public long getRRowId() {
        return rRowId;
    }

    public void setRRowId(long rRowId) {
        this.rRowId = rRowId;
    }

    public long getRColId() {
        return rColId;
    }

    public void setRColId(long rColId) {
        this.rColId = rColId;
    }

    public long getFormulaId() {
        return formulaId;
    }

    public void setFormulaId(long formulaId) {
        this.formulaId = formulaId;
    }
}
