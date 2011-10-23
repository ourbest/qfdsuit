package com.air.web.bvo;

import com.air.pojo.process.ProjectForm;

/**
 * create at: 11-9-5
 *
 * @author Yonghui Chen
 */
public class ProjectFormVo {
    private ProjectForm form;
    private String name;

    public ProjectForm getForm() {
        return form;
    }

    public void setForm(ProjectForm form) {
        this.form = form;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
