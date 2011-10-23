package com.air.web.util;

/**
 * create at: 11-7-25
 *
 * @author Yonghui Chen
 */
public class FormDesc {
    private String field;
    private String text;
    private String code;

    public FormDesc() {
    }

    public FormDesc(String field, String text, String code) {
        this.field = field;
        this.text = text;
        this.code = code;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
