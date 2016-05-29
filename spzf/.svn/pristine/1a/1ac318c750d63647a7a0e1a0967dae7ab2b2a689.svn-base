package com.spzf.web.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.spzf.model.system.SystemConfig;
import com.spzf.service.system.ISystemConfigService;
import com.spzf.tools.common.SpringContextHolder;

/**
 * @Title:
 * @Description:系统初始化监听器
 * @Author:
 * @Since:2014年4月18日
 * @Version:1.1.0
 * @Copyright:Copyright (c)  2014 ~ 2015 版权所有
 */
public class SystemInitListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext servletContext = sce.getServletContext();
		ISystemConfigService systemConfigService = SpringContextHolder.getBean("systemConfigServiceImpl");
		try {
			List<SystemConfig> systemConfigs = systemConfigService.getSystemConfigs();
			servletContext.setAttribute("systemConfigs", systemConfigs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
