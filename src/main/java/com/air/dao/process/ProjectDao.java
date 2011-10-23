package com.air.dao.process;

import com.air.persist.dao.DaoTemplate;
import com.air.pojo.process.Project;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-9-4
 *
 * @author Yonghui Chen
 */
public class ProjectDao extends DaoTemplate<Project> {


    public List<Project> findTemplates() throws SQLException {
        return createQuery().orderDesc("createTime").addFilter("template", 1).asList();
    }

    public List<Project> findByType(int type) throws SQLException {
        return createQuery().orderDesc("createTime")//.addFilter("template", 0)
                .addFilter("status", type).asList();
    }
}
