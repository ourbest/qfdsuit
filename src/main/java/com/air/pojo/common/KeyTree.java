package com.air.pojo.common;

import javax.persistence.Id;

/**
 * create at: 11-9-5
 *
 * @author Yonghui Chen
 */
public class KeyTree {
    @Id
    private long treeId;
    private String treeName;

    public long getTreeId() {
        return treeId;
    }

    public void setTreeId(long treeId) {
        this.treeId = treeId;
    }

    public String getTreeName() {
        return treeName;
    }

    public void setTreeName(String treeName) {
        this.treeName = treeName;
    }
}
