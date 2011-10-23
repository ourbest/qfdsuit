package com.air.dao.process;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.process.ProjectData;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-9-4
 *
 * @author Yonghui Chen
 */
public class ProjectDataDao extends DaoTemplate<ProjectData> {
    public List<ProjectData> findByForm(long projectId, long formId) throws SQLException {
        return createQuery().addFilter("projectId", projectId).addFilter("formId", formId).asList();
    }

    public ProjectData getData(long projectId, long rowId, long colId) throws SQLException {
        return createQuery().addFilter("projectId", projectId).addFilter("rowId", rowId).addFilter("colId", colId).queryOne();
    }
}
