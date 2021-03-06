package com.spzf.dao.role.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.dao.MybatisTemplate;
import com.spzf.dao.role.IRoleDao;
import com.spzf.model.role.Role;

/**
 * 
 * @Title:
 * @Description:角色Dao实现类
 * @Author:
 * @Since:2014年3月31日
 * @Version:1.1.0
 * @Copyright:Copyright (c)  2014 ~ 2015 版权所有
 */
@Repository
public class RoleDaoImpl extends MybatisTemplate implements IRoleDao {

	@Override
	public List<Role> getRolesByUserId(String userId) throws Exception {
		return (List<Role>) this.selectList("RoleXML.getRolesByUserId", userId);
	}

	@Override
	public void insertRole(Role role) throws Exception {
		this.insert("RoleXML.insertRole", role);
	}

	@Override
	public void updateRole(Role role) throws Exception {
		this.update("RoleXML.updateRole", role);
	}

	@Override
	public void delRole(String id) throws Exception {
		this.delete("RoleXML.delRole", id);
	}

	@Override
	public Role getRoleById(String id) throws Exception {
		return (Role) this.selectOne("RoleXML.getRoleById", id);
	}

	@Override
	public PagerModel<Role> getPagerModel(Role role, Query query)
			throws Exception {
		return this.getPagerModelByQuery(role, query, "RoleXML.getPagerModel");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> getAll(Role role) throws Exception {
		return (List<Role>)this.selectList("RoleXML.getAll", role);
	}
}
