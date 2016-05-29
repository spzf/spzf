<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<title>用户列表</title>
</head>
<body class="easyui-layout">   
    <div data-options="region:'west',title:'部门列表',split:true" style="width:200px;">
    	<ul id="dept"></ul>
    </div>   
    <div data-options="region:'center'">
    	<div class="easyui-layout" data-options="fit:true">   
            <div data-options="region:'north'" style="height:95px;">
            	<div id="toolbar" class="easyui-toolbar">
					<c:if test="${my:hasPermission(sessionId,'privilege','user', 0)}">
						<a href="javascript:;" iconCls="icon-add" plain="true" onclick="UserList.add()">添加</a>
					</c:if>
					<c:if test="${my:hasPermission(sessionId,'privilege','user', 2)}">
						<a>-</a><a href="javascript:;" iconCls="icon-edit" plain="true" onclick="UserList.edit()">修改</a>
					</c:if>
					<c:if test="${my:hasPermission(sessionId,'privilege','user', 3)}">
						<a>-</a><a href="javascript:;" iconCls="icon-del" plain="true" onclick="UserList.del()">删除</a>
					</c:if>
					<!--  
					<c:if test="${my:hasPermission(sessionId,'privilege','user', 1)}">
						<a>-</a><a href="javascript:;" iconCls="icon-search" plain="true" onclick="UserList.detail()">查看详情</a>
					</c:if>
					-->
					<c:if test="${my:hasPermission(sessionId,'privilege','user', 2)}">
						<a>-</a><a href="javascript:;" iconCls="icon-aduit" plain="true" onclick="UserList.addrole()">分配角色</a>
					</c:if>
					<c:if test="${my:hasPermission(sessionId,'privilege','user', 6)}">
						<a>-</a><a href="javascript:;" iconCls="icon-aduit" plain="true" onclick="UserList.adduseracl()">操作授权</a>
					</c:if>
					<c:if test="${my:hasPermission(sessionId,'privilege','user', 2)}">
						<a>-</a><a href="javascript:;" iconCls="icon-edit" plain="true" onclick="UserList.updatePassword()">修改密码</a>
					</c:if>
				</div>
				<div class="search-div">
					<form name="searchForm" id="searchForm" method="post">
			                  <table class="search-tb">
			                  	<col width="80"/><col/>
             					<col width="80"/><col/>
             					<col width="80"/><col/>
             					<col width="80"/><col/>
			                     <tbody>
			                        <tr>
			                        	<th>用户名：</th>
	                       				<td><input class="easyui-textbox" name="username"/></td>
			                        	<th>姓名：</th>
	                       				<td><input class="easyui-textbox" name="realName"/></td>
			                            <th>手机：</th>
	                       				<td><input class="easyui-textbox" name="mobile"/></td>
			                        	<th>邮箱：</th>
	                       				<td><input class="easyui-textbox" name="email"/></td>
	                       				<td>
											<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search"  onclick="UserList.doSearch();">查询</a>
				                        </td>
				                        <td>
											<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="UserList.doReset();">重置</a>
				                        </td>
									</tr>
								</tbody>
							</table>
					</form>
				</div>
            </div>   
            <div data-options="region:'center'"><table id="tbList"></table></div>   
        </div>
    </div>   
</body>
<script type="text/javascript"  src="${basePath}js/user/user_list.js"></script>
</html>