package com.pt.base.auth;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pt.base.servlet.SpringServlet;

import java.io.IOException;

/**
 * @author yonghui.chen
 * @version 1.0
 * @date 2009-12-17
 */
public class LogoutServlet extends SpringServlet {

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("j_spring_security_logout");
    }
}
