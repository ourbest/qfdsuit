package com.demx.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * <p>Title: PTF 3.0</p>
 * <p>Description: Prient technology Framwork</p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: </p>
 *
 * @author ԭ��
 * @version 3.0
 */

public class ListMap
        extends HashMap implements Serializable {

    public ListMap() {
        super();
        super.put(keys, values);
    }

    private List keys = new ArrayList();

    private List values = new ArrayList();

    public Object put(Object key, Object value) {
        if (key != null) {
            keys.add(key);
            values.add(value);
        }
        return null;
    }

    public int size() {
        return keys.size();
    }

    public Object get(Object key) {
        if (key != null) {
            int num = keys.indexOf(key);
            if (num >= 0 && values.size() >= num) {
                return values.get(num);
            }
        }
        return null;
    }

    public Object remove(Object key) {
        if (key != null) {
            int num = keys.indexOf(key);
            if (num >= 0 && values.size() >= num) {
                keys.remove(num);
                values.remove(num);
            }
        }
        return null;

    }

    public List getKeys() {
        return keys;
    }

    public List getValues() {
        return values;
    }
}
