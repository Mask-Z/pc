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
		//标的状态
		initStatus($div_title);
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
					'<dd class="condition_type selected" id="selectC">'+
					'<a href="javascript:;" type="'+current_type+'">'+current_name+'</a>'+
					'</dd>');
				return false;
			}
		});
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
				'<dd class="selected" id="selectB">'+
				'<a href="javascript:;" type="'+current_code+'">'+current_name+'</a>'+
				'</dd>');
				return false;
			}
		});
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
						'<dd class="selected" id="selectD">'+
						'<a href="javascript:;" type="'+current_status+'">'+current_name+'</a>'+
						'</dd>');
				return false;
			}
		});
	}

	/**
	 * 分页刷新列表
	 * @pageNo 页码
	 */
	function list_page(){
		var $form =$("#form_list_page");
		$form.submit();
	}

	$(function(){
		init();
		//机构名称
		$("#selectB").click(function(){
			$(this).remove();
			$("input[name=orgid]").val("");
			list_page();
		});
		//标的类型
		$("#selectC").click(function(){
			$(this).remove();
			$("input[name=type]").val("");
			list_page();
		});
		//标的状态
		$("#selectD").click(function(){
			$(this).remove();
			$("input[name=status]").val("");
			list_page();
		});
		
		//直接跳转页码
		$("#id_skip_page").keyup(function(){
			var key =String.fromCharCode(event.which);
			var skip_page =$.trim($(this).val());
    		var ex = /^\d+$/;
    		if (!ex.test(skip_page)) {
    			//alert("跳转的页码只能是正整数");
    		  	skip_page =$(this).val(skip_page.substring(0,skip_page.length-1));
    		}
    		if(skip_page >${pageObj.totalPage}){
    			skip_page =${pageObj.totalPage};
    			$(this).val(skip_page);
    		}
    		$("#id_skip_page_a").attr('page' ,skip_page);
		});
		
		//分页
		$(".condition_page").click(function(){
			var page =$(this).attr("page");
			$("input[name=page]").val(page);
			
			list_page();
		});
		
		//标的类型
		$("#Comment .condition_type").click(function(){
			$("#Comment .condition_type").removeClass("selected");
			$(this).addClass("selected");
			$("input[name=type]").val($(this).find("a").attr("type"));
			list_page();
		});
		
		//机构名称
		$(".condition_orgid").click(function(){
			$(".condition_orgid").removeClass("selected");
			$(this).addClass("selected");
			$("input[name=orgid]").val($(this).find("a").attr("code"));
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

	<form id="form_list_page" action="zbcg_jjdt" method="post">
	<input type="hidden" name="page" value="${pageObj.currentPage }"/>
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
					&gt; <a href="<%=basePath%>basePath%>zbcg_jjdt" target="_blank">竞价大厅</a> &gt;
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
						<dl id="select2">
							<dt>机构名称：</dt>
							<dd class="select-all condition_orgid">
								<a href="javascript:;" code="">全部</a>
							</dd>
							<c:forEach items="${cityinfo}" var="orginfo">
			                <dd class="condition_orgid ${condition.orgid ==orginfo.code ?'selected' :'' }">
								<a href="javascript:;" code='${orginfo.code }'>${orginfo.name }</a>
							</dd>
				            </c:forEach>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select3">
							<dt>标的类型：</dt>
							<dd class="select-all condition_type">
								<a href="javascript:;" type="">全部</a>
							</dd>
							<dd class="condition_type ${condition.type =='B' ?'selected' :'' }">
								<a href="javascript:;" type="B">工程</a>
							</dd>
							<dd class="condition_type ${condition.type =='A' ?'selected' :'' }">
								<a href="javascript:;" type="A">货物</a>
							</dd>
							<dd class="condition_type ${condition.type =='C' ?'selected' :'' }">
								<a href="javascript:;" type="C">服务</a>
							</dd>
						</dl>
					</li>
					<li class="select-list">
						<dl id="select4">
							<dt>标的状态：</dt>
							<dd class="select-all condition_status ${condition.status ==null ||condition.status =='' ?'selected' :'' }">
								<a href="javascript:;" status="">全部</a>
							</dd>
							<dd class="condition_status ${condition.status =='未开始' ?'selected' :'' }">
								<a href="javascript:;" status="未开始">未开始</a>
							</dd>
							<dd class="condition_status ${condition.status =='报价中' ?'selected' :'' }">
								<a href="javascript:;" status="报价中">报价中</a>
							</dd>
							<dd class="condition_status ${condition.status =='已结束' ?'selected' :'' }">
								<a href="javascript:;" status="已结束">已结束</a>
							</dd>
						</dl>
					</li>
					<%--<li class="select-list">--%>
						<%--<dl id="select5">--%>
							<%--<dt>标的名称：</dt>--%>
							<%--<dd class="condition_biaodiname">--%>
								<%--<input type="text" name="biaodiname" value="${condition.biaodiname }" style="border: solid 1px #ccc;line-height: 25px;height: 25px;--%>
    <%--padding: 0px 10px;float:left;margin-right:10px;"/>--%>
								<%--<font class="button"><a href="javascript:;" class="state-btn btn-bidding" style="color: white;" onclick="list_page()">搜索</a></font>--%>
							<%--</dd>--%>
						<%--</dl>--%>
					<%--</li>--%>
				</ul>
			</div>
		</div>

		<div class="k1200">
			<div class="bd_a bgff clearfix mb15">
				<div class="conWrap"
					style="position: relative; width:1198px; height: 412px;">
					<div class="con"
						style="position: absolute; width: 1198px; left: 0px; top: 0px; display: block;">
						<table id="listTable" class="bidding-table index-bidding-table">
							<tbody>
								<tr class="bidding-thead nthodd">
									<th>项目编号</th>
					                <th>项目名称</th>
					                <th>开始时间</th>
					                <th>当前报价(元)</th>
					                <th width="120">状态</th>
								</tr>
							</tbody>
							<tbody id="newHallList" style="font-size: 14px;">
								<c:if test="${list ==null || fn:length(list) ==0 }">
						            <tr class="bd-green">
						            	<td colspan="5">
						            	暂时没有数据。
						            	</td>
						            </tr>
					            </c:if>
								<c:forEach items="${list }" var="project">
									<c:if test="${project.projectnum ne '14HW20170057'}">
						            <tr class="bd-green">
						            	<td>${project.projectnum }</td>
						            	<td title="${project.title }" style="text-align:left;font-size:14px; padding: 5px 10px;">
							            	<a class="bdh-btn" target="_blank" href="newsinfo?infoid=${project.infoid }" style="color: #333">${project.title }</a>
						            	</td>
						            	<td>${fn:substring(project.jingjia_start ,0 ,19) }</td>
						              	<td>${project.zgj } 元</td>
						              	<td>
						              		<c:choose >
												<c:when test="${project.state=='报价中' }">
												<%--<font class="button"><a href="http://www.e-jy.com.cn/ejyhy/login_07.aspx" target="_blank" class="state-btn btn-bidding">登录</a></font>--%>
												<font class="button"><a href="http://www.e-jy.com.cn/ejyhy/login_07.aspx" target="_blank" class="state-btn btn-bidding">${project.state}</a></font>
												</c:when>
												<c:when test="${project.state=='未开始' }">
													<font class="button state-btn btn-update">${project.state }</font>
												</c:when>
												<c:otherwise>
													<font class="button state-btn btn-default">${project.state }</font>
												</c:otherwise>
											</c:choose>
						              	</td>
						             </tr>
									</c:if>
					            </c:forEach>
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
					<a class="condition_page" href="javascript:list_page()" page="${pageObj.currentPage -1 }">上一页</a>
					<a class="condition_page" href="javascript:list_page()" page="${pageObj.currentPage +1 }">下一页</a>
					<a class="condition_page" href="javascript:list_page()" page="${pageObj.totalPage }"> 尾页 </a>
					<span class="disabled">跳转至：</span> 
					<input type="text" id="id_skip_page" value="" style="width:30px;height:24px;BORDER: #666 1px solid;">
					<a id="id_skip_page_a" class="condition_page" href="javascript:list_page();" page="">跳转</a>
				</div>
			</div>
		</div>
	</div>
	</form>

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