<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>添加角色</title>
</head>
<body>
	<center>
	<form id="formA">
		<script type="text/javascript"  src="${basePath}js/role/role.js"></script>
        <div style="margin:20px auto;">
            <table class="form-tb">
               	<tr>
                    <th>角色名称：</th>
                    <td>    
                        <input name="name" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入角色名称'" />
                    </td>
                </tr>
             	<tr>
                    <th>角色标识：</th>
                    <td>    
                        <input name="sn" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入角色标识',validType:'unique'" />
                    </td>
                </tr>
                <tr>
                    <th>备注：</th>
                    <td>  
                    	<textarea name="note" rows="2" cols="30"></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </center>
</body>
</html>