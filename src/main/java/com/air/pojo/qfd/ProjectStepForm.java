package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-8-20
 *
 * @author Yonghui Chen
 */
public class ProjectStepForm {
    @Id
    private String projectId;
    @Id
    private int stepId;
    @Id
    private String formId;

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public int getStepId() {
        return stepId;
    }

    public void setStepId(int stepId) {
        this.stepId = stepId;
    }

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }
}
