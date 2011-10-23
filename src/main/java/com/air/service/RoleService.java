package com.air.service;

import com.air.dao.ItemTreeDao;
import com.air.dao.ItemTreeNodeDao;
import com.air.pojo.qfd.ItemTree;
import com.air.pojo.qfd.ItemTreeNode;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-8-11
 *
 * @author Yonghui Chen
 */
public class RoleService {
    @AirAutowired
    ItemTreeNodeDao itemTreeNodeDao;
    @AirAutowired
    ItemTreeDao itemTreeDao;

    public List<ItemTreeNode> getRoles() throws SQLException {
        ItemTree tree = itemTreeDao.findByName("人员角色");
        return itemTreeNodeDao.findByTree(tree.getTreeId());
    }
}
