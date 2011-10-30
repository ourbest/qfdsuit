package com.air.formula;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * create at: 11-10-30
 *
 * @author Yonghui Chen
 */
public class FormulaParser {
    public static Set<String> getReference(String formula) {
        String pattern = "\\$\\{([^}]+)\\}";
        Pattern p = Pattern.compile(pattern);
        Matcher matcher = p.matcher(formula);
        Set<String> ret = new HashSet<String>();
        while (matcher.find()) {
            ret.add(matcher.group(1));
        }
        return ret;
    }

    public static void main(String[] args) {
        System.out.println(getReference("${中文a} ${b}"));
    }
}
