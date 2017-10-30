<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
    <script src="<%=basePath%>html/js/iconfont.js"></script>
    <script src="<%=basePath%>html/js/focus.js"></script>
    <script src="<%=basePath%>html/js/main.js"></script>
    <script src="<%=basePath%>html/js/glivia.js"></script>
    <script src="<%=basePath%>js/zbcg/list.js"></script>
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
            &gt;
                <a href="<%=basePath%>zbcg_more">招标采购</a>
                &gt;
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
        <ul class="select clearfix">
           <li class="select-list">
              <dl id="select1">
                <dt>机构名称：</dt>
	                <dd class="select-all selected"><a href="javascript:;">全部</a></dd>
	                <c:forEach items="${orgList }" var="info">
	                  <dd><a href="javascript:;" id="${info.code }">${info.name }</a></dd>
	                </c:forEach>
              </dl>
            </li>
            <div class="clear"></div>
            <li class="select-list">
              <dl id="select2">
                <dt>公告类型：</dt>
                <dd  class="select-all selected"><a  href="javascript:;">招标公告</a></dd>
                <dd><a  href="javascript:;">成交公告</a></dd>
              </dl>
            </li>
            <li class="select-list">
              <dl id="select3">
                <dt>项目类型：</dt>
                <dd class="select-all selected"><a  href="javascript:;">全部</a></dd>
                <dd><a  href="javascript:;" id="002001001">工程</a></dd>
                <dd><a  href="javascript:;" id="002001002">货物</a></dd>
                <dd><a  href="javascript:;" id="002001003">服务</a></dd>
              </dl>
            </li>
            <li class="select-list">
              <dl id="select4">
                <dt>项目状态：</dt>
                <dd class="select-all selected"><a  href="javascript:;">全部</a></dd>
                <dd><a  href="javascript:;">未开始</a></dd>
                <dd><a  href="javascript:;">报名中</a></dd>
                <dd><a  href="javascript:;">已结束</a></dd>
              </dl>
            </li>
          </ul>
</div>
  </div>    

  <%--<div class="tender-porduct-list clearfix">--%>
  <div class="list-select-search clearfix">
      <div class="tender-list-box tender-list    cjgg-list clearfix" style="padding-bottom: 0px;">

          <c:choose>
              <c:when test="${type eq 'zbgg'}">
                  <ul class="clearfix five">
                      <li class="bold">
                          <div class="title">项目名称</div>
                          <div class=" item">
                              <p class="unit">组织单位</p>
                          </div>
                          <div class="time">报名截止时间</div>

                          <div class="info2">点击数</div>
                          <div class="info2">项目状态</div>
                      </li>
                      <c:forEach items="${rows }" var="info">
                          <li>
                              <div class=" title"><a href="<%=basePath %>newsinfo?infoid=${info.infoID}&tag=zbcg"
                                                     target="_blank"
                                                     title="${info.biaoduanname }">${info.biaoduanname }</a></div>
                              <div class="item">
                                  <p class="unit" title="${info.xiaquname }">${info.xiaquname }</p>
                              </div>
                              <div class="time">${fn:substring(info.baomingend,0,19) }</div>
                              <div class="info2">${info.clickTimes }</div>
                              <%@ include file="render_zbcg_state.jsp" %>

                          </li>
                      </c:forEach>
                  </ul>
              </c:when>
              <c:otherwise>
                  <ul class="clearfix ">
                      <li class="bold">
                          <div class="title">项目名称</div>
                          <div class=" item">
                              <p class="unit">组织单位</p>
                          </div>
                          <div class="time">报名截止时间</div>

                      </li>
                      <c:forEach items="${rows }" var="info">
                          <li>
                              <div class=" title"><a href="<%=basePath %>newsinfo?infoid=${info.infoID}&tag=zbcg"
                                                     target="_blank"
                                                     title="${info.biaoduanname }">${info.biaoduanname }</a></div>
                              <div class="item">
                                  <p class="unit" title="${info.xiaquname }">${info.xiaquname }</p>
                              </div>
                              <div class="time">${fn:substring(info.baomingend,0,19) }</div>

                          </li>
                      </c:forEach>
                  </ul>
              </c:otherwise>
          </c:choose>


      </div>
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
            共<span class="totalPageNum">${totalPage }</span>页<span class="totalInfoSplitStr">/</span>共<span class="totalRecordNum">${count }</span>条数据</span>
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

   <script type="text/javascript">
    var selectA='${selectA}';
	var selectB='${selectB}';
	var selectC='${selectC}';
	var selectD='${selectD}';
	var selectE='${biaoduanname}';
	var basePath='<%=basePath%>';
	function gotoPage(){
	   var page=document.getElementById('kkpager_btn_go_input').value;
	   if(page==''){
		   alert("请输入要跳转的页面数！");
		   return;
	   }
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

</body>

</html>
