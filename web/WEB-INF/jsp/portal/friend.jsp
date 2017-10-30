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
   <div class="k1200">
     <div class="clear pb15"></div>
	  <!--  帮助中心-->  
	  <jsp:include page="help.jsp"></jsp:include>
	  <!--  帮助中心-->  
      <div class="new-list-right">
        <div class="clearfix smt">
         <div class="fl">
            <a href="" target="_blank">首页</a>
            &gt; 
                <a href="" target="_blank">${catagoryName}</a>
          </div>
          </div>
          <div class=" link-list clearfix">
              <ul class="clearfix">
              	<c:forEach var="link" items="${list}">
              		  <li> <a class="pic" href="${link.url }" target="_blank"><img src="<%=basePath%>upload/link/${link.image}"></a></li>
              	</c:forEach>
              </ul>
          </div>

      </div>
     <div class="clear pb15"></div> 
  </div>      
  
  <div id="kkpager" class="kkpager" style="display: block;">
    <div class="clearfix">
      <span class="pageBtnWrap">
	      <c:if test="${page>1}">
	      	 <a href="<%=basePath %>friends?page=${page-1}" title="上一页">上一页</a>
		  </c:if>
		  <c:if test="${page-3 gt 0}">
		  	<a href="<%=basePath %>friends?page=${page-3}" >${page-3}</a>
		  </c:if>
		  <c:if test="${page-2 gt 0}">
		  	<a href="<%=basePath %>friends?page=${page-2}" >${page-2}</a>
		  </c:if>
		  <c:if test="${page-1 gt 0}">
		  	<a href="<%=basePath %>friends?page=${page-1}" >${page-1}</a>
		  </c:if>
		  <span class="curr">${page}</span>
		  <c:if test="${page+1 lt totalPage}">
		  	<a href="<%=basePath %>friends?page=${page+1}" >${page+1}</a>
		  </c:if>
		  <c:if test="${page+2 lt totalPage}">
		  	<a href="<%=basePath %>friends?page=${page+2}" >${page+2}</a>
		  </c:if>
		  <c:if test="${page+3 lt totalPage}">
		  	<a href="<%=basePath %>friends?page=${page+3}" >${page+3}</a>
		  </c:if>
        <c:if test="${page<totalPage}">
	      	 <a href="<%=basePath %>friends?page=${page+1}" title="下一页">下一页</a></span>
		</c:if>
        <span class="infoTextAndGoPageBtnWrap">
        <span class="totalText">
            共<span class="totalPageNum">${totalPage }</span>页<span class="totalInfoSplitStr">/</span>共<span class="totalRecordNum">${total }</span>条数据</span>
        <span class="goPageBox ml20">
           转到
           <span id="kkpager_gopage_wrap">
           <input type="button" id="kkpager_btn_go" onclick="gotoPage();" value="确定">
           <input onkeyup="this.value=this.value.replace(/\D/g,'')" value="${page }" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" id="kkpager_btn_go_input" onfocus="kkpager.focus_gopage()" onkeypress="return kkpager.keypress_gopage(event);" onblur="kkpager.blur_gopage()">
           </span>页</span>
           </span>
      </div>
    </div> 
<!--  通用底部b -->
<jsp:include page="bottom.jsp"></jsp:include>
<!--  通用底部b -->
<!--侧边快捷导航-->
<jsp:include page="rightbutton.jsp"></jsp:include>
<!--/侧边快捷导航-->
</body>
   <%--<script src="<%=basePath%>html/js/jquery-1.7.2.min.js"></script>--%>
   <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
    <script src="<%=basePath%>html/js/iconfont.js"></script>
    <script src="<%=basePath%>html/js/focus.js"></script>
    <script src="<%=basePath%>html/js/jquery.SuperSlide.js"></script>
   <script src="<%=basePath%>html/js/main.js"></script>
   <script src="<%=basePath%>html/js/glivia.js"></script>
<script type="text/javascript">
var basePath='<%=basePath%>';

//$(function(){
//$("div.list_lh").myScroll({
//    speed:40, //数值越大，速度越慢
//    rowHeight:52 //li的高度
//});
//});

function gotoPage(){
    var page=document.getElementById('kkpager_btn_go_input').value;
    if(page==''){
	    alert("请输入要跳转的页面数！");
		return;
	}
    page=parseInt(page);
    var tPage=parseInt('${totalPage}');
    if(page<=0){
    	window.open(basePath+"friends?page=1","_self");
    }else if(page>tPage){
    	window.open(basePath+"friends?page="+tPage,"_self");
    }else{
    	window.open(basePath+"friends?page="+page,"_self");
    }
}
</script>
<%--<script type="text/javascript">marqueeStart(1, "left");</script>--%>
<script type="text/javascript">jQuery(".hasMoreTab").slide({ mainCell:".conWrap", targetCell:".more a", effect:"fold"});</script>

</body>

</html>

