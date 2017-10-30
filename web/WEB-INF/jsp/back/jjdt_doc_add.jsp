<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">

<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-validtype.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<style>
<!--
tr {
	height: 30px;
}
td{
  text-align: left;
}
-->
</style>
<script type="text/javascript">
	var msg = "${msg}";
	if(msg == "success"){//保存成功的回传
		parent.$.messager.alert("提示", "保存成功");
		parent.$("#jjdtdoc_table").datagrid("reload");
		parent.closeWindow("#w1");
	}else if(msg != ""){
		parent.$.messager.alert("提示", msg);
	}
	$(function(){
		$("#jjdtdoc_add").click(function() {
			var orderno = $("#order_no").val();
			if(!orderno || orderno < 1 || orderno > 5){
				$.messager.alert("提示", "排序只能输入1到5的正整数！","info");
			}else{
				if($("#jjdtdoc_addform").form('validate')){
					$("#jjdtdoc_addform").submit();
				}
			}			
		});
	});
</script>

<form id="jjdtdoc_addform" style="margin: 5px 5px;" method="post" enctype="multipart/form-data" action="<%=basePath%>system/jjdt_doc_save">
	<input type="hidden" id="jjdtdoc_id" name="id" value="${jjdtDoc.id}">
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="jjdtdoc_add">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:parent.$('#w1').window('close');">取消</a>
	<div class="sztab">
		<table id="jjdtdoc_addtable">
			<tr>
				<td>标题</td>
				<td><input type="text" name="title" class="easyui-textbox" requireds="true" value="${jjdtDoc.title }" style="width:100%;"/>
				</td>
			</tr>
			<tr>
				<td>链接</td>
				<td style="text-align: left">
					<input type="text" name="linkurl" value="${jjdtDoc.linkurl }" style="width:100%;"/>
				</td>
			</tr>
			<tr>
				<td>排序</td>
				<td><input type="text" id="order_no" name="order_no" class="easyui-numberbox" value="${jjdtDoc.order_no }" data-options="validType:'digist'"/>(整数数字，越大越靠前显示)
				</td>
			</tr>
			<tr>
				<td>infoid</td>
				<td><input type="text" name="infoid" value="${jjdtDoc.infoid }" style="width:100%;"/>
				</td>
			</tr>
			<tr>
				<td>是否发布</td>
				<td>
					<input id="isShow" name="isShow" class="easyui-switchbutton" data-options="onText:'发布',offText:'待发布'" 
					 <c:if test="${type=='add'}">
					  checked
					 </c:if>
					 <c:if test="${type=='edit'}">
					 	<c:if test="${jjdtDoc.state==1}">
					   		checked
					 	</c:if>
					 </c:if>
					>
				</td>
			</tr>
		</table>
	</div>
</form>