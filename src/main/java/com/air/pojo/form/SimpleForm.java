package com.air.pojo.form;

import javax.persistence.Id;
import java.util.Date;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class SimpleForm {
    @Id
    private long formId;
    private String formName;
    private String refName;
    private int level;
    private Date createTime;

    public long getFormId() {
        return formId;
    }

    public void setFormId(long formId) {
        this.formId = formId;
    }

    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRefName() {
        return refName;
    }

    public void setRefName(String refName) {
        this.refName = refName;
    }
}
