package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-20
 *
 * @author Yonghui Chen
 */
public class ItemTreeNode {
    private String treeId;
    @Id
    private String nodeId;
    private String nodeName;
    private String parentNodeId;

    public String getTreeId() {
        return treeId;
    }

    public void setTreeId(String treeId) {
        this.treeId = treeId;
    }

    public String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        this.nodeId = nodeId;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }

    public String getParentNodeId() {
        return parentNodeId;
    }

    public void setParentNodeId(String parentNodeId) {
        this.parentNodeId = parentNodeId;
    }
}
