<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<c:set var="root" value="<%=basePath %>" scope="page"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>e交易-产权交易平台</title>
<jsp:include page="mate.jsp"></jsp:include>
<link rel="stylesheet" href="${root }html/css/iconfont.css">
<link rel="stylesheet" href="${root }html/css/base.css">
<link rel="stylesheet" href="${root }html/css/header.css">
<link rel="stylesheet" href="${root }html/css/global.css">
<link rel="stylesheet" href="${root }html/css/list.css">

<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/DateOp.js"></script>
   
<!-- 快捷报名 -->
<link rel="stylesheet" href="<%=basePath %>js/ejy_baoming/css/style.css" media="all" />
<script type="text/javascript" src="<%=basePath %>js/ejy_baoming/js/ejy.js"></script>
<!-- 竞价大厅 -->
<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
<script type="text/javascript">
    
	/**
	 * 初始化页面
	 */
	function init(){
		var $div_title =$(".select-no:first");
		var orgid ='${condition.orgid}';
		var biaodiname ='${condition.biaodiname}';
		//机构名称
		initOrgInfo($div_title);
		//标的类型
		initType($div_title);
		//标的地区
		initCity($div_title);
		//标的状态
		initStatus($div_title);
	}
	
	/** 初始化机构名称 */
	function initOrgInfo($div_title){
		//取消所有选中样式
		$(".condition_orgid").removeClass("selected");

		//添加选中样式
		var code ='${condition.orgid}';
		if(code ==null || code ==""){
			$(".condition_orgid:first").addClass("selected");
			return;
		}
		$(".condition_orgid").each(function(index ,element){
			var current_code =$(this).find("a").attr("code");
			var current_name =$(this).find("a").html();
			if(current_code ==code){
				//选项样式
				$(this).addClass("selected");
				//面包屑样式
				$div_title.append(
				'<dd class="selected" id="select_orgid">'+
				'<a href="javascript:;" type="'+current_code+'">'+current_name+'</a>'+
				'</dd>');
				return false;
			}
		});
	}
	
	/** 初始化标的类型 */
	function initType($div_title){
		//取消所有选中样式
		$(".condition_type").removeClass("selected");
		
		//添加选中样式
		var type ='${condition.type}';
		if(type ==null || type ==""){
			$(".condition_type:first").addClass("selected");
			return;
		}
		$(".condition_type").each(function(index ,element){
			var current_type =$(this).find("a").attr("type");
			var current_name =$(this).find("a").html();
			if(current_type ==type){
				//选项样式
				$(this).addClass("selected");
				//面包屑样式
				$div_title.append(
					'<dd class="condition_type selected" id="select_type">'+
					'<a href="javascript:;" type="'+current_type+'">'+current_name+'</a>'+
					'</dd>');
				return false;
			}
		});
	}
	
	/** 初始化标的地区 */
	function initCity($div_title){
		//取消所有选中样式
		$(".condition_city").removeClass("selected");

		//添加选中样式
		var code_shen ='${condition.sheng}';
		var code_shi ='${condition.shi}';
		if(code_shen ==null || code_shen ==""){
			$(".condition_city:first").addClass("selected");
			return;
		}
		//-------------选择了指定的省或市
		var select_code;//选中的code
		var select_name;//选中的name
		//标的地区--省级
		$(".condition_city").each(function(index ,element){
			var current_code =$(this).find("a").attr("code");
			var current_name =$(this).find("a").html();
			if(current_code ==code_shen){
				//选项样式
				$(this).addClass("selected");
				//
				select_code =current_code;
				select_name =current_name;
				
				//展开省级以下：市级
				$(".city_class").hide();
				//点击省级，切换指定市级
				$(".city_"+select_code).show();
				$(".city_"+select_code).css("display" ,"block");
				return false;
			}
		});
		//标的地区--市级
		$(".condition_subCity").each(function(index ,element){
			var current_code =$(this).find("a").attr("code");
			var current_name =$(this).find("a").html();
			if(current_code ==code_shi){
				//选项样式
				$(this).addClass("selected");

				select_code =current_code;
				select_name =current_name;
				return false;
			}
		});
		
		//显示面包屑
		$div_title.append('<li class="county selected" op="'+select_code+'" id="selectBB"><a href="javascript:;" code="'+select_code+'">'+select_name+' </a> </li>');

	}
	
	/** 初始化标的状态 */
	function initStatus($div_title){
		var condition_status ='${condition.status}';
		if(condition_status ==null || condition_status ==""){
			$(".condition_status:first").addClass("selected");
			return;
		}
		
		$(".condition_status").each(function(index ,element){
			var current_status =$(this).find("a").attr("status");
			var current_name =$(this).find("a").html();
			if(current_status ==condition_status){
				//显示面包屑
				$div_title.append(
						'<dd class="selected" id="select_status">'+
						'<a href="javascript:;" type="'+current_status+'">'+current_name+'</a>'+
						'</dd>');
				return false;
			}
		});
	}

	//分页
	$(".condition_page").click(function(){
		var page =$(this).attr("page");
		$("input[name=page]").val(page);		
		list_page();
	});
	
	/**
	 * 分页刷新列表
	 * @pageNo 页码
	 */
	function list_page(){
		var params =$("#form_list_page").serialize();
		$.ajax({
			url:'jjdt_more_data',
			type: 'post',
			data: params,
			dataType: 'json',
			success: function(datas){
				var data =datas.jjdt_more;
				var pageObj =datas.pageObj;
				var current_page =pageObj.currentPage;
				var prev_page =pageObj.currentPage-1;
				var next_page =pageObj.currentPage+1;	
				var totalPage =1;
				var pageSize =8;
				var count =pageObj.total;
				if(data==null || data.length ==0){
					//没有符合的数据
					$("#newHallList").html("<tr class='bd-green'><td colspan='5'>Tips：暂时没有数据。</td></tr>");
				}
				if (count < pageSize || pageSize ==0) {
					totalPage =1; 
				}else{
					totalPage =count % pageSize == 0 ? Math.floor(count / pageSize) : Math.floor(count / pageSize) + 1;
				}
				//更新数据
				var html = "";
				for(var i=0;i<data.length;i++){
	                var subject =data[i];
	                var format ="yyyy-MM-dd HH:mm:ss";
	                var price =subject.price +" 元";//标的底价
	                var endtime =new Date(subject.endtime).format(format);//延时报价时间
	                var biaodino =subject.biaodino;
	                var project_url =subject.project_url;
	                var projectcontroltype =subject.projectcontroltype ==null 
	   						? -1 
							:($.trim(subject.projectcontroltype) =="" 
									? -1
								 	:$.trim(subject.projectcontroltype));
	                var object =subject.object;//项目名称
					var hasbid =subject.hasbid =="1";
	                if(object !=null && object.length >35){
	                	object =object.substring(0,35)+"...";
	                }
	                //需要动态刷新的值
	                var startMs =subject.start;
	                
	                var obj_start;//开始时间
	                var obj_endTime;//剩余时间
	                var obj_bmbtn;//操作按钮
	                var maxprice;//当前价格
	                
	                var status = subject.status;//0 竞价中  1 未开始  2 已结束
	              	
	                //刷新最高价
	                maxprice =subject.maxprice +" 元";
	                //刷新开始时间：已开始直接显示开始时间；未开始显示多久开始
	                var cur = subject.current;//当前时间
	                if(cur > startMs){
	                	obj_start =new Date(startMs).format(format);
	                }else{
	                	obj_start =DateOp.formatMsToStr(startMs - cur);
	                }	                	                
	                //刷新操作按钮：
	                var show_span1 =false;//是否显示span1
	                switch(projectcontroltype){
	                	case "2":
	                		show_span1 =true;
	                		obj_bmbtn ="中止";
	                		obj_endTime = "项目已中止";//剩余时间   
	               		break;
	                	case "1":
	                		show_span1 =true;
	                		obj_bmbtn ="终结";
	                		obj_endTime = "项目已终结";//剩余时间   
	            		break;
	                	default:	                		
	                		obj_bmbtn = subject.statusCN;	                    	
	                    	if(obj_bmbtn==="报价中" || obj_bmbtn==="延时竞价"){
	                    		obj_endTime = (DateOp.formatMsToStr(subject.last_times));//剩余时间
	                		} else if(obj_bmbtn==="已结束" || obj_bmbtn===""){
	                			obj_endTime = ("0秒");
	                		} else if(obj_bmbtn==="未开始"){	                			
	                			obj_endTime = (obj_start);
	                		} else {
	                			obj_endTime = (obj_bmbtn);
	                		}	                		
	               		break;
	                }
					
					//组装html
					html +="<tr class='bd-green'>";
					html +=
						"<td style='text-align:left;font-size:14px; padding: 5px 10px;'>" + "<input type='hidden' name='biaoDiNOs' value='"+biaodino+"' />"
							+"<a class='bdh-btn' target='_blank' href='"+subject.project_url+"' "
							+"style='color: #333'>"+object+"</a>"
						+"</td>"
						+"<td id='endTime_"+biaodino+"'>"
							+obj_endTime
						+"</td>"
						+"<td>"
							+price
						+"</td>";					
					if(hasbid){
					    html += "<td title='"+maxprice+"' id='maxPrice_"+biaodino+"'><font color='red'>"+maxprice+"</font></td>";
					}else{
						html += "<td title='"+maxprice+"' id='maxPrice_"+biaodino+"'>- 元</td>";
					}
						
					if("报价中"===obj_bmbtn || "延时竞价"===obj_bmbtn){
						html+= "<td title='"+biaodino+"' id='bmbtn_readonly_"+biaodino+"'>"
						    +"<font id='bmbtn_span_"+biaodino+"' class='button'>"
							+"<a id='"+biaodino+"' class='ejy_huiyuan_bm state-btn btn-bidding'>报价中</a>"
							+"</font></td>";
					}else if(obj_bmbtn==="报名中"){
						html+= "<td title='"+biaodino+"' id='bmbtn_readonly_"+biaodino+"'>"
					        +"<font id='bmbtn_span_"+biaodino+"' class='button'>"
						    +"<a id='"+biaodino+"' class='ejy_huiyuan_bm state-btn btn-enroll'>"+obj_bmbtn+"</a>"
						    +"</font></td>";
                    }else if(obj_bmbtn==="未开始"){
                        html+= "<td title='"+biaodino+"' id='bmbtn_readonly_"+biaodino+"'>"
                            +"<font id='bmbtn_span_"+biaodino+"' class='button'>"
                            +"<a id='"+biaodino+"' class='ejy_huiyuan_bm state-btn btn-update'>"+obj_bmbtn+"</a>"
                            +"</font></td>";
                    }else{
						html+= "<td title='"+biaodino+"' id='bmbtn_readonly_"+biaodino+"'>"
				        +"<font id='bmbtn_span_"+biaodino+"' class='button'>"
					    +"<a id='"+biaodino+"' class='ejy_huiyuan_bm state-btn btn-default'>"+obj_bmbtn+"</a>"
					    +"</font></td>";
				    }
					html +="</tr>"
				}
				
				if(html!=""){
					$("#newHallList").html(html);
				}			
				
				$("#curr_page").html("当前页"+current_page+"/"+totalPage);
				;
				$("#prev_page").attr("page",prev_page);
				$("#next_page").attr("page",next_page);
				$("#total_page").attr("page",totalPage);
			}
		})
	}

	$(function(){
		init();		
		//机构名称
        $( document ).on( "click", "#selectC", function() {
            $(this).remove();
            $(".condition_orgid:first").addClass("selected").siblings().removeClass("selected");
            $("input[name=orgid]").val("");
            list_page();
        });
		//标的类型
        $( document ).on( "click", "#selectA", function() {
            $(this).remove();
            $(".condition_type:first").addClass("selected").siblings().removeClass("selected");
            $("input[name=type]").val("");
            list_page();
        });
		//标的省市
        $( document ).on( "click", "#selectBB", function() {
            $(this).remove();
            $(".city_class").hide();
            $(".condition_city:first").addClass("selected").siblings().removeClass("selected");
            $("input[name=sheng]").val("all");
            $("input[name=shi]").val("all");
            list_page();
        });
		//标的状态
        $( document ).on( "click", "#selectD", function() {
            $(this).remove();
            $(".condition_status:first").addClass("selected").siblings().removeClass("selected");
            $("input[name=status]").val("");
            list_page();
        });
		
		//直接跳转页码
		$("#id_skip_page").keyup(function(){
			var key =String.fromCharCode(event.which);
			var skip_page =$.trim($(this).val());
    		var ex = /^\d+$/;
    		if (!ex.test(skip_page)) {
    		  	skip_page =$(this).val(skip_page.substring(0,skip_page.length-1));
    		}
    		if(skip_page >${pageObj.totalPage}){
    			skip_page =${pageObj.totalPage};
    			$(this).val(skip_page);
    		}
    		
    		$("#id_skip_page_a").attr('page',skip_page);
		});
		
		//分页
		$(".condition_page").click(function(){
			var page =$(this).attr("page");
			$("input[name=page]").val(page);			
			list_page();
		});
		
		//机构名称
		$(".condition_orgid").click(function(){
			$("input[name=orgid]").val($(this).find("a").attr("code"));
			list_page();
		});
		
		//标的类型
		$("#Comment .condition_type").click(function(){
			$("#Comment .condition_type").removeClass("selected");
			$(this).addClass("selected");
			$("input[name=type]").val($(this).find("a").attr("type"));
			
			list_page();
		});
		
		//标的地区省级
		$(".condition_city").click(function(){
			var city_code =$(this).find("a").attr("code");
            $(this).addClass("selected").siblings().removeClass("selected");
            $(".condition_subCity").removeClass("selected");
            if(city_code==""){
                $("#selectBB").remove();
                $(".city_class").hide();
                $(".condition_city:first").addClass("selected").siblings().removeClass("selected");
                $("input[name=sheng]").val("all");
                $("input[name=shi]").val("all");
                list_page();
			}else {
                //隐藏所有市级
                $(".city_class").hide();
                //点击省级，切换指定市级
                $(".city_" + city_code).show();
                $(".city_" + city_code).css("display", "block");
            }
		});
		//标的地区市级
		$(".condition_subCity").click(function(){
			$("input[name=shi]").val($(this).find("a").attr("code"));
			list_page();
		});
		
		//标的状态：已经在js脚本中实现
		$(".condition_status").click(function(){
			$("input[name=status]").val($(this).find("a").attr("status"));
			list_page();
		});
});
</script>
</head>
<body>
	<!--  头部B-->
	<jsp:include page="top.jsp"></jsp:include>
	<!--  头部E-->
    <script type="text/javascript">
    $(function(){
    	load_jjdt('jjdt-list');
        window.setInterval("refresh()",1000);
    });
    </script>

	<form id="form_list_page" onsubmit="return false;">
	<input type="hidden" name="page" value="${pageObj.currentPage }"/>
	<input type="hidden" name="rows" value="8"/>
	<input type="hidden" name="pageSize" value="${pageObj.rows }"/>
	<input type="hidden" name="orgid" value="${condition.orgid }"/>
	<input type="hidden" name="type" value="${condition.type }"/>
	<input type="hidden" name="sheng" value="${condition.sheng }"/>
	<input type="hidden" name="shi" value="${condition.shi }"/>
	<input type="hidden" name="status" value="${condition.status }"/>
	
	<div class="base-container clearfix">
		<div class="row clearfix">
			<div class="crumbs clearfix">
				<div class="fl">
					<a href="index" target="_blank">首页</a>
					&gt; <a href="<%=basePath%>jjdt_more" target="_blank">竞价大厅</a> &gt;
				</div>
				<li class="select-result">
					<dl>
						<dd class="select-no"></dd>
					</dl>
				</li>
			</div>
		</div>

		<div id="Comment" class="clearfix">
			<div class="list-select-search">
				<ul class="select">
					<li class="select-list">
						<dl id="select3">
							<dt>机构名称：</dt>
							<div  class="jgmc-name auto">
							<dd class="select-all condition_orgid selected">
								<a href="javascript:;" code="">全部</a>
							</dd>
							<c:forEach items="${orglist}" var="orginfo">
			                <dd class="condition_orgid ${condition.orgid ==orginfo.orgid ?'selected' :'' }" >
								<a href="javascript:;" code='${orginfo.orgid }'>${orginfo.name }</a>
							</dd>
				            </c:forEach>
				            </div>
						</dl>
						<a href="javascript:void(0)" class="note-btn"><i></i></a>
					</li>
					<li class="select-list">
						<dl id="select1">
							<dt>标的类型：</dt>
							<dd class="select-all condition_type selected">
								<a href="javascript:;" type="">全部</a>
							</dd>
							<c:forEach items="${typelist}" var="obj">
								<dd class="condition_type">
									<a href="javascript:;" type="${obj.type}">${obj.typeName}</a>
								</dd>
							</c:forEach>
						</dl>
					</li>
					<li class="select-list">
						<dl class="address">
							<dt>标的地区：</dt>
							<dd class="select-all selected condition_city">
								<a href="javascript:;" code="">全部</a>
							</dd>
							<!-- 省级 -->
							<c:forEach items="${cityinfo}" var="city" varStatus="status">
				                <dd class="condition_city">
					                <a href="javascript:;" code='${city.code }'>${city.name }</a>
								</dd>
				            </c:forEach>
							<c:forEach items="${cityinfo}" var="city" varStatus="status">
				                <!-- 市级 -->
								<div class="clear city_${city.code } city_class" style="display: none;"></div>
								<div class="sub-condition J_SubCondition city_${city.code } city_class" style="display:none;">
									<ul class="clearfix" id="select22" >
										<c:forEach items="${city.subCity}" var="subCity" varStatus="status">
										<li class="county condition_subCity" op="${subCity.code }"><a href="javascript:;" code='${subCity.code }'>${subCity.name }</a>
										</li>
										</c:forEach>
									</ul>
								</div>
				            </c:forEach>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select4">
							<dt>标的状态：</dt>
							<dd class="select-all condition_status ${condition.status ==null ||condition.status =='' ?'selected' :'' }">
								<a href="javascript:;" status="">全部</a>
							</dd>
							<dd class="condition_status ${condition.status =='2' ?'selected' :'' }">
								<a href="javascript:;" status="2">未开始</a>
							</dd>
							<dd class="condition_status ${condition.status =='0' ?'selected' :'' }">
								<a href="javascript:;" status="0">报价中</a>
							</dd>
							<dd class="condition_status ${condition.status =='3' ?'selected' :'' }">
								<a href="javascript:;" status="3">已结束</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>

		<div class="k1200">
			<div class="bd_a bgff clearfix mb15">
				<div class="conWrap"
					style="position: relative; width:1198px; height: 412px;">
					<div class="con" style="position: absolute; width: 1198px; left: 0px; top: 0px; display: block;">
						<table id="listTable" class="bidding-table index-bidding-table">
							<tbody>
							    <tr class="bidding-thead nthodd">
							        <th>项目名称</th>
                                    <th width="180">剩余时间</th>
                                    <th width="150">标的底价</th>
                                    <th width="150">当前价格</th>
                                    <th width="120">状态</th>
                                </tr>
                            </tbody>
                            <tbody id="newHallList" style="font-size: 14px;">
            
        	                </tbody>
						</table>
					</div>
				</div>
				<div class="bidding-color clearfix">
					<div class="fl bidding-circle bidding-color-red">
						<span></span> <label>红色：已出价</label>
					</div>
				</div>
				<div class="digg">
					<span class="disabled" id="curr_page">当前页${pageObj.currentPage }/${pageObj.totalPage }</span> 
					<a class="condition_page" href="javascript:list_page()" page="1">首页 </a>
					<a class="condition_page" id="prev_page" href="javascript:list_page()" page="${pageObj.currentPage -1 }">上一页</a>
					<a class="condition_page" id="next_page" href="javascript:list_page()" page="${pageObj.currentPage +1 }">下一页</a>
					<a class="condition_page" id="total_page" href="javascript:list_page()" page="${pageObj.totalPage }"> 尾页 </a>
					<span class="disabled">跳转至：</span> 
					<input type="text" id="id_skip_page" value="" style="width:30px;height:24px;BORDER: #666 1px solid;">
					<a id="id_skip_page_a" class="condition_page" href="javascript:list_page();" page="">跳转</a>
				</div>
			</div>
		</div>
	</div>
	</form>
	
	<div id="ejy_huiyuan_baoming">
		<div class="theme-popover">
			<div class="theme-poptit">
				<a href="javascript:;" title="关闭" class="close">×</a>
				E交易竞买人会员登录
			</div>
			<div class="theme-popbod dform">
				<form class="theme-signin" name="loginform" action="" method="post">
				<input type="hidden" name="projectNo"/>
				<p><strong>会员：</strong><input class="ipt" type="text" name="username" size="20"/></p>
				<p><strong>密码：</strong><input class="ipt" type="password" name="password" size="20"/></p>
				<p style="text-align:center;">
				<a class="ejy_huiyuan_baoming_btn ejy_huiyuan_dl">登 录</a>
				<a class="ejy_huiyuan_baoming_btn" target="_blank" style="background-color:#fea63a;border:#fea63a"
					href="http://www.e-jy.com.cn/ejyhy/HuiYuanInfoMis2_CZCQ/Pages/HuiYuanRegisterTwo/JmrAgree.aspx">我要注册</a>
				</p>
				</form>
				<font id="error" style="font-size: 12px;color: red;"></font>
			</div>
		</div>
		<div class="theme-popover-mask"></div>
	</div>

	<!--  通用底部b -->
	<jsp:include page="bottom.jsp"></jsp:include>
	<!--  通用底部E -->

	<!--侧边快捷导航-->
	<jsp:include page="rightbutton.jsp"></jsp:include>
	<!--/侧边快捷导航-->

	
	<script src="${root }html/js/jquery.autocompleter.js"></script>
	<script src="${root }html/js/iconfont.js"></script>
	<script src="${root }html/js/focus.js"></script>
	<script src="${root }html/js/main.js"></script>
	<script src="${root }html/js/glivia.js"></script>
	<script src="${root }html/js/list.js"></script>
</body>
</html>