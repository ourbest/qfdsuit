package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.SimpleFormColumn;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-7-25
 *
 * @author Yonghui Chen
 */
public class SimpleFormColumnDao extends DaoTemplate<SimpleFormColumn> {
    public List<SimpleFormColumn> getColumnsByForm(String formId) throws SQLException {
        return createQuery().order("showOrder").addFilter("formId", formId).asList();
    }
}
