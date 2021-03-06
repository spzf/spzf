package com.spzf.dao.dept;

import java.util.List;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.model.dept.Department;

/**
 * @Description:部门Dao
 * @Author:
 * @Since:2014年3月31日
 * @Version:1.1.0
 * @Copyright:Copyright (c)2014 ~ 2015 版权所有
 */
public interface IDepartmentDao {
	
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:通过部门得到部门下面子部门的所有id，
	 */
	public List<String> getChildrenIdsByPid(String id) throws Exception;

	/**
	 * @param department
	 * @throws Exception
	 * @Description:添加部门
	 */
	public void insertDepartment(Department department) throws Exception;

	/**
	 * @param department
	 * @throws Exception
	 * @Description:更新部门
	 */
	public void updateDepartment(Department department) throws Exception;

	/**
	 * @param id
	 * @throws Exception
	 * @Description:删除部门
	 */
	public void delDepatment(String id) throws Exception;

	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:根据id查询部门对象
	 */
	public Department getDepartmentById(String id) throws Exception;

	/**
	 * @param department
	 * @param query
	 * @return
	 * @throws Exception
	 * @Description: 分页查询部门列表
	 */
	public PagerModel<Department> getPagerModel(Department department,
			Query query) throws Exception;

	/**
	 * 
	 * @return
	 * @throws Exception
	 * @Description:获取所有部门
	 */
	public List<Department> getAll(Department department) throws Exception;
}
