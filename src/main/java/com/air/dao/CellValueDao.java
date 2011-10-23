package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.CellValue;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-7-30
 *
 * @author Yonghui Chen
 */
public class CellValueDao extends DaoTemplate<CellValue> {

    public List<CellValue> findByForm(String formId) throws SQLException {
        return createQuery().addFilter("formId", formId).asList();
    }

    public List<CellValue> findByForms(List<String> formId) throws SQLException {
        return createQuery().addFilter("formId", formId).asList();
    }

    public CellValue findByCell(String formId, String cellId) throws SQLException {
        return createQuery().addFilter("formId", formId).addFilter("cellId", cellId).queryOne();
    }
}
