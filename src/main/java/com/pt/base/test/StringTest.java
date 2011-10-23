package com.pt.base.test;

public class StringTest {
    public static void main(String args[]) {
        System.out.println("/sdsadsad/mgr/sasadsa".indexOf("/mgr/"));
        String a = "/mgr/xfmcdir/main/ers";
        String[] ss = a.split("/");
        for (String s : ss) {
            System.out.println(s);
        }
        a = a.replace("xfmcdir/", "");
        System.out.println(a);

        String s = "好撒花撒花的撒旦${include}";
        s = s.replaceAll("\\$\\{include\\}", "hahaha");
        System.out.println(s);
    }
}
