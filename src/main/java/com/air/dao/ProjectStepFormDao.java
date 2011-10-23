package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.ProjectStepForm;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-8-20
 *
 * @author Yonghui Chen
 */
public class ProjectStepFormDao extends DaoTemplate<ProjectStepForm> {
    public List<ProjectStepForm> findByForm(String formId) throws SQLException {
        return createQuery().addFilter("formId", formId).asList();
    }

    public void deleteForm(String formId) throws SQLException {
        createDelete().addFilter("formId", formId).executeUpdate();
    }
}
