package com.air.web.util;

import java.util.ArrayList;

/**
 * create at: 11-7-28
 *
 * @author Yonghui Chen
 */
public class CellUtils {
    public static final char[] ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
    public static final int BASE = ALPHABET.length;

    public static String colNumToStr(int id) {
        if (id == 0) {
            return Character.toString(ALPHABET[0]);
        }

        long num = id;

        ArrayList<Character> res = new ArrayList<Character>();
        while (num > 0) {
            int l = (int) (num % BASE);
            num = num / BASE;
            res.add(ALPHABET[l]);
        }
        return reverse(res);
    }

    private static String reverse(ArrayList<Character> res) {
        Character[] cs = res.toArray(new Character[res.size()]);
        int len = cs.length;
        StringBuilder b = new StringBuilder(len);
        for (int i = len - 1; i >= 0; i--) {
            b.append(cs[i]);
        }
        return b.toString();
    }

    public static void main(String[] args) {
        System.out.println(colNumToStr(0));
    }
}
