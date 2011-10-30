package com.air.event;

import java.util.EventListener;

/**
 * create at: 11-9-4
 *
 * @author Yonghui Chen
 */
public interface CellUpdateEventHandler extends EventListener {
    void fireUpdate(CellUpdateEvent event);
}
