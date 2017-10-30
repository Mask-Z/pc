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
		parent.$("#onlineLoansList_table").datagrid('reload');
		parent.$.messager.alert("提示", "保存成功");
		parent.closeWindow("#w1");
	}
	$(function() {
        $("#onlineLoans_save").click(function() {
	        if($("#onlineLoans_addform").form('validate')){
	        	$("#onlineLoans_addform").submit();
	        }
		});
	});
</script>

<form id="onlineLoans_addform" style="margin: 5px 5px;" method="post"  action="onlineLoansSave">
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="onlineLoans_save">提交</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:parent.$('#w1').window('close');">取消</a>
	<div class="sztab">
		<table id="entrust_addtable">
			<%--<tr>--%>
				<%--<td>序号</td>--%>
				<%--<td>--%>
				   <input id="id" type="hidden" name="id" value="${onlineLoans.id }"/>
				<%--</td>--%>
			<%--</tr>--%>
			<tr>
				<td>状态</td>
				<td>
					<select name="status">
						<option value="0" <c:if test="${onlineLoans.status.equals('0')}">selected</c:if> >待联系</option>
					    <option value="1" <c:if test="${onlineLoans.status.equals('1')}">selected</c:if> >已联系</option>
					    <option value="2" <c:if test="${onlineLoans.status.equals('2')}">selected</c:if> >完成</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>说明</td>
				<td style="text-align: left">
					<textarea name="remark" cols="100" rows="8" style="width:95%;height:350px;visibility:hidden;">${onlineLoans.remark }</textarea>
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
		var editor1 = K.create('textarea[name="remark"]', {
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