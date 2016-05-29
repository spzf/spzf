package com.spzf.dao.privilege.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.dao.MybatisTemplate;
import com.spzf.dao.privilege.IPrivilegeValueDao;
import com.spzf.model.privilege.PrivilegeValue;

/**
 * 
 * @Description:权限值dao
 * @Author:
 * @Since:
 * @Version:1.1.0
 * @Copyright:Copyright (c) 
 */
@Repository
public class PrivilegeValueDaoImpl extends MybatisTemplate implements
		IPrivilegeValueDao {

	@Override
	public void insertPrivilegeValue(PrivilegeValue privilegeValue)
			throws Exception {
		this.insert("PrivilegeValueXML.insertPrivilegeValue", privilegeValue);
	}

	@Override
	public void updatePrivilegeValue(PrivilegeValue privilegeValue)
			throws Exception {
		this.update("PrivilegeValueXML.updatePrivilegeValue", privilegeValue);
	}

	@Override
	public void delPrivilegeValue(String id) throws Exception {
		this.delete("PrivilegeValueXML.delPrivilegeValue", id);
	}

	@Override
	public void delPriValByModuleId(String moduleId) throws Exception {
		this.delete("PrivilegeValueXML.delPriValByModuleId", moduleId);
	}
	@Override
	public PrivilegeValue getPrivilegeValueById(String id) throws Exception {
		return (PrivilegeValue)this.selectOne("PrivilegeValueXML.getPrivilegeValueById", id);
	}

	@Override
	public PagerModel<PrivilegeValue> getPagerModel(
			PrivilegeValue privilegeValue, Query query) throws Exception {
		return this.getPagerModelByQuery(privilegeValue, query, "PrivilegeValueXML.getPagerModel");
	}

	@Override
	public List<PrivilegeValue> getAll(PrivilegeValue privilegeValue)
			throws Exception {
		return (List<PrivilegeValue>)this.selectList("PrivilegeValueXML.getAll", privilegeValue);
	}
	
	@Override
	public void updateModuleSnByModuleId(String moduleSn, String moduleId)
			throws Exception {
		PrivilegeValue privilegeValue=new PrivilegeValue();
		privilegeValue.setModuleId(moduleId);
		privilegeValue.setModuleSn(moduleSn);
		this.update("PrivilegeValueXML.updateModuleSnByModuleId", privilegeValue);
	}
}
