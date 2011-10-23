package com.demx.mapping.layout.agent;

import com.demx.cfg.AbstractParse;
import com.demx.cfg.exception.MappingException;
import com.demx.mapping.layout.vo.LayoutMappingable;
import org.apache.log4j.Logger;

import java.io.File;

public class LayoutMappingParse
        extends AbstractParse {
    private static final Logger log = Logger.getLogger(LayoutMappingParse.class);

    public LayoutMappingParse() {
        super();
    }

    private LayoutMappingable layoutable;

    public Object getResult() {
        LayoutMappingLoad load = new LayoutMappingLoad();
        try {
            File filename = (new File(
                    Thread.currentThread().getContextClassLoader().getResource(this.path).getFile()
            ));
            load.addDirectory(filename);
            layoutable = load.getLayoutable();
        } catch (MappingException ex) {
            ex.printStackTrace();
        }
        return layoutable;
    }
}
