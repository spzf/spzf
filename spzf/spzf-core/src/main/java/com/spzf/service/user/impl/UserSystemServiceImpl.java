package com.spzf.service.user.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.dao.user.IUserSystemDao;
import com.spzf.model.user.UserSystem;
import com.spzf.service.user.IUserSystemService;

/**
 * 
 * @Title:
 * @Description:用户系统中间表
 * @Author:
 * @Since:2014-4-2
 * @Version:1.1.0
 * @Copyright:Copyright (c)  2014 ~ 2015 版权所有
 */
@Service
public class UserSystemServiceImpl implements IUserSystemService {
	@Resource
	private IUserSystemDao userSystemDao;

	@Override
	public void insertUserSystem(UserSystem userSystem) throws Exception {
		this.userSystemDao.insertUserSystem(userSystem);
	}

	@Override
	public void updateUserSystem(UserSystem userSystem) throws Exception {
		this.userSystemDao.updateUserSystem(userSystem);
	}

	@Override
	public void delUserSystem(String id) throws Exception {
		this.userSystemDao.delUserSystem(id);
	}

	@Override
	public UserSystem getUserSystemById(String id) throws Exception {
		return this.userSystemDao.getUserSystemById(id);

	}

	@Override
	public PagerModel<UserSystem> getPagerModel(UserSystem userSystem,
			Query query) throws Exception {
		return this.userSystemDao.getPagerModel(userSystem, query);

	}

	@Override
	public List<UserSystem> getAll(UserSystem userSystem) throws Exception {
		return this.userSystemDao.getAll(userSystem);

	}

}
