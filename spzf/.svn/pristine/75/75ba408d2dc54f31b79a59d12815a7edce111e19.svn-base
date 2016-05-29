package com.spzf.web.controller.system;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spzf.common.PagerModel;
import com.spzf.common.Permission;
import com.spzf.common.Query;
import com.spzf.constant.PermissionConatant;
import com.spzf.model.system.SystemConfig;
import com.spzf.service.system.ISystemConfigService;
import com.spzf.utils.JsonUtils;
import com.spzf.vo.SimpleReturnVo;
import com.spzf.web.controller.BaseController;

/**
 * @Title:
 * @Description:系统配置控制中心
 * @Author:
 * @Since:2014年4月1日
 * @Version:1.1.0
 * @Copyright:Copyright (c)  2014 ~ 2015 版权所有
 */
@Controller
@RequestMapping("/managment/systemConfig")
public class SystemConfigController extends BaseController {
	private static Logger logger = Logger
			.getLogger(SystemConfigController.class);
	@Resource
	private ISystemConfigService systemConfigService;

	@RequestMapping("/list")
	@Permission(systemSn="privilege",moduleSn="config",value=PermissionConatant.R)
	public String list(String sessionId,ModelMap model) {
		model.addAttribute("sessionId", sessionId);
		return "/system/system_config_page";
	}
	@ResponseBody
	@RequestMapping("/init")
	@Permission(systemSn="privilege",moduleSn="config",value=PermissionConatant.C)
	public String init(HttpServletRequest request) throws Exception {
		List<SystemConfig> systemConfigs = systemConfigService.getSystemConfigs();
		request.getSession().getServletContext().setAttribute("systemConfigs", systemConfigs);
		SimpleReturnVo vo = new SimpleReturnVo(SUCCESS, "成功");
		return JsonUtils.toJson(vo);
	}

	@ResponseBody
	@RequestMapping("/ajaxList")
	@Permission(systemSn="privilege",moduleSn="config",value=PermissionConatant.R)
	public String ajaxList(SystemConfig config, Query query) {
		PagerModel<SystemConfig> pm = null;
		try {
			pm = systemConfigService.getPagerModel(config, query);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("SystemConfigController-ajaxList:" + e.getMessage());
		}
		return JsonUtils.getPmJson(pm);
	}

	@RequestMapping("/addUI")
	@Permission(systemSn="privilege",moduleSn="config",value=PermissionConatant.C)
	public String addUI(String sessionId,ModelMap model) {
		model.addAttribute("sessionId", sessionId);
		return "/system/system_config_insert";
	}

	@ResponseBody
	@RequestMapping("/add")
	@Permission(systemSn="privilege",moduleSn="config",value=PermissionConatant.C)
	public String add(SystemConfig systemConfig) {
		SimpleReturnVo vo = null;
		try {
			systemConfigService.insertSystemConfig(systemConfig);
			vo = new SimpleReturnVo(SUCCESS, "成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("SystemConfigController-add:" + e.getMessage());
			vo = new SimpleReturnVo(FAIL, "异常");
		}
		return JsonUtils.toJson(vo);
	}

	@RequestMapping("/updateUI")
	@Permission(systemSn="privilege",moduleSn="config",value=PermissionConatant.U)
	public String updateUI(String sessionId,ModelMap model) {
		model.addAttribute("sessionId", sessionId);
		return "/system/system_config_update";
	}

	@ResponseBody
	@RequestMapping("/ajaxUpdate")
	@Permission(systemSn="privilege",moduleSn="config",value=PermissionConatant.U)
	public String ajaxUpdate(String id) {
		SystemConfig config = null;
		try {
			config = systemConfigService.getSystemConfigById(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("SystemConfigController-ajaxUpdate:" + e.getMessage());
		}
		return JsonUtils.toJson(config);
	}

	@ResponseBody
	@RequestMapping("/update")
	@Permission(systemSn="privilege",moduleSn="config",value=PermissionConatant.U)
	public String update(SystemConfig systemConfig) {
		SimpleReturnVo vo = null;
		try {
			systemConfigService.updateSystemConfig(systemConfig);
			vo = new SimpleReturnVo(SUCCESS, "成功");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("SystemConfigController-update:" + e.getMessage());
			vo = new SimpleReturnVo(FAIL, "异常");
		}
		return JsonUtils.toJson(vo);
	}

	@ResponseBody
	@RequestMapping("/delete")
	@Permission(systemSn="privilege",moduleSn="config",value=PermissionConatant.D)
	public String delete(String idStrs) {
		SimpleReturnVo vo = null;
		if (idStrs != null && idStrs.length() > 0) {
			String[] ids = idStrs.split(",");
			try {
				systemConfigService.delSystemConfigs(ids);
				vo = new SimpleReturnVo(SUCCESS, "成功");
			} catch (Exception e) {
				e.printStackTrace();
				logger.debug("SystemConfigController-delete:" + e.getMessage());
				vo = new SimpleReturnVo(FAIL, "异常");
			}
		}
		return JsonUtils.toJson(vo);
	}
	
	
	@ResponseBody
	@RequestMapping("/checkSnExsits")
	public String checkSnExsits(SystemConfig systemConfig){
		try{
			List<SystemConfig> list=this.systemConfigService.getSystemConfigsBySn(systemConfig.getConfigSn());
			if(StringUtils.isNotBlank(systemConfig.getId())){
				SystemConfig scf=this.systemConfigService.getSystemConfigById(systemConfig.getId());
				if(scf!=null && scf.getConfigSn().equals(systemConfig.getConfigSn())){
					return "0";
				}else{
					if(list!=null && list.size()>0){
						return "1";
					}
				}
			}else{
				if(list!=null && list.size()>0){
					return "1";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("RoleController-checkSnExsits:"+e.getMessage());
		}
		return "0";
	}
	
	@ResponseBody
	@RequestMapping("/checkKeyExsits")
	public String checkKeyExsits(SystemConfig systemConfig){
		try{
			List<SystemConfig> list=this.systemConfigService.getSystemConfigsBySn(systemConfig.getConfigKey());
			if(StringUtils.isNotBlank(systemConfig.getId())){
				SystemConfig scf=this.systemConfigService.getSystemConfigById(systemConfig.getId());
				if(scf!=null && scf.getConfigKey().equals(systemConfig.getConfigKey())){
					return "0";
				}else{
					if(list!=null && list.size()>0){
						return "1";
					}
				}
			}else{
				if(list!=null && list.size()>0){
					return "1";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.debug("RoleController-checkKeyExsits:"+e.getMessage());
		}
		return "0";
	}
}
