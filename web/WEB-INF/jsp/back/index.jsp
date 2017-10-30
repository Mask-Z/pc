<%@ page contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>

<title></title>
<jsp:include page="/WEB-INF/jsp/portal/mate.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
	<script type="text/javascript" src="<%=basePath%>html/js/jquery-1.7.2.min.js"></script>
<%--<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js"></script>--%>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-validtype.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>

</head>
<script type="text/javascript">
	$(function() {
		var mytab = $('#tabs');
		$("#tree")
				.tree(
						{
							onClick : function(node) {
								if (node.url ) {
									if (mytab.tabs('exists', node.text)) {
										mytab.tabs('select', node.text);
										var current_tab = mytab.tabs('getSelected');
										current_tab.panel('refresh');
									} else {
										mytab.tabs('add', {
											cache :false,
											title : node.text,
											href : node.url,
											closable : true
										});
									}

								} else
									$(this).tree('toggle', node.target);
							},
							url : 'menu/initmenusByUser',
							onLoadError : function(XMLHttpRequest, textStatus,
									errorThrown) {
								alert(XMLHttpRequest.responseText);
							}
						});

	});
	function updatePwd(){
		showWindow("#w1",{
			title : "修改密码",
			width : 500,
			height : 300, 
			content:"<iframe src='user/openUpdatePwdFormWin' style='width:100%;height:100%;' frameborder='0'></iframe>"
		});
	}
	function logout(){
		$.messager.confirm("提示","确定要注销吗？",function(r){
			if(r){
				location.href='sysexit';
			}
		});
	}
</script>

<body class="easyui-layout">
	<div data-options="region:'north',border:true"
		style="height:67px;padding:0px;background: url(images/yunwei-logo.jpg) no-repeat left top;" class="head">
		
		
		<div style="width:100%;text-align:right;height:65px;line-height:65px;">
		${user.name },你好！&nbsp;&nbsp;&nbsp;&nbsp;
		<a onclick="updatePwd();" style="cursor:pointer;">修改密码</a>&nbsp;&nbsp;
		<a onclick="logout();"  style="cursor:pointer;">注销</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>

	<div data-options="region:'west',split:true,title:'菜单'"
		style="width:200px;padding:0px;">

		<ul id="tree" class="easyui-tree"></ul>
	</div>


	<div data-options="region:'center',title:'',border:true">
		<div id="tabs" class="easyui-tabs" style="width:auto;" fit="true">

		</div>

	</div>

	<div id="w1"
		style="background:url('<%=basePath%>images/bg-header.png?07a751e') repeat-x scroll 0 0 #FFFFFF;">

	</div>
	<div id="w2"
		style="background:url('<%=basePath%>images/bg-header.png?07a751e') repeat-x scroll 0 0 #FFFFFF;">

	</div>
	<div id="w3"
		style="background:url('<%=basePath%>images/bg-header.png?07a751e') repeat-x scroll 0 0 #FFFFFF;">

	</div>
	
	<div id="w4"
		style="background:url('<%=basePath%>images/bg-header.png?07a751e') repeat-x scroll 0 0 #FFFFFF;">

	</div>
	
	<div id="w5"
		style="background:url('<%=basePath%>images/bg-header.png?07a751e') repeat-x scroll 0 0 #FFFFFF;">

	</div>
</body>
</html>
