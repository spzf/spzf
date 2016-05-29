<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<title>角色列表</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:83px;">
		<div id="toolbar" class="easyui-toolbar">
			<c:if test="${my:hasPermission(sessionId,'privilege','role', 0)}">
				<a href="javascript:;" iconCls="icon-add" plain="true" onclick="RoleList.add()">添加</a><a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,'privilege','role', 2)}">
				<a href="javascript:;" iconCls="icon-edit" plain="true" onclick="RoleList.edit()">修改</a><a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,'privilege','role', 3)}">
				<a href="javascript:;" iconCls="icon-del" plain="true" onclick="RoleList.del()">删除</a><a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,'privilege','role', 6)}">
				<a href="javascript:;" iconCls="icon-aduit" plain="true" onclick="RoleList.roleModuleUI()">操作授权</a>
			</c:if>
		</div>
		<div class="search-div">
		<form name="searchForm" id="searchForm" method="post">
                  <table class="search-tb">
                  	<col width="80"/><col/>
             		<col width="80"/><col/>
                     <tbody>
                     	<tr>
                    		<th>角色名称：</th>
	                       	<td><input class="easyui-textbox" name="name"/></td>
	                       	<th>角色标识：</th>
	                        <td><input class="easyui-textbox" name="sn"/></td>
	                        <td>
								<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search"  onclick="RoleList.doSearch();">查询</a>
	                        </td>
	                        <td>
								<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="RoleList.doReset();">重置</a>
	                        </td>
						</tr>
					</tbody>
				</table>
		</form>
		</div>
	</div>
	<div data-options="region:'center',border:false"><table id="tbList"></table></div>
</body>
<script type="text/javascript"  src="${basePath}js/role/role_list.js"></script>
</html>