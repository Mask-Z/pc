<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){
	getDatagrid("#logo_list_table",{
		url:"system/logoList",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field:'id',title:'全选',checkbox:true},
		        {field:'danweiName',title:'机构名称',width:80,align:'left'},
		        {field:'pic',title:'标题图片',width:80,align:'left',
		        	formatter:function(v,r,index){
		        		if(v!=null&&v!=''){
		        			return "<img src='<%=basePath%>upload/ad/"+v+"' style='width: 50px;height: 50px;' align='middle'/>";
		        		}
		        	}
		        },
            {field:'bigpic',title:'标的默认图片',width:80,align:'left',
                formatter:function(v,r,index){
                    if(v!=null&&v!=''){
                        return "<img src='<%=basePath%>"+v+"' style='width: 50px;height: 50px;' align='middle'/>";
                    }
                }
            },
		        {field:'danweiAddress',title:'单位地址',width:80,align:'left'},
		        {field:'order_no',title:'显示顺序',width:80,align:'left'},
		        {field:'operation',title:'操作',width:80,align:'center',
		        	formatter: function(value,row,index){
		        		var str = "";
		        		str += '<a href="javascript:;" class = "green" onClick = "editad('+row.id+');">编辑</a>';
		            	str += '&nbsp;&nbsp;';
//		            	if(row.use_state==0){
//		            		str += '<a href="javascript:;" class = "green" onClick = "">启用</a>';
//		            	}else if(row.use_state==1){
//		            		str += '<a href="javascript:;" class = "red" onClick = "">禁用</a>';
//		            	}
		            	str += '&nbsp;&nbsp;';
		            	return str;
		  			}
		        }
		    ]],
		    toolbar:"#ad_manage_tool"
	});

	$("#logomanage_add").click(function(){
		showWindow("#w1",{
			title : "新增logo",
			width : 900,
			height :500,
			content:"<iframe src='system/logo_add' style='width:100%;height:440px;' frameborder='0' scrolling='yes'></iframe>"
		});
	});

	$("#logomanage_del").click(function(){
		var select = $("#logo_list_table").datagrid("getSelections");
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
					url : "system/logo_del",
					dataType: "json",
					data : {ids:ids},
					method : "post",
					success : function(data) {
						$.messager.alert("提示", data.msg,"info");
						$("#logo_list_table").datagrid('reload');
					}
				});
			}
		});
	});

	$("#usersearch").click(function (){
		$("#logo_list_table").datagrid("load",{
			name:$("#search_user_name").val()
		});
	});

	//查询
	$("#ad_search").click(function(){
		var data = getFormData($("#adserform"));
		$("#logo_list_table").datagrid("reload",data);
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
var editad=function(adid){
	showWindow("#w1",{
		title : "修改Logo",
		width : 900,
		height : 500,
		content:"<iframe src='system/logo_add?id="+adid+"' style='width:100%;height:440px;' frameborder='0'></iframe>"
	});
}
</script>
	<table id="logo_list_table"  >

	</table>

<div id="ad_manage_tool" style="padding:3px;height:auto">
	<div style="padding: 2px">
	<form id="adserform" >
	标题:<input type="text" name="danweiName">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" plain="true"
			id="ad_search">查询</a>
	</form>
	</div>
	<div>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			id="logomanage_add">新增</a>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
		id="logomanage_del">删除</a>
	</div>
</div>

