package com.demx.mapping.layout.vo;

import org.apache.commons.collections.map.ListOrderedMap;

import java.io.Serializable;

public class LayoutMappingable
        extends ListOrderedMap implements Serializable {
    public LayoutMappingable() {
    }

    public Layout getLayout(String name) {
        return (Layout) this.get(name);
    }

    public void addLayout(String name, Layout layout) {
        this.put(name, layout);
    }
}
