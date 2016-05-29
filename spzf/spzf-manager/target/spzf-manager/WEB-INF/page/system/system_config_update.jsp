<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>修改系统配置</title>
</head>
<body>
	<center>
	<form id="formU">
		<script type="text/javascript"  src="${basePath}js/system/system_config.js"></script>
		<input name="id" type="hidden" />
        <div style="margin:20px auto;">
            <table class="form-tb">
           		<tr>
                    <th>配置名称<em class="cred">*</em>：</th>
                    <td>    
                        <input name="configName" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入配置名称'" />
                    </td>
                </tr>
           		<tr>
                    <th>配置标识<em class="cred">*</em>：</th>
                    <td>    
                        <input name="configSn" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入配置标识',validType:'unique'" />
                    </td>
                </tr>
                <tr>
                    <th>配置key<em class="cred">*</em>：</th>
                    <td>    
                        <input name="configKey" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入配置key',validType:'uniquekey'" />
                    </td>
                </tr>
                <tr>
                    <th>配置key的value值<em class="cred">*</em>：</th>
                    <td>    
                        <input name="configValue" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入配置key的value值'" />
                    </td>
                </tr>
                <tr>
                    <th>排序号：</th>
                    <td>    
                    	<input name="configOrder" type="text" class="easyui-numberbox" data-options="min:0"></input>
                    </td>
                </tr>
                <tr>
                    <th>描述：</th>
                    <td>  
                    	<textarea name="remark" rows="2" cols="30"></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </center>
</body>
</html>