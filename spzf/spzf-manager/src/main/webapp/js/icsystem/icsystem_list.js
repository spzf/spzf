var IcsystemList={};
var dataList=null;
//初始化
function parsePage(){
	IcsystemList.init();
}

IcsystemList.init = function(){
	IcsystemList.initToolSearch();
	IcsystemList.initDatagrid();
	
};

//搜索工具
IcsystemList.initToolSearch=function(){
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
IcsystemList.doSearch=function() {
	var json=$("#searchForm").form("getData");
	$('#tbList').datagrid('load', json);
};

//重置
IcsystemList.doReset=function(){
	$("#searchForm").form("reset");
};

//列表
IcsystemList.initDatagrid=function(){
	dataList=$('#tbList').datagrid({
		url: basePATH + 'managment/icsystem/ajaxlist.do?sessionId='+sessionId,
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
				width : 20
			}, {
				title : '标识',
				field : 'sn',
				sortable:true,
				width : 20
			}, {
				title : 'url前缀',
				field : 'url',
				sortable:true,
				width : 20
			}, {
				title : '排序号',
				field : 'orderNo',
				sortable:true,
				width : 20
			}, {
				title : '备注',
				field : 'note',
				sortable:true,
				width : 20
			}
		]],
		onLoadSuccess : function() {
		}
	});
};

//新增
IcsystemList.add = function() {
	ygDialog({
        title:'新增系统',
        width: 500,    
        height: 300, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH + 'managment/icsystem/insertUI.do?sessionId='+sessionId,  
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
IcsystemList.edit = function() {
	var data=dataList.datagrid("getSelected");
	if(!data){
		$.messager.alert('信息','请选择一条记录！','info');
		return;
	}
	ygDialog({
        title:'编辑系统',
        width: 500,    
        height: 300, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH+ 'managment/icsystem/updateUI.do?sessionId='+sessionId,
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
IcsystemList.del = function() {
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
					url : basePATH + "managment/icsystem/delete.do?sessionId="+sessionId+"&ids="+ id,
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
