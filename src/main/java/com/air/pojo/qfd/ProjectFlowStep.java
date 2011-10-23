package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-8-11
 *
 * @author Yonghui Chen
 */
public class ProjectFlowStep {
    @Id
    private String projectId;
    @Id
    private int stepId;
    private String stepName;

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

    public String getStepName() {
        return stepName;
    }

    public void setStepName(String stepName) {
        this.stepName = stepName;
    }
}
