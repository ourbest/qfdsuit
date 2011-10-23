package com.air.pojo.form;

import javax.persistence.Id;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class FormHierarchy {
    @Id
    private long formId;
    private long parentId;

    public long getFormId() {
        return formId;
    }

    public void setFormId(long formId) {
        this.formId = formId;
    }

    public long getParentId() {
        return parentId;
    }

    public void setParentId(long parentId) {
        this.parentId = parentId;
    }
}
