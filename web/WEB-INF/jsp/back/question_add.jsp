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
		parent.$("#questionlist_table").datagrid('reload');
		parent.$.messager.alert("提示", "保存成功");
		parent.closeWindow("#w1");
	}
	$(function() {
        $("#question_save").click(function() {
	        if($("#question_addform").form('validate')){
	        	$("#question_addform").submit();
	        }
		});
	});
</script>

<form id="question_addform" style="margin: 5px 5px;" method="post"  action="questionSave">
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="question_save">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:parent.$('#w1').window('close');">取消</a>
	<div class="sztab">
		<table id="question_addtable">
			<tr>
				<td>标题</td>
				<td>
				   <input id="id" type="hidden" name="id" value="${question.id }"/>
				   <input id="title" name="title" class="easyui-textbox" data-options="required:true" value="${question.title }"  style="width:80%;"/>
				</td>
			</tr>
			<tr>
				<td>关键字</td>
				<td>
				 <input id="key_word"  name="key_word" class="easyui-textbox" data-options="required:true"  value="${question.key_word }"  style="width:80%;"/>
				</td>
			</tr>
			<tr>
				<td>显示顺序</td>
				<td>
				 <input id="order_no" name="order_no" class="easyui-numberbox" data-options="required:false" value="${question.order_no }"  />
				</td>
			</tr>
			<tr>
				<td>产权类别</td>
				<td>
					<input id="type" name="type" class="easyui-combobox" data-options="required:true, multiple:true,url:'<%=basePath %>system/question/cqType',valueField:'itemValue',textField:'itemText',editable:false" 
					 style="width:80%;" value="${question.type }"/>
				 </td>
			</tr>
			<tr>
				<td>是否显示</td>
				<td>
					<input id="isShow" name="isShow" class="easyui-switchbutton" data-options="onText:'启用',offText:'禁用'" 
					<c:if test="${type=='add'}">
					  checked
					 </c:if>
					 <c:if test="${type=='edit'}">
					 	<c:if test="${question.state==1}">
					   		checked
					 	</c:if>
					 </c:if>
					>
				 </td>
			</tr>
			<tr>
				<td>描述</td>
				<td style="text-align: left">
					<textarea name="content" cols="100" rows="8" style="width:95%;height:350px;visibility:hidden;">${question.content }</textarea>
				</td>
			</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
  var resroot = "<%=basePath%>";//用到UEDITOR的地方必须配置
</script>
<link rel="stylesheet" href="<%=basePath%>kindeditor-4.1.11/themes/default/default.css" />
<link rel="stylesheet" href="<%=basePath%>kindeditor-4.1.11/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=basePath%>kindeditor-4.1.11/kindeditor-all.js"></script>
<script charset="utf-8" src="<%=basePath%>kindeditor-4.1.11/lang/zh-CN.js"></script>
<script charset="utf-8" src="<%=basePath%>kindeditor-4.1.11/plugins/code/prettify.js"></script>
<script>
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="content"]', {
			cssPath : '<%=basePath%>kindeditor-4.1.11/plugins/code/prettify.css',
			uploadJson : '<%=basePath%>fileUpload',
			fileManagerJson : '<%=basePath%>fileManager',
			allowFileManager : true,
			afterCreate : function() {
// 				var self = this;
// 				K.ctrl(document, 13, function() {
// 					self.sync();
// 					document.forms['example'].submit();
// 				});
// 				K.ctrl(self.edit.doc, 13, function() {
// 					self.sync();
// 					document.forms['example'].submit();
// 				});
			},
			afterBlur: function(){this.sync();}
		});
		prettyPrint();
	});
</script>