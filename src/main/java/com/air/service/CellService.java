package com.air.service;

import com.air.dao.*;
import com.air.formula.FormCell;
import com.air.formula.Parser;
import com.air.formula.SumFunction;
import com.air.pojo.qfd.*;
import com.air.web.util.CellEditors;
import com.googlecode.aviator.AviatorEvaluator;
import com.googlecode.aviator.Expression;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import javax.swing.event.EventListenerList;
import java.sql.SQLException;
import java.util.*;

/**
 * create at: 11-7-30
 *
 * @author Yonghui Chen
 */
public class CellService {
    @AirAutowired
    CellValueDao cellValueDao;
    @AirAutowired
    CellRelationDao cellRelationDao;
    @AirAutowired
    CellEditorDao cellEditorDao;

    @AirAutowired
    ProjectFormDao projectFormDao;

    @AirAutowired
    CellLegendItemDao cellLegendItemDao;

    private EventListenerList eventListenerList = new EventListenerList();

    @AirAutowired
    private CellLegendDao cellLegendDao;

    public void updateCell(CellValue cell) throws SQLException {
//        List<CellValue> db = cellValueDao.findByForm(cell.getFormId());
        ProjectForm form = projectFormDao.get(cell.getFormId());

        CellEditor editor = cellEditorDao.findByCell(cell.getFormId(), cell.getCellId());
        if (editor.getType() == CellEditors.selection.ordinal()) {
            String v = cell.getValue();
            if (!"0".equals(v)) {
                CellLegendItem item = cellLegendItemDao.get(v);
                cell.setDisplayValue(item.getItemName());
                cell.setValue("" + item.getItemValue());
            }
        }

        List<ProjectForm> forms = projectFormDao.findByProject(form.getProjectId());
        Map<String, String> names = new HashMap<String, String>(forms.size());
        ArrayList<String> ids = new ArrayList<String>();
        for (ProjectForm f : forms) {
            names.put(f.getFormCode(), f.getFormId());
            ids.add(f.getFormId());
        }

        List<CellValue> db = cellValueDao.findByForms(ids); // 一次加载所有数据

        Map<CellValue, CellValue> values = new HashMap<CellValue, CellValue>();
        for (CellValue cellValue : db) {
            values.put(cellValue, cellValue);
        }


        updateCell(cell, values, names);
    }

    private void updateCell(CellValue cell, Map<CellValue, CellValue> values, Map<String, String> names) throws SQLException {
        CellValue val = values.get(cell);
        boolean changed = false;
        if (val == null) {
            changed = true;
            cellValueDao.insert(cell);
            values.put(cell, cell);
        } else {
            if (!StringUtils.equals(cell.getValue(), val.getValue())) {
                cellValueDao.update(cell);
                changed = true;
                values.put(cell, cell);
            }
        }

        if (changed) {
            CellValueChangeListener[] listeners = eventListenerList.getListeners(CellValueChangeListener.class);
            for (CellValueChangeListener listener : listeners) {
                listener.fireUpdated(cell);
            }
            // 查找相关的表格，设置变化值。todo 处理循环引用
            List<CellRelation> ref = cellRelationDao.findByRef(cell.getFormId(), cell.getCellId());
            for (CellRelation relation : ref) {
                if (relation.getFormula() == 1) {
                    // 因为公式产生的关联
                    CellValue cellValue = calcValue(relation.getFormId(), relation.getCellId(), values, names);
                    if (cellValue != null) {
                        updateCell(cellValue, values, names);
                    }
                }
            }
        }
    }

    private CellValue calcValue(String formId, String cellId,
                                Map<CellValue, CellValue> values,
                                Map<String, String> names) throws SQLException {
        CellEditor formula = cellEditorDao.findByCell(formId, cellId);
        if (formula != null && !StringUtils.isEmpty(formula.getFormula())) {
            String f = formula.getFormula().toUpperCase();
            String myName = "";
            for (Map.Entry<String, String> entry : names.entrySet()) {
                if (entry.getValue().equals(formId)) {
                    myName = entry.getKey();
                    break;
                }
            }
            List<FormCell> cells = Parser.parseFormulaCells(myName, f);
            Map<String, Object> env = new HashMap<String, Object>();

            for (FormCell cell : cells) {
                String vak = cell.getColumn() + cell.getRow();
                CellValue v = new CellValue(names.get(cell.getFormCode()), vak);
                CellValue value = values.get(v);
                if (value == null) return null;
                double d = NumberUtils.toDouble(value.getValue());
                env.put((cell.getFormCode() + "_" + vak).toLowerCase(), d);
                if (cell.getFormCode().equals(myName)) {
                    env.put((vak).toLowerCase(), d);
                }
            }
            f = StringUtils.replace(f, "!", "_").toLowerCase();
            Expression compiledExp = AviatorEvaluator.compile(f);
            Object val = compiledExp.execute(env);
            CellValue ret = new CellValue(formId, cellId);
            ret.setValue(val.toString());
            ret.setDisplayValue(ret.getValue());

            return ret;
        }
        return null;
    }

    public CellService() {
        AviatorEvaluator.addFunction(new SumFunction());
    }

    public Map<String, List<CellLegendItem>> getLegends() throws SQLException {
        List<CellLegendItem> legends = cellLegendItemDao.listAll();
        Map<String, List<CellLegendItem>> ret = new HashMap<String, List<CellLegendItem>>();
        for (CellLegendItem legend : legends) {
            List<CellLegendItem> items = ret.get(legend.getLegendId());
            if (items == null) {
                items = new ArrayList<CellLegendItem>();
                ret.put(legend.getLegendId(), items);
            }
            items.add(legend);
        }
        return ret;
    }

    public void createRelation(String formId, String cellId, String formula) throws SQLException {
        ProjectForm form = projectFormDao.get(formId);
        List<String> cells = Parser.parseCellId(formula);
        List<CellRelation> relations = new ArrayList<CellRelation>();
        Map<String, ProjectForm> cached = new HashMap<String, ProjectForm>();
        for (String cell : cells) {
            List<FormCell> cellList = Parser.parseCells(form.getFormCode(), cell);
            for (FormCell formCell : cellList) {
                CellRelation relation = new CellRelation();
                relation.setRelationId(UUID.randomUUID().toString());
                relation.setFormId(form.getFormId());
                relation.setCellId(cellId);
                if (formCell.getFormCode().equals(form.getFormCode())) {
                    relation.setRelationFormId(relation.getFormId());
                } else {
                    ProjectForm projectForm = cached.get(formCell.getFormCode());
                    if (projectForm == null) {
                        projectForm = projectFormDao.findByProjectAndFormCode(form.getProjectId(), formCell.getFormCode());
                        if (projectForm != null) {
                            cached.put(projectForm.getFormCode(), projectForm);
                        }
                    }
                    relation.setRelationFormId(projectForm == null ? "" : projectForm.getFormId());
                }
                relation.setRelationCellId(formCell.getColumn() + formCell.getRow());
                relation.setFormula(1);
                relations.add(relation);
            }
        }
        deleteCellRelations(formId, cellId);
        cellRelationDao.insert(relations);
    }

    public void deleteCellRelations(String formId, String cellId) throws SQLException {
        cellRelationDao.deleteCellRelations(formId, cellId);
    }

    public List<CellLegend> getLegendNames() throws SQLException {
        return cellLegendDao.listAll();
    }
}
