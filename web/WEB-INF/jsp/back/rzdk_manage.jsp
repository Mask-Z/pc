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
                            return "<font color='blue'>三方合同签署</font>";
                        } else if (value===3) {
                            return "<font color='blue'>放款到监管账户</font>";
                        } else if (value===4) {
                            return "<font color='blue'>过户抵押办理</font>";
						}else if (value===5) {
                            return "<font color='green'>放款</font>";
                        }
					}
		        },
            {field:'reviewinfo_shjg',title:'状态',width:80,align:'left',
                formatter: function(value,row,index){
                    if (value===0){
                        return "待审核";
                    } else if (value===1) {
                        return "审核通过";
                    } else if (value===2) {
                        return "审核不通过";
                    } else if (value===3) {
                        return "撤销";
                    } else if (value===4) {
                        return "已失效";
                    }else if (value===5) {
                        return "已完成";
                    }
                }
            },
            {field:'loaninfo_jkje',title:'额度(万元)',width:80,align:'left'},
			{field:'operation',title:'操作',width:80,align:'center',
		        	formatter: function(value,row,index){
		        		var str = "";
						str += '<a href="javascript:;" style="color: green" onClick = "editZxdkApply('+row.id+');">查看</a>';
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
		    ]]
	});

});
function editZxdkApply(id){
   	showWindow("#w1",{
			title : "审核信息",
			width : 900,
			height : 600,
			content:"<iframe src='system/ZxdkApplyForm?id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
	});
}

function showZxdkApply(id){
    showWindow("#w1",{
        title : "审核信息",
        width : 900,
        height : 600,
        content:"<iframe src='system/ZxdkApplyLogList?apply_id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
    });
}

</script>
	<table id="rzdkList_table"  >

	</table>


