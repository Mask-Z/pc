<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){ 
	getDatagrid("#jjdtdoc_table",{
		url:"system/jjdt_doc_list",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field:'id',title:'全选',checkbox:true},
		        {field:'title',title:'标题',width:80,align:'left'},
		        {field:'linkurl',title:'链接',width:80,align:'left'},
		        {field:'pub_time',title:'发布时间',width:80,align:'left'},
		        {field:'state',title:'状态',width:80,align:'left',
		        	formatter: function(value,row,index){
						if (value=="0"){
							return "<font color='red'>待发布</font>";
						} else if (value=="1") {
							return "<font color='blue'>已发布</font>";
						}
					}
		        },
		        {field:'click',title:'点击数',width:80,align:'left'},		   
		        {field:'operation',title:'操作',width:80,align:'center',
		        	formatter: function(value,row,index){
		        		var str = "";
		        		str += '<a href="javascript:;" class="green" onClick="editjjdtdoc('+row.id+');">编辑</a>';
		            	str += '&nbsp;&nbsp;';
		            	if(row.state==0){
		            		str += '<a href="javascript:;" class="green" onClick="pubjjdtdoc('+row.id+');">发布</a>';
		            	}else if(row.state==1){
		            		str += '<a href="javascript:;" class="red" onClick="recalljjdtdoc('+row.id+');">撤回发布</a>';
		            	}
		            	str += '&nbsp;&nbsp;';
		            	return str;
		  			}	
		        }
		    ]],
		    toolbar:"#jjdtdoc_manage_tool"
	});
	
	$("#jjdtdoc_add").click(function(){
		showWindow("#w1",{
			title : "新增竞技大厅文字链",
			width : 675,
			height : 450, 
			content:"<iframe src='system/jjdt_doc_add' style='width:100%;height:100%;' frameborder='0'></iframe>"
		});
	});
	
	$("#jjdtdoc_del").click(function(){
		var select = $("#jjdtdoc_table").datagrid("getSelections");
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
					url : "system/jjdt_doc_del",
					dataType: "json",
					data : {ids:ids},
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#jjdtdoc_table").datagrid('reload');
					}
				});
			}
		});
	}); 
	
	//查询
	$("#jjdtdoc_search").click(function(){
		var data = getFormData($("#jjdtdocform"));
		$("#jjdtdoc_table").datagrid("reload",data);
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
var editjjdtdoc=function(jjdtdocid){
	showWindow("#w1",{
		title : "修改竞价大厅文字链",
		width : 675,
		height : 450,
		content:"<iframe src='system/jjdt_doc_add?id="+jjdtdocid+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
	});
}

//发布竞价大厅文字链
var pubjjdtdoc=function(jjdtdocid){
	$.ajax({
		type : "post",
		url : "system/jjdt_doc_pub",
		dataType: "json",
		data : {id:jjdtdocid},
		method : "post",
		success : function(data) {
			$.messager.alert("提示", data.msg,"info");
			$("#jjdtdoc_table").datagrid('reload');
		}
	});
}

//撤回竞价大厅文字链
var recalljjdtdoc=function(jjdtdocid){
	$.ajax({
		type : "post",
		url : "system/jjdt_doc_recall",
		dataType: "json",
		data : {id:jjdtdocid},
		method : "post",
		success : function(data) {
			$.messager.alert("提示", data.msg,"info");
			$("#jjdtdoc_table").datagrid('reload');
		}
	});
}
</script>
<table id="jjdtdoc_table">	
</table>
<div id="jjdtdoc_manage_tool" style="padding:3px;height:auto">
	<div style="padding: 2px">
	    <form id="jjdtdocform" >
	            标题:<input type="text" name="title">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" plain="true"
			id="jjdtdoc_search">查询</a>
	    </form>
	</div>
	<div>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			id="jjdtdoc_add">新增</a>	
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
		    id="jjdtdoc_del">删除</a>
	</div>
</div>

