package com.air.event;

import com.air.pojo.process.ProjectData;

/**
 * create at: 11-9-4
 *
 * @author Yonghui Chen
 */
public class CellUpdateEvent {
    private ProjectData cell;

    public CellUpdateEvent() {
    }

    public CellUpdateEvent(ProjectData cell) {
        this.cell = cell;
    }

    public ProjectData getCell() {
        return cell;
    }

    public void setCell(ProjectData cell) {
        this.cell = cell;
    }
}
