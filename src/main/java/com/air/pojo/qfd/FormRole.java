package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * 表单操作人员的角色
 * <p/>
 * create at: 11-8-11
 *
 * @author Yonghui Chen
 */
public class FormRole {
    @Id
    private String formId;
    @Id
    private String roleId;

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
