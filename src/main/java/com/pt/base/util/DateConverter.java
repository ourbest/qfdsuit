package com.pt.base.util;

import org.apache.commons.beanutils.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author chen
 * @date 2009-12-15
 */
public class DateConverter implements Converter
{
	static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	static SimpleDateFormat longdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Override
	public Object convert(Class aClass, Object value)
	{
		if (value == null) return null;
		if (((String) value).trim().length() == 0) return null;
		try
		{
			return df.parse((String) value);
		}
		catch (ParseException e)
		{
			return null;
		}
	}

	public static Date toDate(String value)
	{
		try
		{
			return df.parse(value);
		}
		catch (Exception e)
		{
			return null;
		}
	}

	public static String format(Date date)
	{
		return date == null ? null : df.format(date);
	}

	public static String longFormat(Date date)
	{
		return date == null ? null : longdf.format(date);
	}
}
