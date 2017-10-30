<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){ 
	getDatagrid("#entrustlist_table",{
		url:"system/entrustList",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field:'id',title:'全选',checkbox:true},
		        {field:'title',title:'委托标的名',width:80,align:'left'},
		        {field:'name',title:'委托人',width:80,align:'left'},
		        {field:'tel',title:'委托人电话',width:80,align:'left'},
		        {field:'state',title:'状态',width:80,align:'left',
		        	formatter: function(value,row,index){
						if (value=="0"){
							return "<font color='red'>未处理</font>";
						} else if (value=="1") {
							return "<font color='blue'>已处理</font>";
						}
					}
		        },
		        {field:'operation',title:'操作',width:80,align:'center',
		        	formatter: function(value,row,index){
		        		var str = "";
		        		if(row.state==0){
		        		  str += '<a href="javascript:;" class = "green" onClick = "editEntrust('+row.id+');">处理</a>';
		        		}
		            	str += '&nbsp;&nbsp;';
		            	str += '&nbsp;&nbsp;';
		            	str += '<a href="javascript:;"  style = "color:#b8110d;" onClick = "delEntrust('+row.id+');">删除</a>';
		            	return str;
		  			}	
		        }
		    ]],
		    toolbar:"#entrustmanage_tool"
	});
	
	$("#entrust_add").click(function(){
		showWindow("#w1",{
			title : "新增问题",
			width : 900,
			height : 600, 
			content:"<iframe src='system/entrustForm' style='width:100%;height:100%;' frameborder='0'></iframe>"
		});
	});
	
	$("#entrust_del").click(function(){
		var select = $("#entrustlist_table").datagrid("getSelections");
		
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
					url : "system/entrustDel",
					dataType: "json",
					data : "id="+id,
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#entrustlist_table").datagrid('reload');
					}
				});
			}
		});
	}); 
	
	$("#entrust_search").click(function (){
		$("#entrustlist_table").datagrid("load",{
			title:$("#search_entrusttitle").val()
		});
	});

});
function editEntrust(id){
   	showWindow("#w1",{
			title : "处理问题",
			width : 900,
			height : 600, 
			content:"<iframe src='system/entrustForm?id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
	});
}
function delEntrust(id){
	$.messager.confirm("提示", "确认删除选择的数据吗?",function(r){
			if(r){
				$.ajax({
					type : "post",
					url : "system/entrustDel",
					dataType: "json",
					data : "id="+id,
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#entrustlist_table").datagrid('reload');
					}
				});
			}
		});
}

</script>
	<table id="entrustlist_table"  >
	
	</table>

<div id="entrustmanage_tool" style="padding:3px;height:auto">
	<div style="padding: 2px">
	标题：<input type="text" id="search_entrusttitle">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" plain="true"
			id="entrust_search">查询</a>
	
	</div>
	<div>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" plain="true"
			id="entrust_del">删除</a>

	</div>
</div>

