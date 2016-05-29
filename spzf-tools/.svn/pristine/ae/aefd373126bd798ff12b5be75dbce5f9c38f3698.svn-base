package com.spzf.tools.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/** 
 * @Description:
 * @Author:
 * @Since:
 * @Copyright:
 */
public class BaseModel implements Serializable{
	/**
	 *
	 */
		
	private static final long serialVersionUID = 1L;

    private String sessionId;
	/**
	 * 创建人ID
	 */
	private String createUserId;
	/**
	 * 创建人
	 */
	private String createUser;
	/**
     * 创建人邮箱
     */
    private String createUserEmail;
	/**
	 * 创建时间
	 */
	private String createTime;
	/**
	 * 修改人ID
	 */
	private String updateUserId;
	/**
	 * 修改人
	 */
	private String updateUser;
	/**
     * 修改人邮箱
     */
    private String updateUserEmail;
	/**
	 * 修改时间
	 */
	private String updateTime;
	/**
	 * 删除人
	 */
	private String delUser;
	/**
	 * 删除时间
	 */
	private String delTime;
	
	 /**
     * 是否有效：1有效；2-失效
     */
    private String delFlag;
	
    /**
     * 公共服务器地址，文件地址
     */
    private String ftpHost;
    
	private Map map;
	
	//起始日期
    private String startDate;
    //结束日期
    private String endDate;
    
	 /**
	 * 分页参数  row:每页显示的条数   page：页数
	 */
	private int row;
	private int page;
	
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getDelUser() {
		return delUser;
	}
	public void setDelUser(String delUser) {
		this.delUser = delUser;
	}
	public String getDelTime() {
		return delTime;
	}
	public void setDelTime(String delTime) {
		this.delTime = delTime;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getFtpHost() {
		return ftpHost;
	}
	public void setFtpHost(String ftpHost) {
		this.ftpHost = ftpHost;
	}
	
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public Map getParams(){
		Map<String,String> params = new HashMap<String,String>();
		if(map != null && !map.isEmpty()){
			for (Iterator iter = map.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) map.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]: valueStr + values[i] + ",";
				}
				//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
				params.put(name, valueStr);
			}//for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) { end
		}
		return params;
	}
	public String getCreateUserEmail() {
		return createUserEmail;
	}
	public void setCreateUserEmail(String createUserEmail) {
		this.createUserEmail = createUserEmail;
	}
	public String getUpdateUserEmail() {
		return updateUserEmail;
	}
	public void setUpdateUserEmail(String updateUserEmail) {
		this.updateUserEmail = updateUserEmail;
	}
	
}

	