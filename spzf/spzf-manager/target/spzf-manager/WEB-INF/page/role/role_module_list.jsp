<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/page/share/taglib.jsp"%>
<title>授权</title>
</head>
<body>
	<div class="easyui-layout" style="height:100%;">
		<div data-options="region:'west'" style="width:180px;">
	    	<ul id="systemMenu"></ul>
	    </div>
	    <div data-options="region:'center'">
	    	<div id="selectAllBtn" class="tb_class">
				<input class="btn" type="button" value="全选" />&nbsp;&nbsp;
				<input class="btn" type="button" value="取消" />
			</div>
	    	<table id="rmtg"></table>
	    </div>
    </div>
</body>
</html>