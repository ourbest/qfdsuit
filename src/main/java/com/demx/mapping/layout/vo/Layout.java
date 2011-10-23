package com.demx.mapping.layout.vo;

import java.io.Serializable;
import java.util.Map;

public class Layout
        implements Serializable {
    public Layout() {
    }

    private Map globalMsgs;

    public Map getGlobalMsgs() {
        return globalMsgs;
    }

    public void setGlobalMsgs(Map globalMsgs) {
        this.globalMsgs = globalMsgs;
    }

    public Map getGlobalPuts() {
        return globalPuts;
    }

    public void setGlobalPuts(Map globalPuts) {
        this.globalPuts = globalPuts;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Map getMsgs() {
        return msgs;
    }

    public void setMsgs(Map msgs) {
        this.msgs = msgs;
    }

    public Map getPuts() {
        return puts;
    }

    public void setPuts(Map puts) {
        this.puts = puts;
    }

    private Map globalPuts;
    private String template;
    private String id;
    private Map msgs;
    private Map puts;
    private Map rputs;

    public Map getRputs() {
        return rputs;
    }

    public void setRputs(Map rputs) {
        this.rputs = rputs;
    }

    private int selectbar;

    @Override
    public String toString() {
        return "Layout{" +
                "globalMsgs=" + globalMsgs +
                ", globalPuts=" + globalPuts +
                ", template='" + template + '\'' +
                ", id='" + id + '\'' +
                ", msgs=" + msgs +
                ", puts=" + puts +
                '}';
    }

    public int getSelectbar() {
        return selectbar;
    }

    public void setSelectbar(int selectbar) {
        this.selectbar = selectbar;
    }
}
