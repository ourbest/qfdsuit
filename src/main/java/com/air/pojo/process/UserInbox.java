package com.air.pojo.process;

import javax.persistence.Id;
import java.util.Date;

/**
 * create at: 11-9-15
 *
 * @author Yonghui Chen
 */
public class UserInbox {
    @Id
    private String userId;
    @Id
    private long projectId;
    private String projectName;
    private Date updateTime;
    private int status;

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

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
