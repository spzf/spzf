//新增
function add(dialog){
	var form=$("#formA");
	if(form.form('validate')){
		var data=form.form("getData");
		$.post(
			basePATH + 'managment/systemConfig/add.do?sessionId='+sessionId,
			data,
			function(result){
				if(result.responseCode==100){
					dialog.close();
					$.messager.show({title:'提示',msg:'保存成功！',timeout:1000,position:'bottomRight',showType:'slide'});
					$('#tbList').datagrid("reload");
				}else{
					$.messager.alert('信息','保存失败！','info');
				}
			},'json'
		);
	}
}

//修改
function edit(dialog){
	var form=$("#formU");
	if(form.form('validate')){
		var data=form.form("getData");
		$.post(
			basePATH + 'managment/systemConfig/update.do?sessionId='+sessionId,
			data,
			function(result){
				if(result.responseCode==100){
					dialog.close();
					$.messager.show({title:'提示',msg:'保存成功！',timeout:1000,position:'bottomRight',showType:'slide'});
					$('#tbList').datagrid("reload");
				}else{
					$.messager.alert('信息','保存失败！','info');
				}
			},'json'
		);
	}
}

//验证标识的唯一性
$.extend($.fn.validatebox.defaults.rules, {
    unique: {
	    validator: function(value, param){
	    	var valid=true;
	    	var formData=$("#formU").form("getData");
	    	$.ajax({
	    		async:false,
	    		url:basePATH + 'managment/systemConfig/checkSnExsits.do?sessionId='+sessionId,
	    		data:{configSn : value,id : formData.id},
	    		success:function(json){
	    			if(json==1){
	    				valid=false;
	    			}
	    		}
	    	});
	    	return valid;
	    },
    	message: '系统配置标识不能重复!'
    },
    uniquekey: {
	    validator: function(value, param){
	    	var valid=true;
	    	var formData=$("#formU").form("getData");
	    	$.ajax({
	    		async:false,
	    		url:basePATH + 'managment/systemConfig/checkKeyExsits.do?sessionId='+sessionId,
	    		data:{configKey : value,id : formData.id},
	    		success:function(json){
	    			if(json==1){
	    				valid=false;
	    			}
	    		}
	    	});
	    	return valid;
	    },
	    message: '系统配置key不能重复!'
	}
});