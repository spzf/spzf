package com.spzf.api.privilege.impl;

import java.lang.reflect.Type;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import com.google.gson.reflect.TypeToken;
import com.spzf.api.privilege.IPrivilegeApi;
import com.spzf.cache.CacheEntity;
import com.spzf.cache.CacheListHandler;
import com.spzf.common.PrivilegeException;
import com.spzf.common.SessionMap;
import com.spzf.constant.PrivilegeConstant;
import com.spzf.model.frame.ACL;
import com.spzf.model.role.Role;
import com.spzf.model.system.SystemConfig;
import com.spzf.model.user.User;
import com.spzf.service.dept.IDepartmentService;
import com.spzf.service.dictionary.IDictionaryService;
import com.spzf.service.frame.IAclService;
import com.spzf.service.system.ISystemConfigService;
import com.spzf.service.user.IUserRoleService;
import com.spzf.service.user.IUserService;
import com.spzf.utils.JsonUtils;
import com.spzf.vo.privilege.LoginVo;
import com.spzf.vo.privilege.UserAcls;

public class PrivilegeApiImpl implements IPrivilegeApi {

	@Resource
	private IAclService aclService;
	@Resource
	private IUserService userService;
	@Resource
	private IUserRoleService userRoleService;
	@Resource
	private IDepartmentService departmentService;
	@Resource
	private ISystemConfigService systemConfigService;
	@Resource
	private IDictionaryService dictionaryService;

	@Override
	public SystemConfig findSystemConfigByKey(String key)
			throws PrivilegeException {
		try {
			return systemConfigService.findSystemConfigByKey(key);
		} catch (Exception e) {
			e.printStackTrace();
			throw new PrivilegeException("得到数据出错", e);
		}

	}

	@Override
	public LoginVo login(String username, String password, String companyId,
			String ip, String systemSn) throws PrivilegeException {
		try {
			return userService.login(username, password, companyId, ip,
					systemSn);
		} catch (Exception e) {
			e.printStackTrace();
			throw new PrivilegeException("登录出错", e);
		}
	}

	@Override
	public List<Role> getRolesByUserId(String userId) throws PrivilegeException {
		try {
			return this.userRoleService.getRolesByUserId(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new PrivilegeException("通过用户id得到用户角色列表失败", e);
		}
	}

	@Override
	public boolean hasPermission(String sessionId, String systemSn,
			String moduleSn, Integer permission) {
		return aclService.hasPermission(sessionId, systemSn, moduleSn,
				permission);
	}

	@Override
	public UserAcls getUserAclsBySessionId(String sessionId) {
		CacheEntity ce = CacheListHandler.getCache(sessionId);
		if (ce == null)
			return null;
		SessionMap sessionMap = (SessionMap) ce.getCacheContext();
		UserAcls userAcls = new UserAcls();

		String creationTime = sessionMap.get("creationTime") == null ? null
				: (String) sessionMap.get("creationTime");
		String userJson = (String) sessionMap.get(PrivilegeConstant.LOGIN_USER);
		String aclJson = (String) sessionMap
				.get(PrivilegeConstant.LOGIN_USER_ACLS);
		Type type = new TypeToken<HashSet<ACL>>() {
		}.getType();
		Set<ACL> acls = JsonUtils.getGson().fromJson(aclJson, type);
		userAcls.setAcls(acls);
		userAcls.setCreationTime(creationTime);
		User user = (User) JsonUtils.jsonToObj(userJson, User.class);
		userAcls.setLoginUser(user);
		userAcls.setSessionId(sessionId);
		return userAcls;
	}


	@Override
	public List<User> getUserByRoleSns(String... roleSns)
			throws PrivilegeException {
		try {
			return userService.getUserByRoleSns(roleSns);
		} catch (Exception e) {
			e.printStackTrace();
			throw new PrivilegeException("通过角色标示得到用户列表失败", e);
		}
	}
}
