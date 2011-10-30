package com.air.pojo.form;

import javax.persistence.Id;

/**
 * create at: 11-8-28
 *
 * @author Yonghui Chen
 */
public class FormRow {
    @Id
    private long rowId;

    private long formId;
    private String title;
    private int position; // matrix表中靠近哪方
    private long showOrder;
    private int category;  // row = 0  col = 1;
    private long itemId;
    private int level;
    private int type;     //
    private String ref;

    public long getFormId() {
        return formId;
    }

    public void setFormId(long formId) {
        this.formId = formId;
    }

    public long getRowId() {
        return rowId;
    }

    public void setRowId(long rowId) {
        this.rowId = rowId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getShowOrder() {
        return showOrder;
    }

    public void setShowOrder(long showOrder) {
        this.showOrder = showOrder;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public long getItemId() {
        return itemId;
    }

    public void setItemId(long itemId) {
        this.itemId = itemId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }
}
