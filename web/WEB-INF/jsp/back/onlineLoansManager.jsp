<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){
	getDatagrid("#onlineLoansList_table",{
		url:"system/onlineLoansList",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field:'id',title:'全选',checkbox:true},
		        {field:'applytime_str',title:'申请时间',width:80,align:'left'},
//		        {field:'biaodiname',title:'申请标的',width:80,align:'left'},
		        {field:'biaodiname',title:'申请标的',width:80,align:'left',
                    formatter: function(value,row,index){
						return '<a href=\"'+row.biaodiurl+'\" target=\"_blank\">'+value+'</a>';

                    }
				},
		        {field:'applyname',title:'联系人',width:80,align:'left'},
		        {field:'applytel',title:'电话',width:80,align:'left'},
		        {field:'applyaddress',title:'地址',width:80,align:'left'},
		        {field:'status',title:'状态',width:80,align:'left',
		        	formatter: function(value,row,index){
						if (value=="0"){
							return "<font color='red'>待联系</font>";
						} else if (value=="1") {
							return "<font color='blue'>已联系</font>";
						}else if (value=="2") {
                            return "<font color='green'>完成</font>";
                        }
					}
		        },
            {field:'remark',title:'备注',width:80,align:'left'},
			{field:'operation',title:'操作',width:80,align:'center',
		        	formatter: function(value,row,index){
		        		var str = "";
						str += '<a href="javascript:;" style="color: green" onClick = "editOnlineLoans('+row.id+');">更新</a>';
//		            	str += '&nbsp;&nbsp;';
//		            	str += '&nbsp;&nbsp;';
//		            	str += '<a href="javascript:;"  style = "color:#b8110d;" onClick = "delOnlineLoans('+row.id+');">删除</a>';
		            	return str;
		  			}
		        }
		    ]],
		    toolbar:"#entrustmanage_tool"
	});


//	$("#onlineLoans_del").click(function(){
//		var select = $("#onlineLoansList_table").datagrid("getSelections");
//
//		var id="";
//		for(var i=0;i<select.length;i++){
//			if(id!=""){
//				id+=",";
//			}
//			id += select[i].id;
//		}
//		if(id==""){
//			$.messager.alert("提示", "请至少选择一条要删除的数据！","info");return;
//		}
//		$.messager.confirm("提示", "确认删除选择的数据吗?",function(r){
//			if(r){
//				$.ajax({
//					type : "post",
//					url : "system/entrustDel",
//					dataType: "json",
//					data : "id="+id,
//					method : "post",
//					success : function(data) {
//						$.messager.alert("提示", data.msg,"info");
//						$("#onlineLoansList_table").datagrid('reload');
//					}
//				});
//			}
//		});
//	});
//    $('#search_start').datebox({
//        onSelect: function(date){
//            alert(date.getFullYear()+":"+(date.getMonth()+1)+":"+date.getDate());
//        }
//    });
	$("#entrust_search").click(function (){
	    var search_start=$("#search_start").datebox("getValue");
	    var search_end=$("#search_end").datebox('getValue');
	    var search_status=$("#search_status").val();
		$("#onlineLoansList_table").datagrid("load",{
            applyname:$("#search_entrusttitle").val(),
            status:search_status,
            search_start:search_start,
            search_end:search_end
		});
	});

    $("#cancel_search").click(function (){
        $('#search_start').datebox('setValue', '');
        $('#search_end').datebox('setValue', '');
        $("#search_status").val("");
        $("#search_entrusttitle").val("");
    });

});
function editOnlineLoans(id){
   	showWindow("#w1",{
			title : "更新信息",
			width : 900,
			height : 600,
			content:"<iframe src='system/onlineLoansForm?id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
	});
}
//function delOnlineLoans(id){
//	$.messager.confirm("提示", "确认删除选择的数据吗?",function(r){
//			if(r){
//				$.ajax({
//					type : "post",
//					url : "system/entrustDel",
//					dataType: "json",
//					data : "id="+id,
//					method : "post",
//					success : function(data) {
//						$.messager.alert("提示", data.msg,"info");
//						$("#onlineLoansList_table").datagrid('reload');
//					}
//				});
//			}
//		});
//}

</script>
	<table id="onlineLoansList_table"  >

	</table>

<div id="entrustmanage_tool" style="padding:3px;height:auto">
    <div style="padding: 2px">
      申请日期&nbsp;&nbsp;<input id="search_start" type="text" class="easyui-datebox" required="required">
        &nbsp;-&nbsp;<input id="search_end" type="text" class="easyui-datebox" required="required">
    </div>
    <div style="padding: 2px">
        状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <select type="text" id="search_status">
        <option value="">请选择</option>
        <option value="0">待联系</option>
        <option value="1">已联系</option>
        <option value="2">完成</option>
    </select>
    </div>
	<div style="padding: 2px">
	关键词&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="search_entrusttitle" placeholder=" 标的名称/姓名/电话号码">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" plain="true"
			id="entrust_search">查询</a>
        <a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" plain="true"
			id="cancel_search">清除</a>

	</div>
	<%--<div>--%>
		<%--<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" plain="true"--%>
			<%--id="onlineLoans_del">删除</a>--%>

	<%--</div>--%>
</div>

