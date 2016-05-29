var UserList={};
var dataList=null;
//初始化
function parsePage(){
	UserList.init();
}

UserList.init = function(){
	UserList.initTree();
	UserList.initToolSearch();
	UserList.initDatagrid();
	
};

//左边树形菜单
UserList.initTree=function(){
	$('#dept').tree({
		loadFilter: pagerFilter,
		url:basePATH + 'managment/dept/ajaxlist.do?sessionId='+sessionId,
		onSelect: function(node){
			$('#tbList').datagrid("reload");
		},
		onLoadSuccess:function(node,data){  
	        $("#dept li:eq(0)").find("div").addClass("tree-node-selected");   //设置第一个节点高亮  
	        var n = $("#dept").tree("getSelected");  
	        if(n!=null){  
	            $("#dept").tree("select",n.target);    //相当于默认点击了一下第一个节点，执行onSelect方法  
	        }
	    }  
	});
};

function pagerFilter(data){
    if ($.isArray(data)){    // is array  
    	for(var i=0; i<data.length; i++){
    		data[i].text = data[i].name;
    	}
    	var returnData=[];
    	for(var i=0; i<data.length; i++){
    		data[i].children = [];
    		if(!data[i].pid){
        		for(var j=0; j<data.length; j++){
        			if(data[j].pid && data[j].pid==data[i].id){
        				data[i].children.push(data[j]);
        			}
        		}
        		returnData.push(data[i]);
    		}
    	}
    	return returnData; 
    }
}

//搜索工具
UserList.initToolSearch=function(){
	toolSearch({
	    items: [
	        {"text":"名称","name":"name"}
	    ],
	    collapsible:false, 
	    callback: function (key, name) {
	        if (key == "") {
	        	$.messager.alert('提示', '请输入关键字', 'info')
	            return false;
	        }
	        var jsonString='{"'+name+'" : "'+key+'"}';
	        jsonString=jQuery.parseJSON(jsonString);
	        $('#tbList').datagrid('load', jsonString);
	    }
	});
};

//查询
UserList.doSearch=function() {
	var json=$("#searchForm").form("getData");
	$('#tbList').datagrid('load', json);
};

//重置
UserList.doReset=function(){
	$("#searchForm").form("reset");
};

//列表
UserList.initDatagrid=function(){
	dataList=$('#tbList').datagrid({
		url: basePATH + 'managment/user/ajaxlist.do?sessionId='+sessionId,
		singleSelect : false,
		fitColumns : true,
		checkOnSelect : true,
		selectOnCheck : true,
		striped:true,
		rownumbers:true,
		pagePosition:'both',
		showFooter:true,
		multiSort:true,
		pageSize: 20,
		columns : [[{
				checkbox : true
			},{
				title : '姓名',
				field : 'realName',
				sortable:true,
				width : 30
			},{
				title : '性别',
				field : 'sex',
				sortable:true,
				width : 20,
				formatter: function(value,row,index){
					if(value == 0){
						return "男";
					}
					if(value == 1){
						return "女";
					}
					return value;
				}
			},{
				title : '用户名',
				field : 'username',
				sortable:true,
				width : 50
			},{
				title : '角色',
				field : 'roles',
				sortable:true,
				width : 50
			},{
				title : '手机',
				field : 'mobile',
				sortable:true,
				width : 50
			},{
				title : '座机',
				field : 'phone',
				sortable:true,
				width : 50
			},{
				title : '邮箱',
				field : 'email',
				sortable:true,
				width : 80
			},{
				title : '部门',
				field : 'deptName',
				sortable:true,
				width : 50
			}
		]],
		onLoadSuccess : function() {
		},
		onBeforeLoad : function(param) {
			var n = $("#dept").tree("getSelected");
			if(n!=null){  
				param.departmentId=n.id;
	        }else{
	        	return false;
	        }
		}
	});
};

//新增
UserList.add = function() {
	ygDialog({
        title:'新增用户',
        width: 650,    
        height: 350, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH + 'managment/user/insertUI.do?sessionId='+sessionId,  
        modal: true,
		resizable:false,
		buttons:[{
			text:'保存',
			id:'addButton',
			iconCls:'icon-save',
			handler:function(dialog){
				add(dialog);
			}
		}]
    });
};

//修改
UserList.edit = function() {
	var data=dataList.datagrid("getSelected");
	if(!data){
		$.messager.alert('信息','请选择一条记录！','info');
		return;
	}
	ygDialog({
        title:'编辑系统',
        width: 650,    
        height: 350, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH+ 'managment/user/updateUI.do?sessionId='+sessionId,
        modal: true,
		resizable:false,
		buttons:[{
			text:'保存',
			id:'updateButton',
			iconCls:'icon-save',
			handler:function(dialog){
				edit(dialog);
			}
		}],
		onLoad : function (){
			var form=$("#formU");
			form.form("load",data);
		}
    });
};

//删除
UserList.del = function() {
	var rows=dataList.datagrid("getSelections");
	if (rows && rows.length > 0) {
		$.messager.confirm("提示","确定删除？",function(r) {
			if (r) {
				var ids = [];
				for ( var i = 0, l = rows.length; i < l; i++) {
					var r = rows[i];
					ids.push(r.id);
				}
				var id = ids.join(',');
				$.ajax({
					url : basePATH + "managment/user/delete.do?sessionId="+sessionId+"&ids="+ id,
					dataType : 'json',
					success : function(text) {
						if (text.responseCode == 101) {
							$.messager.alert(text.responseMsg);
						}else{
							$.messager.show({title:'提示',msg:'删除成功！',timeout:1000,position:'bottomRight',showType:'slide'});
							dataList.datagrid("reload");
						}
					}
				});
			}
		});
	} else {
		$.messager.alert('信息','请选择要删除的记录！','info');
	}
};

//详情
UserList.detail = function(){
	var data=dataList.datagrid("getSelected");
	if(!data){
		$.messager.alert('信息','请选择一条记录！','info');
		return;
	}
	ygDialog({
        title:'用户详情',
        width: 650,    
        height: 350,  
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH+ 'managment/user/detailUI.do?sessionId='+sessionId+'&userId='+data.id,
        modal: true,
		resizable:false,
		onLoad : function (){
			var form=$("#formU");
			form.form("load",data);
		}
    });
};

//分配角色
UserList.addrole = function(){
	var row=dataList.datagrid("getSelected"),roles=[];
	if(!row){
		$.messager.alert('信息','请选择一条记录！','info');
		return;
	}
	ygDialog({
        title:'给 '+row.realName+' 分配角色',
        width: 750,    
        height: 500, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH+ 'managment/user/insertRoleUI.do?sessionId='+sessionId,
        modal: true,
		resizable:false,
		buttons:[{
			text:'保存',
			id:'saveUserRoleButton',
			iconCls:'icon-save',
			handler:function(dialog){
				$.ajax({
					type:'post',
					url:basePATH+ 'managment/user/saveUserRole.do?sessionId='+sessionId,
					data:{userId:row.id,roleIds:roles.join(",")},
					dataType:'json',
					success:function(text){
						if(text.responseCode==100){
							dialog.close();
							$.messager.show({title:'提示',msg:'保存成功！',timeout:1000,position:'bottomRight',showType:'slide'});
							$('#tbList').datagrid("reload");
						}else{
							$.messager.alert('信息','保存失败！','info');
						}
					}
				});
			}
		}],
		onLoad : function (){
			$.ajax({
				async:false,
				type:'post',
				url:basePATH+ 'managment/user/getRoleByUserId.do?sessionId='+sessionId,
				data:{userId:row.id},
				dataType:'json',
				success:function(text){
					if(text && text.length>0){
						for(var i=0;i<text.length;i++){
							roles.push(text[i].id);
						}
					}
				}
			});
			$('#roledg').datagrid({
				url: basePATH + 'managment/user/getRoles.do?sessionId='+sessionId+'&userId='+row.id,
				singleSelect : false,
				idField : "id",
				fitColumns : true,
				checkOnSelect : true,
				selectOnCheck : true,
				pageSize: 10,
				pageList: [10,20,50],
				columns : [ [ {
					checkbox : true
				}, {
					title : '角色名称',
					field : 'name',
					width : 100,
					align : 'left'
				}, {
					title : '角色标识',
					field : 'sn',
					width : 50,
					align : 'left'
				}, {
					title : '备注',
					field : 'note',
					width : 100,
					align : 'left'
				} ] ],
				onLoadSuccess : function(data) {
					 if ($.isArray(data)){    // is array  
						 for(var i=0;i<data.length;i++){
							 var row=data[i];
							 if(row.checked){
								 $('#roledg').datagrid("selectRecord",row.id);
							 }
						 }
					 }
				},
				onSelect : function(rowIndex, rowData){
					for(var i=0,len=roles.length;i<len;i++){
						if(roles[i]==rowData.id){
							return;
						}
					}
					roles.push(rowData.id);
				},
				onUnselect : function(rowIndex, rowData){
					for(var i=0,len=roles.length;i<len;i++){
						if(roles[i]==rowData.id){
							roles.splice(i, 1);
							return;
						}
					}
				}
			});
		}
    });
};

//操作授权
UserList.adduseracl = function(){
	var row=dataList.datagrid("getSelected");
	if(!row){
		$.messager.alert('信息','请选择一条记录！','info');
		return;
	}
	
	ygDialog({
        title:'给 '+row.realName+' 授权',   
        width: 1024,    
        height: 500, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH+ 'managment/acl/roleModuleUI.do?releaseSn=role&sessionId='+sessionId+'&id=' + row.id,
        modal: true,
		resizable:false,
		onLoad : function (){
			//系统菜单
			$('#systemMenu').tree({
				url:basePATH + 'managment/module/getsystems.do?sessionId='+sessionId,
				onSelect: function(node){
					$.post(basePATH + "managment/module/getAllPriValBySystemSn.do?sessionId="+sessionId,{systemSn : node.sn, type: 'user', releaseId : row.id},function(data){
						$('#rmtg').treegrid("loadData",data);
					},'json');
				},
				onLoadSuccess:function(node,data){  
			        $("#systemMenu li:eq(0)").find("div").addClass("tree-node-selected");   //设置第一个节点高亮  
			        var n = $("#systemMenu").tree("getSelected");  
			        if(n!=null){  
			             $("#systemMenu").tree("select",n.target);    //相当于默认点击了一下第一个节点，执行onSelect方法  
			        }
			    }  
			});
			
			//权限值
			$('#rmtg').treegrid({
				rownumbers : true,
				fitColumns : true,
				pagination : false,
				idField:'id',    
			    treeField:'name',
				columns : [ [ {
					title : '名称',
					field : 'name',
					width : 50,
					align : 'left'
				}, {
					title : ' 权限值',
					field : 'pvs',
					width : 150,
					align : 'left',
					formatter: function(value,row,index){
						var list=value,
							btnValue='全选',
							htmltext='',
							vflag=true;
						for(var i=0,len=list.length;i<len;i++){
							htmltext+='<label class="function-item">'+
							'<input type="checkbox" name="'+row.id+'" value="'+list[i].position+'"';
							if(list[i].flag==true){
								htmltext+='checked=checked';
							}else{
								vflag=false;
							}
							htmltext+=' />'+list[i].name+'</label>';
						}
						if(vflag){
							btnValue='取消';
						}
						var btnhtml='<input class="mbtn btn" id="'+row.id+'" type="button" value="'+btnValue+'" />';
						return btnhtml+htmltext;
					}
				}] ],
				onLoadSuccess : function() {
					var node=$('#systemMenu').tree("getSelected");
					$(":checkbox").click(function(){
						var name=this.name,
							value=this.value,
							yes=false;
						if(this.checked){
							yes=true;
						}
						$.ajax({
							type:'post',
							url:basePATH + 'managment/acl/setAcl.do?sessionId='+sessionId,
							data:{releaseId:row.id,releaseSn:'user',systemSn:node.sn,moduleId:name,position:value,yes:yes}
						});
					});
					
					$(".mbtn").click(function(){
						var chks=document.getElementsByName(this.id),
							yes=false;
						if(this.value == '全选'){
							this.value='取消',yes=true;
							for(var i=0,len=chks.length;i<len;i++){
								chks[i].checked = true;
							}
						}else{
							this.value='全选';
							for(var i=0,len=chks.length;i<len;i++){
								chks[i].checked = false;
							}
						}
						$.ajax({
							type:'post',
							url:basePATH + 'managment/acl/setAclByModule.do?sessionId='+sessionId,
							data:{releaseId:row.id,releaseSn:'user',systemSn:node.sn,moduleId:this.id,yes:yes}
						});
					});
					
					$("#selectAllBtn .btn").click(function(){
						var yes=true;
						if(this.value == '全选'){
							//全选
							$(":checkbox").attr("checked","true");
							$(".mbtn").val("取消");
						}else{
							//全不选
							yes=false;
							$(":checkbox").removeAttr("checked");
							$(".mbtn").val("全选");
						}
						$.ajax({
							type:'post',
							url:basePATH + 'managment/acl/setAllAcl.do?sessionId='+sessionId,
							data:{releaseId:row.id,releaseSn:'user',systemSn:node.sn,yes:yes}
						});
					});
				}
			});
		}
    });
};

//修改用户名密码
UserList.updatePassword = function() {
	var row=dataList.datagrid("getSelected");
	if(!row){
		$.messager.alert('信息','请选择一条记录！','info');
		return;
	}
	ygDialog({
        title:'修改密码',
        width: 400,    
        height: 220, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH+ 'managment/user/udpatePasswordUI.do?sessionId='+sessionId,
        modal: true,
		resizable:false,
		buttons:[{
			text:'保存',
			id:'updatePassowrdButton',
			iconCls:'icon-save',
			handler:function(dialog){
				var form=$("#formP");
				if(form.form('validate')){
					var fdata=form.serialize();
					$.post(
						basePATH+ 'managment/user/updatePassowrd.do?sessionId='+sessionId,
						fdata,
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
		}],
		onLoad : function (){
			var form=$("#formP");
			form.form("load",row);
		}
    });
};

function pagerFilterSys(data){
    if ($.isArray(data)){    // is array  
    	for(var i=0; i<data.length; i++){
    		data[i].text = data[i].name;
    	}
    }
    return data;
}