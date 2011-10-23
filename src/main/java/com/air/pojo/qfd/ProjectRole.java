package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * 项目涉及的角色
 *  create at: 11-8-11
 *
 * @author Yonghui Chen
 */
public class ProjectRole {
    @Id
    private String projectId;
    @Id
    private String roleId;

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
