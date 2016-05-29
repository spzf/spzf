var PrivilegeList={};
var dataList=null;
//初始化
function parsePage(){
	PrivilegeList.init();
}

PrivilegeList.init = function(){
	PrivilegeList.initTree();
	PrivilegeList.initDatagrid();
	
};

//左边树形菜单
PrivilegeList.initTree=function(){
	$('#systemMenu').tree({
		url:basePATH + 'managment/module/getsystems.do?sessionId='+sessionId,
		onSelect: function(node){
			$.post(basePATH + 'managment/pval/ajaxlist.do?sessionId='+sessionId,{systemId : node.id},function(data){
				$('#tbList').datagrid("loadData",data);
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
};

//搜索工具
PrivilegeList.initToolSearch=function(){
	
};

//查询
PrivilegeList.doSearch=function() {
	var json=$("#searchForm").form("getData");
	$('#tbList').datagrid('load', json);
};

//重置
PrivilegeList.doReset=function(){
	$("#searchForm").form("reset");
};

//列表
PrivilegeList.initDatagrid=function(){
	dataList=$('#tbList').datagrid({
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
				title : '名称',
				field : 'name',
				sortable:true,
				width : 30
			},{
				title : '整型位',
				field : 'position',
				sortable:true,
				width : 20,
				formatter: function(value,row,index){
					if(!value){return "0";}return value;
				}
			},{
				title : '排序号',
				field : 'orderNo',
				sortable:true,
				width : 20
			},{
				title : '备注',
				field : 'remark',
				sortable:true,
				width : 30
			}
		]],
		onLoadSuccess : function() {
		}
	});
};

//新增
PrivilegeList.add = function() {
	var node = $("#systemMenu").tree("getSelected");
	ygDialog({
        title:'新增权限值',
        width: 500,    
        height: 300, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH + 'managment/pval/insertUI.do?sessionId='+sessionId+'&systemId='+node.id,
        modal: true,
		resizable:false,
		buttons:[{
			text:'保存',
			id:'addButton',
			iconCls:'icon-save',
			handler:function(dialog){
				add(dialog,node);
			}
		}]
    }); 
};

//修改
PrivilegeList.edit = function() {
	var data=dataList.datagrid("getSelected");
	if(!data){
		$.messager.alert('信息','请选择一条记录！','info');
		return;
	}
	ygDialog({
        title:'编辑权限值',
        width: 500,    
        height: 300, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH+ 'managment/pval/updateUI.do?sessionId='+sessionId,
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
PrivilegeList.del = function() {
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
					url : basePATH + "managment/pval/delete.do?sessionId="+sessionId+"&ids="+ id,
					dataType : 'json',
					success : function(data) {
						if (data.responseCode == 101) {
							$.messager.alert(data.responseMsg);
						}else{
							$.messager.show({title:'提示',msg:'删除成功！',timeout:1000,position:'bottomRight',showType:'slide'});
							refreshSelectedNode();
						}
					}
				});
			}
		});
	} else {
		$.messager.alert('信息','请选择要删除的记录！','info');
	}
};


function refreshSelectedNode(){
	var n = $("#systemMenu").tree("getSelected");  
    if(n!=null){  
         $("#systemMenu").tree("select",n.target);
    }
}

