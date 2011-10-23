package com.air.dao.process;

import com.air.persist.dao.DaoTemplate;
import com.air.persist.dao.Operator;
import com.air.pojo.process.UserInbox;
import com.air.service.values.ProjectStatus;

import java.sql.SQLException;
import java.util.List;

/**
 * create at: 11-9-15
 *
 * @author Yonghui Chen
 */
public class UserInboxDao extends DaoTemplate<UserInbox> {
    public List<UserInbox> findByUser(String userId) throws SQLException {
        return createQuery().orderDesc("updateTime").orderDesc("projectId")
                .addFilter("userId", userId)
                .addFilter("status", Operator.le, ProjectStatus.finished.ordinal()).asList();
    }

    public UserInbox getInboxItem(String userId, long projectId) throws SQLException {
        return createQuery().addFilter("userId", userId).addFilter("projectId", projectId).queryOne();
    }
}
