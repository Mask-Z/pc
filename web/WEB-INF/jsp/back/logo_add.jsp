<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
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
            var pic=$("#pic").val();
            var bigpic=$("#bigpic").val();
            if(typeof FileReader != 'undefined'){
                var file = document.getElementById("file").files[0];
                var file2 = document.getElementById("file2").files[0];
                if ( typeof pic == 'undefined' || pic==null){
                    if (typeof file =='undefined' ||file==null || (file.type).indexOf("image/")==-1){
                        alert("请上传标题图片!");
                        return;
					}
				}
                if ( typeof bigpic == 'undefined' || bigpic==null){
                    if (typeof file2 =='undefined' ||file2==null || (file2.type).indexOf("image/")==-1){
                        alert("请上传标的默认图片!");
                        return;
                    }
                }
//                if((typeof file =='undefined' || (file.type).indexOf("image/")==-1)&& typeof ($("#pic").val()) == 'undefined'){
//                    alert("请上传标题图片!");
//                    return;
//                }
//                if((typeof file2 =='undefined' || (file2.type).indexOf("image/")==-1)&& typeof ($("#bigpic").val()) == 'undefined'){
//                    alert("请上传标的默认图片!");
//                    return;
//                }
            }else{
                if ( typeof pic == 'undefined' || pic==null) {
                    var fileName = document.getElementById("file").value;
                    var suffixIndex = fileName.lastIndexOf(".");
                    var suffix = fileName.substring(suffixIndex + 1).toUpperCase();
                    if (suffix != "BMP" && suffix != "JPG" && suffix != "JPEG" && suffix != "PNG" && suffix != "GIF") {
                        alert("标题图片格式错误,请上传图片（格式如BMP、JPG、JPEG、PNG、GIF等）!");
                        return;
                    }
                }
                if ( typeof bigpic == 'undefined' || bigpic==null) {
                    var fileName2 = document.getElementById("file").value;
                    var suffixIndex2 = fileName2.lastIndexOf(".");
                    var suffix2 = fileName2.substring(suffixIndex2 + 1).toUpperCase();
                    if (suffix2 != "BMP" && suffix2 != "JPG" && suffix2 != "JPEG" && suffix2 != "PNG" && suffix2 != "GIF") {
                        alert("标的默认图片格式错误,请上传图片（格式如BMP、JPG、JPEG、PNG、GIF等）!");
                        return;
                    }
                }
            }

            if($("#ad_addform").form('validate')){
				$("#ad_addform").submit();
			}
		});
	});
</script>

<form id="ad_addform" style="margin: 5px 5px;" method="post" enctype="multipart/form-data" action="<%=basePath%>system/logo_save">
	<input type="hidden" id="ad_id" name="id" value="${ad.id}">
	<%--<input type="hidden" id="danweiName" name="danweiName" value="${ad.danweiName}">--%>
	<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="ad_save">保存</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:parent.$('#w1').window('close');">取消</a>
	<div class="sztab">
		<table id="logo_addtable">

			<tr>
				<td>机构名称</td>
				<td>
					<select id="jgmc" name="jgmc" class="easyui-combobox" style="width: 155px;" data-options="editable:false">
						<c:forEach items="${orgList}" var="map">
							<option value="${map.orgId}" <c:if test="${map.orgId eq ad.jgmc }">selected</c:if> >${map.orgName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>

			<tr>
				<td>标题图片</td>
				<td>
					<input type="file" name="file" id="file" requireds="true" accept="image/*"/>
					<c:if test="${ad.pic != null or ad.pic eq ''}">
						<input type="hidden" name="pic" value="${ad.pic}" id="pic"/>
						<img src="<%=basePath%>upload/ad/${ad.pic}" style="width: 50px;height: 50px;" align="middle"/>
					</c:if>
			 	</td>
			</tr>

			<tr>
				<td>标的默认图片</td>
				<td>
					<input type="file" name="file2" id="file2" accept="image/*"/>
					<c:if test="${ad.bigpic != null or ad.bigpic eq ''}">
						<input type="hidden" name="bigpic" value="${ad.bigpic}" id="bigpic"/>
						<img src="<%=basePath%>${ad.bigpic}" style="width: 50px;height: 50px;" align="middle"/>
					</c:if>
				</td>
			</tr>

			<tr>
				<td>单位地址</td>
				<td><input type="text" name="danweiAddress" class="easyui-textbox" requireds="true" value="${ad.danweiAddress }" />
				</td>
			</tr>
			<tr>
				<td>显示顺序</td>
				<td><input type="text" name="order_no" class="easyui-numberbox" value="${ad.order_no }" data-options="validType:'digist'"/>(整数数字，越大越靠前显示)
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