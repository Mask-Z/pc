<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){ 
	getDatagrid("#advicelist_table",{
		url:"system/adviceList",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field:'id',title:'全选',checkbox:true},
		        {field:'name',title:'联系人',width:80,align:'left'},
		        {field:'tel',title:'联系人电话',width:80,align:'left'},
		        {field:'title',title:'留言主题',width:80,align:'left'},
		        {field:'operation',title:'操作',width:80,align:'center',
		        	formatter: function(value,row,index){
		        		var str = "";
		        		str += '<a href="javascript:;" class = "green" onClick = "editAdvice('+row.id+');">查看</a>';
		            	str += '&nbsp;&nbsp;';
		            	str += '&nbsp;&nbsp;';
		            	str += '<a href="javascript:;"  style = "color:#b8110d;" onClick = "delAdvice('+row.id+');">删除</a>';
		            	return str;
		  			}	
		        }
		    ]],
		    toolbar:"#advicemanage_tool"
	});
	
	$("#advice_add").click(function(){
		showWindow("#w1",{
			title : "新增意见",
			width : 900,
			height : 600, 
			content:"<iframe src='system/adviceForm' style='width:100%;height:100%;' frameborder='0'></iframe>"
		});
	});
	
	$("#advice_del").click(function(){
		var select = $("#advicelist_table").datagrid("getSelections");
		
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
					url : "system/adviceDel",
					dataType: "json",
					data : "id="+id,
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#advicelist_table").datagrid('reload');
					}
				});
			}
		});
	}); 
	
	$("#advice_search").click(function (){
		$("#advicelist_table").datagrid("load",{
			title:$("#search_advicetitle").val()
		});
	});

});
function editAdvice(id){
   	showWindow("#w1",{
			title : "查看意见",
			width : 900,
			height : 600, 
			content:"<iframe src='system/adviceForm?id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
	});
}
function delAdvice(id){
	$.messager.confirm("提示", "确认删除选择的数据吗?",function(r){
			if(r){
				$.ajax({
					type : "post",
					url : "system/adviceDel",
					dataType: "json",
					data : "id="+id,
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#advicelist_table").datagrid('reload');
					}
				});
			}
		});
}

</script>
	<table id="advicelist_table"  >
	
	</table>

<div id="advicemanage_tool" style="padding:3px;height:auto">
	<div style="padding: 2px">
	留言主题：<input type="text" id="search_advicetitle">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" plain="true"
			id="advice_search">查询</a>
	
	</div>
	<div>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" plain="true"
			id="advice_del">删除</a>

	</div>
</div>

