package com.air.dao.process;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.process.ProjectForm;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-9-4
 *
 * @author Yonghui Chen
 */
public class ProjectFormDao extends DaoTemplate<ProjectForm> {
    public List<ProjectForm> findByProject(long projectId) throws SQLException {
        return createQuery().addFilter("projectId", projectId).asList();
    }

    public ProjectForm getProjectForm(long projectId, long formId) throws SQLException {
        return createQuery().addFilter("projectId", projectId)
                .addFilter("formId", formId).queryOne();
    }

    public void deleteForm(long formId) throws SQLException {
        createDelete().addFilter("formId", formId).executeUpdate();
    }

    public ProjectForm getProjectFormByFormId(long formId) throws SQLException {
        return createQuery().addFilter("formId", formId).queryOne();
    }

    public List<ProjectForm> listByType(long projectId, int type) throws SQLException {
        return createQuery().addFilter("projectId", projectId).addFilter("formType", type).asList();
    }
}
