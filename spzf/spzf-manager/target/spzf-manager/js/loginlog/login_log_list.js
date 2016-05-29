var LoginLogList={};
var dataList=null;
//初始化
function parsePage(){
	LoginLogList.init();
}

LoginLogList.init = function(){
	LoginLogList.initToolSearch();
	LoginLogList.initDatagrid();
	
};

//搜索工具
LoginLogList.initToolSearch=function(){
	toolSearch({
	    items: [
	        {"text":"用户名","name":"operationUsername"}
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
LoginLogList.doSearch=function() {
	var json=$("#searchForm").form("getData");
	$('#tbList').datagrid('load', json);
};

//重置
LoginLogList.doReset=function(){
	$("#searchForm").form("reset");
};

//列表
LoginLogList.initDatagrid=function(){
	dataList=$('#tbList').datagrid({
		url: basePATH + 'managment/loginLog/ajaxList.do?sessionId='+sessionId,
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
				title : 'IP地址',
				field : 'ip',
				sortable:true,
				width : 20
			}, {
				title : '用户名',
				field : 'operationUsername',
				sortable:true,
				width : 20
			}, {
				title : '真实姓名',
				field : 'operationPerson',
				sortable:true,
				width : 20
			}, {
				title : '操作行为',
				field : 'operationContent',
				sortable:true,
				width : 20
			}, {
				title : '操作时间',
				field : 'operationTime',
				sortable:true,
				width : 20
			}
		]],
		onLoadSuccess : function() {
		}
	});
};

//修改
LoginLogList.edit = function() {
	var data=dataList.datagrid("getSelected");
	if(!data){
		$.messager.alert('信息','请选择一条记录！','info');
		return;
	}
	ygDialog({
        title:'修改日志',
        width: 500,    
        height: 300, 
		maximizable:false,
        closed: false,
		cache: false,
        href:  basePATH+ 'managment/loginLog/updateUI.do?sessionId='+sessionId,
        modal: true,
		resizable:false,
		onLoad : function (){
			var form=$("#formU");
			form.form("load",data);
		}
    });
};

//删除
LoginLogList.del = function() {
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
					url : basePATH + "managment/loginLog/delete.do?sessionId="+sessionId+"&idStrs="+ id,
					dataType : 'json',
					success : function(data) {
						if (data.responseCode == 101) {
							$.messager.alert(data.responseMsg);
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
