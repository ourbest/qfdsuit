package com.air.event;

/**
 * create at: 11-9-4
 *
 * @author Yonghui Chen
 */
public class EventManager {
    private static EventManager instance = new EventManager();

    public static EventManager getInstance() {
        return instance;
    }

    public void fireEvent(CellUpdateEvent event) {

    }
}
