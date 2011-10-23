package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-29
 *
 * @author Yonghui Chen
 */
public class CellRelation {
    @Id
    private String relationId;
    private String formId;       // 表格
    private String cellId;
    private String relationFormId;
    private String relationCellId; // 关联的单元格，如果此单元发生变化，则cellId值也会变化
    private int formula;

    public String getRelationId() {
        return relationId;
    }

    public void setRelationId(String relationId) {
        this.relationId = relationId;
    }

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String getCellId() {
        return cellId;
    }

    public void setCellId(String cellId) {
        this.cellId = cellId;
    }

    public String getRelationFormId() {
        return relationFormId;
    }

    public void setRelationFormId(String relationFormId) {
        this.relationFormId = relationFormId;
    }

    public String getRelationCellId() {
        return relationCellId;
    }

    public void setRelationCellId(String relationCellId) {
        this.relationCellId = relationCellId;
    }

    public int getFormula() {
        return formula;
    }

    public void setFormula(int formula) {
        this.formula = formula;
    }
}
