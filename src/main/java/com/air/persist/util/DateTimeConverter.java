package com.air.persist.util;

import org.apache.commons.lang.math.NumberUtils;

import java.util.Date;

/**
 * create at: 11-7-15
 *
 * @author Yonghui Chen
 */
public class DateTimeConverter extends org.apache.commons.beanutils.converters.DateTimeConverter {
    @Override
    public Object convert(Class type, Object value) {
        if (value instanceof String && NumberUtils.isDigits((String) value)) {
            return new Date(NumberUtils.toLong((String) value));
        }
        return super.convert(type, value);
    }

    @Override
    protected Class getDefaultType() {
        return Date.class;
    }
}
