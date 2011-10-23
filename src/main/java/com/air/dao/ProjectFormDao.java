package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.ProjectForm;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-7-17
 *
 * @author Yonghui Chen
 */
public class ProjectFormDao extends DaoTemplate<ProjectForm> {
    public ProjectForm findByProjectAndFormCode(String projectId, String code) throws SQLException {
        return createQuery().addFilter("projectId", projectId).addFilter("formCode", code).queryOne();
    }

    public List<ProjectForm> findByProject(String projectId) throws SQLException {
        return filter("projectId", projectId);
    }
}
