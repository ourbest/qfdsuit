package com.air.persist.util;

import org.apache.commons.lang.builder.ToStringStyle;

import java.util.List;

import static org.apache.commons.lang.builder.ToStringBuilder.reflectionToString;

/**
 * create at: 11-7-7
 *
 * @author Yonghui Chen
 */
public class PagedList<T> {
    private int total;
    private int offset;
    private int pageSize;
    private List<T> values;

    public PagedList() {
    }

    public PagedList(int total, int offset, int pageSize, List<T> values) {
        this.total = total;
        this.offset = offset;
        this.values = values;
        this.pageSize = pageSize;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public List<T> getValues() {
        return values;
    }

    public void setValues(List<T> values) {
        this.values = values;
    }

    @Override
    public String toString() {
        return reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
