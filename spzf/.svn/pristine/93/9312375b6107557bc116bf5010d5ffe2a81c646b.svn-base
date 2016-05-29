package com.spzf.dao.user.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spzf.dao.MybatisTemplate;
import com.spzf.dao.user.IUserRoleDao;
import com.spzf.model.role.Role;
import com.spzf.model.user.UserRole;

/**
 * @Title:
 * @Description:用户角色dao实现类
 * @Author:
 * @Since:2014年4月1日
 * @Version:1.1.0
 * @Copyright:Copyright (c)  2014 ~ 2015 版权所有
 */
@Repository
public class UserRoleDaoImpl extends MybatisTemplate implements IUserRoleDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> getRolesByUserId(String userId) throws Exception {
		return (List<Role>) this.selectList("UserRoleXML.getRolesByUserId", userId);
	}

	@Override
	public void insertUserRole(UserRole ur) throws Exception {
		this.insert("UserRoleXML.insertUserRole", ur);
	}

	@Override
	public void delUserRole(String id) throws Exception {
		this.delete("UserRoleXML.delUserRole", id);
	}

	@Override
	public void delUserRoleByUserId(String userId) throws Exception {
		this.delete("UserRoleXML.delUserRoleByUserId", userId);
	}

	@Override
	public void delUserRoleByRoleId(String roleId) throws Exception {
		this.delete("UserRoleXML.delUserRoleByRoleId", roleId);
	}

}
