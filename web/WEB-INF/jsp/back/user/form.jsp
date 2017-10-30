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
<script type="text/javascript" src="<%=basePath%>js/easyui-valid-ext.js"></script>
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
		parent.$("#userlist_table").datagrid("reload");
		parent.closeWindow("#w1");
	}
	$(function() {
		$("#user_save").click(function() {
			if($("#user_addform").form('validate')){
				$("#user_addform").submit();
			}
		});
	});
	function checkUserCode(value){
		var id=$("#user_id").val();
		$.ajax({
			url :"<%=basePath%>user/checkUserCode",
			type : 'POST',
			dataType : 'json',
			data : { loginname : value,id:id },
			success : function(data) {
				if(data>0){
					$("#accountusercodemsg").html("用户名已被占用");
					$("#user_save").linkbutton({
						disabled: true
					});
				}else{
					$("#accountusercodemsg").html("");
					$("#user_save").linkbutton({
						disabled: false
					});
				}
			}
		});
	}
</script>

<form id="user_addform" style="margin: 5px 5px;" method="post" enctype="multipart/form-data" action="<%=basePath%>user/save">
	<input type="hidden" id="user_id" name="id" value="${user.id}">
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="user_save">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:parent.$('#w1').window('close');">取消</a>
	<div class="sztab">
		<table id="user_addtable">
			<tr>
				<td>登录名</td>
				<td><input type="text" id="loginname" name="loginname" class="easyui-textbox" data-options="required:true,onChange:checkUserCode" value="${user.loginname }" />
				<span id="accountusercodemsg" style="color:red;"></span>
				</td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><input type="text"  name="name" class="easyui-textbox" data-options="required:true" value="${user.name }" />
				</td>
			</tr>
			<tr>
    			<td>角色(<span style="color: red;">*</span>)：</td>
    			<td>
    			     <input  class="easyui-combobox" name="role_id" value="${user.role_id }" data-options="required:true,multiple:false,editable:false,url:'<%=basePath %>role/comboData',textField:'name',valueField:'id'">
    			</td>
		    </tr>
		</table>
	</div>
</form>

