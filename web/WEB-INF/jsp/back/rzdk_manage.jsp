<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
$(function(){
	getDatagrid("#rzdkList_table",{
		url:"system/zxdkApplyList",
		pageList:[15,20,30,40,50],
		columns:[[
		        {field:'id',title:'全选',checkbox:true},
		        {field:'create_time_str',title:'申请时间',width:80,align:'left'},
		        {field:'biaodi_name',title:'申请标的',width:80,align:'left',
                    formatter: function(value,row,index){
						return '<a href=\"'+row.biaodi_url+'\" target=\"_blank\">'+value+'</a>';

                    }
				},
		        {field:'shenqingren',title:'申请人',width:80,align:'left'},
		        {field:'lianxidianhua',title:'电话',width:80,align:'left'},
		        {field:'reviewinfo_shzt',title:'进度',width:80,align:'left',
		        	formatter: function(value,row,index){
						if (value===0){
							return "<font color='red'>初审</font>";
						} else if (value===1) {
							return "<font color='blue'>资料审核</font>";
                        } else if (value===2) {
                            return "<font color='blue'>合同签署</font>";
                        } else if (value===3) {
                            return "<font color='blue'>放款监管</font>";
                        } else if (value===4) {
                            return "<font color='blue'>产权变更</font>";
						}else if (value===5) {
                            return "<font color='blue'>线下打款</font>";
                        }else if (value===6) {
                            return "<font color='blue'>还款</font>";
                        }else if (value===7) {
                            return "<font color='green'>流程已完成</font>";
                        }
					}
		        },
            {field:'reviewinfo_shjg',title:'状态',width:80,align:'left',
                formatter: function(value,row,index){
                	if(row.reviewinfo_shzt===0){
                        if (value===-1){
                            return "已失效";
                        } else if (value===0) {
                            return "待绑定";
                        } else if (value===1) {
                            return "待审核";
                        }else if (value===2) {
                            return "未通过";
                        } else if (value===3) {
                            return "已通过";
                        }
					}else if (row.reviewinfo_shzt===1){
                        if (value===-1){
                            return "已失效";
                        } else if (value===1) {
                            return "待审核";
                        }else if (value===2) {
                            return "不完备";
                        } else if (value===3) {
                            return "已完备";
                        }
					}else if(row.reviewinfo_shzt===2){
                        if (value===-1){
                            return "已失效";
                        } else if (value===1) {
                            return "待签署";
                        } else if (value===3) {
                            return "已签署";
                        }
					}else if(row.reviewinfo_shzt===3){
                        if (value===-1){
                            return "已失效";
                        } else if (value===1) {
                            return "待放款";
                        } else if (value===3) {
                            return "已放款";
                        }
                    }else if(row.reviewinfo_shzt===4){
                        if (value===-1){
                            return "已失效";
                        } else if (value===1) {
                            return "待办理";
                        } else if (value===3) {
                            return "已办理";
                        }else if (value===4) {
                            return "已提交";
                        }
                    }else if(row.reviewinfo_shzt===5){
                        if (value===-1){
                            return "已失效";
                        } else if (value===1) {
                            return "待打款";
                        } else if (value===3) {
                            return "已打款";
                        }
                    }else if(row.reviewinfo_shzt===6){
                        if (value===-1){
                            return "已失效";
                        } else if (value===1) {
                            return "当月未还";
                        } else if (value===3) {
                            return "当月已还";
                        }
                    }else if(row.reviewinfo_shzt===7){
                        if (value===5){
                            return "已完成";
                        } else {
                            return "错误代码";
                        }
                    }
                }
            },
            {field:'loaninfo_jkje',title:'额度(万元)',width:80,align:'left'},
			{field:'operation',title:'操作',width:80,align:'center',
		        	formatter: function(value,row,index){
		        		var str = "";
						str += '<a href="javascript:;" style="color: green" onClick = "openNewTab('+row.id+');">查看</a>';
		            	return str;
		  			}
		        },
            {field:'operation2',title:'备注',width:80,align:'center',
                formatter: function(value,row,index){
                    var str = "";
                    str += '<a href="javascript:;" style="color: green" onClick = "showZxdkApply('+row.id+');">历史查询</a>';
                    return str;
                }
            }
		    ]],
        toolbar:"#rzdkmanage_tool"
	});

});
//function editZxdkApply(id){
//   	showWindow("#w1",{
//			title : "审核信息",
//			width : 900,
//			height : 600,
//			content:"<iframe src='system/ZxdkApplyForm?id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
//	});
//}

function showZxdkApply(id){
    showWindow("#w1",{
        title : "审核信息",
        width : 900,
        height : 600,
        content:"<iframe src='system/ZxdkApplyLogList?apply_id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
    });
}



function openNewTab(id){

    var jq = top.jQuery;

    if (jq("#tabs").tabs('exists', '贷款申请详情')){
        jq("#tabs").tabs('select', '贷款申请详情');
    } else {
        var url='system/ZxdkApplyForm?id='+id;
        var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
        jq("#tabs").tabs('add',{
            title:'贷款申请详情',
            content:content,
            closable:true
        });
    }
}
$("#zxdk_search").click(function (){
    var search_start=$("#search_start").datebox("getValue");
    var search_end=$("#search_end").datebox('getValue');
    var search_status=$("#search_status").val();
    $("#rzdkList_table").datagrid("load",{
        keywords:$("#search_zxdktitle").val(),
        reviewinfo_shzt:search_status,
        search_start:search_start,
        search_end:search_end
    });
});

$("#cancel_search").click(function (){
    $('#search_start').datebox('setValue', '');
    $('#search_end').datebox('setValue', '');
    $("#search_status").val("");
    $("#search_zxdktitle").val("");
});
</script>
	<table id="rzdkList_table"  >

	</table>


<div id="rzdkmanage_tool" style="padding:3px;height:auto">
	<div style="padding: 2px">
		申请日期&nbsp;&nbsp;<input id="search_start" type="text" class="easyui-datebox" required="required">
		&nbsp;-&nbsp;<input id="search_end" type="text" class="easyui-datebox" required="required">
	</div>
	<%--0：初审；1：材料审核；2：合同签署；3：放款监管；4：产权变更；5：线下打款；6：还款 7.已完成整个流程--%>
	<div style="padding: 2px">
		状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <select type="text" id="search_status">
		<option value="">请选择</option>
		<option value="0">初审</option>
		<option value="1">材料审核</option>
		<option value="2">合同签署</option>
		<option value="3">放款监管</option>
		<option value="4">产权变更</option>
		<option value="5">线下打款</option>
		<option value="6">还款</option>
		<option value="7">已完成整个流程</option>
	</select>
	</div>
	<div style="padding: 2px">
		关键词&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="search_zxdktitle" placeholder=" 标的名称/姓名/电话号码">
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" plain="true"
		   id="zxdk_search">查询</a>
		<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" plain="true"
		   id="cancel_search">清除</a>

	</div>
	<%--<div>--%>
	<%--<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-cancel" plain="true"--%>
	<%--id="onlineLoans_del">删除</a>--%>

	<%--</div>--%>
</div>

