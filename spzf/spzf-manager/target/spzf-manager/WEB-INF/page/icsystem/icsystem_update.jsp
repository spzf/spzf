<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>修改系统</title>
</head>
<body>
	<center>
	<form id="formU">
		<script type="text/javascript"  src="${basePath}js/icsystem/icsystem.js"></script>
		<input name="id" type="hidden" />
        <div style="margin:20px auto;">
            <table class="form-tb">
             	<tr>
                    <th>名称：</th>
                    <td>    
                        <input id="name" name="name" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入系统名称'" />
                    </td>
                </tr>
             	<tr>
                    <th>标识：</th>
                    <td>    
                        <input id="sn" name="sn" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入系统标识',validType:'unique'" />
                    </td>
                </tr>
                <tr>
                    <th>url前缀：</th>
                    <td>    
                    	<input id="url" name="url" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入url前缀'" style="width:300px"/>
                    </td>
                </tr>
                <tr>
                    <th>排序号：</th>
                    <td>    
                    	<input name="orderNo" type="text" class="easyui-numberbox" data-options="min:0"></input>
                    </td>
                </tr>
                <tr>
                    <th>描述：</th>
                    <td>  
                    	<textarea name="note" rows="2" cols="47"></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </center>
</body>
</html>