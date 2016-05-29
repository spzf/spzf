<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<title>权限值</title>
</head>
<body class="easyui-layout">   
    <div data-options="region:'west',title:'系统列表',split:true" style="width:200px;">
    	<ul id="systemMenu"></ul>
    </div>   
    <div data-options="region:'center'">
    	<div class="easyui-layout" data-options="fit:true">   
            <div data-options="region:'north'">
            	<div id="toolbar" class="easyui-toolbar">
					<c:if test="${my:hasPermission(sessionId,'privilege','pval', 0)}">
						<a href="javascript:;" iconCls="icon-add" plain="true" onclick="PrivilegeList.add()">添加</a><a>-</a>
					</c:if>
					<c:if test="${my:hasPermission(sessionId,'privilege','pval', 2)}">
						<a href="javascript:;" iconCls="icon-edit" plain="true" onclick="PrivilegeList.edit()">修改</a><a>-</a>
					</c:if>
					<c:if test="${my:hasPermission(sessionId,'privilege','pval', 3)}">
						<a href="javascript:;" iconCls="icon-del" plain="true" onclick="PrivilegeList.del()">删除</a>
					</c:if>
				</div>
            </div>   
            <div data-options="region:'center'">
    			<table id="tbList"></table>
            </div>   
        </div>
    </div>   
</body> 
<script type="text/javascript"  src="${basePath}js/privilege/privilege_list.js"></script>
</html>