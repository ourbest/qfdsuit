package com.pt.base;

import java.util.HashMap;
import java.util.Map;

/**
 * Copyright (c) 2007 - 2009,NEO Grid Technology Inc.
 * All rights reserved.
 *
 * @author yonghui.chen
 * @version 1.0
 * @date 2009-12-17
 */
public class Constants {
    public static final String SPLIT = "\", \"";
    public static final Map titles;
    public static final Map regions;

    static {
        titles = new HashMap();
        titles.put("main_side", "项目数据快速索引");
        titles.put("main", "项目数据查询和结果");
        titles.put("sim_side", "仿真数据快速索引");
        titles.put("sim", "仿真数据查询和结果");
        titles.put("fmc_side", "FMC模板快速索引");
        titles.put("fmc", "FMC模板查询和结果");
        titles.put("qfd_side", "设计指标快速索引");
        titles.put("qfd", "设计指标数据查询和结果");
        titles.put("org_side", "组织资源快速索引");
        titles.put("org", "组织资源查询和结果");
        titles.put("tbox_side", "设计工具库快速索引");
        titles.put("tbox", "设计工具库列表");
        titles.put("xfmc", "FMC模板应用查询和结果");
        titles.put("xfmc_side", "FMC模板应用索引");
        titles.put("req", "需求定义流程");
        titles.put("req_side", "需求定义快速索引");
        titles.put("space", "设计空间定义流程");
        titles.put("space_side", "设计空间模板快速索引");
        titles.put("report", "方案报告定义");
        titles.put("report_side", "方案报告模板快速索引");
        titles.put("org_side", "组织资源快速索引");
        titles.put("org", "组织资源查询和结果");
        titles.put("case", "生成设计案例");
        titles.put("case_side", "设计案例快速索引");
        titles.put("inhouse", "访问In-House工具进行计算");
        titles.put("inhouse_side", "In-House工具快速索引");
        titles.put("index_side", "产品结构快速索引");
        regions = new HashMap();
        regions.put("index", "west");
        regions.put("main", "west");
        regions.put("req", "west");
//        regions.put("reqdef", "east");
        regions.put("choicedef", "east");
        regions.put("space", "west");
        regions.put("decision", "east");
        regions.put("decisiondef", "east");
        regions.put("cad", "east");
        regions.put("cae", "east");
        regions.put("opt", "east");
        regions.put("techdef", "east");
        regions.put("xfmc", "west");
        regions.put("inhouse", "west");
        regions.put("report", "west");
        regions.put("case", "west");
        regions.put("org", "west");


    }
}
