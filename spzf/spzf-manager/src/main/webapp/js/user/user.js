//新增
function add(dialog){
	var form=$("#formA");
	if(form.form('validate')){
		var data=form.form("getData");
		$.post(
			basePATH + 'managment/user/insert.do?sessionId='+sessionId,
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
	var systemIds = "";
	$("input[name='systemIds']").each(function(){
		var check = $(this).attr("checked");//判断是否选中
		if(check){ 
			var systemId = $(this).val();
			systemIds += systemId+",";
		}
	})
	var form=$("#formU");
	if(form.form('validate')){
		var data=form.form("getData");
		data.systemIds = systemIds;
		$.post(
			basePATH + 'managment/user/update.do?sessionId='+sessionId,
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
				url:basePATH + 'managment/user/checkUserNameExsits.do?sessionId='+sessionId,
				data:{username:value,id:formData.id},
				success:function(json){
					if(json==1){
						valid=false;
					}
				}
			});
			return valid;
		},
		message: '标识不能重复!'
	}
});