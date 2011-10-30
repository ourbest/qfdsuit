package com.air.formula;

import com.air.dao.form.FormRowDao;
import com.air.dao.process.ProjectDataDao;
import com.air.event.CellUpdateEvent;
import com.air.event.CellUpdateEventHandler;
import com.air.pojo.Types;
import com.air.pojo.form.FormRow;
import com.air.pojo.process.ProjectData;
import com.air.service.AirAutowired;
import com.googlecode.aviator.AviatorEvaluator;
import com.googlecode.aviator.Expression;
import org.apache.commons.lang.StringUtils;

import java.sql.SQLException;
import java.util.*;

/**
 * create at: 11-10-30
 *
 * @author Yonghui Chen
 */
public class ValueCalculator implements CellUpdateEventHandler {
    @AirAutowired
    FormRowDao formRowDao;

    @AirAutowired
    ProjectDataDao projectDataDao;

    @Override
    public void fireUpdate(CellUpdateEvent event) {
        ProjectData cell = event.getCell();
        long formId = cell.getFormId();
        try {
            List<ProjectData> newValues = new ArrayList<ProjectData>();
            // todo 修改变结构时将信息处理好保存下来
            List<FormRow> all = formRowDao.findByForm(formId);
            Map<String, FormRow> map = new HashMap<String, FormRow>(all.size());
            Map<String, Collection<FormRow>> ref = new HashMap<String, Collection<FormRow>>(all.size());
            FormRow meRow = null, meCol = null;
            for (FormRow row : all) {
                map.put(row.getCategory() + "-" + row.getTitle(), row);
                if (row.getRowId() == cell.getRowId()) meRow = row;
                if (row.getRowId() == cell.getColId()) meCol = row;
                if (!StringUtils.isEmpty(row.getRef())) {
                    Set<String> reference = FormulaParser.getReference(row.getRef());
                    for (String s : reference) {
                        Collection<FormRow> formRows = ref.get(s);
                        if (formRows == null) {
                            formRows = new HashSet<FormRow>();
                            ref.put(s, formRows);
                        }
                        formRows.add(row);
                    }
                }
            }

            if (meRow == null || meCol == null) {
                System.out.println("DEF error!!");
                return;
            }

            Map<String, ProjectData> dataMap = new HashMap<String, ProjectData>();
            for (ProjectData data : event.getAllVal()) {
                dataMap.put(data.getRowId() + "-" + data.getColId(), data);
            }
            Collection<FormRow> formRows = ref.get(meRow.getTitle());
            if (formRows != null) {
                for (FormRow row : formRows) {
                    ProjectData d = new ProjectData();
                    d.setRowId(row.getRowId());
                    d.setColId(cell.getColId()); // 和我同一列

                    String formula = row.getRef();
                    Set<String> reference = FormulaParser.getReference(formula);
                    for (String s : reference) {
                        FormRow formRow = map.get(Types.ROW_CATEGORY_ROW + "-" + s);
                        if (formRow == null) break; // 定义错误
                        ProjectData data = dataMap.get(formRow.getRowId() + "-" + cell.getColId());
                        if (data == null) break; // 数据不完整
                        formula = formula.replace("${" + s + "}", data.getData());
                    }

                    if (!formula.contains("${")) {
                        // 可以计算了
                        Expression compiledExp = AviatorEvaluator.compile(formula);
                        try {
                            String execute = compiledExp.execute().toString();
                            d.setData(execute);
                            d.setUpdateTime(new Date());
                            d.setFormId(cell.getFormId());
                            d.setProjectId(cell.getProjectId());
                            newValues.add(d);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }


            Collection<FormRow> formCols = ref.get(meCol.getTitle());
            if (formCols != null) {
                for (FormRow col : formCols) {
                    ProjectData d = new ProjectData();
                    d.setRowId(cell.getRowId());
                    d.setColId(col.getRowId()); // 和我同一行

                    String formula = col.getRef();
                    Set<String> reference = FormulaParser.getReference(formula);
                    for (String s : reference) {
                        FormRow formRow = map.get(Types.ROW_CATEGORY_COL + "-" + s);
                        if (formRow == null) break; // 定义错误
                        ProjectData data = dataMap.get(d.getRowId() + "-" + formRow.getRowId());
                        if (data == null) break; // 数据不完整
                        formula = formula.replace("${" + s + "}", data.getData());
                    }

                    if (!formula.contains("${")) {
                        // 可以计算了
                        Expression compiledExp = AviatorEvaluator.compile(formula);
                        try {
                            String execute = compiledExp.execute().toString();
                            d.setData(execute);
                            d.setUpdateTime(new Date());
                            d.setFormId(cell.getFormId());
                            d.setProjectId(cell.getProjectId());
                            newValues.add(d);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
                if (!newValues.isEmpty()) {
                    for (ProjectData newValue : newValues) {
                        ProjectData v = dataMap.get(newValue.getRowId() + "-" + newValue.getColId());
                        if (v != null) {
                            projectDataDao.delete(v);
                        }
                        dataMap.put(newValue.getRowId() + "-" + newValue.getColId(), newValue);
                    }
                    projectDataDao.insert(newValues);
                    event.getAllVal().clear();
                    event.getAllVal().addAll(dataMap.values());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
