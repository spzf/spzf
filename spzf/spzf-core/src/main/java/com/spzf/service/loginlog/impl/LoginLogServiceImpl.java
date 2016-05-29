package com.spzf.service.loginlog.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.dao.loginlog.ILoginLogDao;
import com.spzf.model.loginlog.LoginLog;
import com.spzf.service.loginlog.ILoginLogService;
import com.spzf.vo.privilege.LoginLogVo;

/**
 * 
 * @Title:
 * @Description:日志service实现类
 * @Author:
 * @Since:2014年4月8日
 * @Version:1.1.0
 * @Copyright:Copyright (c)2014 ~ 2015 版权所有
 */
@Service
public class LoginLogServiceImpl implements ILoginLogService {

	@Resource
	private ILoginLogDao loginLogDao;

	@Override
	public void insertLoginLog(LoginLog loginLog) throws Exception {
		this.loginLogDao.insertLoginLog(loginLog);
	}

	@Override
	public void updateLoginLog(LoginLog loginLog) throws Exception {
		this.loginLogDao.updateLoginLog(loginLog);
	}

	@Override
	public void delLoginLog(int id) throws Exception {
		this.loginLogDao.delLoginLog(id);
	}

	@Override
	public void delLoginLogs(int[] ids) throws Exception {
		for (int id : ids) {
			this.loginLogDao.delLoginLog(id);
		}
	}

	@Override
	public LoginLog getLoginLogById(int id) throws Exception {
		return this.loginLogDao.getLoginLogById(id);
	}

	@Override
	public PagerModel<LoginLog> getPagerModel(LoginLogVo loginLogVo, Query query) throws Exception {
		return this.loginLogDao.getPagerModel(loginLogVo, query);
	}

	@Override
	public List<LoginLog> getAll(LoginLogVo loginLogVo) throws Exception {
		return this.loginLogDao.getAll(loginLogVo);
	}
}
