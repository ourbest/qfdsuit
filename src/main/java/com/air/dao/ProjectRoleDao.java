package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.ProjectRole;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-8-11
 *
 * @author Yonghui Chen
 */
public class ProjectRoleDao extends DaoTemplate<ProjectRole> {
    public int deleteProject(String projectId) throws SQLException {
        return createDelete().addFilter("projectId", projectId).executeUpdate();
    }

    public List<ProjectRole> findByProject(String projectId) throws SQLException {
        return createQuery().addFilter("projectId", projectId).asList();
    }
}
