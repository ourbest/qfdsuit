package com.demx.mapping.startup.agent;

import com.demx.cfg.AbstractMappingLoad;
import com.demx.cfg.exception.MappingException;
import com.demx.mapping.startup.vo.StartContains;
import com.demx.mapping.startup.vo.StartMappingable;
import com.demx.mapping.startup.vo.Startup;
import org.apache.log4j.Logger;
import org.dom4j.Element;

import java.util.Iterator;

public class StartMappingLoad
        extends AbstractMappingLoad {
    private static Logger log = Logger.getLogger(StartMappingLoad.class);

    public StartMappingLoad() {
        super();
        descName = ".xml";
        valid = false;
    }

    private StartMappingable startable = new StartMappingable();

    /**
     * @return the MsgMappingable value of msgable.
     */
    public StartMappingable getStartable() {
        return startable;
    }

    public void add(org.dom4j.Document doc)
            throws MappingException {
        Element root = doc.getRootElement().element(StartContains.STARTCONFIG);
        if (root != null) {
            Iterator its = root.elementIterator(StartContains.STARTUP);
            while (its.hasNext()) {
                Startup start = new Startup();
                Element el = (Element) its.next();
                Element startname = el.element(StartContains.STARTNAME);
                Element startclazz = el.element(StartContains.STARTCLAZZ);
                Element startact = el.element(StartContains.STARTACT);
                String name = startname.getText();
                start.setName(name);
                start.setClazz(startclazz.getText());
                start.setActived(startact.getText());
                startable.addStartup(name, start);
            }
        }
    }

    public void configure(org.dom4j.Document doc)
            throws MappingException {
    }
}
