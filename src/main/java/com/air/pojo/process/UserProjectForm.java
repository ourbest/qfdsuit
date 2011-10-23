package com.air.pojo.process;

import javax.persistence.Id;
import java.util.Date;

/**
 * create at: 11-9-15
 *
 * @author Yonghui Chen
 */
public class UserProjectForm {
    @Id
    private String userId;
    @Id
    private long projectId;
    @Id
    private long formId;
    private Date updateTime;
    private int status;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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
