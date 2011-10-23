package com.air.service;

import com.air.dao.FormRoleDao;
import com.air.dao.ItemTreeNodeDao;
import com.air.dao.ProjectStepFormDao;
import com.air.pojo.qfd.FormRole;
import com.air.pojo.qfd.ItemTreeNode;
import com.air.pojo.qfd.ProjectStepForm;
import org.apache.commons.lang.math.NumberUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * create at: 11-8-11
 *
 * @author Yonghui Chen
 */
public class FormService {
    @AirAutowired
    FormRoleDao formRoleDao;
    @AirAutowired
    ProjectStepFormDao projectStepFormDao;
    @AirAutowired
    private ItemTreeNodeDao itemTreeNodeDao;

    public void assignRoles(String formId, String[] roles) throws SQLException {
        // delete old
        formRoleDao.deleteForm(formId);
        List<FormRole> n = new ArrayList<FormRole>(roles.length);
        for (String s : roles) {
            FormRole r = new FormRole();
            r.setFormId(formId);
            r.setRoleId(s);
            n.add(r);
        }
        formRoleDao.insert(n);
    }

    public List<ItemTreeNode> getFormRoles(String formId) throws SQLException {
        List<FormRole> formRoles = formRoleDao.findByForm(formId);
        List<String> ids = new ArrayList<String>(formRoles.size());
        for (FormRole formRole : formRoles) {
            ids.add(formRole.getRoleId());
        }
        return itemTreeNodeDao.findByIds(ids);
    }


    public void assignSteps(String projectId, String formId, String[] stepIds) throws SQLException {
        projectStepFormDao.deleteForm(formId);
        for (String stepId : stepIds) {
            ProjectStepForm f = new ProjectStepForm();
            f.setFormId(formId);
            f.setProjectId(projectId);
            f.setStepId(NumberUtils.toInt(stepId));
            projectStepFormDao.insert(f);
        }
    }
}
