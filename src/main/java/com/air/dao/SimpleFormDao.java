package com.air.dao;

import com.air.pojo.qfd.ItemTreeNode;
import com.air.pojo.qfd.SimpleFormColumn;
import com.air.pojo.qfd.SimpleFormRow;
import com.air.service.AirAutowired;
import com.air.web.bvo.RowCategory;
import com.air.web.util.FormDesc;
import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.commons.lang.StringUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * create at: 11-7-25
 *
 * @author Yonghui Chen
 */
public class SimpleFormDao {
    @AirAutowired
    private SimpleFormRowDao simpleFormRowDao;
    @AirAutowired
    private SimpleFormColumnDao simpleFormColumnDao;
    @AirAutowired
    private ItemTreeNodeDao itemTreeNodeDao;

    public List<RowCategory> getFormRows(String formId) throws SQLException {
        List<SimpleFormRow> rows = simpleFormRowDao.createQuery().order("showOrder").addFilter("formId", formId).asList();

        List<String> nodeIds = new ArrayList<String>(rows.size());
        for (SimpleFormRow row : rows) {
            if (!StringUtils.isEmpty(row.getNodeId())) {
                nodeIds.add(row.getNodeId());
            }
        }

        Map<String, ItemTreeNode> itemMap = getNodes(nodeIds);
        Map<String, List<FormDesc>> desc = new ListOrderedMap();
        for (SimpleFormRow row : rows) {
            ItemTreeNode node = itemMap.get(row.getNodeId());
            String parentNodeId = node.getParentNodeId();
            List<FormDesc> formDescs = desc.get(parentNodeId);
            if (formDescs == null) {
                formDescs = new ArrayList<FormDesc>();
                desc.put(parentNodeId, formDescs);
            }
            formDescs.add(new FormDesc(node.getNodeId(), node.getNodeName(), row.getRowCode()));
        }

        Map<String, ItemTreeNode> nodes = getNodes(new ArrayList<String>(desc.keySet()));

        List<RowCategory> cats = new ArrayList<RowCategory>(nodes.size());
        for (Map.Entry<String, List<FormDesc>> entry : desc.entrySet()) {
            ItemTreeNode node = nodes.get(entry.getKey());
            cats.add(new RowCategory(node.getNodeName(), entry.getValue()));
        }
        return cats;
    }

    public List<FormDesc> getSimpleFormColumns(String formId) throws SQLException {
        List<SimpleFormColumn> cols = simpleFormColumnDao.getColumnsByForm(formId);//.createQuery().order("showOrder").addFilter("formId", formId).asList();

        List<String> nodeIds = new ArrayList<String>(cols.size());
        for (SimpleFormColumn col : cols) {
            if (!StringUtils.isEmpty(col.getNodeId())) {
                nodeIds.add(col.getNodeId());
            }
        }

        Map<String, ItemTreeNode> itemMap = getNodes(nodeIds);


        List<FormDesc> formCols = new ArrayList<FormDesc>(cols.size());
        for (SimpleFormColumn col : cols) {
            if (!StringUtils.isEmpty(col.getNodeId())) {
                ItemTreeNode node = itemMap.get(col.getNodeId());
                if (node != null) {
                    formCols.add(new FormDesc(node.getNodeId(), node.getNodeName(), col.getColCode()));
                }
            } else {
                formCols.add(new FormDesc(col.getAdhocName(), col.getAdhocName(), col.getColCode()));
            }
        }

        return formCols;
    }

    private Map<String, ItemTreeNode> getNodes(List<String> nodeIds) throws SQLException {
        List<ItemTreeNode> formItems = itemTreeNodeDao.findByIds(nodeIds);
        Map<String, ItemTreeNode> itemMap = new HashMap<String, ItemTreeNode>(formItems.size());
        for (ItemTreeNode item : formItems) {
            itemMap.put(item.getNodeId(), item);
        }
        return itemMap;
    }

    public List<FormDesc> getSimpleFormRows(String formId) throws SQLException {
        List<SimpleFormRow> rows = simpleFormRowDao.createQuery().order("showOrder").addFilter("formId", formId).asList();

        List<String> nodeIds = new ArrayList<String>(rows.size());


        for (SimpleFormRow row : rows) {
            if (!StringUtils.isEmpty(row.getNodeId())) {
                nodeIds.add(row.getNodeId());
            }
        }

        Map<String, ItemTreeNode> itemMap = getNodes(nodeIds);

        List<FormDesc> formRows = new ArrayList<FormDesc>(rows.size());
        for (SimpleFormRow row : rows) {
            ItemTreeNode node = itemMap.get(row.getNodeId());
            if (node != null) {
                formRows.add(new FormDesc(node.getNodeId(), node.getNodeName(), row.getRowCode()));
            }
        }

        return formRows;
    }
}
