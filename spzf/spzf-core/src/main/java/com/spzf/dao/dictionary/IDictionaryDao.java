package com.spzf.dao.dictionary;

import java.util.List;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.model.dictionary.Dictionary;

/**
 * @Title:
 * @Description:数据字典Dao
 * @Author:
 * @Since:2014年3月31日
 * @Version:1.1.0
 * @Copyright:Copyright (c)  2014 ~ 2015 版权所有
 */
public interface IDictionaryDao {

	/**
	 * @param Dictionary
	 * @throws Exception
	 * @Description:添加数据字典
	 */
	public void insertDictionary(Dictionary dictionary) throws Exception;

	/**
	 * @param Dictionary
	 * @throws Exception
	 * @Description:更新数据字典
	 */
	public void updateDictionary(Dictionary dictionary) throws Exception;

	/**
	 * @param id
	 * @throws Exception
	 * @Description:删除数据字典
	 */
	public void delDictionary(String id) throws Exception;

	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @Description:根据id查询数据字典对象
	 */
	public Dictionary getDictionaryById(String id) throws Exception;

	/**
	 * @param Dictionary
	 * @param query
	 * @return
	 * @throws Exception
	 * @Description: 分页查询数据字典列表
	 */
	public PagerModel<Dictionary> getPagerModel(Dictionary dictionary, Query query)
			throws Exception;

	/**
	 * 
	 * @param Dictionary
	 * @return
	 * @throws Exception
	 * @Description:获取所有数据字典列表
	 */
	public List<Dictionary> getAll(Dictionary dictionary) throws Exception;

}
