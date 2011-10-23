package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-25
 *
 * @author Yonghui Chen
 */
public class SimpleFormRow {
    @Id
    private String rowId;
    private String rowCode;
    private String formId;
    private String nodeId;
    private String unit;
    private int showOrder;

    public String getRowCode() {
        return rowCode;
    }

    public void setRowCode(String rowCode) {
        this.rowCode = rowCode;
    }

    public String getRowId() {
        return rowId;
    }

    public void setRowId(String rowId) {
        this.rowId = rowId;
    }

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        this.nodeId = nodeId;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getShowOrder() {
        return showOrder;
    }

    public void setShowOrder(int showOrder) {
        this.showOrder = showOrder;
    }
}
