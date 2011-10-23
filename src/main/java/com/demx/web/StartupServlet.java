package com.demx.web;

import com.demx.core.startup.DefaultStartupImpl;
import com.demx.core.startup.StartupEnable;
import com.demx.mapping.startup.agent.StartManagerAgent;
import com.demx.util.DateConverter;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.sql.Timestamp;
import java.util.Date;

/**
 * @author <a href="yonghuichen@prient.com">Yonghui Chen</a>
 * @version $Id: StartupServlet.java,v 1.6 2004/09/21 09:25:46 administrator Exp $
 */
public class StartupServlet
        extends HttpServlet {
    /**
     * 使用DummyRequest进行Local方式测试Dynamic ActionForm需要启动的DynamicAction实例的属性
     * dummyContext = false 为WebApp方式 dummyContext = true 为Local方式
     *
     * @since empty
     */
    public boolean dummyContext = false;
    /**
     * 实例化Log
     *
     * @since empty
     */
    private static Logger log = Logger.getLogger(StartupServlet.class);

    /**
     * 属性描述
     *
     * @since empty
     */
    private boolean isActivedStart = false;

    /**
     * 在服务启动时需要对Dynamic ActionForm的数据类型进行定义，以便于在运行时进行数据类型的动态转换
     *
     * @throws ServletException
     */
    public void init()
            throws ServletException {
        ConvertUtils.deregister();
        ConvertUtils.register(new DateConverter(), Date.class);
        ConvertUtils.register(new DateConverter(), Timestamp.class);
        ConvertUtils.register(new DateConverter(), java.sql.Date.class);

        String start = this.getInitParameter("isStart");
        startConf = this.getInitParameter("startConfig");
        if (start != null && start.equals("true")) {
            this.isActivedStart = true;
            if (this.isActivedStart) {
                this.actived();
            }
        } else {
            StartManagerAgent startAgent = new StartManagerAgent();
            if (!startAgent.isStart()) {
                this.actived();
            }
        }
    }

    private String startConf;

    /**
     * 启动在startup.xml中所有标注为启动的服务
     */
    public void actived() {
        StartupEnable start = new DefaultStartupImpl();
        if (startConf == null || startConf.equals("")) {
            startConf = "startup.xml";
        }
        start.startFile = startConf;
        start.init();
        start.startAll();
    }
}
