<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <jsp:include page="mate.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=basePath%>html/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/base.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/header.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/global.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/list.css">
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
</head>

<script type="text/javascript">
function gotoPage(){
    var page=document.getElementById('kkpager_btn_go_input').value;
    if(page==''){
	    alert("请输入要跳转的页面数！");
		return;
	}
    page=parseInt(page);
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
    var url="zdxm_more?rows=16";
    if(page!=null){
        url+='&page='+page;
    }
    window.open(url,"_self");
}
</script>
<body>
<!--  头部B-->
<jsp:include page="top.jsp"></jsp:include>
<!--  头部E-->
<div class="base-container clearfix">

    <div class="row clearfix">
        <div class="crumbs clearfix">
            <div class="fl">
                <a href="" target="_blank">首页</a>
                &gt;
                <a >重点推荐</a>

            </div>
        </div>
    </div>




    <div class="list-key-project">
        <ul>
            <c:forEach items="${list }" var="project">
                <c:if test="${project.outLinkAddr !=null and project.outLinkAddr != '' }">
                    <li>
                        <a href="${project.outLinkAddr }" target="_blank">
                            <p class="pic"><img src="${project.picUrl }" alt="" class="dsb" style="width: 290px;height: 210px"></p>
                        </a>
                    </li>
                </c:if>
                <c:if test="${project.outLinkAddr ==null or project.outLinkAddr eq '' }">
                    <li>
                    <c:if test="${project.row_ID==9 }">
                        <a href="javascript:void(0)">
                            <p class="pic"><img src="${project.picUrl }" alt="" class="dsb" style="width: 290px;height: 210px"></p>
                        </a>
                    </c:if>
           		    <c:if test="${project.row_ID!=9 }">
           		    	<a href="<%=basePath%>zdxminfo?id=${project.row_ID}" target="_blank">
                            <p class="pic"><img src="${project.picUrl }" alt="" class="dsb" style="width: 290px;height: 210px"></p>
                        </a>
           		    </c:if>
                    </li>
                </c:if>
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

    <!--  通用底部b -->
    <jsp:include page="bottom.jsp"></jsp:include>
    <!--  通用底部b -->
    <!--侧边快捷导航-->
    <jsp:include page="rightbutton.jsp"></jsp:include>
    <!--/侧边快捷导航-->

</body>

    <script src="<%=basePath%>html/js/jquery.SuperSlide.js"></script>
    <script type="text/javascript" src="<%=basePath%>html/js/city-data.js"></script>
    <script type="text/javascript" src="<%=basePath%>html/js/hzw-city-picker.min.js"></script>
    <%--<script src="<%=basePath%>html/js/jquery-1.7.2.min.js"></script>--%>
    <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
    <script src="<%=basePath%>html/js/iconfont.js"></script>
    <script src="<%=basePath%>html/js/focus.js"></script>
    <script src="<%=basePath%>html/js/jquery.SuperSlide.js"></script>
    <script src="<%=basePath%>html/js/main.js"></script>
    <script src="<%=basePath%>html/js/index.js"></script>
    <script src="<%=basePath%>html/js/glivia.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.cookie.min.js"></script>

</html>
