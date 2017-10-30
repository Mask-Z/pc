<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){ 
	getDatagrid("#userlist_table",{
		url:"user/gridList",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field:'id',title:'全选',checkbox:true},
		        {field:'loginname',title:'登录名',width:80,align:'left'},
		        {field:'name',title:'姓名',width:80,align:'left'},
		        {field:'role_name',title:'角色',width:80,align:'left'},
		        {field:'operation',title:'操作',width:80,align:'center',
		        	formatter: function(value,row,index){
		        		var str = "";
		        		str += '<a href="javascript:;" class = "green" onClick = "editUser('+row.id+');">编辑</a>';
		            	str += '&nbsp;&nbsp;';
		            	str += '&nbsp;&nbsp;';
		            	str += '<a href="javascript:;"  style = "color:#b8110d;" onClick = "delUser('+row.id+');">删除</a>';
		            	return str;
		  			}	
		        }
		    ]],
		    toolbar:"#usermanage_tool"
	});
	
	$("#user_add").click(function(){
		showWindow("#w1",{
			title : "新增用户",
			width : 500,
			height : 300, 
			content:"<iframe src='user/openFormWin' style='width:100%;height:100%;' frameborder='0'></iframe>"
		});
	});
	
	$("#user_del").click(function(){
		var select = $("#userlist_table").datagrid("getSelections");
		
		var id="";
		for(var i=0;i<select.length;i++){
			if(id!=""){
				id+=",";
			}
			id += select[i].id;
		}
		if(id==""){
			$.messager.alert("提示", "请至少选择一条要删除的数据！","info");return;
		}
		$.messager.confirm("提示", "确认删除选择的数据吗?",function(r){
			if(r){
				$.ajax({
					type : "post",
					url : "user/delete",
					dataType: "json",
					data : "id="+id,
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#userlist_table").datagrid('reload');
					}
				});
			}
		});
	}); 
	
	$("#user_search").click(function (){
		$("#userlist_table").datagrid("load",{
			loginname:$("#search_loginname").val(),
			name:$("#search_name").val()
		});
	});

});
function editUser(id){
   	showWindow("#w1",{
			title : "修改/查看用户信息",
			width : 500,
			height : 300, 
			content:"<iframe src='user/openFormWin?id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
	});
}
function delUser(id){
	$.messager.confirm("提示", "确认删除选择的数据吗?",function(r){
			if(r){
				$.ajax({
					type : "post",
					url : "user/delete",
					dataType: "json",
					data : "id="+id,
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#userlist_table").datagrid('reload');
					}
				});
			}
		});
}

</script>
	<table id="userlist_table"  >
	
	</table>

<div id="usermanage_tool" style="padding:3px;height:auto">
	<div style="padding: 2px">
	登录名：<input type="text" id="search_loginname">
	姓名：<input type="text" id="search_name">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" plain="true"
			id="user_search">查询</a>
	</div>
	<div>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			id="user_add">新增</a>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" plain="true"
			id="user_del">删除</a>

	</div>
</div>

