package com.demx.mapping.startup.vo;

import java.io.Serializable;

public class Startup
        implements Serializable {
    public Startup() {
    }

    private String clazz;
    private String name;
    private boolean actived;

    /**
     * @return true if actived is set to true.
     */
    public boolean isActived() {
        return actived;
    }

    /**
     * @param aActived - the new value for actived
     */
    public void setActived(String aActived) {
        actived = false;
        if (aActived != null && aActived.equals("true")) {
            actived = true;
        }
    }

    /**
     * @return the String value of clazz.
     */
    public String getClazz() {
        return clazz;
    }

    /**
     * @param aClazz - the new value for clazz
     */
    public void setClazz(String aClazz) {
        clazz = aClazz;
    }

    /**
     * @return the String value of name.
     */
    public String getName() {
        return name;
    }

    /**
     * @param aName - the new value for name
     */
    public void setName(String aName) {
        name = aName;
    }

    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("<com.ptf.mapping.startup.vo.Startup>\n");
        buffer.append("\t<clazz>").append(clazz).append("</clazz>\n");
        buffer.append("\t<name>").append(name).append("</name>\n");
        buffer.append("\t<actived>").append(actived).append("</actived>\n");
        buffer.append("\t<hashcode>").append(hashCode()).append("</hashcode>\n");
        buffer.append("</com.ptf.mapping.startup.vo.Startup>\n");
        return buffer.toString();
    }
}
