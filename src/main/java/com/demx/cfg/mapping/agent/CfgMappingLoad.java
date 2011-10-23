package com.demx.cfg.mapping.agent;

import com.demx.cfg.AbstractMappingLoad;
import com.demx.cfg.exception.MappingException;
import com.demx.cfg.mapping.vo.Cfgable;
import com.demx.cfg.mapping.vo.Config;
import org.dom4j.Attribute;
import org.dom4j.Element;

import java.util.Iterator;

public class CfgMappingLoad
        extends AbstractMappingLoad {
    //    private static Logger log = Logger.getLogger(CfgMappingLoad.class);
    public CfgMappingLoad() {
        super();
        descName = ".xml";
        valid = false;
    }

    private Cfgable cfgable = new Cfgable();

    /**
     * @return the MsgMappingable value of msgable.
     */
    public Cfgable getCfgable() {
        return cfgable;
    }

    public void add(org.dom4j.Document doc)
            throws MappingException {
        Element root = doc.getRootElement().element(CfgContains.ROOT);
        if (root != null) {
            Iterator its = root.elementIterator(CfgContains.CONFIG);
            while (its.hasNext()) {
                Config cfg = new Config();
                Element el = (Element) its.next();
                Element cfgname = el.element(CfgContains.ALIAS);
                Element cfgact = el.element(CfgContains.ACTIVED);
                Element cfgpath = el.element(CfgContains.PATH);
                Element cfgin = el.element(CfgContains.INSIDE);
                Element cfgreload = el.element(CfgContains.RELOAD);
                String alias = cfgname.getText();
                cfg.setAlias(alias);
                Attribute cfgclazz = el.attribute(CfgContains.CLAZZNAME);
                String clazz = cfgclazz.getValue();
                cfg.setClazzname(clazz);
                cfg.setActived(cfgact.getText());
                cfg.setInside(cfgin.getText());
                cfg.setPath(cfgpath.getText());
                if (cfgreload != null) {
                    cfg.setReload(cfgreload.getTextTrim());
                }
                cfgable.addCfg(clazz, cfg);
            }
        }
    }

    public void configure(org.dom4j.Document doc)
            throws MappingException {
    }
}
