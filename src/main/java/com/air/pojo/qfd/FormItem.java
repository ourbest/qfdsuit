package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-17
 *
 * @author Yonghui Chen
 */
public class FormItem {
    @Id
    private String formId;
    @Id
    private String itemId;

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }
}
