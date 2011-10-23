package com.demx.mapping.layout.agent;

import com.demx.cfg.AbstractMappingLoad;
import com.demx.cfg.exception.MappingException;
import com.demx.mapping.layout.vo.Layout;
import com.demx.mapping.layout.vo.LayoutContains;
import com.demx.mapping.layout.vo.LayoutMappingable;
import org.apache.log4j.Logger;
import org.dom4j.Attribute;
import org.dom4j.Element;
import java.util.*;

public class LayoutMappingLoad
        extends AbstractMappingLoad {
    private static Logger log = Logger.getLogger(LayoutMappingLoad.class);

    public LayoutMappingLoad() {
        super();
        descName = ".xml";
        valid = false;
    }

    private LayoutMappingable layoutable = new LayoutMappingable();

    /**
     * @return the MsgMappingable value of msgable.
     */
    public LayoutMappingable getLayoutable() {
        return layoutable;
    }

    public void add(org.dom4j.Document doc)
            throws MappingException {
        Element root = doc.getRootElement();
        try {
            if (root != null) {
                Iterator gits = root.elementIterator(LayoutContains.GTEMPLATE);
                Map<String, String> gputs = new HashMap<String, String>();
                Map<String, String> gmsg = new HashMap<String, String>();
                while (gits.hasNext()) {
                    Element el = (Element) gits.next();
                    List<Element> pit = el.selectNodes("part[@type='put']");
                    for (Element pe : pit) {
                        gputs.put(pe.attribute(LayoutContains.NAME).getValue(), pe.attribute(LayoutContains.VALUE).getValue());
                    }
                    List<Element> mit = el.selectNodes("part[@type='msg']");
                    for (Element pe : mit) {
                        gmsg.put(pe.attribute(LayoutContains.NAME).getValue(), pe.attribute(LayoutContains.VALUE).getValue());
                    }
                }
                Iterator its = root.elementIterator(LayoutContains.LAYOUT);
                while (its.hasNext()) {
                    Layout layout = new Layout();
                    layout.setGlobalPuts(gputs);
                    layout.setGlobalMsgs(gmsg);
                    Element el = (Element) its.next();
                    String id = el.attribute(LayoutContains.ID).getValue();
                    layout.setId(id);
                    Attribute tm = el.attribute(LayoutContains.TEMPLATE);
                    if (tm != null) {
                        layout.setTemplate(tm.getValue());
                    }
                    Attribute ref = el.attribute(LayoutContains.REF);
                    if (ref != null) {
                        String r = ref.getValue();
                        if ("global".equals(r)) {
                            layout.setPuts((Map)((HashMap)gputs).clone());
                            layout.setMsgs((Map)((HashMap)gmsg).clone());
                        }
                    }
                    List<Element> pit = el.selectNodes("part[@type='put']");
                    Map puts = layout.getPuts();
                    if (puts == null) {
                        puts = new HashMap();
                    }
                    for (Element pe : pit) {
                        String value = pe.attribute(LayoutContains.VALUE).getValue();
                        String name = pe.attribute(LayoutContains.NAME).getValue();
                        Set keys = gputs.keySet();
                        for (Iterator<String> it = keys.iterator(); it.hasNext(); ) {
                            String key = it.next();
                            String v = gputs.get(key);
                            value = value.replaceAll("\\$\\{" + key + "\\}", v);
                        }
                        puts.put(name, value);
                    }
                    layout.setPuts(puts);
                    List<Element> mit = el.selectNodes("part[@type='msg']");
                    Map msgs = layout.getMsgs();
                    if (msgs == null) {
                        msgs = new HashMap();
                    }
                    for (Element pe : mit) {
                        String value = pe.attribute(LayoutContains.VALUE).getValue();
                        String name = pe.attribute(LayoutContains.NAME).getValue();
                        Set keys = gmsg.keySet();
                        for (Iterator<String> it = keys.iterator(); it.hasNext(); ) {
                            String key = it.next();
                            String v = gmsg.get(key);
                            value = value.replaceAll("\\$\\{" + key + "\\}", v);
                        }
                        msgs.put(name, value);
                    }
                    layout.setMsgs(msgs);
                    layoutable.addLayout(id, layout);
                }
            }
        } catch (Exception e) {
            throw new MappingException("Map Clone Error",e);  //To change body of catch statement use File | Settings | File Templates.
        }
    }

    public void configure(org.dom4j.Document doc)
            throws MappingException {
    }
}
