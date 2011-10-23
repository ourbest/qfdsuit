package com.air.service.form;

import com.air.dao.form.*;
import com.air.dao.process.ProjectFormDao;
import com.air.pojo.form.*;
import com.air.pojo.process.ProjectForm;
import com.air.service.AirAutowired;
import com.air.service.common.SequenceService;
import com.air.service.form.bvo.DesignerVo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class FormService {
    @AirAutowired
    SequenceService sequenceService;
    @AirAutowired
    ProjectFormDao projectFormDao;
    @AirAutowired
    SimpleFormDao simpleFormDao;
    @AirAutowired
    FormRowDao formRowDao;
    @AirAutowired
    CellEditorDao cellEditorDao;
    @AirAutowired
    MatrixFormDao matrixFormDao;
    @AirAutowired
    FormHierarchyDao formHierarchyDao;

    public SimpleForm createForm(SimpleForm form) throws SQLException {
        form.setFormId(sequenceService.getNextId("simpleForm"));
        form.setCreateTime(new Date());
        form.setLevel(1);
        simpleFormDao.insert(form);
        return form;
    }

    public List<SimpleForm> listAll() throws SQLException {
        return simpleFormDao.listAll();
    }

    public void deleteForm(long formId) throws SQLException {
        simpleFormDao.delete(formId);
        matrixFormDao.delete(formId);
    }

    public SimpleForm updateForm(SimpleForm form) throws SQLException {
        SimpleForm db = simpleFormDao.get(form.getFormId());
        db.setLevel(form.getLevel());
        db.setFormName(form.getFormName());
        db.setRefName(form.getRefName());
        simpleFormDao.update(db);
        return db;
    }

    public DesignerVo loadForm(long formId) throws SQLException {
        DesignerVo ret = new DesignerVo();
        List<FormRow> all = formRowDao.findByForm(formId);
        List<FormRow> rows = new ArrayList<FormRow>(all.size());
        List<FormRow> cols = new ArrayList<FormRow>(all.size());
        for (FormRow row : all) {
            if (row.getCategory() == 0) rows.add(row);
            else cols.add(row);
        }
        ret.setRows(rows);
        ret.setCols(cols);
        ret.setEditors(cellEditorDao.findByForm(formId));
        ProjectForm form = projectFormDao.getProjectFormByFormId(formId);
        ret.setForm(form);
        if (form.getFormType() == 1) {
            MatrixForm matrix = matrixFormDao.get(form.getFormId());
            ret.setMatrix(matrix);
            List<FormRow> allTop = formRowDao.findByForm(matrix.getTopId());
            List<FormRow> topRows = new ArrayList<FormRow>(all.size());
            List<FormRow> topCols = new ArrayList<FormRow>(all.size());
            for (FormRow row : allTop) {
                if (row.getCategory() == 0) topRows.add(row);
                else topCols.add(row);
            }
            ret.setTopRows(topRows);
            ret.setTopCols(topCols);

            List<FormRow> allLeft = formRowDao.findByForm(matrix.getLeftId());
            List<FormRow> leftRows = new ArrayList<FormRow>(all.size());
            List<FormRow> leftCols = new ArrayList<FormRow>(all.size());
            for (FormRow row : allLeft) {
                if (row.getCategory() == 0) leftRows.add(row);
                else leftCols.add(row);
            }
            ret.setLeftRows(leftRows);
            ret.setLeftCols(leftCols);
        }
        return ret;
    }

    public FormRow addRow(FormRow row) throws SQLException {
        row.setRowId(sequenceService.getNextId("formRowCol"));
        row.setShowOrder(row.getRowId());
        row.setCategory(0);
        formRowDao.insert(row);
        return row;
    }

    public FormRow addCol(FormRow col) throws SQLException {
        col.setRowId(sequenceService.getNextId("formRowCol"));
        col.setCategory(1);
        formRowDao.insert(col);
        return col;
    }

    public List<CellEditor> getEditors(long formId) throws SQLException {
        return cellEditorDao.findByForm(formId);
    }

    public void saveEditors(List<CellEditor> editors) throws SQLException {
        cellEditorDao.storeEditors(editors);
    }

    public MatrixForm createMatrixForm(MatrixForm form) throws SQLException {
        form.setFormId(sequenceService.getNextId("simpleForm")); // 保持唯一性
        form.setCreateDate(new Date());
        matrixFormDao.insert(form);
        return form;
    }

    public List<MatrixForm> listMatrixForms() throws SQLException {
        return matrixFormDao.listAll();
    }

    public String getFormName(ProjectForm form) throws SQLException {
        if (form.getFormType() == 0) {
            SimpleForm simpleForm = simpleFormDao.get(form.getFormId());
            if (simpleForm != null) return simpleForm.getFormName();
        } else {
            MatrixForm mf = matrixFormDao.get(form.getFormId());
            if (mf != null) return mf.getFormName();
        }
        return null;
    }

    public MatrixForm getMatrixForm(long formId) throws SQLException {
        return matrixFormDao.get(formId);
    }

    public List<FormHierarchy> getRelations() throws SQLException {
        return formHierarchyDao.listAll();
    }

    public FormHierarchy storeHierarchy(FormHierarchy hierarchy) throws SQLException {
        try {
            formHierarchyDao.insert(hierarchy);
        } catch (SQLException ignored) {

        }
        return hierarchy;
    }

    public ProjectForm updateFormName(SimpleForm form) throws SQLException {
        ProjectForm pf = projectFormDao.getProjectFormByFormId(form.getFormId());
        if (pf.getFormType() == 0) {
            SimpleForm db = simpleFormDao.get(form.getFormId());
            db.setFormName(form.getFormName());
            simpleFormDao.update(db);
        } else {
            MatrixForm db = matrixFormDao.get(form.getFormId());
            db.setFormName(form.getFormName());
            matrixFormDao.update(db);
        }
        pf.setFormName(form.getFormName());
        projectFormDao.update(pf);
        return pf;
    }

    public List<FormRow> getRows(long formId) throws SQLException {
        return formRowDao.findRowsByForm(formId);
    }

    public FormRow getRow(long rowId) throws SQLException {
        return formRowDao.getRow(rowId);
    }

    public void updateRow(FormRow r) throws SQLException {
        formRowDao.update(r);
    }

    public void deleteRow(long rowId) throws SQLException {
        formRowDao.deleteRow(rowId);
    }

    public void swapRow(int rowId1, int rowId2) throws SQLException {
        FormRow r1 = formRowDao.getRow(rowId1);
        FormRow r2 = formRowDao.getRow(rowId2);
        long o2 = r1.getShowOrder() == 0 ? r1.getRowId() : r1.getShowOrder();
        r1.setShowOrder(r2.getShowOrder() == 0 ? r2.getRowId() : r2.getShowOrder());
        r2.setShowOrder(o2);
        formRowDao.update(r1);
        formRowDao.update(r2);
    }

    public List<FormRow> getCols(long formId) throws SQLException {
        return formRowDao.findColsByForm(formId);
    }

    public SimpleForm createRelatedForm(long formId) throws SQLException {
        DesignerVo vo = loadForm(formId);
        ProjectForm form1 = vo.getForm();
        if (form1.getFormType() != 0) throw new IllegalArgumentException("类型不正确");
        SimpleForm form = new SimpleForm();
        form.setFormName(form1.getFormName() + "~~");
        createForm(form);
        List<FormRow> cols = vo.getCols();
        for (FormRow col : cols) {
            FormRow r = new FormRow();
            r.setTitle(col.getTitle());
            r.setFormId(form.getFormId());
            r.setType(col.getType());
            r.setCategory(col.getCategory());
            r.setLevel(col.getLevel());
            addRow(r);
        }
        return form;
    }

    public void updateMatrixForm(MatrixForm matrixForm) throws SQLException {
        MatrixForm db = getMatrixForm(matrixForm.getFormId());
        matrixForm.setFormName(db.getFormName());
        matrixForm.setCreateDate(db.getCreateDate());
        matrixFormDao.update(matrixForm);
    }

    public void insertSimpleForm(SimpleForm simpleForm) throws SQLException {
        simpleFormDao.insert(simpleForm);
    }

    public void insertMatrixForm(MatrixForm matrixForm) throws SQLException {
        matrixFormDao.insert(matrixForm);
    }

    public void insertRows(List<FormRow> rows) throws SQLException {
        formRowDao.insert(rows);
    }
}
