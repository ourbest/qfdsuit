package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.ItemTree;

import java.sql.SQLException;

/**
 * create at: 11-7-20
 *
 * @author Yonghui Chen
 */
public class ItemTreeDao extends DaoTemplate<ItemTree> {
    public ItemTree findByName(String name) throws SQLException {
        return createQuery().addFilter("treeName", name).queryOne();
    }
}
