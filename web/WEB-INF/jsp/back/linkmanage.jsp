<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){ 
	getDatagrid("#link_list_table",{
		url:"system/linkList",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field:'id',title:'全选',checkbox:true},
		        {field:'name',title:'公司名称',width:80,align:'left'},
		        {field:'image',title:'标题图片',width:80,align:'left',
		        	formatter:function(v,r,index){
		        		if(v!=null&&v!=''){
		        			return "<img src='<%=basePath%>upload/link/"+v+"' style='width: 50px;height: 50px;' align='middle'/>";
		        		}
		        	}	
		        },
		        {field:'url',title:'链接地址',width:80,align:'left'},
		        {field:'order_no',title:'显示顺序',width:80,align:'left'},
		        {field:'operation',title:'操作',width:80,align:'center',
		        	formatter: function(value,row,index){
		        		var str = "";
		        		str += '<a href="javascript:;" class = "green" onClick = "editLink('+row.id+');">编辑</a>';
		            	str += '&nbsp;&nbsp;';
		            	str += '&nbsp;&nbsp;';
		            	str += '<a href="javascript:;"  style = "color:#b8110d;" onClick = "delLink('+row.id+');">删除</a>';
		            	return str;
		  			}	
		        }
		    ]],
		    toolbar:"#link_manage_tool"
	});
	
	$("#linkmanage_add").click(function(){
		showWindow("#w1",{
			title : "新增友情链接",
			width : 600,
			height :400, 
			content:"<iframe src='system/link_add' style='width:100%;height:100%;' frameborder='0' scrolling='yes'></iframe>"
		});
	});
	
	$("#linkmanage_del").click(function(){
		var select = $("#link_list_table").datagrid("getSelections");
		var ids="";
		for(var i=0;i<select.length;i++){
			if(ids!=""){
				ids+=",";
			}
			ids += select[i].id;
		}
		if(ids==""){
			$.messager.alert("提示", "请至少选择一条要删除的数据！","info");return;
		}
		$.messager.confirm("提示", "确认删除选择的数据吗?",function(r){
			if(r){
				$.ajax({
					type : "post",
					url : "system/link_del",
					dataType: "json",
					data : {ids:ids},
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#link_list_table").datagrid('reload');
					}
				});
			}
		});
	}); 
	//查询
	$("#link_search").click(function(){
		var data = getFormData($("#linkform"));
		$("#link_list_table").datagrid("reload",data);
	});

});

//序列化
function getFormData(form) {
	var o = {};
	var a = form.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
}

//修改页面
var editLink=function(adid){
	showWindow("#w1",{
		title : "修改友情链接",
		width : 600,
		height : 400,
		content:"<iframe src='system/link_add?id="+adid+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
	});
}
var delLink=function(id){
	$.messager.confirm("提示", "确认删除选择的数据吗?",function(r){
			if(r){
				$.ajax({
					type : "post",
					url : "system/link_del",
					dataType: "json",
					data : "ids="+id,
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#link_list_table").datagrid('reload');
					}
				});
			}
		});
}
</script>
	<table id="link_list_table"  >
	
	</table>

<div id="link_manage_tool" style="padding:3px;height:auto">
	<div style="padding: 2px">
	<form id="linkform" >
	公司名称:<input type="text" name="name">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" plain="true"
			id="link_search">查询</a>
	</form>
	</div>
	<div>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			id="linkmanage_add">新增</a>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
		id="linkmanage_del">删除</a>
	</div>
</div>

