package com.air.service.form.bvo;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class CellEditorForm {
    private long formId;
    private String cells;
    private int type;
    private String param;

    public long getFormId() {
        return formId;
    }

    public void setFormId(long formId) {
        this.formId = formId;
    }

    public String getCells() {
        return cells;
    }

    public void setCells(String cells) {
        this.cells = cells;
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
