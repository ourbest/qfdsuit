package com.air.dao.process;

import com.air.persist.dao.DaoTemplate;
import com.air.persist.dao.Query;
import com.air.pojo.form.FormRow;
import com.air.pojo.process.ProjectData;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * create at: 11-9-4
 *
 * @author Yonghui Chen
 */
public class ProjectDataDao extends DaoTemplate<ProjectData> {
    public List<ProjectData> findByForm(long projectId, long formId) throws SQLException {
        List<FormRow> rows = new Query<FormRow>(FormRow.class).addFilter("formId", formId).asList();
        List<Long> ids = new ArrayList<Long>(rows.size());
        for (FormRow row : rows) {
            ids.add(row.getRowId());
        }
        List<ProjectData> projectDatas = createQuery()
                .addFilter("projectId", projectId)
                .addFilter("rowId", ids)
                .asList();
        projectDatas.addAll(createQuery()
                .addFilter("projectId", projectId)
                .addFilter("colId", ids)
                .asList());
        return projectDatas;
    }

    public ProjectData getData(long projectId, long rowId, long colId) throws SQLException {
        return createQuery().addFilter("projectId", projectId)
                .addFilter("rowId", rowId)
                .addFilter("colId", colId)
                .queryOne();
    }
}
