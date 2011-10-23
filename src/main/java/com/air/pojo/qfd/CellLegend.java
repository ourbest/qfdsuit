package com.air.pojo.qfd;

import javax.persistence.Id;

/**
 * create at: 11-7-29
 *
 * @author Yonghui Chen
 */
public class CellLegend {
    @Id
    private String legendId;
    private String legendName;

    public String getLegendId() {
        return legendId;
    }

    public void setLegendId(String legendId) {
        this.legendId = legendId;
    }

    public String getLegendName() {
        return legendName;
    }

    public void setLegendName(String legendName) {
        this.legendName = legendName;
    }
}
