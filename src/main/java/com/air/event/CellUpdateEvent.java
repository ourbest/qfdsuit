package com.air.event;

import com.air.pojo.process.ProjectData;

import java.util.Collection;

/**
 * create at: 11-9-4
 *
 * @author Yonghui Chen
 */
public class CellUpdateEvent {
    private ProjectData cell;
    private Collection<ProjectData> allVal;

    public CellUpdateEvent() {
    }

    public CellUpdateEvent(ProjectData cell) {
        this.cell = cell;
    }

    public CellUpdateEvent(ProjectData cell, Collection<ProjectData> data) {
        this.cell = cell;
        this.allVal = data;
    }

    public Collection<ProjectData> getAllVal() {
        return allVal;
    }

    public void setAllVal(Collection<ProjectData> allVal) {
        this.allVal = allVal;
    }

    public ProjectData getCell() {
        return cell;
    }

    public void setCell(ProjectData cell) {
        this.cell = cell;
    }
}
