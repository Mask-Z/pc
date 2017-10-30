<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){ 
	getDatagrid("#questionlist_table",{
		url:"system/questionList",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field:'id',title:'全选',checkbox:true},
		        {field:'title',title:'标题',width:80,align:'left'},
		        {field:'key_word',title:'关键字',width:80,align:'left'},
		        {field:'order_no',title:'显示顺序',width:80,align:'left'},
		        {field:'state',title:'是否显示',width:80,align:'left',
		        	formatter: function(value,row,index){
						if (value=="0"){
							return "<font color='red'>不显示</font>";
						} else if (value=="1") {
							return "<font color='blue'>显示</font>";
						}
					}
		        },
		        {field:'operation',title:'操作',width:80,align:'center',
		        	formatter: function(value,row,index){
		        		var str = "";
		        		str += '<a href="javascript:;" class = "green" onClick = "editQuestion('+row.id+');">编辑</a>';
		            	str += '&nbsp;&nbsp;';
		            	str += '&nbsp;&nbsp;';
		            	str += '<a href="javascript:;"  style = "color:#b8110d;" onClick = "delQuestion('+row.id+');">删除</a>';
		            	return str;
		  			}	
		        }
		    ]],
		    toolbar:"#questionmanage_tool"
	});
	
	$("#question_add").click(function(){
		showWindow("#w1",{
			title : "新增问题",
			width : 900,
			height : 600, 
			content:"<iframe src='system/questionForm' style='width:100%;height:100%;' frameborder='0'></iframe>"
		});
	});
	
	$("#question_del").click(function(){
		var select = $("#questionlist_table").datagrid("getSelections");
		
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
					url : "system/questionDel",
					dataType: "json",
					data : "id="+id,
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#questionlist_table").datagrid('reload');
					}
				});
			}
		});
	}); 
	
	$("#question_search").click(function (){
		$("#questionlist_table").datagrid("load",{
			title:$("#search_questiontitle").val()
		});
	});

});
function editQuestion(id){
   	showWindow("#w1",{
			title : "编辑问题",
			width : 900,
			height : 600, 
			content:"<iframe src='system/questionForm?id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
	});
}
function delQuestion(id){
	$.messager.confirm("提示", "确认删除选择的数据吗?",function(r){
			if(r){
				$.ajax({
					type : "post",
					url : "system/questionDel",
					dataType: "json",
					data : "id="+id,
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#questionlist_table").datagrid('reload');
					}
				});
			}
		});
}

</script>
	<table id="questionlist_table"  >
	
	</table>

<div id="questionmanage_tool" style="padding:3px;height:auto">
	<div style="padding: 2px">
	标题：<input type="text" id="search_questiontitle">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" plain="true"
			id="question_search">查询</a>
	
	</div>
	<div>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			id="question_add">新增</a>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" plain="true"
			id="question_del">删除</a>

	</div>
</div>

