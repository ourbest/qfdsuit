package com.demx.util;

import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.Converter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author <a href="yonghuichen@prient.com">Yonghui Chen</a>
 * @version $Id: DateConverter.java,v 1.3 2004/09/21 09:25:46 administrator Exp $
 */
public class DateConverter
        implements Converter {
    public Object convert(Class aClass, Object object) {
        Date defaultValue = new Date();
        if (object == null) {
            return null;
        }
        String pattern = "yyyy-MM-dd";
        if (object instanceof String) {
            try {
                String str = (String) object;
                if (str.indexOf(":") != -1) {
                    pattern = "yyyy-MM-dd hh:mm:ss";
                }
                DateFormat df = new SimpleDateFormat(pattern);
                Date date = df.parse(str);
                if ("java.util.Date".equals(aClass.getName())) {
                    return date;
                } else if ("java.sql.Date".equals(aClass.getName())) {
                    return new java.sql.Date(date.getTime());
                } else if ("java.sql.Time".equals(aClass.getName())) {
                    return new java.sql.Time(date.getTime());
                } else if ("java.sql.Timestamp".equals(aClass.getName())) {
                    return new java.sql.Timestamp(date.getTime());
                }
                return date;
            } catch (ParseException e) {
                throw new ConversionException(e.getMessage());
            }
        }
        return defaultValue;
    }
}
