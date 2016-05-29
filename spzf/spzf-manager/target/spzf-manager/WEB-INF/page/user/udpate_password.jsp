<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>修改密码</title>
</head>
	<body>
	<center>
	<form id="formP">
        <div style="margin:20px auto;">
        	<input name="id" type="hidden" />
            <table class="form-tb">
            	<tr>
             		<th>用户名：</th>
                    <td>    
                        <input name="username" type="text" class="easyui-validatebox" data-options="required:true" readonly />
                    </td>
                </tr>
             	<tr>
                    <th>密码：</th>
                    <td>    
                    	<input name="password" type="text" class="easyui-validatebox" data-options="required:true" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </center>
</body>
</html>