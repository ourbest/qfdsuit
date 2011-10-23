package com.demx.core.startup;

public abstract class StartupEnable {
    /**
     * 默认构造方法
     */
    public StartupEnable() {
    }

    /**
     * 启动所有服务接口
     */
    public abstract void startAll();

    /**
     * 启动指定服务接口
     *
     * @param serviceName String 服务名
     */
    public abstract void startAlone(String serviceName);

    /**
     * 刷新所有服务
     */
    public abstract void reflush();

    /**
     * 初始化方法
     */
    public abstract void init();

    /**
     * 停止所有服务
     */
    public abstract boolean stopAll();

    /**
     * 指定服务的活动状态
     *
     * @param serviceName String 服务名
     * @return boolean
     */
    public abstract boolean actived(String serviceName);

    /**
     * 停止指定服务
     */
    public boolean stop(String serviceName) {
        return false;
    }

    public String startFile;
}
