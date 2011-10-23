package com.air.web.form;

import com.air.pojo.qfd.ItemTreeNode;
import com.air.web.util.Form;

/**
 * create at: 11-7-20
 *
 * @author Yonghui Chen
 */
public class NodeForm extends ItemTreeNode implements Form {
    public void setName(String name) {
        setNodeName(name);
    }

    public String getName() {
        return getNodeName();
    }
}
