package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-29
 *
 * @author Yonghui Chen
 */
public class CellEditor {
    @Id
    private String formId;
    @Id
    private String cellId;
    private int type;
    private String legend;
    private String formula;

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String getCellId() {
        return cellId;
    }

    public void setCellId(String cellId) {
        this.cellId = cellId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getLegend() {
        return legend;
    }

    public void setLegend(String legend) {
        this.legend = legend;
    }

    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }
}
