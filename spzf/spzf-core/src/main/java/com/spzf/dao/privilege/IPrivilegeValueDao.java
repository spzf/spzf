package com.spzf.dao.privilege;

import java.util.List;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.model.privilege.PrivilegeValue;

/**
 * @Title:
 * @Description:权限值Dao
 * @author 
 * @Since:
 * @Version:1.1.0
 * @Copyright:
 */
public interface IPrivilegeValueDao {

	/**
	 * @param PrivilegeValue
	 * @throws Exception
	 * @Description:添加权限值
	 */
	public void insertPrivilegeValue(PrivilegeValue privilegeValue)
			throws Exception;

	/**
	 * @param PrivilegeValue
	 * @throws Exception
	 * @Description:更新权限值
	 */
	public void updatePrivilegeValue(PrivilegeValue privilegeValue)
			throws Exception;

	/**
	 * @param id
	 * @throws Exception
	 * @Description:删除权限值
	 */
	public void delPrivilegeValue(String id) throws Exception;

	/**
	 * 
	 * @param moduleId
	 * @throws Exception
	 * @Description:根据模块id删除权限值
	 */
	public void delPriValByModuleId(String moduleId) throws Exception;

	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:根据id查询权限值对象
	 */
	public PrivilegeValue getPrivilegeValueById(String id) throws Exception;

	/**
	 * @param PrivilegeValue
	 * @param query
	 * @return
	 * @throws Exception
	 * @Description: 分页查询权限值列表
	 */
	public PagerModel<PrivilegeValue> getPagerModel(
			PrivilegeValue privilegeValue, Query query) throws Exception;

	/**
	 * 
	 * @param privilegeValue
	 * @return
	 * @throws Exception
	 * @Description:
	 */
	public List<PrivilegeValue> getAll(PrivilegeValue privilegeValue)
			throws Exception;

	/**
	 * 根据模块id修改模块标识
	 * @param moduleSn
	 * @param moduleId
	 * @throws Exception
	 */
	public void updateModuleSnByModuleId(String moduleSn,String moduleId)throws Exception;
}
