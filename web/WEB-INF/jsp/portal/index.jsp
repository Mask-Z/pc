<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Object obj = request.getSession().getAttribute("qieHuanFlag");
    String qieHuanFlag= "";  
  	if(obj!=null){
  		qieHuanFlag = obj.toString();
  	}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    <title>e交易-产权交易平台</title>
	<jsp:include page="mate.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=basePath%>html/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/base.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/header.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/global.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/index.css?20171013">
    <link rel="stylesheet" href="<%=basePath%>js/ejy_baoming/css/style.css">
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/DateOp.js"></script>

      <%--根据IP地址获取所在城市--%>
      <script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"type="text/ecmascript"></script>
    <!-- 竞价大厅 -->
    <script type="text/javascript" src="<%=basePath%>js/index.js?20171013"></script>
    <script type="text/javascript">


    $(function () {
        var city=remote_ip_info["city"];
        var province=remote_ip_info["province"] ;
        <%--var qieHuanFlag='<%=qieHuanFlag%>';--%>
        <%--if ("" == qieHuanFlag ){--%>
            <%--$("#qhdq_content").html('您当前在<span class="fcdd3 bold">'+city+'市</span>,<br>是否定位至此？</span></span>');--%>
            <%--$("#qhdq").show();--%>
        <%--}--%>
        var qhCookie = $.cookie("qhCookie");
//        cookie中没值
        if (typeof(qhCookie)=="undefined"){
            $("#qhdq_content").html('您当前在<span class="fcdd3 bold">'+city+'市</span>,<br>是否定位至此？</span></span>');
            $("#qhdq").show();
        }
        $("#qhdqOK").click(function () {
            $.cookie("cityCookie", city, { expires: 2 });
            $.cookie("provinceCookie", province, { expires: 2 });
            $.cookie("qhCookie", '1', { expires: 2 });
            window.location.reload();

            <%--$.ajax({--%>
                <%--type: "post",--%>
                <%--url: "<%=basePath%>index/otherUpdateSession",--%>
                <%--dataType: "json",--%>
                <%--data: {--%>
                    <%--city: city,--%>
                    <%--province: province,--%>
                    <%--qieHuanFlag:"1"--%>
                <%--},--%>
                <%--method: "post",--%>
                <%--success : function(data) {--%>
                    <%--window.location.reload();--%>
                <%--},--%>
                <%--error:function () {--%>
                    <%--window.location.reload();--%>
                <%--}--%>
            <%--});--%>
        })

        $("#qhdqNO").click(function () {
            $("#qhdq").hide();
            $.cookie("qhCookie", '0', { expires: 2 });


            <%--$.ajax({--%>
                <%--type: "post",--%>
                <%--url: "<%=basePath%>index/otherUpdateSession",--%>
                <%--dataType: "json",--%>
                <%--data: {--%>
                    <%--city: city,--%>
                    <%--province: province,--%>
                    <%--qieHuanFlag:"0"--%>
                <%--},--%>
                <%--method: "post",--%>
                <%--success : function(data) {--%>
                <%--}--%>
            <%--});--%>
        })



        load_jjdt('index');
    	window.setInterval("refresh()",1000);
    });

    </script>
    
    <!-- 快捷报名 -->
	<link rel="stylesheet" href="<%=basePath %>js/ejy_baoming/css/style.css" media="all" />
	<script type="text/javascript" src="<%=basePath %>js/ejy_baoming/js/ejy.js"></script>
  </head>
<script type="text/javascript">
$(function(){ 
    $("#hy_login").click(function(){
		$("#login_div").fadeIn(200);    	
	});    
});
var basePath='<%=basePath%>';

function updateTypeCookieAndOpenPage(value,id,hotlable){
    $.cookie("categoryname", value, { expires: 7});//存标的类型cookie，用于猜你喜欢
    $.cookie("hotlable", hotlable, { expires: 7});//存亮点标签cookie，用于猜你喜欢

	set_type_cookie(value);
	window.open(basePath+"infodetail?infoid="+id);
}

function set_type_cookie(type){//标的类型
	var max_type = $.cookie("max_type_count");
	if(!max_type){
		max_type = 0;
	}else{
		max_type = parseInt(max_type);
	}
	var cr = $.cookie(type);
	if(cr){
		var count = parseInt(cr) + 1;
		$.cookie(type,count , { expires: 2 });
		if(count > max_type){
			$.cookie("type",type);
			$.cookie("max_type_count",count);
		}
	}else{
		if(!$.cookie("type")){
			$.cookie("type",type);
		}
		$.cookie(type, 1, { expires: 2 });
	}
}
</script>  
<body>
        <!--  头部B-->  
        <jsp:include page="top.jsp"></jsp:include>
        <!--  头部E-->
       <div class="index-container clearfix">

       <div class="row clearfix">

       <div class="index-main-screen-layout clearfix" >
          <!-- 登录和新闻B-->
          <div class="index-login">
            <div class="box">

            <!-- 新闻公告B -->

              
             <!-- 登录B -->
              <div class="index-login-entry">
                <a target="_blank" href="http://jjxt.e-jy.com.cn/ejyjj/login.aspx?ReturnUrl=%2fejyjj%2f"><i class="jj"></i><div class="clear"></div>竞价登录</a>
                <a href="javascript:showLogin2();"><i class="hy"></i><div class="clear"></div>会员登录</a>
                <a target="_blank" href="http://www.e-jy.com.cn/ejyzx/CustomFrame4Bid/login_USB.aspx?ReturnUrl=%2fejyzx%2fCustomFrame4Bid%2flogin.aspx"><i class="jg"></i><div class="clear"></div>机构入口</a>
                <a target="_blank" href="http://www.e-jy.com.cn:8082/ejypb/" class="last"><i class="pw"></i><div class="clear"></div>评委入口</a>
              </div>
              <!-- 登录E -->

              
              <!-- 个人信息B -->
              <div id ="no_login" class="index-login-info unlisted" style="${loginAccount !=null ?'display:none' :''}">
                  <div class="smt clearfix">
                    <span class="item"><img src="images/photo.png" width="50" height="50" alt=""></span>
                    <p class="text">
                      <span class="pb5 dsb">欢迎来到e交易网</span>
                      <span class="clear"></span>
                      <a  href="javascript:;" class="state-btn btn-enroll mr10 ejy_huiyuan_bm" skipType="web" callback="location.href='index'">登录</a>
                      <a href="http://www.e-jy.com.cn/ejyhy/HuiYuanInfoMis2_CZCQ/Pages/HuiYuanRegisterTwo/Agree.aspx" class="state-btn btn-trailer">注册</a>
                    </p>
                  </div>
                  <div class="smb">
                    <a href="questioninfo?infoid=24" target="_blank"><b>[会员]</b>如何注册会员？</a>
                    <a href="questioninfo?infoid=27" target="_blank"><b>[会员]</b>如何缴纳与查询保证金？ </a>
                    <a href="questioninfo?infoid=26" target="_blank"><b>[会员]</b>如何参与竞价？</a>
                  </div>
              </div>              
              <!-- 个人信息E -->
              
              <!-- 个人信息B -->
              <div id ="has_login" class="index-login-info" style="${loginAccount ==null ?'display:none' :''}">
                  <div class="smt clearfix">
                    <span class="item"><img src="images/photo.png" width="50" height="50" alt=""></span>
                    <p class="text">Hi,您好<br><span class="fcaa" id="has_login_displayName"><b>${loginAccount ==null ?'' :loginAccount.displayName }</b> &nbsp;&nbsp;<a href="javascript:exitLogin();" class="identity">退出</a></span> </p>
                  </div>
                  <div class="smc">
                      <a id="has_login_ygz" href="ygz_more?danWeiGuid=${loginAccount ==null ?'' :loginAccount.danWeiGuid }"><b>${loginInfo ==null ?'' :loginInfo.ygz }</b><br>已关注</a>
                      <a id="has_login_ybm" href="ybm_more?danWeiGuid=${loginAccount ==null ?'' :loginAccount.danWeiGuid }"><b>${loginInfo ==null ?'' :loginInfo.ybm }</b><br>已报名</a>
                      <a id="has_login_jjz" href="jjz_more?danWeiGuid=${loginAccount ==null ?'' :loginAccount.danWeiGuid }"><b>${loginInfo ==null ?'' :loginInfo.jjz }</b><br>竞价中</a>
                      <a id="has_login_ygm" href="ygm_more?danWeiGuid=${loginAccount ==null ?'' :loginAccount.danWeiGuid }"><b>${loginInfo ==null ?'' :loginInfo.ygm }</b><br>已成交</a>                                   
                  </div>
              </div>              
              <!-- 个人信息E -->

              <div class="index-new-list">
                <div class="smt">
                  <span class="curr">最新成交</span>
                  <span >平台公告</span>
                  <span>行业资讯</span>
                </div>
                <div class=" news-list-box  news-list-success">


    <!-- 代码开始 -->
    <div class="list_lh">
      <ul>        
          <c:forEach items="${zxcjs}" var="zxcj">
              <li>
                  <%--<a href="completeInfo?infoid=${zxcj.cjgg_guid}" target="_blank"><span class="time">${zxcj.beforeTime }${zxcj.beforeTimeUnit }</span><span class="fcdd3">[${zxcj.areaName }]</span>${zxcj.categoryname }项目已成交  (项目编号：${zxcj.projectnum })</a>--%>
                  <%-- <a href="infodetail?infoid=${zxcj.jygg_guid}" target="_blank"><span class="time">${zxcj.beforeTime }${zxcj.beforeTimeUnit }</span><span class="fcdd3">[${zxcj.areaName }]</span>${zxcj.categoryname }项目已成交  (项目编号：${zxcj.projectnum })</a> --%>
                  <a href="infodetail?infoid=${zxcj.jygg_guid}" target="_blank"><span class="time fr" >${zxcj.beforeTime }${zxcj.beforeTimeUnit }</span><span class="fl item"><span class="fcdd3 fl">[${zxcj.areaName }]</span><span class="name">${zxcj.categoryname }项目已成交</span><div class="clear"></div><p class="number">  (项目编号：${zxcj.projectnum })</p></span></a>
              </li>
          </c:forEach>                 
      </ul>
    </div>
    <!-- 代码结束 -->

                </div>
                <div class="news-list-info news-list-box" style="display:none;">
				<c:forEach items="${ptggs }" var="ptgg">
					<a href="<%=basePath%>newsinfo?infoid=${ptgg.infoid }" target="_blank">${ptgg.title }</a>
				</c:forEach>                	
                </div>
                <div class="news-list-info news-list-box" style="display:none;">
                <c:forEach items="${hyzxs }" var="hyzx">
					<a href="<%=basePath%>newsinfo?infoid=${hyzx.infoid }" target="_blank">${hyzx.title }</a>
				</c:forEach>
                </div>
              </div>
              
             <!-- 新闻公告E -->

            </div>
          </div>
         <!-- 登录和新闻E-->
          <!--焦点图-->
    
                <%--     <div class="focus" id="focus">
              <ul>
              	<c:forEach items="${bigads }" var="ad">
              		<li>
              			<c:if test="${ad.url !=null and ad.url != '' }">
              				<a href="${ad.url }" target="_blank"><img src="<%=basePath %>upload/ad/${ad.pic }" style="width: 920px;height: 400px;"/></a>
              			</c:if>
              			<c:if test="${ad.url ==null or ad.url eq '' }">
              				<a href=""><img src="<%=basePath %>upload/ad/${ad.pic }" style="width: 920px;height: 400px;"/></a>
              			</c:if>
              		</li>
              	</c:forEach>
              </ul>
            </div> --%>
         <%--    <div class="focus-banner">
				<ul class="focus-img">
				<c:forEach items="${bigads }" var="ad">
					<li>
							<c:if test="${ad.url !=null and ad.url != '' }">
			              				<a href="${ad.url }" target="_blank"><img src="<%=basePath %>upload/ad/${ad.pic }" style="width: 920px;height: 400px;"/></a>
			              			</c:if>
			              			<c:if test="${ad.url ==null or ad.url eq '' }">
			              				<a href=""><img src="<%=basePath %>upload/ad/${ad.pic }" style="width: 920px;height: 400px;"/></a>
			              			</c:if>
					</li>
					</c:forEach>
				</ul>
				<ul class="focus-num"></ul>
				<div class="arrow-btn">
					<span class="prev"></span>
					<span class="next"></span>
				</div>
			</div> --%>
            <!--/焦点图-->
		<div id="slideBox" class="slideBox">
			<div class="hd">
				<ul>
				<c:forEach items="${bigads }" var="ad" >
					<li>${ad.index }</li>
					</c:forEach>
				</ul>
			</div>
			<div class="bd">
		
				<ul>
					<c:forEach items="${bigads }" var="ad">
					<li>
						<c:if test="${ad.url !=null and ad.url != '' }">
              				<a href="${ad.url }" target="_blank"><img src="<%=basePath %>upload/ad/${ad.pic }" style="width: 920px;height: 400px;"/></a>
              			</c:if>
              			<c:if test="${ad.url ==null or ad.url eq '' }">
              				<a href=""><img src="<%=basePath %>upload/ad/${ad.pic }" style="width: 920px;height: 400px;"/></a>
              			</c:if>
						</li>
					</c:forEach>
				</ul>
				
			</div>

			<!-- 下面是前/后按钮代码，如果不需要删除即可 -->
			<a class="prev" href="javascript:void(0)"></a>
			<a class="next" href="javascript:void(0)"></a>

		</div>
            <!-- 二级广告样式B -->
            <div class="index-advert">
	            <c:forEach items="${smallads.rows }" var="ad">
	            	<c:if test="${ad.url !=null and ad.url != '' }">
           				<a href="${ad.url }" target="_blank"><img src="<%=basePath %>upload/ad/${ad.pic }" alt="" class="dsb"></a>
           			</c:if>
           			<c:if test="${ad.url ==null or ad.url eq '' }">
           				<a href=""><img src="<%=basePath %>upload/ad/${ad.pic }" alt="" class="dsb"></a>
           			</c:if>
	            </c:forEach>
            </div>
            <!-- 二级广告样式E -->
        </div>

        <!-- 网站数据介绍b -->
        <div class="index-data-info clearfix">
          <ul>
            <li class="nLi">
              <span class="ico"><i class="i-1"></i></span>
              <span class="box"><b>入驻会员</b><br>${statistics.rzhy_tj } 家</span>
                <ul class="sub">
                      <li>
                        <div class="menu_left">
                                      招标机构：<br>
                                      交易机构：<br>
                                      供应商：<br>
                                      竞买人：<br>
                          </div>
                        <div class="menu_right">
                            ${statistics.zbjg }&nbsp;家<br>
                            ${statistics.cqjg }&nbsp;家<br>
                            ${statistics.gys }&nbsp;家<br>
                            ${statistics.jmr }&nbsp;家<br>
                          </div>
                      </li>
                  </ul>
            </li>
            <li>
              <span class="ico"><i class="i-2"></i></span>
              <span class="box"><b>产权交易</b><br>${statistics.cqjy_tj }项</span>
              <ul class="sub">
                    <li><div class="menu_left">
					                            股权：<br>
					                            增资扩股：<br>
					                            房地产：<br>
					                            车辆：<br>
					                            房产招租：<br>
					                            废旧物资：<br>
					                            粮食：<br>
					                           工美藏品：<br>
					                            花木交易：<br>
					                            其他：<br>
					                            
                        </div>
                    	<div class="menu_right">
                    		${statistics.gq }&nbsp;项<br>
                    		${statistics.zzkg }&nbsp;项<br>
                        	${statistics.fccs }&nbsp;项<br>
                            ${statistics.escl }&nbsp;项<br>
                            ${statistics.fczz }&nbsp;项<br>
                            ${statistics.wz }&nbsp;项<br>
                            ${statistics.ls }&nbsp;项<br>
                            ${statistics.gmcp }&nbsp;项<br>
                            ${statistics.hmjy }&nbsp;项<br>
                            ${statistics.qt }&nbsp;项<br>
                            
                        </div>
                    </li>
                </ul>
            </li>
            <li>
              <span class="ico"><i class="i-3"></i></span>
              <span class="box"><b>成交金额</b><br>${statistics.jehj } 万元</span>
            </li>
            <li>
              <span class="ico"><i class="i-4"></i></span>
              <span class="box"><b>招标采购</b><br>${statistics.zbcg_tj } 项</span>
              <ul class="sub">
                    <li>
                    	<div class="menu_left">
                        	货物：<br>
					                        工程：<br>
					                        服务：<br>
                        </div>
                    	<div class="menu_right">
                        	${statistics.hw }&nbsp;项<br>
                            ${statistics.gc }&nbsp;项<br>
                            ${statistics.fw }&nbsp;项<br>

                        </div>
                    </li>
                </ul>
            </li>
            <li class="last">
              <span class="ico"><i class="i-5"></i></span>
              <span class="box"><b>采购金额</b><br>${statistics.zbcg_jehj } 万元</span>
            </li>
          </ul>
        </div>
        <!-- 网站数据介绍E -->

        <!-- 重点项目B -->
        <div class="index-theme  clearfix indexZdxm">
         <div class="smt clearfix pb12">
            <a href="zdxm_more" class="more">更多</a>
            <h2><i></i>重点推荐</h2>
         </div>
        <div class="index-key-project">
          <ul>
            <c:forEach items="${zdads.rows }" var="ad">
	            <c:if test="${ad.outLinkAddr !=null and ad.outLinkAddr != '' }">
	                <li>
                        <a href="${ad.outLinkAddr }" target="_blank">
                            <p class="pic"><img src="${ad.picUrl }" alt="" class="dsb" style="width: 290px;height: 210px"></p>
                        </a>
                    </li>
           		</c:if>
           		<c:if test="${ad.outLinkAddr ==null or ad.outLinkAddr eq '' }">
           		    <li>
           		    <c:if test="${ad.row_ID==9 }">
           		    	<a href="javascript:void(0)">
                            <p class="pic"><img src="${ad.picUrl }" alt="" class="dsb" style="width: 290px;height: 210px"></p>
                        </a>
           		    </c:if>
           		    <c:if test="${ad.row_ID!=9 }">
           		    	<a href="<%=basePath%>zdxminfo?id=${ad.row_ID}" target="_blank">
                            <p class="pic"><img src="${ad.picUrl }" alt="" class="dsb" style="width: 290px;height: 210px"></p>
                        </a>
           		    </c:if>
                    </li>
           		</c:if>
	        </c:forEach>
          </ul>
        </div>
        </div>
        <!-- 重点项目E -->

		<!-- 产权交易B -->
        <div class="index-theme clearfix indexCqjy"> 
         <div class="smt clearfix">
            <a href="<%=basePath %>jygg_more" class="more">更多</a>
            <h2 class="chanquan"><i></i>产权交易</h2>
         </div>
        <div class="index-transaction-list clearfix">
          <div class="transaction-box clearfix">
            <!-- 瀑布流 房地产 B -->
              <div class="waterfall-list clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-fang">
                       <a  class="more" onclick="cqjy_more('房地产')">更多</a> <h3><i></i>房产</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                            <c:forEach items="${cqjys }" var="cqjy">
                                <c:if test="${cqjy.categorynum eq '001001001' }">
                                    <li>
                                    <c:if test="${cqjy.oldprojectguid != ''}"><div class="activity"></div></c:if>
                                        <div class="pic">
                                            <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('房地产','${cqjy.infoid}','${cqjy.hotLabelName}')"><img src="${cqjy.titlepic}" alt="" class="p"></a>
                                             <c:if test="${fn:length(cqjy.hotLabelName) > 0}">
                                             <div class="characteristic">
                                             <c:forEach items="${cqjy.hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
                                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                            </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                        <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('房地产','${cqjy.infoid}','${cqjy.hotLabelName}')"><%@ include file="index_render_state.jsp" %></a>
                                        <div class="box">
	                                        <div class="title"><a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" target="_blank"><b>[${cqjy.shiname }]</b>${cqjy.title }</a></div>
	                                        <div class="item">
	                                            挂牌价：<span class="fcdd3"><span class="bold">${cqjy.guapaiprice }</span> <c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span>
	                                        </div>
	                                        <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${cqjy.click }次浏览</span>
					                        </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 房地产 E -->
             <!-- 瀑布流 资产招租 B -->
              <div class="waterfall-list clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-zhaozu">
                       <a  onclick="cqjy_more('资产招租')" class="more">更多</a> <h3><i></i>资产招租</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                            <c:forEach items="${cqjys }" var="cqjy">
                                <c:if test="${cqjy.categorynum eq '001001009' }">
                                    
                                    <li>
                                    	<c:if test="${cqjy.oldprojectguid != ''}"><div class="activity"></div></c:if>
                                        <div class="pic">
                                            <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('资产招租','${cqjy.infoid}','${cqjy.hotLabelName}')"><img src="${cqjy.titlepic}" alt="" class="p"></a>
                                             <c:if test="${fn:length(cqjy.hotLabelName) > 0}">
                                             <div class="characteristic">
                                             <c:forEach items="${cqjy.hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
                                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                            </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                        <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('资产招租','${cqjy.infoid}','${cqjy.hotLabelName}')"><%@ include file="index_render_state.jsp" %></a>
                                        <div class="box">
	                                        <div class="title"><a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" target="_blank"><b>[${cqjy.shiname }]</b>${cqjy.title }</a></div>
	                                        <div class="item">
	                                            挂牌价：<span class="fcdd3"><span class="bold">${cqjy.guapaiprice }</span> <c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span>
	                                        </div>
	                                        <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${cqjy.click }次浏览</span>
					                        </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 资产招租 E -->

 <!-- 瀑布流 二手车 B -->
              <div class="waterfall-list clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-che">
                       <a  onclick="cqjy_more('二手车')" class="more">更多</a> <h3><i></i>二手车</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                            <c:forEach items="${cqjys }" var="cqjy">
                                <c:if test="${cqjy.categorynum eq '001001003' }">
                                    
                                    <li>
                                    <c:if test="${cqjy.oldprojectguid != ''}"><div class="activity"></div></c:if>
                                        <div class="pic">
                                            <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('二手车','${cqjy.infoid}','${cqjy.hotLabelName}')"><img src="${cqjy.titlepic}" alt="" class="p"></a>
                                             <c:if test="${fn:length(cqjy.hotLabelName) > 0}">
                                             <div class="characteristic">
                                             <c:forEach items="${cqjy.hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
                                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                            </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                        <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('二手车','${cqjy.infoid}','${cqjy.hotLabelName}')"><%@ include file="index_render_state.jsp" %></a>
                                        <div class="box">
	                                        <div class="title"><a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" target="_blank"><b>[${cqjy.shiname }]</b>${cqjy.title }</a></div>
	                                        <div class="item">
	                                            挂牌价：<span class="fcdd3"><span class="bold">${cqjy.guapaiprice }</span> <c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span>
	                                        </div>
	                                        <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${cqjy.click }次浏览</span>
					                        </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 二手车 E -->

            <!-- 瀑布流 废旧物资 B -->
              <div class="waterfall-list clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-feijiu">
                       <a onclick="cqjy_more('废旧物资')" class="more">更多</a> <h3><i></i>废旧物资</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                            <c:forEach items="${cqjys }" var="cqjy">
                                <c:if test="${cqjy.categorynum eq '001001004' }">
                                    
                                    <li>
                                    <c:if test="${cqjy.oldprojectguid != ''}"><div class="activity"></div></c:if>
                                        <div class="pic">
                                            <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('废旧物资','${cqjy.infoid}','${cqjy.hotLabelName}')"><img src="${cqjy.titlepic}" alt="" class="p"></a>
                                             <c:if test="${fn:length(cqjy.hotLabelName) > 0}">
                                             <div class="characteristic">
                                             <c:forEach items="${cqjy.hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
                                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                            </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                        <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('废旧物资','${cqjy.infoid}','${cqjy.hotLabelName}')"><%@ include file="index_render_state.jsp" %></a>
                                        <div class="box">
	                                        <div class="title"><a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" target="_blank"><b>[${cqjy.shiname }]</b>${cqjy.title }</a></div>
	                                        <div class="item">
	                                            挂牌价：<span class="fcdd3"><span class="bold">${cqjy.guapaiprice }</span> <c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span>
	                                        </div>
	                                        <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${cqjy.click }次浏览</span>
					                        </div>
                                        </div>
                                    </li>
                                    
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 废旧物资 E -->

            <!-- 瀑布流 股权 B -->
              <div class="waterfall-list clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-guquan">
                       <a onclick="cqjy_more('股权')" class="more">更多</a> <h3><i></i>股权</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                          <c:forEach items="${cqjys }" var="cqjy">
                          	 <c:if test="${cqjy.categorynum eq '001001002' }">
                        	 	<li>
                        	 	<c:if test="${cqjy.oldprojectguid != ''}"><div class="activity"></div></c:if>
                                        <div class="pic">
                                            <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('股权','${cqjy.infoid}','${cqjy.hotLabelName}')"><img src="${cqjy.titlepic}" alt="" class="p"></a>
                                             <c:if test="${fn:length(cqjy.hotLabelName) > 0}">
                                             <div class="characteristic">
                                             <c:forEach items="${cqjy.hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
                                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                            </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                        <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('股权','${cqjy.infoid}','${cqjy.hotLabelName}')"><%@ include file="index_render_state.jsp" %></a>
                                        <div class="box">
	                                        <div class="title"><a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" target="_blank"><b>[${cqjy.shiname }]</b>${cqjy.title }</a></div>
	                                        <div class="item">
	                                            挂牌价：<span class="fcdd3"><span class="bold">${cqjy.guapaiprice }</span> <c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span>
	                                        </div>
	                                        <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${cqjy.click }次浏览</span>
					                        </div>
                                        </div>
                                    </li>
	                          </c:if>
                        	</c:forEach>
                        </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 股权 E -->
 
 			<!-- 瀑布流 债权 B -->
              <div class="waterfall-list clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-zhaiquan">
                       <a onclick="cqjy_more('增资扩股')" class="more">更多</a> <h3><i></i>增资扩股</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                            <c:forEach items="${cqjys }" var="cqjy">
                                <c:if test="${cqjy.categorynum eq '001001012' }">
                                    <li>
                                    	<c:if test="${cqjy.oldprojectguid != ''}"><div class="activity"></div></c:if>
                                        <div class="pic">
                                            <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('增资扩股','${cqjy.infoid}','${cqjy.hotLabelName}')"><img src="${cqjy.titlepic}" alt="" class="p"></a>
                                             <c:if test="${fn:length(cqjy.hotLabelName) > 0}">
                                             <div class="characteristic">
                                             <c:forEach items="${cqjy.hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
                                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                            </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                        <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('增资扩股','${cqjy.infoid}','${cqjy.hotLabelName}')"><%@ include file="index_render_state.jsp" %></a>
                                        <div class="box">
	                                        <div class="title"><a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" target="_blank"><b>[${cqjy.shiname }]</b>${cqjy.title }</a></div>
	                                        <div class="item">
	                                             挂牌价：<span class="fcdd3"><span class="bold">${cqjy.zzkg_guapaiprice}</span></span>
	                                        </div>
	                                        <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${cqjy.click }次浏览</span>
					                        </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 债权 E -->


            <!-- 瀑布流 二手设备 B -->
              <div class="waterfall-list clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-ershou">
                       <a onclick="cqjy_more('二手设备')" class="more">更多</a> <h3><i></i>二手设备</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                          <c:forEach items="${cqjys }" var="cqjy">
                        	<c:if test="${cqjy.categorynum eq '001001018' }">
                        	 <li>
                        	 			<c:if test="${cqjy.oldprojectguid != ''}"><div class="activity"></div></c:if>
                                        <div class="pic">
                                            <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('二手设备','${cqjy.infoid}','${cqjy.hotLabelName}')"><img src="${cqjy.titlepic}" alt="" class="p"></a>
                                             <c:if test="${fn:length(cqjy.hotLabelName) > 0}">
                                             <div class="characteristic">
                                             <c:forEach items="${cqjy.hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
                                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                            </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                        <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('二手设备','${cqjy.infoid}','${cqjy.hotLabelName}')"><%@ include file="index_render_state.jsp" %></a>
                                        <div class="box">
	                                        <div class="title"><a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" target="_blank"><b>[${cqjy.shiname }]</b>${cqjy.title }</a></div>
	                                        <div class="item">
	                                            挂牌价：<span class="fcdd3"><span class="bold">${cqjy.guapaiprice }</span> <c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span>
	                                        </div>
	                                        <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${cqjy.click }次浏览</span>
					                        </div>
                                        </div>
                                    </li>
	                       	 </c:if>
                        </c:forEach>
                        </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 林权 E -->


            <!-- 瀑布流 土地 B -->
              <div class="waterfall-list clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-tudi">
                       <a onclick="cqjy_more('土地')" class="more">更多</a> <h3><i></i>土地</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                           <c:forEach items="${cqjys }" var="cqjy">
                        	<c:if test="${cqjy.categorynum eq '001001011' }">
                        	 <li>
                        	 			<c:if test="${cqjy.oldprojectguid != ''}"><div class="activity"></div></c:if>
                                        <div class="pic">
                                            <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('土地','${cqjy.infoid}','${cqjy.hotLabelName}')"><img src="${cqjy.titlepic}" alt="" class="p"></a>
                                             <c:if test="${fn:length(cqjy.hotLabelName) > 0}">
                                             <div class="characteristic">
                                             <c:forEach items="${cqjy.hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
                                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                            </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                        <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('土地','${cqjy.infoid}','${cqjy.hotLabelName}')"><%@ include file="index_render_state.jsp" %></a>
                                        <div class="box">
	                                        <div class="title"><a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" target="_blank"><b>[${cqjy.shiname }]</b>${cqjy.title }</a></div>
	                                        <div class="item">
	                                            挂牌价：<span class="fcdd3"><span class="bold">${cqjy.guapaiprice }</span> <c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span>
	                                        </div>
	                                        <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${cqjy.click }次浏览</span>
					                        </div>
                                        </div>
                                    </li>
	                       	 </c:if>
                        </c:forEach>
                          </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 土地 E -->


             <!-- 瀑布流 工美藏品 B -->
              <div class="waterfall-list clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-cangpin">
                       <a onclick="cqjy_more('工美藏品')" class="more">更多</a> <h3><i></i>工美藏品</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                          <c:forEach items="${cqjys }" var="cqjy">
                          	 <c:if test="${cqjy.categorynum eq '001001007' }">
                        	 <li>
                        	 			<c:if test="${cqjy.oldprojectguid != ''}"><div class="activity"></div></c:if>
                                        <div class="pic">
                                            <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('工美藏品','${cqjy.infoid}','${cqjy.hotLabelName}')"><img src="${cqjy.titlepic}" alt="" class="p"></a>
                                             <c:if test="${fn:length(cqjy.hotLabelName) > 0}">
                                             <div class="characteristic">
                                             <c:forEach items="${cqjy.hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
                                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                            </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                        <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('工美藏品','${cqjy.infoid}','${cqjy.hotLabelName}')"><%@ include file="index_render_state.jsp" %></a>
                                        <div class="box">
	                                        <div class="title"><a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" target="_blank"><b>[${cqjy.shiname }]</b>${cqjy.title }</a></div>
	                                        <div class="item">
	                                            挂牌价：<span class="fcdd3"><span class="bold">${cqjy.guapaiprice }</span> <c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span>
	                                        </div>
	                                        <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${cqjy.click }次浏览</span>
					                        </div>
                                        </div>
                                    </li>
	                          </c:if>
                        	</c:forEach>
                        </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 工美藏品 E -->

            <!-- 瀑布流 其他 B -->
              <div class="waterfall-list clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-qita">
                       <a  onclick="cqjy_more('其他')" class="more">更多</a> <h3><i></i>其他</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                          <c:forEach items="${cqjys }" var="cqjy">
                          	 <c:if test="${cqjy.categorynum eq '001001006' }">
                        	 <li>
                        	 			<c:if test="${cqjy.oldprojectguid != ''}"><div class="activity"></div></c:if>
                                        <div class="pic">
                                            <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('其他','${cqjy.infoid}','${cqjy.hotLabelName}')"><img src="${cqjy.titlepic}" alt="" class="p"></a>
                                             <c:if test="${fn:length(cqjy.hotLabelName) > 0}">
                                             <div class="characteristic">
                                             <c:forEach items="${cqjy.hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
                                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                            </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                        <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('其他','${cqjy.infoid}','${cqjy.hotLabelName}')"><%@ include file="index_render_state.jsp" %></a>
                                        <div class="box">
	                                        <div class="title"><a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" target="_blank"><b>[${cqjy.shiname }]</b>${cqjy.title }</a></div>
	                                        <div class="item">
	                                            挂牌价：<span class="fcdd3"><span class="bold">${cqjy.guapaiprice }</span> <c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span>
	                                        </div>
	                                        <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${cqjy.click }次浏览</span>
					                        </div>
                                        </div>
                                    </li>
	                          </c:if>
                        	</c:forEach>
                        </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 其他 E -->
            
              <!-- 瀑布流 预披露 B -->
              <div class="waterfall-list beforehand clearfix">
                  <div class="info clearfix">
                    <div class="smt ico-yupilu">
                       <a href="ypl_more" class="more">更多</a> <h3><i></i>项目预告</h3>
                    </div>
                    <div class="smc clearfix">
                        <ul>
                          <c:forEach items="${ypl_index}" var="ypl" varStatus="status">                             
                                <li>
                                    <div class="pic">
                                        <a href="newsinfo?infoid=${ypl.infoid}&categoryNum=${ypl.categorynum}" target="_blank">
                                            <img src="${ypl.titlepic}" alt="" class="p">
                                        </a>                                        
                                    </div>
                                    <div class="box">
                                    <div class="title">
                                        <a href="newsinfo?infoid=${ypl.infoid}&categoryNum=${ypl.categorynum}" target="_blank">
                                            <b><c:if test="${not empty ypl.shiname and ypl.shiname ne ''}">[${ypl.shiname}]</c:if></b>${ypl.title}
                                        </a>
                                    </div>
                                    <div class="item">
                                        <c:if test="${'0.00'!=ypl.guapaiprice }">
                                            参考价格：<span class="fcdd3"><span class="bold">${ypl.guapaiprice }</span> 元</span>
                                        </c:if>
                                        <c:if test="${'0.00'==ypl.guapaiprice }">
                                            参考价格：<span class="fcdd3"><span class="bold">面议</span></span>
                                        </c:if>                                                                                                                        
                                    </div>
                                    <div class="item">
					                               <span class="f12 fc99"><i class="footprint"></i>${ypl.click }次浏览</span>
					                        </div>
					                  </div>

                                </li>
                          </c:forEach>                          
                        </ul>
                    </div>
                  </div>
              </div>
            <!-- 瀑布流 预披露 E -->

          </div>
        </div>
        </div>
        <!-- 产权交易E -->

        <!-- 招标采购B -->
<div class="pt15 clearfix   indexZbcg">
 <div class="hasMoreTab">
  <div class="hd">
  <h2><i></i>招标采购</h2>
  <span class="more">
      <a href="<%=basePath%>zbcg_more" target="_blank" style="display: inline;">更多</a>

      <a onclick="zbcg_more('成交公告');" target="_blank" style="display: none;">更多</a>
  </span>
    <ul>
      <li class="on">招标公告</li>

      <li class="">成交公告</li>
    </ul>
  </div>
  <div class="bd">
    <div class="conWrap" style="height: 422px;">
      <div class="con" style="display: block;">
        <div class="index-tender-list zbgg">
        <div class="smt">
                  <span class="curr">工程</span>
                  <span>货物</span>
                  <span>服务</span>
                </div>
                <div class="tender-list-box tender-list zbgg-list"   style="display:inline;">
                   <ul>
						<li class="bold">
		                        <div class="item">项目编号</div>
		                        <div class=" title">
		                           <p class="unit">项目名称</p>
		                        </div>
		                        <div class="time">有效期</div>
		                        <%-- <div class="info">
		                              <%@ include file="render_zbcg_state.jsp" %>
		                                 <span class="keyword">点击数：${info.clickTimes }</span>
		                        </div> --%>
		              </li>
                     <c:forEach items="${zbcgs }" var="info">
                     	<c:if test="${info.categorynum eq '002001001' }">
                     		<li>
		                        <div class=" item"><a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank">${info.projectNum }</a></div>
		                        <div class="title">
		                          <a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank"> <p class="unit" title="${info.biaoduanname }">${info.biaoduanname }</p></a>
		                        </div>
		                        <%--<div class="time"><fmt:formatDate value="${info.baomingend }" type="date" dateStyle="medium"/></div>--%>
		                        <div class="time">${fn:substring(info.baomingend_str,0,19) }</div>

		                     </li>
                     	</c:if>
                     </c:forEach>
                   </ul>
                </div>
                <div class="tender-list-box tender-list zbgg-list" style="display:none;">
                  <ul>
                      <li class="bold">
                          <div class="item">项目编号</div>
                          <div class=" title">
                              <p class="unit">项目名称</p>
                          </div>
                          <div class="time">有效期</div>
                      </li>
                     <c:forEach items="${zbcgs }" var="info">
                     	<c:if test="${info.categorynum eq '002001002' }">
                     		<li>
		                        <div class=" item"><a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank">${info.projectNum }</a></div>
		                        <div class="title">
		                          <a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank"> <p class="unit" title="${info.biaoduanname }">${info.biaoduanname }</p></a>
		                        </div>
		                         <%--<div class="time">--%>
		                         <%--<fmt:formatDate value="${info.baomingend }" type="date" dateStyle="medium"/>--%>
		                         <%--</div>--%>
                                <div class="time">${fn:substring(info.baomingend_str,0,19) }</div>
		                     </li>
                     	</c:if>
                     </c:forEach>
                   </ul>
                </div>
                <div class="tender-list-box tender-list zbgg-list" style="display:none;">
                  <ul>
                      <li class="bold">
                          <div class="item">项目编号</div>
                          <div class="title">
                              <p class="unit">项目名称</p>
                          </div>
                          <div class="time">有效期</div>
                      </li>
                     <c:forEach items="${zbcgs }" var="info">
                     	<c:if test="${info.categorynum eq '002001003' }">
                     		<li>
		                        <div class="item"><a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank">${info.projectNum }</a></div>
		                        <div class="title">
		                           <a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank"><p class="unit" title="${info.biaoduanname }">${info.biaoduanname }</p></a>
		                            
		                        </div>
                                <div class="time">${fn:substring(info.baomingend_str,0,19) }</div>
		                        <%--<div class="time">--%>
		                        <%--<fmt:formatDate value="${info.baomingend }" type="date" dateStyle="medium"/>--%>
		                        <%--</div>--%>
		                     </li>
                     	</c:if>
                     </c:forEach>
                   </ul>
                </div>
          </div>
      </div>

      <div class="con" style="display: none;">
        <div class="index-tender-list cjgg">
        <div class="smt">
                  
                  <span class="curr">工程</span>
                  <span>货物</span>
                  <span>服务</span>
                </div>
                <div class="tender-list-box tender-list  cjgg-list"  style="display:inline;">
                   <ul>
                       <li class="bold">
                           <div class="item">项目编号</div>
                           <div class="title">
                               <p class="unit">项目名称</p>
                           </div>
                           <div class="time">有效期</div>
                       </li>
                    <c:forEach items="${zbcg_cjgg_GC }" var="info">
                    	<li>
                            <div class="item"><a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank">${info.projectNum }</a></div>
                            <div class="title ">
                               <a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank"> <p class="unit" title="${info.biaoduanname }">${info.biaoduanname }</p></a>

                            </div>
                            <div class="time">${fn:substring(info.baomingend_str,0,19) }</div>
                            <%--<div class="time">--%>
                                <%--<fmt:formatDate value="${info.baomingend }" type="date" dateStyle="medium"/>--%>
                            <%--</div>--%>
	                     </li>
                    </c:forEach>
                   </ul>
                </div>
                <div class="tender-list-box tender-list cjgg-list" style="display:none;">
                  <ul>
                      <li class="bold">
                          <div class="item">项目编号</div>
                          <div class=" title ">
                              <p class="unit">项目名称</p>
                          </div>
                          <div class="time">有效期</div>
                      </li>
                      <c:forEach items="${zbcg_cjgg_HW }" var="info">
                          <li>
                              <div class="item "><a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank">${info.projectNum }</a></div>
                              <div class="title">
                                  <a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank"><p class="unit" title="${info.biaoduanname }">${info.biaoduanname }</p></a>

                              </div>
                              <div class="time">${fn:substring(info.baomingend_str,0,19) }</div>
                              <%--<div class="time">--%>
                                  <%--<fmt:formatDate value="${info.baomingend }" type="date" dateStyle="medium"/>--%>
                              <%--</div>--%>
                          </li>
                    </c:forEach>
                   </ul>
                </div>
                <div class="tender-list-box tender-list cjgg-list" style="display:none;">
                  <ul>
                      <li class="bold">
                          <div class="item">项目编号</div>
                          <div class="title">
                              <p class="unit">项目名称</p>
                          </div>
                          <div class="time">有效期</div>
                      </li>
                      <c:forEach items="${zbcg_cjgg_FW }" var="info">
                          <li>
                              <div class=" item"><a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank">${info.projectNum }</a></div>
                              <div class="title ">
                                 <a href="<%=basePath %>newsinfo?tag=zbcg&infoid=${info.infoID}" target="_blank"> <p class="unit" title="${info.biaoduanname }">${info.biaoduanname }</p></a>

                              </div>
                              <div class="time">${fn:substring(info.baomingend_str,0,19) }</div>
                              <%--<div class="time">--%>
                                  <%--<fmt:formatDate value="${info.baomingend }" type="date" dateStyle="medium"/>--%>
                              <%--</div>--%>
                          </li>
                    </c:forEach>
                   </ul>
                </div>

          </div>
      </div>
    </div>
  </div>
</div>
              </div>

<!-- 招标采购E -->




  <!-- 快捷采购B -->
        <div class="pt15 clearfix indexKjcg">
 <div class="hasMoreTab">
  <div class="hd">
  <h2 class="kuaijie"><i></i>快捷采购</h2>
  <span class="more">
      <a href="<%=basePath %>kjcg_more" target="_blank" style="display: inline;">更多</a>
<!--       <a href="" target="_blank" style="display: none;">更多2&gt;</a> -->
      <a  target="_blank" style="display: none; cursor: pointer" onclick="kjcg_more('成交公告');" >更多</a>
  </span>
    <ul>
      <li class="on">采购公告</li>
<!--       <li class="">更正公告</li> -->
      <li class="">成交公告</li>
    </ul>
  </div>
  <div class="bd">
    <div class="conWrap">
      <div class="con" style="display: block;">
        <div class="index-tender-list">
                <div class="tender-list-box tender-list"   style="display:inline;">
                   <ul>
                       <li class="bold">
                           <div class="item">项目编号</div>
                           <div class="title">
                               <p class="unit">项目名称</p>
                           </div>
                           <div class="time">有效期</div>
                       </li>
                   	 <c:forEach items="${kjcgs }" var="info">
                         <li>
                             <div class="item"><a href="<%=basePath %>newsinfo?tag=kjcg&infoid=${info.infoID}" target="_blank">${info.projectNum }</a></div>
                             <div class="title">
                                <a href="<%=basePath %>newsinfo?tag=kjcg&infoid=${info.infoID}" target="_blank"> <p class="unit" title="${info.biaoduanname }">${info.biaoduanname }</p></a>

                             </div>
                             <%--<div class="time">${fn:substring(info.baomingend,0,19) }</div>--%>
                             <div class="time">${fn:substring(info.baomingend_str,0,19) }</div>
                             <%--<div class="time">--%>
                                 <%--<fmt:formatDate value="${info.baomingend }" type="date" dateStyle="medium"/>--%>
                             <%--</div>--%>
                         </li>
                   	 </c:forEach>
                   </ul>
                </div>
          </div>
      </div>

      <div class="con" style="display: none;">
        <div class="index-tender-list">
                <div class="tender-list-box tender-list" >
                   <ul>
                       <li class="bold">
                           <div class="item">项目编号</div>
                           <div class="title">
                               <p class="unit">项目名称</p>
                           </div>
                           <div class="time">有效期</div>
                       </li>
                     <c:forEach items="${kjcg_cjgg }" var="info">
                    	<li>
                            <div class="item"><a href="<%=basePath %>newsinfo?tag=kjcg&infoid=${info.infoID}" target="_blank">${info.projectNum }</a></div>
                            <div class="title">
                               <a href="<%=basePath %>newsinfo?tag=kjcg&infoid=${info.infoID}" target="_blank"> <p class="unit" title="${info.biaoduanname }">${info.biaoduanname }</p></a>
                            </div>
                            <%--<div class="time">${fn:substring(info.baomingend,0,19) }</div>--%>
                            <div class="time">${fn:substring(info.baomingend_str,0,19) }</div>
                            <%--<div class="time">--%>
                                <%--<fmt:formatDate value="${info.baomingend }" type="date" dateStyle="medium"/>--%>
                            <%--</div>--%>
	                     </li>
                    </c:forEach>

                   </ul>
                </div>

          </div>

      </div>
      
      
  </div>
</div>
</div>
              </div>


                 <!-- 快捷采购E -->
 <!-- 竞价大厅B -->
        <div class="indexJjdt pt15 clearfix  ">
 <div class="hasMoreTab">
  <div class="hd">
  <h2 class="jingjia"><i></i>竞价大厅</h2>
  <span class="more">
      <a href="jjdt_more" target="_blank" style="display: inline;">更多</a>
      <a href="zbcg_jjdt" target="_blank" style="display: none;">更多</a>
  </span>
    <ul>
      <li class="on">产权交易</li>
      <li class="">快捷采购</li>
    </ul>
  </div>
  <div class="bd">
    <div class="conWrap">
      <!-- 产权交易竞价大厅 -->
      <div class="con" style="display: block;">
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

		<div id="ejy_huiyuan_baoming">
			<div class="theme-popover">
				<div class="theme-poptit">
					<a href="javascript:;" title="关闭" class="close">×</a>
					E交易竞买人会员登录
				</div>
				<div class="theme-popbod dform">
					<form class="theme-signin" name="loginform" action="" method="post">
					<input type="hidden" name="skipType" value="hyzx" id="skipType"/>
					<input type="hidden" name="projectNo"/>
					<input type="hidden" name="role"/>
					<p><strong>会员：</strong><input class="ipt" type="text" name="username" size="20"/></p>
					<p><strong>密码：</strong><input class="ipt" type="password" name="password" size="20"/></p>
					<p style="text-align:center;">
					<a class="ejy_huiyuan_baoming_btn ejy_huiyuan_dl">登 录</a>
						<a class="ejy_huiyuan_baoming_btn" target="_blank" style="background-color:#fea63a;margin-left:5px;border-color:#fea63a"
							href="http://www.e-jy.com.cn/ejyhy/HuiYuanInfoMis2_CZCQ/Pages/HuiYuanRegisterTwo/JmrAgree.aspx">我要注册</a>
					</p>
					</form>
					<font id="error" stont-size: 12px;color: red;"></font>
				</div>
			</div>
			<div class="theme-popover-mask"></div>

<!-- 			<div id="ejy_huiyuan_selectRole" class="theme-popover">
				<div class="theme-poptit">
					<a href="javascript:;" title="关闭" class="close">×</a>
					请选择用户登录身份
				</div>
				<div class="theme-popbod dform base-jg">
					<a href="javascript:;" role="1">竞买人</a>
			  		<a href="javascript:;" role="2">供应商</a>
				</div>
			</div>
			<div class="theme-popover-mask"></div> -->
			</div>
		</div>
		
			
	 
	  <!-- 招标采购竞价大厅 -->
      <div class="con" style="display: none;">
        <table id="listTable" class="bidding-table index-bidding-table">
            <tbody>
            <tr class="bidding-thead nthodd">
                <th width="160">项目编号</th>
                <th>项目名称</th>
                <th>开始时间</th>
                <th>当前报价(元)</th>
                <th width="120">状态</th>
            </tr>
            </tbody>
            <tbody id="newHallList">
            <c:if test="${jjdt_zbcg ==null || fn:length(jjdt_zbcg) ==0 }">
            <tr class="bd-green">
            	<td colspan="5">
            	Tips：暂时没有数据。
            	</td>
            </tr>
            </c:if>
            <c:forEach items="${jjdt_zbcg }" var="project">
                <c:if test="${project.projectnum ne '14HW20170057'}">
	            <tr class="bd-green">
	            	<td>${project.projectnum }</td>
	            	<td title="${project.title }" style="text-align:left;font-size:14px; padding: 5px 10px;">
		            	<a class="bdh-btn" target="_blank" href="newsinfo?infoid=${project.infoid }" style="color: #333">${project.title }</a>
	            	</td>
	            	<%--<td >${fn:substring(project.jingjiastartdate_str ,0 ,19) }</td>--%>
	            	<td >${project.jingjiastartdate_str }</td>
	              	<td title="${project.zgj } 元">${project.zgj } 元</td>
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
  </div>
</div>
</div>

<!-- 竞价大厅E -->

<!-- 加盟机构b -->
<div class="index-theme clearfix   indexJmjg"> 
         <div class="smt clearfix">
            <a href="<%=basePath %>friends" class="more">更多</a>
            <h2 class="jiameng"><i></i>加盟机构</h2>
         </div>
         <div class="friendship-list clearfix">

            <div id="marquee1" class="marqueeleft">
              <div style="width:10000px;">
                <ul id="marquee1_1">
	                <c:forEach var="link" items="${linkList}">
	              		  <li> <a class="pic" href="${link.url }" target="_blank"><img width="222" height="68" src="<%=basePath%>upload/link/${link.image}"></a></li>
	              	</c:forEach>
                </ul>
                <ul id="marquee1_2">
                </ul>
              </div>
            </div>
<!--marqueeleft end--> 

         </div>

</div>
 
<!-- 加盟机构E -->

 </div>
 </div>
<!--  通用底部b -->
<jsp:include page="bottom.jsp"></jsp:include>
<!--  通用底部E -->
        
        <!--左侧漂浮导航-->
        <div class="nav_left" style="display: ;">
            <div class="nav_left_nav">
                <ul class="clearfix zcfdh">
                    <li class="active"><h3>重点<br>推荐</h3></li>
                    <li class=""><h3>产权<br>交易</h3></li>
                    <li class=""><h3>招标<br>采购</h3></li>
                    <li class=""><h3>快捷<br>采购</h3></li>
                    <li class=""><h3>竞价<br>大厅</h3></li>
                    <li class=""><h3>加盟<br>机构</h3></li>
                    <li class="last"><h3>平台<br>优势</h3></li>
                </ul>
            </div>
        </div>
        <!--/左侧漂浮导航-->
        <!-- 新的会员验证 B -->
        <div class="rc_box new-base-login" id="baseLogin2">
         <div class="fix-bg"></div>
          <em style="position: absolute; left: 375px; top:0px;width: 150px;height: 200px;"></em>
                <span class="rc_arrow"><i></i></span>
                <div class="rt_login_box" style="    height: 240px;margin-top: -120px;">
                    <div class="login_box_inner">
                        <div class="login_tit"><a href="javascript:closeLogin2();" class="close">
                      <i class="fcff f24 iconfont icon-error"></i>
                </a><span style="letter-spacing:0px;">请选择用户登录身份</span></div>
                        <div class="clearfix">
                               <div class="fix-base-jg clearfix">
                                <a class="ejy_huiyuan_bm" href="javascript:closeLogin2();" skipType="index">竞买人</a>
                                <a target="_blank" onclick="closeLogin2();" href="http://www.e-jy.com.cn/ejyhy/Pages/HYHomeIN/index.aspx">供应商</a>
                                </div>
                        </div>
                    </div>
                </div>
        </div>
         <!-- 新的会员验证 B -->
        
        
        <!--侧边快捷导航-->
          <div class="rc_box  new-base-login" id="baseLogin">
          <em style="position: absolute; left: 375px; top:0px;width: 150px;height: 200px;"></em>
                <span class="rc_arrow"><i></i></span>
                <div class="rt_login_box">
                    <div class="login_box_inner">
                        <div class="login_tit"><a href="javascript:closeLogin();" class="close">
                      <i class="fcff f24 iconfont icon-error"></i>
                </a>登录</div>
                        <div class="login_con">
                            <div class="bd" style="padding-left: 0px;">
                                <div class="item">
                                    <ul>
                                        <li class="li1">
                                            <input type="text" maxlength="25" class="txt" name="loginName" id="login_name" value="" placeholder="请输入登录名">
                                            <i class="arr"></i>
                                            <i class="icon s1"></i>
                                        </li>
                                        <li class="li2">
                                            <input type="password" maxlength="25" class="txt" name="passWord" id="pass_word" value="" placeholder="请输入密码">
                                            <i class="arr"></i>
                                            <i class="icon s2"></i>
                                        </li>
                                        <li class="li2">
                                            <input type="text" maxlength="25" class="txt code" name="vercode" id="ver_code" value="" placeholder="请输入验证码">
                                            <i class="arr"></i>
                                            <i class="icon s2"></i>
                                            <img src="" alt="" width="120" height="40" id="authimg" class="dsb fr">
                                        </li>
                                        
                                        <li>
                                            <a href="javascript:void(0)" onclick="loginR()" style="width:100%;">
                                                <button class="btn yahei">登录</button>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <jsp:include page="rightbutton.jsp"></jsp:include>
        <!--/侧边快捷导航-->
        
        
        
      <!-- 新增检测地址 B -->
        <div class="visit-fix fbjywt" style="bottom: 0px;display: none" id="qhdq" >
        <div class="fix-bg"></div>
        <div class="box" style="width: 300px;margin-left: -150px; top: 40%;">
            <div class="recharge-cz">
            
               <div class="bd_b  pb10  clearfix lh24 ta-c " id="qhdq_content"></div>

            </div>
            <div class="pd10 ta-c recharge-btn " style="height: 34px;">
                <button type="button" class="fix-base-btn mr10 fix-btn-default"  id="qhdqNO">取消</button>
                <button type="button" class="fix-base-btn fix-btn-danger "  id="qhdqOK">切换</button>
            </div>
        </div>
    </div>
     <!-- 新增检测地址 E -->
    
    
        <a style="display: none;" href="http://www.e-jy.com.cn/ejyhy/logout.aspx" target="ejy_huiyuan_logout"><i id="ejy_huiyuan_logout" ></i></a>
        <iframe style="display: none;" name="ejy_huiyuan_logout"></iframe>
</body>
   <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
    <script src="<%=basePath%>html/js/iconfont.js"></script>
    <script src="<%=basePath%>html/js/focus.js"></script>
    <script src="<%=basePath%>html/js/jquery.SuperSlide.js"></script>
    <script src="<%=basePath%>html/js/index.js"></script>
   <script src="<%=basePath%>html/js/main.js"></script>
   <script src="<%=basePath%>html/js/glivia.js"></script>
  
   
<script type="text/javascript">
$(function(){
  $("div.list_lh").myScroll({
    speed:60, //数值越大，速度越慢
    rowHeight:52 //li的高度
  });
});
</script>
<script type="text/javascript">
function showLogin() {
    $(".new-base-login").animate({ bottom: '0px' }, 300);
    newimg();
};

function closeLogin() {
    $(".new-base-login").animate({ bottom: '-100%' }, 300);
};


function showLogin2() {
    $("#baseLogin2").animate({ bottom: '0px' }, 300);
    newimg();
};

function closeLogin2() {
    $("#baseLogin2").animate({ bottom: '-100%' }, 0);
};

//退出登陆
function exitLogin() {
	$("#ejy_huiyuan_logout").trigger("click");

    $.ajax({
        type: "POST",
        url: "login_out",
       	dataType:"json",
       	data: "",
       	success: function(message){
       	    if(message.code == "0"){
				var $no_login =$("#no_login");
  	        	var $has_login =$("#has_login");
  	        	$no_login.show();
  	        	$has_login.hide();    	        
       	    }       	    	    
       	},
       	error:function (XMLHttpRequest, textStatus, errorThrown) {

       	}
    });
};
function newimg(){
	$("#authimg").attr("src","authimg?"+new Date().getTime());
}
$("#authimg").click(function(){
	newimg();
});
function loginR(){
    var flag = true;
    var msg = "";
    if($.trim($('#pass_word').val()) == ''){
        msg = "密码必填！";
        flag = false;
    }
    if($.trim($('#login_name').val()) == ''){
        msg = "登录名必填！";
        flag = false;
    }
    if(!flag){
        alert(msg);
    }else{
        $.ajax({
            type: "POST",
            url: "login_in",
       	    dataType: "json",
       	    data: {
				loginName: $('#login_name').val(),
				passWord: $('#pass_word').val(),
				vercode: $('#ver_code').val()
			},
       	    success: function(message){
       	        if(message.msg != ""){
       	            alert(message.msg);
       	        }else{
       	            window.location.reload();
       	        }
       	    },
       	    error:function (XMLHttpRequest, textStatus, errorThrown) {

       	    }
        });
    }  
}

function l_login(name,pwd){	
	$.ajax({
        type: "POST",
        url: "login_in",
   	    dataType: "json",
   	    data: {
			loginName: $('#login_name').val(),
			passWord: $('#pass_word').val()
		},
   	    success: function(message){
   	        if(message.msg != ""){
   	            alert(message.msg);
   	        }else{
   	            window.location.reload();
   	        }
   	    },
   	    error:function (XMLHttpRequest, textStatus, errorThrown) {

   	    }
    });	
}
</script>
<script>
 function zbcg_more(type){
 	window.open('<%=basePath%>zbcg_more?type='+encodeURI(encodeURI(type)));
 }
 function cqjy_more(type){
	 	window.open('<%=basePath%>jygg_more?categoryname='+encodeURI(encodeURI(type)));
}
 function kjcg_more(type){
	 	window.open('<%=basePath%>kjcg_more?type='+encodeURI(encodeURI(type)));
}
</script>
<script type="text/javascript">marqueeStart(1, "left");</script>
<script type="text/javascript">jQuery(".hasMoreTab").slide({ mainCell:".conWrap", targetCell:".more a", effect:"fold"});</script>
</body>

</html>

