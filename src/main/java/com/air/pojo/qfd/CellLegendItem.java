package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-29
 *
 * @author Yonghui Chen
 */
public class CellLegendItem {
    @Id
    private String itemId;
    private String legendId;
    private String itemName;
    private int itemValue;
    private String itemIcon;

    public String getLegendId() {
        return legendId;
    }

    public void setLegendId(String legendId) {
        this.legendId = legendId;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getItemValue() {
        return itemValue;
    }

    public void setItemValue(int itemValue) {
        this.itemValue = itemValue;
    }

    public String getItemIcon() {
        return itemIcon;
    }

    public void setItemIcon(String itemIcon) {
        this.itemIcon = itemIcon;
    }
}
