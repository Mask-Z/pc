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
		parent.$("#s_role_dataGrid").datagrid("reload");
		parent.closeWindow("#w1");
	}
	$(function() {
		$("#s_role_save").click(function() {
			if($("#s_role_form").form('validate')){
				$("#s_role_form").submit();
			}
		});
	});
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',bodyCls:'panel-noscroll',border:false" >
		<form id="s_role_form" data-id="s_role_form" method="post" action="<%=basePath%>role/save">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="s_role_save">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:parent.$('#w1').window('close');">取消</a>
				<input name="id" value="${role.id }" type="hidden"></input>
				<table cellpadding="4">
					<tr>
						<td class="queryFormLabel">角色名&nbsp;(<span style="color:red">*</span>):
						</td>
						<td><input class="easyui-textbox"  value="${role.name }" type="text" name="name" data-options="required:true,validType:'length[0,20]'"></input></td>
					</tr>
					<tr>
						<td class="queryFormLabel">描述:</td>
						<td><input class="easyui-textbox" value="${role.note }" name="note" data-options="multiline:true" style="height:60px"></input></td>
					</tr>
				</table>
		</form>
	</div>
</div>