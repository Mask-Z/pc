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
		parent.$("#link_list_table").datagrid("reload");
		parent.closeWindow("#w1");
	}
	$(function() {
		$("#link_save").click(function() {
			if($("#link_addform").form('validate')){
				$("#link_addform").submit();
			}
		});
	});
</script>

<form id="link_addform" style="margin: 5px 5px;" method="post" enctype="multipart/form-data" action="<%=basePath%>system/link_save">
	<input type="hidden" id="link_id" name="id" value="${link.id}">
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="link_save">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:parent.$('#w1').window('close');">取消</a>
	<div class="sztab">
		<table id="link_addtable">
			<tr>
				<td>公司名称</td>
				<td><input type="text" name="name" class="easyui-textbox" requireds="true" value="${link.name }" />
				</td>
			</tr>
			<tr>
				<td>公司logo</td>
				<td>
					<input type="file" name="file" id="file" />
					<c:if test="${link.image != null or link.image eq ''}">
						<input type="hidden" name="image" value="${link.image}"/>
						<img src="<%=basePath%>upload/link/${link.image}" style="width: 50px;height: 50px;" align="middle"/>
					</c:if>
			 	</td>
			</tr>
			<tr>
				<td>外链地址</td>
				<td style="text-align: left">
					<input type="text" name="url" value="${link.url }" />
				</td>
			</tr>
			<tr>
				<td>显示顺序</td>
				<td><input type="text" name="order_no" class="easyui-numberbox" value="${link.order_no }" data-options="validType:'digist'"/>(整数数字，越大越靠前显示)
				</td>
			</tr>
		</table>
	</div>
</form>