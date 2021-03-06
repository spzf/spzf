package com.spzf.dao.dictionary.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spzf.common.PagerModel;
import com.spzf.common.Query;
import com.spzf.dao.MybatisTemplate;
import com.spzf.dao.dictionary.IDictionaryDao;
import com.spzf.model.dictionary.Dictionary;

/**
 * 
 * @Description:数据字典dao
 * @Author:
 * @Since:2014-4-8
 * @Version:1.1.0
 * @Copyright:Copyright (c)  2014 ~ 2015 版权所有
 */
@Repository
public class DictionaryDaoImpl extends MybatisTemplate implements
		IDictionaryDao {

	@Override
	public void insertDictionary(Dictionary dictionary) throws Exception {
		this.insert("DictionaryXML.insertDictionary", dictionary);
	}

	@Override
	public void updateDictionary(Dictionary dictionary) throws Exception {
		this.update("DictionaryXML.updateDictionary", dictionary);
	}

	@Override
	public void delDictionary(String id) throws Exception {
		this.delete("DictionaryXML.delDictionary", id);
	}

	@Override
	public Dictionary getDictionaryById(String id) throws Exception {
		return (Dictionary) this.selectOne("DictionaryXML.getDictionaryById",
				id);
	}

	@Override
	public PagerModel<Dictionary> getPagerModel(Dictionary dictionary,
			Query query) throws Exception {
		return this.getPagerModelByQuery(dictionary, query,
				"DictionaryXML.PagerModel");
	}

	@Override
	public List<Dictionary> getAll(Dictionary dictionary) throws Exception {
		return (List<Dictionary>) this.selectList("DictionaryXML.getAll",dictionary);
	}
}
