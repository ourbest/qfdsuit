package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.CellRelation;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-7-30
 *
 * @author Yonghui Chen
 */
public class CellRelationDao extends DaoTemplate<CellRelation> {
    public void deleteCellRelations(String formId, String cellId) throws SQLException {
        createDelete().addFilter("formula", 1).addFilter("formId", formId).addFilter("cellId", cellId).execute();
    }

    public List<CellRelation> findByRef(String formId, String cellId) throws SQLException {
        return createQuery().addFilter("relationFormId", formId).addFilter("relationCellId", cellId).asList();
    }
}
