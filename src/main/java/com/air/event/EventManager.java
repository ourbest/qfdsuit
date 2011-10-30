package com.air.event;

import com.air.formula.ValueCalculator;
import com.air.web.dummy.AutoBeanFactory;

import javax.swing.event.EventListenerList;

/**
 * create at: 11-9-4
 *
 * @author Yonghui Chen
 */
public class EventManager {
    private static EventManager instance = new EventManager();
    private EventListenerList eventListenerList = new EventListenerList();

    public EventManager() {
        ValueCalculator c = new ValueCalculator();
        AutoBeanFactory.getFactory().doAutoWired(c);
        eventListenerList.add(CellUpdateEventHandler.class, c);
    }

    public static EventManager getInstance() {
        return instance;
    }

    public void fireEvent(CellUpdateEvent event) {
        CellUpdateEventHandler[] listeners = eventListenerList.getListeners(CellUpdateEventHandler.class);
        for (CellUpdateEventHandler listener : listeners) {
            listener.fireUpdate(event);
        }
    }
}
