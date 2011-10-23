package com.pt.base.servlet;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 * Copyright (c) 2007 - 2009,NEO Grid Technology Inc.
 * All rights reserved.
 *
 * @author yonghui.chen
 * @version 1.0
 * @date 2009-12-17
 */
public abstract class SpringServlet extends HttpServlet {
    protected ApplicationContext context;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
    }
}
