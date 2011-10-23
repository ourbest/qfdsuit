package com.air.dao.form;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.form.FormRow;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class FormRowDao extends DaoTemplate<FormRow> {
    public List<FormRow> findByForm(long formId) throws SQLException {
        return createQuery().order("showOrder").addFilter("formId", formId).asList();
    }

    public FormRow getRow(long rowId) throws SQLException {
        return createQuery().addFilter("rowId", rowId).queryOne();
    }

    public int deleteRow(long rowId) throws SQLException {
        return createDelete().addFilter("rowId", rowId).executeUpdate();
    }

    public List<FormRow> findRowsByForm(long formId) throws SQLException {
        return createQuery().order("showOrder").addFilter("category", 0).addFilter("formId", formId).asList();
    }

    public List<FormRow> findColsByForm(long formId) throws SQLException {
        return createQuery().order("showOrder").addFilter("category", 1).addFilter("formId", formId).asList();
    }
}
