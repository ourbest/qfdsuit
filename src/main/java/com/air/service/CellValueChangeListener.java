package com.air.service;

import com.air.pojo.qfd.CellValue;

import java.util.EventListener;

/**
 * create at: 11-8-2
 *
 * @author Yonghui Chen
 */
public interface CellValueChangeListener extends EventListener {
    public void fireUpdated(CellValue cellValue);
}
