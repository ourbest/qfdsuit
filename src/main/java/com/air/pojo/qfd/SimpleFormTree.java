package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-25
 *
 * 记录Row和Col使用的tree
 *
 * @author Yonghui Chen
 */
public class SimpleFormTree {
    @Id
    private String formId;
    private String rowRoot;
    private String colRoot;

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String getRowRoot() {
        return rowRoot;
    }

    public void setRowRoot(String rowRoot) {
        this.rowRoot = rowRoot;
    }

    public String getColRoot() {
        return colRoot;
    }

    public void setColRoot(String colRoot) {
        this.colRoot = colRoot;
    }
}
