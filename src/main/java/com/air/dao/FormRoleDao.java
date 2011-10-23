package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.FormRole;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-8-11
 *
 * @author Yonghui Chen
 */
public class FormRoleDao extends DaoTemplate<FormRole> {
    public void deleteForm(String formId) throws SQLException {
        createDelete().addFilter("formId", formId).executeUpdate();
    }

    public List<FormRole> findByForm(String formId) throws SQLException {
        return createQuery().addFilter("formId", formId).asList();
    }
}
