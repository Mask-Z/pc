<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){ 
	getDatagrid("#s_role_dataGrid",{
		url:"role/gridList",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field : "id",checkbox : true},
		        {field : "name",title : "角色名",width : 100},
		        {field : "note",title : "描述",hidden:true}
		    ]],
		onClickRow: function(index,row){
			renderMenuTree(row.id);
		},
	    toolbar:[ {
			iconCls : "icon-add",
			text : "新增",
			handler : function() {
				openFormWin("add");
			}
		}, "-", {
			iconCls : "icon-edit",
			text : "修改/查看",
			handler : function() {
				openFormWin("update");
			}
		}, "-", {
			iconCls : "icon-cancel",
			text : "删除",
			handler : function() {
				var ids = "", checkedRows = $("table[data-id='s_role_dataGrid']").datagrid("getChecked");
				if(checkedRows.length==0){
					$.messager.show({ msg:"没有勾选需要操作的记录！", title: "系统提示"});
					return;
				}else{
					$.messager.confirm("确认对话框", "您确认要删除这些数据吗？", function(r){
						if (r){
							/**如果选择数>0，遍历结果数组，拼接成字符串传给后台**/
							var idArray = [];
							$.each(checkedRows,function(i,row){
								idArray.push(row.id);
							});
							ids = idArray.join(",");
							$.ajax({
								type : "post",
								dataType : "json",
								url : "role/delete",
								data : {ids:ids},
								success : function(data){
									/**显示后台返回的提示信息**/
									$.messager.show({ msg:"删除成功", title: "系统提示"});
									/**如果删除成功，刷新grid数据**/
									if(data.msg=='success'){
										$("#s_role_dataGrid").datagrid("reload");
									}
								}
							});
						}
					});
				}
			}
		}]
	});
	$("a[data-id='s_role_tree_save']").click(function(){
		if(!$("table[data-id='s_role_dataGrid']").datagrid("getSelected")){
			$.messager.show({ msg:"请选择你要分配的角色！", title: "系统提示"});
		}
		var roleId = $("table[data-id='s_role_dataGrid']").datagrid("getSelected").id;
		/**选择的节点**/
		var nodes = [];
		var checkNodes = $("ul[data-id='s_role_menutree']").tree('getChecked', ['checked','indeterminate']);	
		for(var i=0;i<checkNodes.length;i++){
			nodes.push(checkNodes[i].id);
		}
		$.ajax({
			type : "post",
			dataType : "json",
			url : "role/saveRelate",
			data : {
				menuIds : nodes.join(","),
				roleId : roleId
			},
			success : function(data){
				/**显示后台返回的提示信息**/
				$.messager.show({ msg:"保存成功", title: "系统提示"});
			}
		});
	});
	function openFormWin(type){
		var title="新增";
		var selectRow;
		var id="";
		if(type=="update"){
			title="修改";
			selectRow=$("table[data-id='s_role_dataGrid']").datagrid("getSelected");
			if(!selectRow){
				$.messager.show({ msg:"选择一条需要操作的数据!", title: "系统提示"});
				return;
			}else{
				id=selectRow.id;
			}
		}
		showWindow("#w1",{
			title : title,
			width : 250,
			height : 200,
			content:"<iframe src='role/openFormWin?id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
		});
	}
	function renderMenuTree(roleId) {
		$("ul[data-id='s_role_menutree']").tree({
			url : "menu/initmenus?pid=0",
			method : "post",
			animate : true,
			cascadeCheck :true,//是否允许级联选中
			checkbox : true,
			onLoadSuccess:function(){
				$.ajax({
					type : "post",
					dataType : "json",
					url : "role/queryMenusByRoleid",
					data : {roleId:roleId},
					success : function(data){
						if(data.length!=0){
							var menus = data;
							/**循环打勾checkbox**/
							for(var i =0;i<menus.length;i++){
								var menuNode =$("ul[data-id='s_role_menutree']").tree("find",menus[i].menuid);
								if(menuNode!=null&&$("ul[data-id='s_role_menutree']").tree("isLeaf",menuNode.target)){
									$("ul[data-id='s_role_menutree']").tree("check",menuNode.target);
								}
							}
						}
					}
				});
			}
	});
}
});


</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'west',border:false,collapsible:true,title:'角色列表'" style="width:300px;">
		<table id="s_role_dataGrid" data-id="s_role_dataGrid"></table>
	</div>

	<div data-options="region:'center',border:true,collapsible:false,title:'菜单选择'">
		<div class="easyui-layout" data-options="fit:true,border:true">
			<div data-options="region:'center',border:false" style="padding:10px">
			    <ul id="s_role_menutree" data-id="s_role_menutree" class="easyui-tree" ></ul>
			</div>
			<div data-options="region:'south',border:false" style="height:26px;text-align:center;background-color:#DCDCDC;">
				<a data-id="s_role_tree_save" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a> 
			</div>
		</div>
	</div>
</div>

