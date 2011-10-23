package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-30
 *
 * @author Yonghui Chen
 */
public class CellValue {
    @Id
    private String formId;
    @Id
    private String cellId;
    private String displayValue;  // 显示值
    private String value;


    public CellValue() {
    }

    public CellValue(String formId, String cellId) {
        this.formId = formId;
        this.cellId = cellId;
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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDisplayValue() {
        return displayValue;
    }

    public void setDisplayValue(String displayValue) {
        this.displayValue = displayValue;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CellValue cellValue = (CellValue) o;

        return !(cellId != null ? !cellId.equals(cellValue.cellId) : cellValue.cellId != null)
                && !(formId != null ? !formId.equals(cellValue.formId) : cellValue.formId != null);
    }

    @Override
    public int hashCode() {
        int result = formId != null ? formId.hashCode() : 0;
        result = 31 * result + (cellId != null ? cellId.hashCode() : 0);
        return result;
    }
}
