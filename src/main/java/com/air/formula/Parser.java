package com.air.formula;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import java.util.*;

/**
 * create at: 11-7-29
 *
 * @author Yonghui Chen
 */
public class Parser {
    public static final Set<String> FUNC_NAMES;

    static {
        FUNC_NAMES = new HashSet<String>(Arrays.asList(
                "SUM", "AVG"));
    }

    public static List<String> parseCellId(String formula) {
        String[] strings = formula.split("[\\+\\-\\*/\\(\\)]");
        List<String> ret = new ArrayList<String>(strings.length);
        for (String string : strings) {
            if (FUNC_NAMES.contains(string)) continue;
            if (!NumberUtils.isDigits(string)) {
                ret.add(string.trim());
            }
        }
        return ret;
    }

    public static FormCell parseCell(String currentFormName, String cellId) {
        String name = currentFormName;
        if (cellId.contains("!")) {
            name = StringUtils.substringBefore(cellId, "!");
            cellId = StringUtils.substringAfter(cellId, "!");
        }
        int split = 0;
        for (int i = 0; i < cellId.length(); i++) {
            if (Character.isDigit(cellId.charAt(i))) {
                split = i;
                break;
            }
        }
        return new FormCell(name, cellId.substring(0, split), NumberUtils.toInt(cellId.substring(split)));
    }

    public static List<FormCell> parseFormulaCells(String currentFormName, String format) {
        List<String> list = parseCellId(format);
        List<FormCell> ret = new ArrayList<FormCell>();
        for (String s : list) {
            ret.addAll(parseCells(currentFormName, s));
        }
        return ret;
    }

    public static List<FormCell> parseCells(String currentFormName, String cellId) {
        if (!cellId.contains(":")) {
            return new ArrayList<FormCell>(Arrays.asList(parseCell(currentFormName, cellId)));
        }

        String[] strings = StringUtils.split(cellId, ":");
        if (strings.length != 2) throw new IllegalArgumentException("invalid argument " + cellId);
        FormCell from = parseCell(currentFormName, strings[0]);
        FormCell to = parseCell(from.getFormCode(), strings[1]);

        List<FormCell> ret = new ArrayList<FormCell>();
        if (from.getColumn().equals(to.getColumn())) {
            int fi = from.getRow();
            int ti = to.getRow();
            if (fi > ti) {
                ti = fi;
                fi = to.getRow();
            }

            for (int i = fi; i <= ti; i++) {
                ret.add(new FormCell(from.getFormCode(), from.getColumn(), i));
            }
        }  // 跨列的视是否需要吧
        return ret;
    }

    public static void main(String[] args) {
        System.out.println(parseCellId("A1+B2"));
        System.out.println(parseCells("F1", "A1:A10"));
    }
}
