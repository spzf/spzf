<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/WEB-INF/page/share/taglib.jsp" %>
<title>添加数据字典</title>
</head>
<body>
	<center>
	<form id="formA">
        <div style="margin:20px auto;">
			<input name="pcode" type="hidden" value="${pcode }" />
			<input name="systemSn" type="hidden" value="${systemSn }" />
            <table class="form-tb">
             	<tr>
                    <th>名称：</th>
                    <td>
                    	<input name="name" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入名称'" />
                    </td>
                </tr>
                <tr>
                    <th>编码：</th>
                    <td>
                    	<input name="code" type="text" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入编码',validType:'unique'" />
                    </td>
                </tr>
             	<tr>
                    <th>排序号：</th>
                    <td>  
                    	<input name="orderNo" type="text" class="easyui-numberbox" data-options="min:0" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    </center>
</body>
</html>