package com.spzf.service.user;

import java.util.List;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.model.user.UserSystem;

/**
 * 
 * @Title:
 * @Description:用户系统中间表
 * @Author:
 * @Since:2014-4-2
 * @Version:1.1.0
 * @Copyright:Copyright (c)  2014 ~ 2015 版权所有
 */
public interface IUserSystemService {
	/**
	 * @param UserSystem
	 * @throws Exception
	 * @Description:添加用户系统中间表
	 */
	public void insertUserSystem(UserSystem userSystem) throws Exception;

	/**
	 * @param UserSystem
	 * @throws Exception
	 * @Description:更新用户系统中间表
	 */
	public void updateUserSystem(UserSystem userSystem) throws Exception;

	/**
	 * @param id
	 * @throws Exception
	 * @Description:删除用户系统中间表
	 */
	public void delUserSystem(String id) throws Exception;

	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:根据id查询用户系统中间表对象
	 */
	public UserSystem getUserSystemById(String id) throws Exception;

	/**
	 * @param UserSystem
	 * @param query
	 * @return
	 * @throws Exception
	 * @Description: 分页查询用户系统中间表列表
	 */
	public PagerModel<UserSystem> getPagerModel(UserSystem userSystem,
			Query query) throws Exception;

	/**
	 * 
	 * @param UserSystem
	 * @return
	 * @throws Exception
	 * @Description:获取所有用户系统中间表列表
	 */
	public List<UserSystem> getAll(UserSystem userSystem) throws Exception;
}
