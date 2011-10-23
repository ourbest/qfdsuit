package com.demx.cfg.mapping.vo;

import java.io.Serializable;

public class Config
        implements Serializable {
    private String clazzname;
    private String alias;
    private String path;
    private String actived;
    private String inside;

    private boolean reload;

    /**
     * @return true if reload is set to true.
     */
    public boolean isReload() {
        return reload;
    }

    public void setReload(String aReload) {
        if (aReload != null && aReload.equals("true")) {
            reload = true;
        }
    }

    public String getActived() {
        return actived;
    }

    public boolean isActive() {
        if (actived != null && actived.equals("true")) {
            return true;
        } else {
            return false;
        }
    }

    public void setActived(String aActived) {
        actived = aActived;
    }


    public String getInside() {
        return inside;
    }

    public void setInside(String aInside) {
        inside = aInside;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String aPath) {
        path = aPath;
    }


    public String getAlias() {
        return alias;
    }


    public void setAlias(String aAlias) {
        alias = aAlias;
    }


    public String getClazzname() {
        return clazzname;
    }

    public void setClazzname(String aClazzname) {
        clazzname = aClazzname;
    }

    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("<com.demx.cfg.agent.vo.Config>\n");
        buffer.append("\t<clazzname>").append(clazzname).append("</clazzname>\n");
        buffer.append("\t<property>").append(alias).append("</property>\n");
        buffer.append("\t<property>").append(path).append("</property>\n");
        buffer.append("\t<actived>").append(isActive()).append("</actived>\n");
        buffer.append("\t<inside>").append(inside).append("</inside>\n");
        buffer.append("\t<hashcode>").append(hashCode()).append("</hashcode>\n");
        buffer.append("</com.demx.cfg.agent.vo.Config>\n");
        return buffer.toString();
    }
}
