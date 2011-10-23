package com.air.pojo.process;

import javax.persistence.Id;
import java.util.Date;

/**
 * create at: 11-9-3
 *
 * @author Yonghui Chen
 */
public class ProjectData {
    @Id
    private long projectId;
    private long formId;
    @Id
    private long rowId;
    @Id
    private long colId;
    private String data;
    private Date updateTime;

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

    public long getRowId() {
        return rowId;
    }

    public void setRowId(long rowId) {
        this.rowId = rowId;
    }

    public long getColId() {
        return colId;
    }

    public void setColId(long colId) {
        this.colId = colId;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
