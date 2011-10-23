package com.demx.mapping.layout.agent;

import com.demx.cfg.AbstractManagerAgent;
import com.demx.cfg.AbstractParse;
import com.demx.cfg.exception.MappingException;
import com.demx.mapping.layout.vo.Layout;
import com.demx.mapping.layout.vo.LayoutMappingable;
import org.apache.log4j.Logger;

public class LayoutManagerAgent
        extends AbstractManagerAgent {
    private static final Logger log = Logger.getLogger(LayoutManagerAgent.class);
    private LayoutMappingable layoutable = null;

    public LayoutManagerAgent() {
        super();
        this.registryName = "layout";
    }

    public void parse()
            throws MappingException {
        AbstractParse parse = new LayoutMappingParse();
        parse.path = this.path;
        layoutable = (LayoutMappingable) parse.getResult();
    }

    public void addRegistry() {
        registry.addDomain(registryName, layoutable);
    }

    public Layout getLayout(String name) {
        layoutable = (LayoutMappingable) registry.getConfigDomain(registryName);
        Layout layout = null;
        if (registry == null) {
            log.debug(" registry is null, please init registry with Registry.getRegistry() method ");
        }
        if (layoutable != null) {
            layout = layoutable.getLayout(name);
        }
        return layout;
    }

}
