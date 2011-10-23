package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.SimpleFormRow;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-7-25
 *
 * @author Yonghui Chen
 */
public class SimpleFormRowDao extends DaoTemplate<SimpleFormRow> {
    public List<SimpleFormRow> getRowsByForm(String formId) throws SQLException {
        return createQuery().order("showOrder").addFilter("formId", formId).asList(); // 也可直接用rownum排序
    }
}
