package com.air.persist.pojo;

import org.apache.commons.lang.builder.ToStringStyle;

import static org.apache.commons.lang.builder.ToStringBuilder.reflectionToString;

/**
 * create at: 11-7-7
 *
 * @author Yonghui Chen
 */
public class Base {
    public String toString() {
        return reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
