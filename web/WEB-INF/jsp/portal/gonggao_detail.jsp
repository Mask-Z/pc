<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>e交易-产权交易平台</title>
	<jsp:include page="mate.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=basePath%>html/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/base.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/header.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/global.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/list.css">
  </head>
<body>
	 <!--  头部B-->  
	  <jsp:include page="top.jsp"></jsp:include>
	 <!--  头部B-->  
	   <div class="base-container clearfix">
	 	<div class="row clearfix">
		       <div class="crumbs clearfix">
		        <div class="fl">
		            <a href="" target="_blank">首页</a>
		               &gt;${newsDetail.title}
		          </div>
		      </div>
        </div>
		<div class="k1200">
		    <div class="detail-box">
		        <div class="box">
		   			    <h1>${newsDetail.title}</h1>
				        <div class="time">发布时间 ${newsDetail.infodate}&nbsp;&nbsp;&nbsp;${newsDetail.click }次阅读</div>
				        <div class="box">
				   			${newsDetail.content }	
		                </div>
		         </div>
		    </div>
		  </div>       
		<div class="clear pb15"></div>
	 </div>
	 <!--  通用底部b -->
	 <jsp:include page="bottom.jsp"></jsp:include>
	 <!--  通用底部b -->
	 <!--侧边快捷导航-->
	 <jsp:include page="rightbutton.jsp"></jsp:include>
	 <!--/侧边快捷导航-->
</body>
    <script src="<%=basePath%>html/js/jquery-1.7.2.min.js"></script>
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
    speed:40, //数值越大，速度越慢
    rowHeight:52 //li的高度
  });
});
</script>
<script type="text/javascript">marqueeStart(1, "left");</script>
<script type="text/javascript">jQuery(".hasMoreTab").slide({ mainCell:".conWrap", targetCell:".more a", effect:"fold"});</script>

</body>

</html>

