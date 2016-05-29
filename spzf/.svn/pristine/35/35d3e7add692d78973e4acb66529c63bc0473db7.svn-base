//新增
function add(dialog,node){
	var form=$("#formA");
	if(form.form('validate')){
		var data=form.form("getData");
		$.post(
			basePATH + 'managment/pval/insert.do?sessionId='+sessionId,
			data,
			function(result){
				if(result.status==100){
					dialog.close();
					$.messager.show({title:'提示',msg:'保存成功！',timeout:1000,position:'bottomRight',showType:'slide'});
					$("#systemMenu").tree("select",node.target);
				}else{
					$.messager.alert('信息','保存失败！','info');
				}
			},'json'
		);
	}
}

//修改
function edit(dialog) {
	var form=$("#formU");
	if(form.form('validate')){
		var fdata=form.form("getData");
		$.post(
			basePATH + 'managment/pval/update.do?sessionId='+sessionId,
			fdata,
			function(result){
				if(result.status==100){
					dialog.close();
					$.messager.show({title:'提示',msg:'保存成功！',timeout:1000,position:'bottomRight',showType:'slide'});
					refreshSelectedNode();
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
    	var node = $("#systemMenu").tree("getSelected");
    	var valid=true;
    	var formData=$("#formU").form("getData");
    	$.ajax({
    		async:false,
    		url:basePATH + 'managment/pval/checkExsits.do?sessionId='+sessionId,
    		data:{position : value , id : formData.id, systemId : node.id},
    		success:function(json){
    			if(json==1){
    				valid=false;
    			}
    		}
    	});
    	return valid;
    },
    message: '整形位值不能重复!'
    }
});
