package com.spzf.dao.dept.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.dao.MybatisTemplate;
import com.spzf.dao.dept.IDepartmentDao;
import com.spzf.model.dept.Department;

@Repository
public class DepartmentDaoImpl extends MybatisTemplate implements IDepartmentDao {

	@Override
	public List<String> getChildrenIdsByPid(String id) throws Exception {
		return (List<String>) this.selectList("DepartmentXML.getChildrenIdsByPid", id);
	}

	@Override
	public void insertDepartment(Department department) throws Exception {
		this.insert("DepartmentXML.insertDepartment", department);
	}

	@Override
	public void updateDepartment(Department department) throws Exception {
		this.update("DepartmentXML.updateDepartment", department);
	}

	@Override
	public void delDepatment(String id) throws Exception {
		this.delete("DepartmentXML.delDepatment", id);
	}

	@Override
	public Department getDepartmentById(String id) throws Exception {
		return (Department) this.selectOne("DepartmentXML.getDepartmentById", id);
	}

	@Override
	public PagerModel<Department> getPagerModel(Department department,
			Query query) throws Exception {
		return this.getPagerModelByQuery(department, query, "DepartmentXML.getPagerModel");
	}
	
	@Override
	public List<Department> getAll(Department department) throws Exception {
		return (List<Department>)this.selectList("DepartmentXML.getAll",department);
	}
}
