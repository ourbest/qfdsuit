package com.air.dao.common;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.common.KeyTreeItem;

import java.sql.SQLException;
import java.util.List;

/**
 * Created at 11-9-8
 *
 * @author yonghui.chen
 */
public class KeyTreeItemDao extends DaoTemplate<KeyTreeItem> {
    public List<KeyTreeItem> loadByTree(long treeId) throws SQLException {
        return createQuery().order("parent").order("itemId").addFilter("treeId", treeId).asList();
    }
}
