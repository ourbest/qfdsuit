package com.air.pojo.process;

import javax.persistence.Id;
import java.util.Date;

/**
 * create at: 11-9-3
 *
 * @author Yonghui Chen
 */
public class ProjectForm {
    @Id
    private long projectId;
    @Id
    private long formId;
    private String formName;
    private int step;
    private int formType;
    private Date updateTime;
    private int status;
    private int posLeft;
    private int posTop;

    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    public int getPosLeft() {
        return posLeft;
    }

    public void setPosLeft(int posLeft) {
        this.posLeft = posLeft;
    }

    public int getPosTop() {
        return posTop;
    }

    public void setPosTop(int posTop) {
        this.posTop = posTop;
    }

    public int getStep() {
        return step;
    }

    public void setStep(int step) {
        this.step = step;
    }

    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    public long getFormId() {
        return formId;
    }

    public void setFormId(long formId) {
        this.formId = formId;
    }

    public int getFormType() {
        return formType;
    }

    public void setFormType(int formType) {
        this.formType = formType;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
