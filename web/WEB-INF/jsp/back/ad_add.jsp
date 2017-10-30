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
		parent.$("#ad_list_table").datagrid("reload");
		parent.closeWindow("#w1");
	}
	$(function() {
		$("#ad_save").click(function() {
			if($("#ad_addform").form('validate')){
				$("#ad_addform").submit();
			}
		});
	});
</script>

<form id="ad_addform" style="margin: 5px 5px;" method="post" enctype="multipart/form-data" action="<%=basePath%>system/ad_save">
	<input type="hidden" id="ad_id" name="id" value="${ad.id}">
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="ad_save">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:parent.$('#w1').window('close');">取消</a>
	<div class="sztab">
		<table id="ad_addtable">
			<tr>
				<td>标题</td>
				<td><input type="text" name="title" class="easyui-textbox" requireds="true" value="${ad.title }" />
				</td>
			</tr>
			<tr>
				<td>标题图片</td>
				<td>
					<input type="file" name="file" id="file" />
					<c:if test="${ad.pic != null or ad.pic eq ''}">
						<input type="hidden" name="pic" value="${ad.pic}" id="pic"/>
						<img src="<%=basePath%>upload/ad/${ad.pic}" style="width: 50px;height: 50px;" align="middle"/>
					</c:if>
			 	</td>
			</tr>
			<tr>
				<td>外链地址</td>
				<td style="text-align: left">
					<input type="text" name="url" value="${ad.url }" />
				</td>
			</tr>
			<tr>
				<td>展示时间</td>
				<td style="text-align: left">
					<input type="text" name="begin_time" value="${ad.begin_time }" class="easyui-datebox" data-options="editable:false,required:true"/>
					至<input type="text" name="end_time" value="${ad.end_time }" class="easyui-datebox" data-options="editable:false,required:true"/>
				</td>
			</tr>
			<tr>
				<td>显示位置</td>
				<td>
					<select name="adtype" class="easyui-combobox" style="width: 155px;" data-options="editable:false">
						<option value="1" <c:if test="${ad.adtype eq '1' }">selected</c:if> >首页大图</option>
						<option value="2" <c:if test="${ad.adtype eq '2' }">selected</c:if> >首页小图</option>
						<option value="3" <c:if test="${ad.adtype eq '3' }">selected</c:if> >重点项目</option>
						<option value="4" <c:if test="${ad.adtype eq '4' }">selected</c:if> >诚聘英才</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>显示顺序</td>
				<td><input type="text" name="order_no" class="easyui-numberbox" value="${ad.order_no }" data-options="validType:'digist'"/>(整数数字，越大越靠前显示)
				</td>
			</tr>
			<tr>
				<td>是否启用</td>
				<td>
					<input id="isShow" name="isShow" class="easyui-switchbutton" data-options="onText:'启用',offText:'禁用'" 
					 <c:if test="${type=='add'}">
					  checked
					 </c:if>
					 <c:if test="${type=='edit'}">
					 	<c:if test="${ad.state==1}">
					   		checked
					 	</c:if>
					 </c:if>
					>
				</td>
			</tr>
			<tr>
				<td>描述</td>
				<td style="text-align: left">
					<textarea name="content" cols="100" rows="8" style="width:95%;height:350px;visibility:hidden;">${ad.content }</textarea>
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