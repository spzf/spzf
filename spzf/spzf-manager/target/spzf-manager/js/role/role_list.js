var RoleList={};
var dataList=null;
//初始化
function parsePage(){
	RoleList.init();
}

RoleList.init = function(){
	RoleList.initToolSearch();
	RoleList.initDatagrid();
	
};

//搜索工具
RoleList.initToolSearch=function(){
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
RoleList.doSearch=function() {
	var json=$("#searchForm").form("getData");
	$('#tbList').datagrid('load', json);
};

//重置
RoleList.doReset=function(){
	$("#searchForm").form("reset");
};

//列表
RoleList.initDatagrid=function(){
	dataList=$('#tbList').datagrid({
		url: basePATH + 'managment/role/ajaxlist.do?sessionId='+sessionId,
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
				title : '角色名称',
				field : 'name',
				sortable:true,
				width : 35
			},{
				title : '角色标识',
				field : 'sn',
				sortable:true,
				width : 30
			},{
				title : '备注',
				field : 'note',
				width : 35
			}
		]],
		onLoadSuccess : function() {
		}
	});
};

//新增
RoleList.add = function() {
	ygDialog({
        title:'新增角色',
        width: 500,    
        height: 300, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH + 'managment/role/insertUI.do?sessionId='+sessionId,  
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
RoleList.edit = function() {
	var data=dataList.datagrid("getSelected");
	if(!data){
		$.messager.alert('信息','请选择一条记录！','info');
		return;
	}
	ygDialog({
        title:'编辑角色',
        width: 500,    
        height: 300, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH+ 'managment/role/updateUI.do?sessionId='+sessionId,
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
RoleList.del = function() {
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
					url : basePATH + "managment/role/delete.do?sessionId="+sessionId+"&ids="+ id,
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

//操作授权
RoleList.roleModuleUI = function(){
	var row=dataList.datagrid("getSelected");
	if(!row){
		$.messager.alert('信息','请选择一条记录！','info');
		return;
	}
	ygDialog({
		title: '给 '+row.name+' 授权', 
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
				url:basePATH+ 'managment/module/getsystems.do?sessionId='+sessionId,
				onSelect: function(node){
					$.post(basePATH+ "managment/module/getAllPriValBySystemSn.do?sessionId="+sessionId,{systemSn : node.sn, type: 'role', releaseId : row.id},function(data){
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
							url:basePATH+ 'managment/acl/setAcl.do?sessionId='+sessionId,
							data:{releaseId:row.id,releaseSn:'role',systemSn:node.sn,moduleId:name,position:value,yes:yes}
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
							url:basePATH+ 'managment/acl/setAclByModule.do?sessionId='+sessionId,
							data:{releaseId:row.id,releaseSn:'role',systemSn:node.sn,moduleId:this.id,yes:yes}
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
							url:basePATH+ 'managment/acl/setAllAcl.do?sessionId='+sessionId,
							data:{releaseId:row.id,releaseSn:'role',systemSn:node.sn,yes:yes}
						});
					});
				}
			});
		}
    });
};
