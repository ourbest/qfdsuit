package com.air.pojo.form;

import javax.persistence.Id;
import java.util.Date;

/**
 * create at: 11-8-29
 *
 * @author Yonghui Chen
 */
public class MatrixForm {
    @Id
    private long formId;
    private long leftId;
    private long topId;
    private boolean hasRoof;
    private boolean hasLeft;
    private String formName;
    private Date createDate;

    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    public long getFormId() {
        return formId;
    }

    public void setFormId(long formId) {
        this.formId = formId;
    }

    public long getLeftId() {
        return leftId;
    }

    public void setLeftId(long leftId) {
        this.leftId = leftId;
    }

    public long getTopId() {
        return topId;
    }

    public void setTopId(long topId) {
        this.topId = topId;
    }

    public boolean isHasRoof() {
        return hasRoof;
    }

    public void setHasRoof(boolean hasRoof) {
        this.hasRoof = hasRoof;
    }

    public boolean isHasLeft() {
        return hasLeft;
    }

    public void setHasLeft(boolean hasLeft) {
        this.hasLeft = hasLeft;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
