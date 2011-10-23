package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-25
 *
 * @author Yonghui Chen
 */
public class SimpleFormColumn {
    @Id
    private String colId;
    private String colCode; // 用于引用
    private String formId;
    private String nodeId;
    private String adhocName; // itemId为null，表示此列是自定义
    private int drawType; // 0 普通文字, 1 数字, 2 百分比, 3 长短等（块表示...）
    private int hasSummary;
    private int showOrder;

    public String getColCode() {
        return colCode;
    }

    public void setColCode(String colCode) {
        this.colCode = colCode;
    }

    public String getColId() {
        return colId;
    }

    public void setColId(String colId) {
        this.colId = colId;
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

    public int getDrawType() {
        return drawType;
    }

    public void setDrawType(int drawType) {
        this.drawType = drawType;
    }

    public String getAdhocName() {
        return adhocName;
    }

    public void setAdhocName(String adhocName) {
        this.adhocName = adhocName;
    }

    public int getHasSummary() {
        return hasSummary;
    }

    public void setHasSummary(int hasSummary) {
        this.hasSummary = hasSummary;
    }

    public int getShowOrder() {
        return showOrder;
    }

    public void setShowOrder(int showOrder) {
        this.showOrder = showOrder;
    }
}
