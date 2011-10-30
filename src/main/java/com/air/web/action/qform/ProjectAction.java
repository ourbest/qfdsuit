package com.air.web.action.qform;

import com.air.pojo.form.MatrixForm;
import com.air.pojo.form.SimpleForm;
import com.air.pojo.process.Project;
import com.air.pojo.process.ProjectData;
import com.air.pojo.process.ProjectForm;
import com.air.pojo.process.UserInbox;
import com.air.service.AirAutowired;
import com.air.service.form.FormService;
import com.air.service.process.ProjectService;
import com.air.web.bvo.ProjectFormVo;
import com.air.web.bvo.ProjectVo;
import com.air.web.bvo.TypeBvo;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * create at: 11-9-3
 *
 * @author Yonghui Chen
 */
public class ProjectAction {
    @AirAutowired
    ProjectService projectService;
    @AirAutowired
    FormService formService;

    public List<Project> templates() throws SQLException {
        return projectService.findTemplates();
    }

    public Project create(Project p) throws SQLException {
        return projectService.createProject(p.getName());
    }

    public List<UserInbox> inbox(Principal user) throws SQLException {
        if (user == null) return Collections.emptyList();
        return projectService.getUserInbox(user.getName());
    }

    public UserInbox assign(UserInbox inbox) throws SQLException {
        return projectService.createInbox(inbox);
    }

    public List<ProjectFormVo> forms(Project p) throws SQLException {
        List<ProjectForm> forms = projectService.getForms(p.getProjectId());
        List<ProjectFormVo> vos = new ArrayList<ProjectFormVo>(forms.size());
        for (ProjectForm form : forms) {
            ProjectFormVo vo = new ProjectFormVo();
            vo.setForm(form);
            vo.setName(formService.getFormName(form));
            vos.add(vo);
        }
        return vos;
    }

    public List<ProjectForm> load(Project project) throws SQLException {
        return projectService.getForms(project.getProjectId());
    }

    public Project info(Project project) throws SQLException {
        return projectService.getProject(project.getProjectId());
    }

    // 添加已有表单
    public void addForm(ProjectForm form) throws SQLException {
        projectService.addForm(form);
    }

    public ProjectForm createMatrixForm(ProjectForm form) throws SQLException {
        MatrixForm mf = new MatrixForm();
        mf.setFormName("新质量屋");
        formService.createMatrixForm(mf);
        addForm(form, mf);
        return form;
    }

    public String deleteForm(ProjectForm form) throws SQLException {
        projectService.deleteForm(form.getFormId());
        formService.deleteForm(form.getFormId());
        return "OK";
    }

    public ProjectForm createRelatedForm(ProjectForm form) throws SQLException {
        SimpleForm simpleForm = formService.createRelatedForm(form.getFormId());
        addForm(form, simpleForm);
        return form;
    }

    public ProjectForm createForm(ProjectForm form) throws SQLException {
        SimpleForm simpleForm = new SimpleForm();
        simpleForm.setFormName("新表单");

        formService.createForm(simpleForm);
        addForm(form, simpleForm);
        return form;
    }

    private void addForm(ProjectForm form, SimpleForm simpleForm) throws SQLException {
        form.setFormId(simpleForm.getFormId());
        form.setFormType(0);
        form.setFormName(simpleForm.getFormName());
        form.setPosLeft(10);
        form.setPosTop(10);
        projectService.addForm(form);
    }

    private void addForm(ProjectForm form, MatrixForm matrixForm) throws SQLException {
        form.setFormId(matrixForm.getFormId());
        form.setFormType(1);
        form.setFormName(matrixForm.getFormName());
        form.setPosLeft(10);
        form.setPosTop(10);
        projectService.addForm(form);
    }

    public ProjectForm position(ProjectForm form) throws SQLException {
        return projectService.updatePosition(form);
    }

    public List<ProjectData> data(ProjectVo prj) throws SQLException {
        return projectService.getData(prj.getProjectId(), prj.getFormId());
    }

    public Map<String, List<ProjectData>> matrixData(ProjectVo prj) throws SQLException {
        return projectService.getMatrixData(prj.getProjectId(), prj.getFormId());
    }

    public List<ProjectData> set(ProjectData val) throws SQLException {
        return projectService.setCellData(val);
//        return projectService.getData(val.getProjectId(), val.getFormId());
    }

    public List<Project> list(TypeBvo type) throws SQLException {
        return projectService.listProjects(type.getType());
    }

    public Project asTemplate(Project p) throws SQLException {
        return projectService.asTemplate(p);
    }

    public Project setStatus(Project p) throws SQLException {
        return projectService.setStatus(p);
    }

    public Project setProjectName(Project p) throws SQLException {
        Project project = projectService.getProject(p.getProjectId());
        project.setName(p.getName());
        projectService.saveProject(project);
        return project;
    }

    public List<ProjectForm> listFormsByType(ProjectForm form) throws SQLException {
        int type = form.getFormType();
        return projectService.listFormsByType(form.getProjectId(), type);
    }


    public Project cloneProject(Project p) throws SQLException {
        return projectService.cloneProject(p.getProjectId());
    }
}
