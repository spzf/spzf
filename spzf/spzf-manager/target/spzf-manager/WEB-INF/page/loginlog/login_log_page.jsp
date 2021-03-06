<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<title>登录日志列表</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:83px;">
		<div id="toolbar" class="easyui-toolbar">
			<c:if test="${my:hasPermission(sessionId,'privilege','loginlog', 0)}">
				<a href="javascript:;" iconCls="icon-info" plain="true" onclick="LoginLogList.edit()">查看</a><a>-</a>
			</c:if>
			<c:if test="${my:hasPermission(sessionId,'privilege','loginlog', 3)}">
				<a href="javascript:;" iconCls="icon-del" plain="true" onclick="LoginLogList.del()">删除</a>
			</c:if>
		</div>
		<!--搜索start-->
		<div class="search-div">
			<form name="searchForm" id="searchForm" method="post">
            	<table class="search-tb">
            		<col width="80"/><col/>
                	<tbody>
                    	<tr>
                    		<th>用户名：</th>
	                       	<td><input class="easyui-textbox" name="operationUsername"/></td>
	                        <td>
								<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search"  onclick="LoginLogList.doSearch();">查询</a>
	                        </td>
	                        <td>
								<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="LoginLogList.doReset();">重置</a>
	                        </td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div data-options="region:'center',border:false"><table id="tbList"></table></div>
</body>
<script type="text/javascript"  src="${basePath}js/loginlog/login_log_list.js"></script>
</html>