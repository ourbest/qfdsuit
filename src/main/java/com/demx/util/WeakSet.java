package com.demx.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @author <a href="mailto:jeff@shiftone.org">Jeff Drost</a>
 * @version $Revision: 1.2 $
 */
public class WeakSet {

    private static final Log LOG = LogFactory.getLog(WeakSet.class);
    private WeakMap weakMap = new WeakMap();
    private int count = 0;

    public int size() {
        return weakMap.size();
    }

    public boolean isEmpty() {
        return weakMap.isEmpty();
    }

    public void add(Object obj) {
        weakMap.put(new Integer(count++), obj);
    }

    public void clear() {
        weakMap.clear();
    }

    public Iterator iterator() {

        List list = new ArrayList();
        Set keys = weakMap.keySet();
        Iterator iterator = keys.iterator();

        while (iterator.hasNext()) {
            Object key = iterator.next();
            Object value = weakMap.get(key);

            if (value != null) {
                list.add(value);
            }
        }

        return list.iterator();
    }
}
