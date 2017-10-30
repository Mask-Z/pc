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
	  <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
	  <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
  </head>
<body>
	 <!--  头部B-->  
	  <jsp:include page="top.jsp"></jsp:include>
	 <!--  头部B-->  
	   <div class="base-container clearfix">
	 	<div class="row clearfix">
		       <div class="crumbs clearfix">
		        <div class="fl">
		            <a href="index" target="_blank">首页</a>
		              &gt;
					<c:if test="${tag eq 'zbcg'}">
		                <a href="<%=basePath %>zbcg_more" target="_blank">招标采购</a>
					</c:if>
					<c:if test="${tag eq 'kjcg'}">
						<a href="<%=basePath %>kjcg_more" target="_blank">快捷采购</a>
					</c:if>
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
				   			<%--${newsDetail.content }	--%>
								<%--<div class="p">--%>
									<iframe frameborder="0" scrolling="auto"
											src="content?infoid=${newsDetail.infoid}" width="100%" id="iframeContent"></iframe>
								<%--</div>--%>
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
   <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
    <script src="<%=basePath%>html/js/iconfont.js"></script>
    <script src="<%=basePath%>html/js/focus.js"></script>
    <script src="<%=basePath%>html/js/jquery.SuperSlide.js"></script>
    <%--<script src="<%=basePath%>html/js/index.js"></script>--%>
   <script src="<%=basePath%>html/js/main.js"></script>
   <script src="<%=basePath%>html/js/glivia.js"></script>
<%--<script type="text/javascript">jQuery(".hasMoreTab").slide({ mainCell:".conWrap", targetCell:".more a", effect:"fold"});</script>--%>

</body>
<script>
    var r = 0;

    function reinitIframe() {
        var iframe = document.getElementById("iframeContent");
        try {
            var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
            var height = Math.max(bHeight, dHeight);
            if (height - r > 10) {
                r = height;
                iframe.height = height;
            }
        } catch (ex) {
        }
    }

    window.setInterval(reinitIframe, 500);

</script>
</html>

