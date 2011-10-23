package com.air.service;

import com.air.dao.*;
import com.air.persist.dao.Order;
import com.air.pojo.qfd.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * create at: 11-8-11
 *
 * @author Yonghui Chen
 */
public class ProjectService {
    @AirAutowired
    ProjectRoleDao projectRoleDao;
    @AirAutowired
    ProjectFormDao projectFormDao;
    @AirAutowired
    ProjectDao projectDao;
    @AirAutowired
    ItemTreeNodeDao itemTreeNodeDao;
    @AirAutowired
    ProjectFlowStepDao projectFlowStepDao;

    public void assignRoles(String projectId, String[] roleId) throws SQLException {
        // delete old
        projectRoleDao.deleteProject(projectId);
        List<ProjectRole> n = new ArrayList<ProjectRole>(roleId.length);
        for (String s : roleId) {
            ProjectRole r = new ProjectRole();
            r.setProjectId(projectId);
            r.setRoleId(s);
            n.add(r);
        }
        projectRoleDao.insert(n);
    }

    public void deleteForm(ProjectForm form) throws SQLException {
        projectFormDao.delete(form);
    }

    public void insertForm(ProjectForm form) throws SQLException {
        projectFormDao.insert(form);
    }

    public ProjectForm updateForm(ProjectForm form) throws SQLException {
        ProjectForm db = projectFormDao.get(form.getFormId());
        if (db == null) return null;
        db.setUpdateTime(new Date());
        db.setType(form.getType());
        db.setFormName(form.getFormName());
        db.setFormCode(form.getFormCode());
        db.setStatus(form.getStatus());
        db.setDescription(form.getDescription());
        projectFormDao.update(db);
        return db;
    }

    public List<Project> listProjects() throws SQLException {
        return projectDao.listAll(Order.desc("createTime"));
    }

    public void insertProject(Project p) throws SQLException {
        projectDao.insert(p);
    }

    public Project updateProject(Project project) throws SQLException {
        Project db = projectDao.get(project.getProjectId());
        if (db == null) return null;
        db.setUpdateTime(new Date());
        db.setProjectName(project.getProjectName());
        db.setStatus(project.getStatus());
        db.setDescription(project.getDescription());
        projectDao.update(db);
        return db;
    }

    public List<ProjectForm> findProjectForms(String projectId) throws SQLException {
        return projectFormDao.findByProject(projectId);
    }

    public List<ItemTreeNode> getProjectRoles(String projectId) throws SQLException {
        List<ProjectRole> projectRoles = projectRoleDao.findByProject(projectId);
        List<String> ids = new ArrayList<String>(projectRoles.size());
        for (ProjectRole projectRole : projectRoles) {
            ids.add(projectRole.getRoleId());
        }
        return itemTreeNodeDao.findByIds(ids);
    }

    public List<ProjectFlowStep> getProjectSteps(String projectId) throws SQLException {
        return projectFlowStepDao.findByProject(projectId);
    }

    public void clearStep(String projectId) throws SQLException {
        projectFlowStepDao.deleteByProjectId(projectId);
    }

    public void updateStep(ProjectFlowStep step) throws SQLException {
        projectFlowStepDao.update(step);
    }

    public void insertStep(ProjectFlowStep step) throws SQLException {
        projectFlowStepDao.insert(step);
    }
}
