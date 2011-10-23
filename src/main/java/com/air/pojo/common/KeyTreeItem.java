package com.air.pojo.common;

import javax.persistence.Id;

/**
 * create at: 11-9-5
 *
 * @author Yonghui Chen
 */
public class KeyTreeItem {
    private long treeId;
    @Id
    private long itemId;
    private String itemName;

    //可能有
    private long parent;

    public long getTreeId() {
        return treeId;
    }

    public void setTreeId(long treeId) {
        this.treeId = treeId;
    }

    public long getItemId() {
        return itemId;
    }

    public void setItemId(long itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public long getParent() {
        return parent;
    }

    public void setParent(long parent) {
        this.parent = parent;
    }
}
