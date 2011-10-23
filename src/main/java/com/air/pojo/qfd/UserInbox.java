package com.air.pojo.qfd;

import javax.persistence.Id;
import java.util.Date;

/**
 * create at: 11-8-11
 *
 * @author Yonghui Chen
 */
public class UserInbox {
    @Id
    private String userId;
    private Date createTime;
    @Id
    private String formId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }
}
