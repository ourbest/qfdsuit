package com.air.pojo.common;

import javax.persistence.Id;

/**
 * 用于填表中的固定值 1 3 9等
 * create at: 11-9-5
 *
 * @author Yonghui Chen
 */
public class OptionDict {
    @Id
    private long dictId;
    @Id
    private String value;
    private String display;
    private String image;

    public long getDictId() {
        return dictId;
    }

    public void setDictId(long dictId) {
        this.dictId = dictId;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
