package com.air.web.action.qform;

import com.air.pojo.form.*;
import com.air.pojo.process.ProjectForm;
import com.air.service.AirAutowired;
import com.air.service.form.FormService;
import com.air.service.form.bvo.CellEditorForm;
import com.air.service.form.bvo.DesignerVo;
import com.air.web.bvo.FormCount;
import com.air.web.bvo.SwapVo;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class FormAction {
    @AirAutowired
    FormService formService;

    public SimpleForm create(SimpleForm form) throws SQLException {
        return formService.createForm(form);
    }

    public SimpleForm update(SimpleForm form) throws SQLException {
        return formService.updateForm(form);
    }

    public ProjectForm setFormName(SimpleForm form) throws SQLException {
        return formService.updateFormName(form);
    }


    public List<SimpleForm> list() throws SQLException {
        return formService.listAll();
    }

    public void delete(SimpleForm form) throws SQLException {
        formService.deleteForm(form.getFormId());
    }

    public DesignerVo load(SimpleForm form) throws SQLException {
        return formService.loadForm(form.getFormId());
    }

    public Map<String, Object> loadMatrix(MatrixForm matrixForm) throws SQLException {
        Map<String, Object> ret = new HashMap<String, Object>();
        MatrixForm form = formService.getMatrixForm(matrixForm.getFormId());
        ret.put("form", form);
        ret.put("top", formService.loadForm(form.getTopId()));
        ret.put("left", formService.loadForm(form.getLeftId()));
        return ret;
    }

    public FormRow addRow(FormRow row) throws SQLException {
        return formService.addRow(row);
    }

    public List<FormRow> getRows(ProjectForm projectForm) throws SQLException {
        return formService.getRows(projectForm.getFormId());
    }

    public List<FormRow> getCols(ProjectForm projectForm) throws SQLException {
        return formService.getCols(projectForm.getFormId());
    }

    public FormRow setRowTitle(FormRow row) throws SQLException {
        FormRow r = formService.getRow(row.getRowId());
        r.setTitle(row.getTitle());
        formService.updateRow(r);
        return r;
    }

    public FormRow setRowLevel(FormRow row) throws SQLException {
        FormRow r = formService.getRow(row.getRowId());
        r.setLevel(row.getLevel());
        formService.updateRow(r);
        return r;
    }

    public FormRow setRowType(FormRow row) throws SQLException {
        FormRow r = formService.getRow(row.getRowId());
        r.setType(row.getType());
        formService.updateRow(r);
        return r;
    }

    public FormRow setRowOrder(FormRow row) throws SQLException {
        FormRow r = formService.getRow(row.getRowId());
        r.setShowOrder(row.getShowOrder());
        formService.updateRow(r);
        return r;
    }

    public FormRow setRowRef(FormRow row) throws SQLException {
        FormRow r = formService.getRow(row.getRowId());
        r.setRef(row.getRef());
        formService.updateRow(r);
        return r;
    }

    public List<FormRow> addRows(FormCount count) throws SQLException {
        List<FormRow> ret = new ArrayList<FormRow>(count.getCount());
        for (int i = 0; i < count.getCount(); i++) {
            FormRow r = new FormRow();
            r.setTitle("");
            r.setFormId(count.getFormId());
            ret.add(formService.addRow(r));
        }
        return ret;
    }

    public List<FormRow> addCols(FormCount count) throws SQLException {
        List<FormRow> ret = new ArrayList<FormRow>(count.getCount());
        for (int i = 0; i < count.getCount(); i++) {
            FormRow r = new FormRow();
            r.setTitle("");
            r.setFormId(count.getFormId());
            ret.add(formService.addCol(r));
        }
        return ret;
    }

    public FormRow addCol(FormRow col) throws SQLException {
        return formService.addCol(col);
    }

    public List<CellEditor> setCellEditors(CellEditorForm form) throws SQLException {
        List<CellEditor> editors = new ArrayList<CellEditor>(10);
        String[] strings = StringUtils.split(form.getCells(), ",");
        if (strings != null) {
            for (String string : strings) {
                CellEditor cellEditor = new CellEditor();
                cellEditor.setFormId(form.getFormId());
                cellEditor.setParam(form.getParam());
                cellEditor.setType(form.getType());
                String[] split = StringUtils.split(string, '_');
                cellEditor.setRowId(NumberUtils.toLong(split[0]));
                cellEditor.setColId(NumberUtils.toLong(split[1]));
                editors.add(cellEditor);
            }
            formService.saveEditors(editors);
        }
        return formService.getEditors(form.getFormId());
    }

    public List<FormHierarchy> relations() throws SQLException {
        return formService.getRelations();
    }

    public FormHierarchy createRelation(FormHierarchy hierarchy) throws SQLException {
        return formService.storeHierarchy(hierarchy);
    }

    public MatrixForm createMatrixForm(MatrixForm form) throws SQLException {
        return formService.createMatrixForm(form);
    }

    public List<MatrixForm> listMatrix() throws SQLException {
        return formService.listMatrixForms();
    }

    public FormRow deleteRow(FormRow row) throws SQLException {
        formService.deleteRow(row.getRowId());
        return row;
    }

    public boolean swapRow(SwapVo vo) throws SQLException {
        formService.swapRow(vo.getRowId1(), vo.getRowId2());
        return true;
    }

    public MatrixForm editMatrix(MatrixForm matrixForm) throws SQLException {
        formService.updateMatrixForm(matrixForm);
        return matrixForm;
    }
}
