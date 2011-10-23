package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-20
 *
 * @author Yonghui Chen
 */
public class ItemTree {
    @Id
    private String treeId;

    private String treeName;

    public String getTreeId() {
        return treeId;
    }

    public void setTreeId(String treeId) {
        this.treeId = treeId;
    }

    public String getTreeName() {
        return treeName;
    }

    public void setTreeName(String treeName) {
        this.treeName = treeName;
    }
}
