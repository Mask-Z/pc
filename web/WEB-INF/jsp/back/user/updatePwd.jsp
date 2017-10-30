<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>

<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">

<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-validtype.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easyui-valid-ext.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>

</head>
<script type="text/javascript">
	var flag = "${flag}";
	if(flag == "success"){//保存成功的回传
		parent.$.messager.alert("提示", "保存成功");
		parent.closeWindow("#w1");
	}else if(flag=="fail"){
	    parent.$.messager.alert("提示", "${msg}");
	}
	$(function() {
		$("#user_pwd_save").click(function() {
			if($("#userPWDForm").form('validate')){
				$("#userPWDForm").submit();
			}
		});
	});
</script>
<div class="easyui-layout" fit="true">
	  <div class="div_add" data-options="region:'center',border:false">
	  	   <form id="userPWDForm" method="post" enctype="multipart/form-data" action="<%=basePath%>user/updatePassword">
		        <a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="user_pwd_save">保存</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:parent.$('#w1').window('close');">取消</a>
		        <table align="center" border="0" width="99%">
		    		<tr>
		    		    <input type="hidden" name="loginname" value="${loginname}"/>
		    			<td width="20%" >旧密码(<span style="color: red;">*</span>)：</td>
		    			<td width="80%" >
			    			<input id="oldpass" name="oldpassword" type="password" class="easyui-textbox"  
			    			 data-options="required:true" style="width:80%;"  />
		    			</td>
		    		</tr>
		    		<tr>
		    			<td  >新密码(<span style="color: red;">*</span>)：</td>
		    			<td >
			    			<input id="pass"  name="pwd" type="password" class="easyui-textbox" 
			    			data-options="required:true" style="width:80%;"  />
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>确认新密码(<span style="color: red;">*</span>)：</td>
		    			<td>
			    			<input  name="confirmpass" type="password" class="easyui-textbox"  data-options="required:true,validType:'confirmPass[\'#pass\']'" style="width:80%;"  />
		    			</td>
		    		</tr>
		    	</table>
		   </form>
	    </div>
	</div>

