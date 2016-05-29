package com.spzf.model.user;

import java.io.Serializable;

import com.spzf.model.BaseModel;

/**
 * @Comment:用户系统
 * @author
 * @Create Date 2014年3月11日
 */
public class UserSystem extends BaseModel implements Serializable {
	private static final long serialVersionUID = 1L;

	//id 32
	private String id;
	//用户id 32
	private String userId;
	//系统id 32
	private String systemId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSystemId() {
		return systemId;
	}
	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}
	
}
