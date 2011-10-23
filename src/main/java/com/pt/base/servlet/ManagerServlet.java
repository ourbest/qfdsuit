package com.pt.base.servlet;

import com.pt.base.auth.UserDetail;
import com.pt.base.layout.LayoutAssembly;
import com.pt.base.util.DateConverter;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author yonghui.chen
 * @version 1.0
 * @date 2009-12-15
 */
public class ManagerServlet extends HttpServlet {
    private static Logger log = Logger.getLogger(ManagerServlet.class);

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        ApplicationContext context = WebApplicationContextUtils
                .getWebApplicationContext(getServletContext());
        ConvertUtils.register(new DateConverter(), java.util.Date.class);
    }

    public void destroy() {
        super.destroy();
    }

    private String[] parseFunc(HttpServletRequest req) {
        String[] ret = new String[]{"index", "", "0"};
        String uri = req.getRequestURI();
        HttpSession session = req.getSession();
        if (session.getAttribute("full") == null) {
            session.setAttribute("full", "false");
        }
        String full = req.getParameter("fullscreen");
        if ("true".equals(full)) {
            session.setAttribute("full", "true");
        }
        if ("false".equals(full)) {
            session.setAttribute("full", "false");
        }
        String path = req.getContextPath();
        uri = uri.substring(path.length(), uri.length());
        log.debug("------------------>" + uri + " time>>" + System.nanoTime());
        String suffix = "/mgr/xfmcdir/index";
        if (uri.endsWith(suffix)) {
            Object spc = session.getAttribute("SPRING_SECURITY_CONTEXT");
            if (spc != null) {
                UserDetail user = (UserDetail) ((SecurityContextImpl) spc).getAuthentication().getPrincipal();
                session.setAttribute("role", user.getRole());
                session.setAttribute("region", user.getRegion());
                uri = uri.substring(0, (uri.length() - suffix.length())) + "/mgr/xfmc/index";
            }
        }
        String replace = "";
        String sswit = "0";
        String dir = "";
        String prefix = "/mgr/";
        String ajax = "/ajax/";
        String service = "/service/";
        String[] paths = uri.split("/");
        for (String p : paths) {
            if (p.endsWith("dir")) {
                dir = p + "/";
                break;
            }
        }
        if (uri.indexOf(prefix) >= 0) {
            if (uri.length() <= prefix.length())
                return ret;
            int len = prefix.length() + dir.length();
            replace = uri.substring(len).replace("/", "_");
            if ("true".equals(session.getAttribute("full"))) {
                sswit = "3";
            } else {
                sswit = "0";
            }
        } else if (uri.indexOf(ajax) >= 0) {
            if (uri.length() <= ajax.length())
                return ret;
            int len = ajax.length() + dir.length();
            replace = uri.substring(len).replace("/", "_");
            sswit = "1";
        } else if (uri.indexOf(service) >= 0) {
            if (uri.length() <= service.length())
                return ret;
            int len = service.length() + dir.length();
            replace = uri.substring(len).replace("/", "_");
            sswit = "2";
        }
        ret[0] = replace;
        ret[1] = dir;
        ret[2] = sswit;
        return ret;
    }

//    public void service(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setHeader("PRagma", "No-cache");
//        response.setHeader("Cache-Control", "no-cache");
//        response.setDateHeader("Expires", 0);
//        request.setCharacterEncoding("utf-8");
//        String[] ret = parseFunc(request);
//        String page = ret[0];
//        String dir = ret[1];
//        page = dir + page ;
//        int swit = Integer.parseInt(ret[2]);
//        String parent = "/layout/" + dir + "index.jsp";
//        switch (swit) {
//            case 0:
//                parent = "/layout/" + dir + "index.jsp";
//                break;
//            case 1:
//                parent = "/layout/" + dir + "blank.jsp";
//                break;
//            case 2:
//                parent = "/layout/" + dir + "service.jsp";
//                break;
//            case 3:
//                parent = "/layout/" + dir + "indexall.jsp";
//                break;
//        }
//        String redirect = request.getParameter("r");
//        if (redirect != null) {
//            response.sendRedirect(redirect);
//        } else {
//            response.setContentType("text/html; charset=UTF-8");
//            try {
//                String parent = LayoutAssembly.assembly("xfmc.index", request);
//                request.getRequestDispatcher(parent).include(
//                        request, response);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//    }

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getContextPath();
        String uri = request.getRequestURI();
        String page = uri.substring(path.length(), uri.length());
        HttpSession session = request.getSession();
        Object spc = session.getAttribute("SPRING_SECURITY_CONTEXT");
        if (spc != null) {
            UserDetail user = (UserDetail) ((SecurityContextImpl) spc).getAuthentication().getPrincipal();
            session.setAttribute("role", user.getRole());
            session.setAttribute("region", user.getRegion());
        }
        response.setHeader("PRagma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");
        try {
            String parent = LayoutAssembly.assembly(page, request);
            request.getRequestDispatcher(parent).include(
                    request, response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String args[]) {
        System.out.println("/sdsadsad/mgr/sasadsa".indexOf("/mgr/"));
    }
}
