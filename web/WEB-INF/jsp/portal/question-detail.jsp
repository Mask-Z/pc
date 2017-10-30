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
   <div class="k1200 clearfix">
     <div class="clear pb15"></div>
	  <!--  帮助中心-->  
	  <jsp:include page="help.jsp"></jsp:include>
	  <!--  帮助中心-->  
      <div class="new-list-right">
        <div class="clearfix smt">
         <div class="fl">
            <a href="" target="_blank">首页</a>
            &gt; 
                <a>帮助中心</a>&gt; 
                <a>常见问题</a>
          </div>
          </div>
          <div class="smc clearfix">
             <div class="new-detail-box">
		        <h1>${question.title}</h1>
		        <div class="time">&nbsp;&nbsp;&nbsp;${question.click }次阅读</div>
		        <div class="box">
		   			${question.content }	
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
   <script src="<%=basePath%>html/js/main.js"></script>
   <script src="<%=basePath%>html/js/glivia.js"></script>

</body>

</html>

