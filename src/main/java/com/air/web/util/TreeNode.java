package com.air.web.util;

import java.util.ArrayList;
import java.util.List;

/**
 * create at: 11-7-14
 *
 * @author Yonghui Chen
 */
public class TreeNode {
    private String id;
    private String text;
    private List<TreeNode> children;

    public TreeNode(String id) {
        this.id = id;
    }

    public TreeNode() {
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getText() {
        return text;
    }

    public List<TreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }

    public void addChild(TreeNode node) {
        if(children == null) children = new ArrayList<TreeNode>();
        children.add(node);
    }
}
