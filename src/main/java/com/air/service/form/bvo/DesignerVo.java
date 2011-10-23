package com.air.service.form.bvo;

import com.air.pojo.form.CellEditor;
import com.air.pojo.form.FormRow;
import com.air.pojo.form.MatrixForm;
import com.air.pojo.process.ProjectForm;

import java.util.List;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class DesignerVo {
    private List<FormRow> rows;
    private List<FormRow> cols;
    private List<CellEditor> editors;
    private ProjectForm form;
    private MatrixForm matrix;
    private List<FormRow> leftCols;
    private List<FormRow> leftRows;
    private List<FormRow> topRows;
    private List<FormRow> topCols;

    public void setRows(List<FormRow> rows) {
        this.rows = rows;
    }

    public List<FormRow> getRows() {
        return rows;
    }

    public void setCols(List<FormRow> cols) {
        this.cols = cols;
    }

    public List<FormRow> getCols() {
        return cols;
    }

    public void setEditors(List<CellEditor> editors) {
        this.editors = editors;
    }

    public List<CellEditor> getEditors() {
        return editors;
    }

    public ProjectForm getForm() {
        return form;
    }

    public void setForm(ProjectForm form) {
        this.form = form;
    }

    public void setMatrix(MatrixForm matrixForm) {
        this.matrix = matrixForm;
    }

    public MatrixForm getMatrix() {
        return matrix;
    }

    public void setLeftCols(List<FormRow> leftCols) {
        this.leftCols = leftCols;
    }

    public void setLeftRows(List<FormRow> leftRows) {
        this.leftRows = leftRows;
    }

    public void setTopRows(List<FormRow> topRows) {
        this.topRows = topRows;
    }

    public void setTopCols(List<FormRow> topCols) {
        this.topCols = topCols;
    }

    public List<FormRow> getLeftCols() {
        return leftCols;
    }

    public List<FormRow> getLeftRows() {
        return leftRows;
    }

    public List<FormRow> getTopRows() {
        return topRows;
    }

    public List<FormRow> getTopCols() {
        return topCols;
    }
}
