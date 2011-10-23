package com.demx.core.startup;

import com.demx.cfg.ConfigurationFactory;
import com.demx.mapping.defination.MappingDefination;
import com.demx.mapping.startup.agent.StartManagerAgent;
import com.demx.mapping.startup.vo.Startup;
import org.apache.log4j.Logger;

import java.util.Iterator;

/**
 * <p>DefaultStartupImpl默认的系统服务的启动实例</p>
 * DefaultStartupImpl是默认的服务启动实例，其根据配置文件startup.xml的startup部分启动所有的可用服务
 */

public class DefaultStartupImpl
        extends StartupEnable {
    /**
     * 获得Log实例
     */
    protected static Logger log = Logger.getLogger(DefaultStartupImpl.class);

    /**
     * 单子方法，在本程序被任何使用调用时，都将触发
     * 启动PTF3的Configuration，按配置的种类解析和cache所有的配置属性
     */
    static {
    }

    /**
     * 默认构造器
     */
    public DefaultStartupImpl() {
    }

    /**
     * 指定服务的活动状态
     *
     * @param serviceName String 服务名
     * @return boolean
     */
    public boolean actived(String serviceName) {
        return false;
    }

    /**
     * 初始化方法
     */
    public void init() {
        ConfigurationFactory factory = ConfigurationFactory.getFactory();
        factory.setStartFile(startFile);
        factory.initRegistry();
    }

    /**
     * 刷新所有服务
     */
    public void reflush() {
        ConfigurationFactory factory = ConfigurationFactory.getFactory();
        factory.setStartFile(startFile);
        factory.reloadRegistry();
        startAll();
    }

    /**
     * 启动所有服务接口.
     * 在配置文件的startup类中，所有的启动元素都使用StartuoEnable接口来产生实例.
     * 本启动，将依次启动所有服务
     */
    public void startAll() {
        StartManagerAgent agent = new StartManagerAgent();
        agent.registryName = MappingDefination.STARTUP;
        Iterator allstart = agent.getStartupIterator(true).iterator();
        while (allstart.hasNext()) {
            Startup start = (Startup) allstart.next();
            String clazzname = (start).getClazz();
            try {
                Class clazz = Class.forName(clazzname);
                StartupEnable startup = (StartupEnable) clazz.newInstance();
                startup.startAll();
            } catch (ClassNotFoundException ex) {
                log.error(":: 子系统< " + start.getName() + " >无法正确启动，请联系管理员\n" + ex);
            } catch (IllegalAccessException ex) {
                log.error(":: 子系统< " + start.getName() + " >无法正确启动，请联系管理员\n" + ex);
            } catch (InstantiationException ex) {
                log.error(":: 子系统< " + start.getName() + " >无法正确启动，请联系管理员\n" + ex);
            }
        }
    }

    /**
     * 启动指定服务接口
     *
     * @param name String 服务名
     */
    public void startAlone(String name) {
    }

    /**
     * 停止所有服务
     */
    public boolean stopAll() {
        return false;
    }

    /**
     * 停止指定服务
     */
    public boolean stop(String serviceName) {
        return false;
    }
}
