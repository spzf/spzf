<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<title>系统配置列表</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:83px;">
		<div id="toolbar" class="easyui-toolbar">
			<c:if test="${my:hasPermission(sessionId,'privilege','config', 0)}">
				<a href="javascript:;" iconCls="icon-reload" plain="true" onclick="SystemConfigList.initData()">同步</a><a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,'privilege','config', 0)}">
				<a href="javascript:;" iconCls="icon-add" plain="true" onclick="SystemConfigList.add()">添加</a><a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,'privilege','config', 2)}">
				<a href="javascript:;" iconCls="icon-edit" plain="true" onclick="SystemConfigList.edit()">修改</a><a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,'privilege','config', 3)}">
				<a href="javascript:;" iconCls="icon-del" plain="true" onclick="SystemConfigList.del()">删除</a>
			</c:if>
		</div>
		<div class="search-div">
			<form name="searchForm" id="searchForm" method="post">
	        	<table class="search-tb">
	            	<col width="80"/><col/>
             		<col width="80"/><col/>
                    <tbody>
                     	<tr>
                     		<th>配置名称：</th>
                        	<td><input class="easyui-textbox" name="configName"/></td>
                        	<th>配置标识：</th>
                            <td><input class="easyui-textbox" name="configSn"/></td>
                            <td>
								<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search"  onclick="SystemConfigList.doSearch();">查询</a>
	                        </td>
	                        <td>
								<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="SystemConfigList.doReset();">重置</a>
	                        </td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div data-options="region:'center',border:false"><table id="tbList"></table></div>
</body>
<script type="text/javascript"  src="${basePath}js/system/system_config_list.js"></script>
</html>