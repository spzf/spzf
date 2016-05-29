package com.spzf.service.privilege.impl;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.dao.privilege.ISystemPrivilegeValueDao;
import com.spzf.model.privilege.SystemPrivilegeValue;
import com.spzf.service.privilege.ISystemPrivilegeValueService;

/**
 * @author 
 * @date 2014-07-28 11:34:08
 */
@Service
public class SystemPrivilegeValueServiceImpl implements ISystemPrivilegeValueService {
	@Resource
	private ISystemPrivilegeValueDao systemPrivilegeValueDao;

	@Override
	public SystemPrivilegeValue getSystemPrivilegeValueById(String id) throws Exception {
		return this.systemPrivilegeValueDao.getSystemPrivilegeValueById(id);
	}

	@Override
	public List<SystemPrivilegeValue> getAll(SystemPrivilegeValue systemPrivilegeValue) throws Exception {
		return this.systemPrivilegeValueDao.getAll(systemPrivilegeValue);
	}
	@Override
	public List<SystemPrivilegeValue> getPval(String systemId)
			throws Exception {
		return this.systemPrivilegeValueDao.getPval(systemId);
	}
	@Override
	public PagerModel<SystemPrivilegeValue> getPagerModelByQuery(SystemPrivilegeValue systemPrivilegeValue, Query query)
			throws Exception {
		return this.systemPrivilegeValueDao.getPagerModelByQuery(systemPrivilegeValue, query);
	}

	@Override
	public void insertSystemPrivilegeValue(SystemPrivilegeValue systemPrivilegeValue) throws Exception {
		systemPrivilegeValue.setCreateTime(new Date());
		this.systemPrivilegeValueDao.insertSystemPrivilegeValue(systemPrivilegeValue);
	}
	
	@Override
	public void delSystemPrivilegeValueById(String... id) throws Exception {
		for(String s : id){
			this.systemPrivilegeValueDao.delSystemPrivilegeValueById(s);
		}
	}

	@Override
	public void updateSystemPrivilegeValue(SystemPrivilegeValue systemPrivilegeValue) throws Exception {
		this.systemPrivilegeValueDao.updateSystemPrivilegeValue(systemPrivilegeValue);
	}
}

