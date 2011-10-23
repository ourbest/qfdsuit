package com.air.service.process;

import com.air.dao.form.MatrixFormDao;
import com.air.dao.process.ProjectDao;
import com.air.dao.process.ProjectDataDao;
import com.air.dao.process.ProjectFormDao;
import com.air.dao.process.UserInboxDao;
import com.air.event.CellUpdateEvent;
import com.air.event.EventManager;
import com.air.pojo.form.FormRow;
import com.air.pojo.form.MatrixForm;
import com.air.pojo.form.SimpleForm;
import com.air.pojo.process.Project;
import com.air.pojo.process.ProjectData;
import com.air.pojo.process.ProjectForm;
import com.air.pojo.process.UserInbox;
import com.air.service.AirAutowired;
import com.air.service.common.SequenceService;
import com.air.service.form.FormService;
import com.air.service.form.bvo.DesignerVo;
import com.air.service.values.ProjectStatus;

import java.sql.SQLException;
import java.util.*;

/**
 * create at: 11-9-3
 *
 * @author Yonghui Chen
 */
public class ProjectService {
    @AirAutowired
    ProjectDao projectDao;
    @AirAutowired
    ProjectFormDao projectFormDao;
    @AirAutowired
    ProjectDataDao projectDataDao;
    @AirAutowired
    SequenceService sequenceService;
    @AirAutowired
    MatrixFormDao matrixFormDao;
    @AirAutowired
    UserInboxDao userInboxDao;

    public Project getProject(long projectId) throws SQLException {
        return projectDao.get(projectId);
    }

    public List<ProjectForm> getForms(long projectId) throws SQLException {
        return projectFormDao.findByProject(projectId);
    }

    public List<ProjectData> getData(long projectId, long formId) throws SQLException {
        return projectDataDao.findByForm(projectId, formId);
    }

    public void setCellData(long projectId, long formId, long rowId, long colId, String data) throws SQLException {
        ProjectData db = new ProjectData();
        db.setData(data);
        db.setUpdateTime(new Date());
        db.setColId(colId);
        db.setFormId(formId);
        db.setRowId(rowId);
        db.setProjectId(projectId);
        setCellData(db);
    }

    public void setCellData(ProjectData val) throws SQLException {
        ProjectData db = projectDataDao.getData(val.getProjectId(), val.getRowId(), val.getColId());
        if (db == null) {
            projectDataDao.insert(val);
        } else {
            db.setData(val.getData());
            db.setUpdateTime(new Date());
            projectDataDao.update(db);
        }
        EventManager.getInstance().fireEvent(new CellUpdateEvent(db));
    }

    public Project createProject(String name) throws SQLException {
        Project p = new Project();
        p.setCreateTime(new Date());
        p.setName(name);
        p.setProjectId(sequenceService.getNextId("project"));
        projectDao.insert(p);
        return p;
    }

    public void addForm(ProjectForm form) throws SQLException {
        form.setUpdateTime(new Date());
        projectFormDao.insert(form);
    }

    public Map<String, List<ProjectData>> getMatrixData(long projectId, long formId) throws SQLException {
        MatrixForm matrixForm = matrixFormDao.get(formId);
        if (matrixForm == null) return null;
        Map<String, List<ProjectData>> ret = new HashMap<String, List<ProjectData>>();
        ret.put("left", getData(projectId, matrixForm.getLeftId()));
        ret.put("top", getData(projectId, matrixForm.getTopId()));
        ret.put("matrix", getData(projectId, matrixForm.getFormId()));
        return ret;
    }

    public List<UserInbox> getUserInbox(String userId) throws SQLException {
        return userInboxDao.findByUser(userId);
    }

    public UserInbox createInbox(UserInbox inbox) throws SQLException {
        inbox.setUpdateTime(new Date());
        Project project = getProject(inbox.getProjectId());
        inbox.setProjectName(project.getName());
        inbox.setStatus(ProjectStatus.inprogress.ordinal());
        UserInbox old = userInboxDao.getInboxItem(inbox.getUserId(), inbox.getProjectId());
        if (old != null) {
            userInboxDao.update(inbox);
        } else {
            userInboxDao.insert(inbox);
        }
        return inbox;
    }

    //  修改表单状态时，需要做的处理
    // 1. 看看自己还有没有事情要做，没有就同时修改project的状态
    // 2. 是否有关联表，相关计算公式
    // 3. 是否满足条件进入下一个步骤
    public void markUserFormFinished(String userId, long projectId, long formId) {

    }

    public List<Project> findTemplates() throws SQLException {
        return projectDao.findTemplates();
    }

    public ProjectForm updatePosition(ProjectForm form) throws SQLException {
        ProjectForm pf = projectFormDao.getProjectForm(form.getProjectId(), form.getFormId());
        if (pf != null) {
            pf.setPosLeft(form.getPosLeft());
            pf.setPosTop(form.getPosTop());
            projectFormDao.update(pf);
        }
        return pf;
    }

    public void deleteForm(long formId) throws SQLException {
        projectFormDao.deleteForm(formId);
    }

    public List<Project> listProjects(int type) throws SQLException {
        return projectDao.findByType(type);
    }

    public Project asTemplate(Project p) throws SQLException {
        Project project = this.getProject(p.getProjectId());
        project.setTemplate(1);
        projectDao.update(project);
        return project;
    }

    public Project setStatus(Project p) throws SQLException {
        Project project = this.getProject(p.getProjectId());
        project.setStatus(p.getStatus());
        projectDao.update(project);
        return project;
    }

    public void saveProject(Project project) throws SQLException {
        projectDao.update(project);
    }

    public List<ProjectForm> listFormsByType(long projectId, int type) throws SQLException {
        return projectFormDao.listByType(projectId, type);
    }

    @AirAutowired
    FormService formService;

    public Project cloneProject(long projectId) throws SQLException {
        Project project = getProject(projectId);
        if (project == null) return null;
        Project p = createProject(project.getName() + " - clone");
        List<ProjectForm> forms = this.getForms(projectId);
        Map<Long, Long> old2new = new HashMap<Long, Long>();
        for (ProjectForm form : forms) {
            ProjectForm cf = new ProjectForm();
            cf.setFormId(sequenceService.getNextId("simpleForm"));
            cf.setFormName(form.getFormName());
            cf.setFormType(form.getFormType());
            cf.setPosLeft(form.getPosLeft());
            cf.setPosTop(form.getPosTop());
            cf.setProjectId(p.getProjectId());
            cf.setStatus(0);
            cf.setStep(0);
            cf.setUpdateTime(new Date());
            addForm(cf);
            old2new.put(form.getFormId(), cf.getFormId());
            if (form.getFormType() == 0) {
                DesignerVo vo = formService.loadForm(form.getFormId());
                //simple form
                SimpleForm sf = new SimpleForm();
                sf.setFormId(cf.getFormId());
                sf.setFormName(cf.getFormName());
                sf.setCreateTime(new Date());
                sf.setLevel(1);
                formService.insertSimpleForm(sf);
                cloneForm(vo, sf.getFormId());
            }
        }

        for (ProjectForm form : forms) {
            if (form.getFormType() == 1) {
                // matrix form
                DesignerVo vo = formService.loadForm(form.getFormId());
                MatrixForm matrix = vo.getMatrix();
                MatrixForm me = new MatrixForm();
                me.setFormName(matrix.getFormName());
                me.setCreateDate(new Date());
                Long formId = old2new.get(form.getFormId());
                me.setFormId(formId);
                me.setHasLeft(matrix.isHasLeft());
                me.setHasRoof(matrix.isHasRoof());
                me.setLeftId(old2new.get(matrix.getLeftId()));
                me.setTopId(old2new.get(matrix.getTopId()));
                formService.insertMatrixForm(me);
                cloneForm(vo, me.getFormId());
            }
        }
        return p;
    }

    private void cloneForm(DesignerVo vo, long formId) throws SQLException {
        List<FormRow> rows = new ArrayList<FormRow>();
        for (FormRow row : vo.getCols()) {
            FormRow r = cloneRow(formId, row);
            rows.add(r);
        }

        for (FormRow row : vo.getRows()) {
            FormRow r = cloneRow(formId, row);
            rows.add(r);
        }

        formService.insertRows(rows);
    }

    private FormRow cloneRow(long formId, FormRow row) throws SQLException {
        FormRow r = new FormRow();
        r.setCategory(row.getCategory());
        r.setLevel(row.getLevel());
        r.setShowOrder(row.getShowOrder());
        r.setType(row.getType());
        r.setFormId(formId);
        r.setPosition(row.getPosition());
        r.setRef(row.getRef());
        r.setShowOrder(row.getShowOrder());
        r.setTitle(row.getTitle());
        r.setItemId(row.getItemId());
        r.setRowId(sequenceService.getNextId("formRowCol"));
        return r;
    }
}
