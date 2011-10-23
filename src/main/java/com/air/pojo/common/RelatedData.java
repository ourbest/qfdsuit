package com.air.pojo.common;

import javax.persistence.Id;

/**
 * Created at 11-9-9
 *
 * @author yonghui.chen
 */
public class RelatedData {
    @Id
    private long itemId;
    @Id
    private long itemId2;
    private String value;

    public long getItemId() {
        return itemId;
    }

    public void setItemId(long itemId) {
        this.itemId = itemId;
    }

    public long getItemId2() {
        return itemId2;
    }

    public void setItemId2(long itemId2) {
        this.itemId2 = itemId2;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
