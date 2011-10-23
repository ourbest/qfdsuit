package com.air.persist.util;

/**
 * create at: 11-7-9
 *
 * @author Yonghui Chen
 */
public class DBUtils {
    public static String propertyToDb(String name) {
        StringBuilder target = new StringBuilder(name.length() + 5);
        for (int i = 0; i < name.length(); i++) {
            char c = name.charAt(i);
            if (Character.isUpperCase(c) || c == '_') {
                if (i != 0) {
                    target.append("_");
                }
                c = Character.toLowerCase(c);
            }
            target.append(c);
        }

        return target.toString();
    }

    public static String dbToProperty(String col) {
        String lower = col.toLowerCase();
        StringBuilder target = new StringBuilder(lower.length());
        boolean cap = false;
        for (int i = 0; i < lower.length(); i++) {
            char c = lower.charAt(i);
            if (c == '_') {
                if (!cap) {
                    cap = true;
                } else {
                    cap = false;
                    target.append("_");
                }
            } else {
                target.append(cap ? Character.toUpperCase(c) : c);
                cap = false;
            }
        }

        return target.toString();
    }

    public static void main(String[] args) {
        System.out.println(propertyToDb("this__is"));
        System.out.println(dbToProperty("this____is"));
    }
}
