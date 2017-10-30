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
		parent.$("#ehelp_list_table").datagrid("reload");
		parent.closeWindow("#w1");
	}
	$(function() {
		$("#ehelp_save").click(function() {
			if($("#ehelp_addform").form('validate')){
			    var projectTypes = $("#ehelp_projectType").combobox("getValues"); 
			    $("#projectTypes").val(projectTypes);
			    var nodes = $("#ehelp_city").combotree('tree').tree("getChecked");  
			    var citys = "";			     
			    for(var i=0;i<nodes.length;i++){
			        if(i==nodes.length-1){
			            citys = citys + nodes[i].id;
			        }else{
			            citys = citys + nodes[i].id + ",";
			        }			        
			    }
			    $("#citys").val(citys);
			    $("#ehelp_addform").submit();
			}
		});
		
		$("#ehelp_city").combotree({      
            url: "getCitys?citys="+"${ehelp.ehelp_city}",  
            onlyLeafCheck: true,
            multiple: true,
            required:true,
            loadFilter: function(data){
                return data;        
            }       
        }); 
        
        var types = "${ehelp.ehelp_projectType}"+"";      
        if(types != ""){
            $("#ehelp_projectType").combobox("setValues",types.split(","));      
        }
	});
</script>

<form id="ehelp_addform" style="margin: 5px 5px;" method="post" enctype="multipart/form-data" action="<%=basePath%>system/ehelp_save">
	<input type="hidden" id="e_id" name="id" value="${ehelp.id}">
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="ehelp_save">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:parent.$('#w1').window('close');">取消</a>
	<div class="sztab">
		<table id="ehelp_addtable">
			<tr>
				<td>标题</td>
				<td><input type="text" name="title" class="easyui-textbox" requireds="true" value="${ehelp.title }" />
				</td>
			</tr>
			<tr>
				<td>标题图片</td>
				<td>
					<input type="file" name="file" id="file" />
					<c:if test="${ehelp.pic != null or ehelp.pic eq ''}">
						<input type="hidden" name="pic" value="${ehelp.pic}" id="pic"/>
						<img src="<%=basePath%>upload/ehelp/${ehelp.pic}" style="width: 50px;height: 50px;" align="middle"/>
					</c:if>
			 	</td>
			</tr>
			<tr>
				<td>地区</td>
				<td style="text-align: left">
					<ul id="ehelp_city" class="easyui-combotree" checkbox="true" data-options="lines:true" style="height:94%"></ul>  
					<input type="hidden" name="ehelp_city" id="citys" value="${ehelp.ehelp_city}">
				</td>
			</tr>
			<tr>
				<td>组织机构</td>
				<td style="text-align: left">
					<input type="text" name="org" value="${ehelp.org }" />
				</td>
			</tr>
			<tr>
				<td>价格</td>
				<td style="text-align: left">
					<input type="text" name="price" value="${ehelp.price }" />
				</td>
			</tr>
			<tr>
				<td>显示顺序</td>
				<td><input type="text" name="order_no" class="easyui-numberbox" value="${ehelp.order_no }" data-options="validType:'digist'"/>(整数数字，越大越靠前显示)
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
					 	<c:if test="${ehelp.state==1}">
					   		checked
					 	</c:if>
					 </c:if>
					>
				</td>
			</tr>
			<tr>
				<td>适用的产权交易类别</td>
				<td>
				    <select class="easyui-combobox" style="width: 100px;" multiple="multiple" id="ehelp_projectType">
						<c:forEach items="${projectTypes}" var="projectType">
                            <option value="${projectType.itemValue}">${projectType.itemText}</option>
                        </c:forEach>
					</select>
					<input type="hidden" name="ehelp_projectType" id="projectTypes" value="${ehelp.ehelp_projectType}">
				</td>
			</tr>
			<tr>
				<td>描述</td>
				<td style="text-align: left">
					<textarea name="content" cols="100" rows="8" style="width:95%;height:350px;visibility:hidden;">${ehelp.content }</textarea>
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