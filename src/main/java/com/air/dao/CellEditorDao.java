package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.CellEditor;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-7-29
 *
 * @author Yonghui Chen
 */
public class CellEditorDao extends DaoTemplate<CellEditor> {

    public CellEditor findByCell(String formId, String cellId) throws SQLException {
        return createQuery().addFilter("formId", formId).addFilter("cellId", cellId).queryOne();
    }

    public List<CellEditor> findByForm(String formId) throws SQLException {
        return createQuery().addFilter("formId", formId).asList();
    }
}
