package com.spzf.dao.privilege.impl;

import org.springframework.stereotype.Repository;

import com.spzf.dao.MybatisTemplate;
import com.spzf.dao.privilege.ISessionDataDao;
import com.spzf.model.privilege.SessionData;

/**
 * @Title:
 * @Description:session数据实现类
 * @Author:
 * @Since:2014年4月10日
 * @Version:1.1.0
 * @Copyright:Copyright (c)  2014 ~ 2015 版权所有
 */
@Repository
public class SessionDataDaoImpl extends MybatisTemplate implements
		ISessionDataDao {

	@Override
	public void insertSessionData(SessionData sessionData) throws Exception {
		this.insert("SessionDataXML.insertSessionData", sessionData);
	}

	@Override
	public void updateSessionData(SessionData sessionData) throws Exception {
		this.update("SessionDataXML.updateSessionData", sessionData);
	}

	@Override
	public SessionData getSessionDataBySessionId(String sessionId)
			throws Exception {
		return (SessionData) this.selectOne("SessionDataXML.getSessionDataBySessionId", sessionId);
	}

	@Override
	public void deleteSessionDataBySessionId(String sessionId) throws Exception {
		this.delete("SessionDataXML.deleteSessionDataBySessionId", sessionId);
	}

	@Override
	public void deleteSessionDataByCreationTime(long creationTime)
			throws Exception {
		this.delete("SessionDataXML.deleteSessionDataByCreationTime", creationTime);
	}

}
