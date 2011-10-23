package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.SimpleFormTree;

import java.sql.SQLException;

/**
 * create at: 11-7-25
 *
 * @author Yonghui Chen
 */
public class SimpleFormTreeDao extends DaoTemplate<SimpleFormTree> {
    @Override
    public SimpleFormTree get(String id) throws SQLException {
        SimpleFormTree tree = super.get(id);
        if (tree == null) {
            tree = new SimpleFormTree();
            tree.setFormId(id);
            insert(tree);
        }
        return tree;
    }
}
