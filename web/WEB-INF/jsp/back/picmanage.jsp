<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){ 
	getDatagrid("#pic_list_table",{
		url:"system/picList",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field:'id',title:'全选',checkbox:true},
		        {field:'title',title:'公告标题',width:80,align:'left'},
		        {field:'path',title:'公告图片',width:80,align:'left',
		        	formatter:function(v,r,index){
			        	if(v!=null&&v!=''){
			        	   return "<img src='<%=basePath%>"+v+"' style='width: 50px;height: 50px;' align='middle'/>";
			        	}
		        	}	
		        }
		    ]],
		    toolbar:"#pic_manage_tool"
	});
	
	$("#picmanage_del").click(function(){
		var select = $("#pic_list_table").datagrid("getSelections");
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
					url : "system/pic_del",
					dataType: "json",
					data : {ids:ids},
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#pic_list_table").datagrid('reload');
					}
				});
			}
		});
	}); 
	
	//查询
	$("#pic_search").click(function(){
		var data = getFormData($("#picform"));
		$("#pic_list_table").datagrid("reload",data);
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
</script>
<table id="pic_list_table">	
</table>
<div id="pic_manage_tool" style="padding:3px;height:auto">
	<div style="padding: 2px">
	    <form id="picform" >
	            公告标题:<input type="text" name="title">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" plain="true"
			id="pic_search">查询</a>
	    </form>
	</div>
	<div>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
		    id="picmanage_del">删除</a>
	</div>
</div>

