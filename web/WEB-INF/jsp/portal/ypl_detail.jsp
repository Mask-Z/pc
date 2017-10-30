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
	  <script src="<%=basePath%>html/js/jquery-1.7.2.min.js"></script>
	  <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
	  <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
	  <script src="<%=basePath%>html/js/iconfont.js"></script>
	  <script src="<%=basePath%>html/js/focus.js"></script>
	  <script src="<%=basePath%>html/js/jquery.SuperSlide.js"></script>
	  
	  <script src="<%=basePath%>html/js/main.js"></script>
	  <script src="<%=basePath%>html/js/glivia.js"></script>
  </head>
  <script>
      $(function () {
          $(".ypl-detail-title .item").click(function () {
              $(this).addClass("curr").siblings().removeClass("curr");
              $(".ypl-detail-box").hide().eq($(this).index()).show()
          });
          var r = 0;
          function reinitIframe(){
              var iframe = document.getElementById("contentIframe");
              try{
                  var bHeight = iframe.contentWindow.document.body.scrollHeight;
                  var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                  var height = Math.max(bHeight, dHeight);
                  if(height - r > 10){
                      r = height;
                      iframe.height =  height;
                  }

              }catch (ex){}

          }

          window.setInterval(reinitIframe, 1000);
      })
  </script>

<body>
	 <!--  头部B-->
	  <jsp:include page="top.jsp"></jsp:include>
	 <!--  头部B-->
	   <div class="base-container clearfix">
		   <div class="k1200">
		   <div class="liebiao" style="width: 100%;padding-top: 10px">
			   <div class="weizhi">
				   <a href="index">首页</a>&nbsp;>&nbsp;
				   <a href="ypl_more">项目预告</a>&nbsp;>&nbsp;
				   <a href="">${newsDetail.title }</a>

			   </div>
			   <div class="liebiao-neirong clearfix">
				   <div class="neirong-title">
					   ${newsDetail.title }
				   </div>
				   <div class="neirong-time">发布时间&nbsp;${newsDetail.infodate }&nbsp;&nbsp;&nbsp;&nbsp;${newsDetail.click }次阅读</div>
				   <div class="neirong-content">
					   <iframe frameborder="0" scrolling="auto" name="gonggao_iframe" src="content?infoid=${newsDetail.infoid}" width="1200px" id="contentIframe"></iframe>
					   <%--${newsDetail.content }--%>
				   </div>
			   </div>
		   </div>
		   </div>
	 </div>
	 <!--  通用底部b -->
	 <jsp:include page="bottom.jsp"></jsp:include>
	 <!--  通用底部b -->
	 <!--侧边快捷导航-->
	 <jsp:include page="rightbutton.jsp"></jsp:include>
	 <!--/侧边快捷导航-->
</body>



<%--<script type="text/javascript">jQuery(".hasMoreTab").slide({ mainCell:".conWrap", targetCell:".more a", effect:"fold"});</script>--%>

</body>

</html>

