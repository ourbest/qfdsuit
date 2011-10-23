package com.air.pojo.form;

import javax.persistence.Id;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class CellValidation {
    @Id
    private long formulaId;
    private long formId;
    private long rowId;
    private long colId;
    private String formula;

    public long getFormulaId() {
        return formulaId;
    }

    public void setFormulaId(long formulaId) {
        this.formulaId = formulaId;
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

    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }
}
