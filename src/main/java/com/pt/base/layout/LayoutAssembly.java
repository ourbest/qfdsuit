package com.pt.base.layout;


import com.demx.mapping.layout.agent.LayoutManagerAgent;
import com.demx.mapping.layout.vo.Layout;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class LayoutAssembly {
    private static Logger log = Logger.getLogger(LayoutAssembly.class);


    public static String assembly(String page, HttpServletRequest request) {
        LayoutManagerAgent agent = new LayoutManagerAgent();
        String id = page.replace("/", ".");
        if (id.startsWith(".")) {
            id = id.substring(1, id.length());
        }
        Layout layout = agent.getLayout(id);
        if (layout == null) {
            layout = agent.getLayout("mgr.error");
        }
        popular(page, layout, request);
        request.setAttribute("layout", layout);
        return layout.getTemplate();
    }


    private static void popular(String page, Layout layout, HttpServletRequest request) {
        page = "/WEB-INF/jsp" + page;
        Map puts = layout.getPuts();
        Map ins = new HashMap();
        Set ks = puts.keySet();
        for (Iterator is = ks.iterator(); is.hasNext(); ) {
            Object key = is.next();
            String value = (String) puts.get(key);
            String param = "";
            if (value.indexOf("?") > 0) {
                param = value.substring(value.indexOf("?"), value.length());
                value = value.substring(0, value.indexOf("?"));
            }
            if (value.startsWith("${include")) {
                value = value.replaceAll("\\$\\{include\\}", page) + ".jsp";
            } else if (value.startsWith("${")) {
                String com = value.substring(2, value.length() - 1);
                value = "/WEB-INF/jsp/mgr/com/" + com + ".jsp";
            }
            ins.put(key, value);
            layout.setSelectbar(0);
            if (!param.equals("")) {
                String n = param.substring(param.indexOf("=") + 1, param.length());
                int m = Integer.parseInt(n);
                layout.setSelectbar(m);
            }
        }
        layout.setRputs(ins);
    }

    private static String parsePage(String page) {
        return null;
    }

}
