package com.pt.base.vo;

import java.io.Serializable;

/**
 * @author yonghui.chen
 * @version 1.0
 * @date 2009-12-17
 */
public class UserInfo implements Serializable {

	private static final long serialVersionUID = -2984635348742528534L;

	public UserInfo(){
	}
	
	private String userid;
	private String username;
	private String password;
	private String realname;
    private String userrole;
	private String title;
	private String region;

    public String getUserrole() {
        return userrole;
    }

    public void setUserrole(String userrole) {
        this.userrole = userrole;
    }
	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserid() {
		return userid;
	}

    @Override
    public String toString() {
        return "UserInfo{" +
                "userid='" + userid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", realname='" + realname + '\'' +
                ", userrole='" + userrole + '\'' +
                ", title='" + title + '\'' +
                ", region='" + region + '\'' +
                '}';
    }
}
