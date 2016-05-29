package com.spzf.service.loginlog;

import java.util.List;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.model.loginlog.LoginLog;
import com.spzf.vo.privilege.LoginLogVo;

/**
 * 
 * @Title:
 * @Description:日志service
 * @Author:
 * @Since:2014年4月8日
 * @Version:1.1.0
 * @Copyright:Copyright (c)  2014 ~ 2015 版权所有
 */
public interface ILoginLogService {
	/**
	 * 
	 * @param loginLog
	 * @throws Exception
	 * @Description:添加日志表
	 */
	public void insertLoginLog(LoginLog loginLog) throws Exception;

	/**
	 * 
	 * @param loginLog
	 * @throws Exception
	 * @Description:更新日志表
	 */
	public void updateLoginLog(LoginLog loginLog) throws Exception;

	/**
	 * 
	 * @param id
	 * @throws Exception
	 * @Description:删除日志表通过id
	 */
	public void delLoginLog(int id) throws Exception;

	/**
	 * 
	 * @param ids
	 * @throws Exception
	 * @Description:删除多条记录
	 */
	public void delLoginLogs(int[] ids) throws Exception;

	/**
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:通过id查询日志表
	 */
	public LoginLog getLoginLogById(int id) throws Exception;

	/**
	 * 
	 * @param loginLog
	 * @param query
	 * @return
	 * @throws Exception
	 * @Description:分页查询日志表列表
	 */
	public PagerModel<LoginLog> getPagerModel(LoginLogVo loginLogVo, Query query) throws Exception;

	/**
	 * 
	 * @param loginLog
	 * @return
	 * @throws Exception
	 * @Description:查询所有日志表
	 */
	public List<LoginLog> getAll(LoginLogVo loginLogVo) throws Exception;

}
