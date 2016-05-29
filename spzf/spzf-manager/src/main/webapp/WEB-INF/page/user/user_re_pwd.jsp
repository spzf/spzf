<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>重置密码</title>
</head>
	<body>
	<center>
	<form id="formA">
        <div style="margin:20px auto;">
            <table class="form-tb">
            	<tr>
                    <th>原密码：</th>
                    <td>    
                        <input name="oldpwd" type="password" class="easyui-validatebox" data-options="required:true" />
                    </td>
                </tr>
            	<tr>
                    <th>新密码：</th>
                    <td>    
                        <input id="newpwd" name="newpwd" type="password" class="easyui-validatebox" data-options="required:true" />
                    </td>
                </tr>
            	<tr>
                    <th>重复新密码：</th>
                    <td>    
                        <input name="renewpwd" type="password" class="easyui-validatebox" data-options="required:true,validType:'checkpwd'" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </center>
	<script type="text/javascript">
	//验证标识的唯一性
	$.extend($.fn.validatebox.defaults.rules, {
		checkpwd: {
	    validator: function(value, param){
	    	var valid=true;
	    	var newpwd=$("#newpwd").val();
	    	if(newpwd!=value){
	    		valid=false;
	    	}
	    	return valid;
	    },
	    message: '两次输入密码不一致!'
	    }
	});
	</script>
</body>
</html>