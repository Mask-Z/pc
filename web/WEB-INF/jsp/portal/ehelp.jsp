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
   
   <div class="base-container clearfix" style="background: #Fff;text-align: center">
        <div style="width:100%;min-width:1200px;background:url(<%=basePath%>html/images/ebang2.jpg) repeat-x center top;height:608px;"></div>
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
   <script src="<%=basePath%>html/js/main.js"></script>
   <script src="<%=basePath%>html/js/glivia.js"></script>
<script type="text/javascript">
var selectA='${selectA}';
var basePath='<%=basePath%>';
$(function(){
//  $("div.list_lh").myScroll({
//    speed:40, //数值越大，速度越慢
//    rowHeight:52 //li的高度
//  });
});
function gotoPage(){
   var page=document.getElementById('kkpager_btn_go_input').value;
   page=parseInt(page);
    if (isNaN(page)){
        page=1;
    }
   var tPage=parseInt('${totalPage}');
   if(page<=0){
   	   queryData(1);
   }else if(page>tPage){
   	   queryData(tPage);
   }else{
      queryData(page);
   }
}
</script>
<%--<script type="text/javascript">marqueeStart(1, "left");</script>--%>
<%--<script type="text/javascript">jQuery(".hasMoreTab").slide({ mainCell:".conWrap", targetCell:".more a", effect:"fold"});</script>--%>

</body>

</html>

