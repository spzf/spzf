package com.spzf.dao.loginlog.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.dao.MybatisTemplate;
import com.spzf.dao.loginlog.ILoginLogDao;
import com.spzf.model.loginlog.LoginLog;
import com.spzf.vo.privilege.LoginLogVo;
/**
 * 
 *@Title:
 *@Description:日志dao实现类
 *@Author:TaoXiang.Wen
 *@Since:2014年4月8日
 *@Version:1.1.0
 *@Copyright:Copyright (c) 中国电子器材深圳有限公司 2014 ~ 2015 版权所有
 */
@Repository
public class LoginLogDaoImpl extends MybatisTemplate implements ILoginLogDao {

	@Override
	public void insertLoginLog(LoginLog loginLog) throws Exception {
		this.insert("LoginLogXML.insertLoginLog", loginLog);
	}

	@Override
	public void updateLoginLog(LoginLog loginLog) throws Exception {
		this.update("LoginLogXML.updateLoginLog", loginLog);
	}

	@Override
	public void delLoginLog(int id) throws Exception {
		this.delete("LoginLogXML.delLoginLog", id);
	}

	@Override
	public LoginLog getLoginLogById(int id) throws Exception {
		return (LoginLog) this.selectOne("LoginLogXML.getLoginLogById", id);
	}

	@Override
	public PagerModel<LoginLog> getPagerModel(LoginLogVo loginLogVo, Query query) throws Exception {
		return this.getPagerModelByQuery(loginLogVo, query, "LoginLogXML.getPagerModel");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LoginLog> getAll(LoginLogVo loginLogVo) throws Exception {
		return (List<LoginLog>) this.selectList("LoginLogXML.getAll", loginLogVo);
	}
}
