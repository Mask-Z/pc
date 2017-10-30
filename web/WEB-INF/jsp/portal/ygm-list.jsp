<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <link rel="stylesheet" href="<%=basePath%>html/css/list.css">
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
	<style type="text/css">
		dd{
			cursor: pointer;
		}
	</style>
</head>

<body>
        <!--  头部B-->  
        <jsp:include page="top.jsp"></jsp:include>
        <!--  头部E-->
       <div class="base-container clearfix">
        
       <div class="row clearfix">
       <div class="crumbs clearfix">
        <div class="fl">
            <a href="<%=basePath%>index" target="_blank">首页</a>
            &gt; <a href="<%=basePath%>ygm_more?danWeiGuid=${danWeiGuid}" target="_blank">已成交</a>
          </div>
      </div>
        </div>
        
   <div class="enroll-list-box">
      <ul class="clearfix">
          <c:forEach items="${list }" var="ygm">
		      <li>
		          <div class="pic">
		              <a href="infodetail?infoid=${ygm.infoid }&categoryNum=${ygm.categorynum }" target="_blank" class="content4-detail"><img src="${ygm.titlepic }" alt="" class="p"></a>
                  </div>
                  <div class="title"><a href="infodetail?infoid=${ygm.infoid }&categoryNum=${ygm.categorynum }" target="_blank" class="content4-detail"><b>[${ygm.areaName }]</b>${ygm.title }</a></div>  
                  <div class="item">
                                                                  成交价：<span class="fcdd3"><span class="bold">${ygm.chengjiaoprice }</span> 元</span>
                  </div>        
                  <div class="item">
                      <a href="javascript:void(0)" class="state-btn fr btn-update">已成交</a>
                                                                  成交日期：${ygm.chengjiaodate }
                  </div>
              </li>
		  </c:forEach>                       
      </ul>
  </div>
  <div id="kkpager" class="kkpager" style="display: block;">
    <div class="clearfix">
      <span class="pageBtnWrap">
	      <c:if test="${page>1}">
	      	 <a href="javascript:;" onclick="queryData(${page-1})" title="上一页">上一页</a>
		  </c:if>
		  <c:if test="${page-3 gt 0}">
		  	<a href="javascript:;" onclick="queryData(${page-3})">${page-3}</a>
		  </c:if>
		  <c:if test="${page-2 gt 0}">
		  	<a href="javascript:;" onclick="queryData(${page-2})">${page-2}</a>
		  </c:if>
		  <c:if test="${page-1 gt 0}">
		  	<a href="javascript:;" onclick="queryData(${page-1})">${page-1}</a>
		  </c:if>
		  <span class="curr">${page}</span>
		  <c:if test="${page+1 lt totalPage}">
		  	<a href="javascript:;" onclick="queryData(${page+1})">${page+1}</a>
		  </c:if>
		  <c:if test="${page+2 lt totalPage}">
		  	<a href="javascript:;" onclick="queryData(${page+2})">${page+2}</a>
		  </c:if>
		  <c:if test="${page+3 lt totalPage}">
		  	<a href="javascript:;" onclick="queryData(${page+3})">${page+3}</a>
		  </c:if>
        <c:if test="${page<totalPage}">
	      	 <a href="javascript:;" onclick="queryData(${page+1})" title="下一页">下一页</a></span>
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
  </div>      
  		<!--  通用底部b -->
		<jsp:include page="bottom.jsp"></jsp:include>
        <!--  通用底部E -->
        
        <!--侧边快捷导航-->
    	<jsp:include page="rightbutton.jsp"></jsp:include>
        <!--/侧边快捷导航-->
</body>
   <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
    <script src="<%=basePath%>html/js/iconfont.js"></script>
    <script src="<%=basePath%>html/js/focus.js"></script>
   <script src="<%=basePath%>html/js/main.js"></script>
   <script src="<%=basePath%>html/js/glivia.js"></script>
   <script src="<%=basePath%>js/zbcg/list.js"></script>
<script type="text/javascript">
function gotoPage(){
   var page=document.getElementById('kkpager_btn_go_input').value;
   if(page==''){
       alert("请输入要跳转的页面数！");
	   return;
   }
   page=parseInt(page);
   if(isNaN(page)){
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
function queryData(page){
    var basePath='<%=basePath%>';
    var danWeiGuid='${danWeiGuid}';
	var url=basePath+"ygm_more?danWeiGuid="+danWeiGuid+"&time="+new Date().getTime();
	if(page!=null){
		url+='&page='+page;
	}
	window.open(url,"_self");
}
</script>
</body>

</html>