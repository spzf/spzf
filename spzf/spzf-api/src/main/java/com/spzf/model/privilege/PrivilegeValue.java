package com.spzf.model.privilege;

import java.io.Serializable;

import com.spzf.model.BaseModel;

/**
 * @Comment: 权限值
 * @author 
 * @Create Date 2014年3月12日
 */
@SuppressWarnings("serial")
public class PrivilegeValue extends BaseModel implements Serializable {
	//id 32
	private String id;
	//权限值key 20
	private String pkey;
	//权限值名称
	private String pvalue;
	//模块id 32
	private String moduleId;
	//系统id 32
	private String systemId;
	//权限值类型 0：操作权限 1：数据权限
	private Integer type;
	//排序号
	private Integer orderNo;
	//模块标识
	private String moduleSn;
	
	public String getModuleSn() {
		return moduleSn;
	}
	public void setModuleSn(String moduleSn) {
		this.moduleSn = moduleSn;
	}
	public PrivilegeValue(){}
	public PrivilegeValue(String moduleId, String systemId) {
		this.moduleId = moduleId;
		this.systemId = systemId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPkey() {
		return pkey;
	}
	public void setPkey(String pkey) {
		this.pkey = pkey;
	}
	public String getModuleId() {
		return moduleId;
	}
	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}
	public String getSystemId() {
		return systemId;
	}
	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}
	public String getPvalue() {
		return pvalue;
	}
	public void setPvalue(String pvalue) {
		this.pvalue = pvalue;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	
}
