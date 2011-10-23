package com.air.dao.form;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.form.CellEditor;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class CellEditorDao extends DaoTemplate<CellEditor> {
    public List<CellEditor> findByForm(long formId) throws SQLException {
        return createQuery().addFilter("formId", formId).asList();
    }

    public void storeEditors(List<CellEditor> editors) throws SQLException {
        for (CellEditor editor : editors) {
            int i = update(editor);
            if (i != 1) {
                insert(editor);
            }
        }
    }
}
