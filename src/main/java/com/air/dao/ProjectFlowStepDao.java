package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.ProjectFlowStep;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-8-15
 *
 * @author Yonghui Chen
 */
public class ProjectFlowStepDao extends DaoTemplate<ProjectFlowStep> {

    public List<ProjectFlowStep> findByProject(String projectId) throws SQLException {
        return createQuery().addFilter("projectId", projectId).asList();
    }

    public void deleteByProjectId(String projectId) throws SQLException {
        createDelete().addFilter("projectId", projectId).executeUpdate();
    }
}
