package com.air.dao;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.qfd.ItemTreeNode;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-7-20
 *
 * @author Yonghui Chen
 */
public class ItemTreeNodeDao extends DaoTemplate<ItemTreeNode> {
    public List<ItemTreeNode> findByTree(String treeId) throws SQLException {
        return filter("treeId", treeId);
    }

    public void deleteByTree(String treeId) throws SQLException {
        createDelete().addFilter("treeId", treeId).execute();
    }

    public List<ItemTreeNode> findByIds(List<String> nodeIds) throws SQLException {
        return createQuery().addFilter("nodeId", nodeIds).asList();
    }
}
