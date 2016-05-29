package com.spzf.model.loginlog;

import java.io.Serializable;

/**
 * @Title:
 * @Description:日志
 * @Author:z
 * @Since:2014年4月8日
 * @Version:1.1.0
 * @Copyright:Copyright (c) 2014 ~ 2015 版权所有
 */
public class LoginLog implements Serializable {
		
	private static final long serialVersionUID = 1L;
	//id 自增长
	private int id;
	//访问ip
	private String ip;
	//操作人id
	private String operationId;
	//操作人的姓名
	private String operationUsername;
	//操作人姓名
	private String operationPerson;
	//操作内容
	private String operationContent;
	//操作时间
	private String operationTime;
	
	public LoginLog(){}
	public LoginLog(String ip, String operationId,
			String operationUsername, String operationPerson,
			String operationContent) {
		this.ip = ip;
		this.operationId = operationId;
		this.operationUsername = operationUsername;
		this.operationPerson = operationPerson;
		this.operationContent = operationContent;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getOperationId() {
		return operationId;
	}
	public void setOperationId(String operationId) {
		this.operationId = operationId;
	}
	public String getOperationUsername() {
		return operationUsername;
	}
	public void setOperationUsername(String operationUsername) {
		this.operationUsername = operationUsername;
	}
	public String getOperationPerson() {
		return operationPerson;
	}
	public void setOperationPerson(String operationPerson) {
		this.operationPerson = operationPerson;
	}
	public String getOperationContent() {
		return operationContent;
	}
	public void setOperationContent(String operationContent) {
		this.operationContent = operationContent;
	}
	public String getOperationTime() {
		return operationTime;
	}
	public void setOperationTime(String operationTime) {
		this.operationTime = operationTime;
	}

}
