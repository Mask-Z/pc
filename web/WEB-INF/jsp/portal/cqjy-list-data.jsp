<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
  <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
   <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
   <script src="<%=basePath%>html/js/iconfont.js"></script>
   <script src="<%=basePath%>html/js/focus.js"></script>
   <script src="<%=basePath%>html/js/jquery.SuperSlide.js"></script>
   <script src="<%=basePath%>html/js/main.js"></script>
   <script src="<%=basePath%>html/js/glivia.js"></script>
   <script src="<%=basePath%>js/cqjy/list_data.js"></script>
   
   
  <script type="text/javascript">
      var selectA='${selectA}';
      var selectG='${selectG}';
      var selectE='${selectE}';
      var orderType='${orderType}';
      var pagename='${pagename}';
      var basePath='<%=basePath%>';
      
      $(function(){
          
      });
      function gotoPage(){
          var page=document.getElementById('kkpager_btn_go_input').value;
          if(page==''){
   		      alert("请输入要跳转的页面数！");
   		      return;
   	      }
          page=parseInt(page);
          var tPage=parseInt('${totalPage}');
          if(page<=0){
              queryData(orderType,1);
          }else if(page>tPage){
              queryData(orderType,tPage);
          }else{
              queryData(orderType,page);
          }
      }
  </script>
<body>
   <!--  头部B-->  
   <jsp:include page="top.jsp"></jsp:include>
   
   <div class="base-container clearfix">
       <div class="row clearfix">
       <div class="crumbs clearfix">
        <div class="fl">
            <a href="index" target="_blank">首页</a>
            &gt;
            <c:choose>
                <c:when test="${not empty pagename and pagename eq 'jl_more'}">
                    <a href="<%=basePath%>jygg_more?pagename=jl_more" target="_blank">捡漏</a>
                </c:when>
                <c:otherwise>
                    <a href="<%=basePath%>jygg_more" target="_blank">产权交易</a>
                </c:otherwise>
            </c:choose>
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
        <ul class="select">
            <li class="select-list">
              <dl id="select1">
                <dt>标的类型：</dt>
                <dd class="select-all selected"><a href="javascript:;">全部</a></dd>
                  <c:forEach items="${categories}" var="categoryname">
                      <dd><a href="javascript:;">${categoryname}</a></dd>
                  </c:forEach>
              </dl>
            </li>
            <c:if test="${hasHotLable=='1' }">
            <li class="select-list">
              <dl id="select6">
                <dt>标的亮点：</dt>
                  <dd>
                  <div class="box-menu">
                  <c:forEach var="hotlable" items="${hotlables}">
                    <span class="item"><input type="checkbox" class="hot_lable"><span>${hotlable.HotLabelName }</span></span>
                  </c:forEach>
                  </div>
                  </dd>
              </dl>
            </li>
            </c:if>
            <c:if test="${hasHotLable=='0' }">
            <li class="select-list" style="display:none;">
              <dl id="select6">
                <dt>标的亮点：</dt>
                  <dd>
                  <div class="box-menu">
                  <c:forEach var="hotlable" items="${hotlables}">
                    <span class="item"><input type="checkbox" class="hot_lable">${hotlable.HotLabelName }</span>
                  </c:forEach>
                  </div>
                  </dd>
              </dl>
            </li>
            </c:if>
            <li class="select-list-bot clearfix">
                    <span class="fl mr30">当前记录 <span class="fcdd3">${total }</span> 条</span>                
                  <div class="fr ">默认排序：   
                   <a href="javascript:;" class="location curr" onclick="queryData('orderType1')">默认 <i></i></a> 
                   <a href="javascript:;" class="location" onclick="queryData('orderType2')">低价 <i></i></a>
                   <a href="javascript:;" class="location" onclick="queryData('orderType3')">最新 <i></i></a> 
                  </div>
            </li>
            
          </ul>
</div>
  </div>    

  <div class="product-list">
      <ul class="clearfix">
       <c:forEach var="cqjy" items="${list}">
          	<li>
                <c:if test="${cqjy.oldprojectguid != ''}">
                    <div class="activity"></div>
                </c:if>
				<div class="pic">
                   <a href="javascript:;" onclick="updateTypeCookieAndOpenPage('${cqjy.projectstyle}','${cqjy.infoid}')">
                   
                   <img src="${cqjy.titlepic}" alt="" class="p">
                   <c:if test="${cqjy.cjgg_guid!=null && cqjy.cjgg_guid!='' }"><p class="base-concluded"></p></c:if>
                   </a>
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
                 <div class="title"><a href="javascript:;" onclick="updateTypeCookieAndOpenPage('${cqjy.projectstyle}','${cqjy.infoid}')"><b>[${cqjy.s2 }]</b>${cqjy.title }</a></div>
                 <div class="item">
                     <c:if test="${cqjy.systemtype != 'ZZKG' }"> 
                         挂牌价：<span class="fcdd3"><span class="bold">${cqjy.guapaiprice }</span><c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span>
                     </c:if>
                     <c:if test="${cqjy.systemtype == 'ZZKG' }"> 
                         挂牌价：<span class="fcdd3"><span class="bold">${cqjy.zzkg_guapaiprice }</span></span>
                     </c:if>                     
                 </div>
                 
                 <c:if test="${cqjy.xiaQuCode == '101023' || cqjy.xiaQuCode == '101024' }">
                 <div class="item">报名截止时间：${cqjy.gonggaotodate_str.substring(0, 10) }</div>
                 </c:if>
                 <c:if test="${cqjy.xiaQuCode != '101023' && cqjy.xiaQuCode != '101024' }">
                 <div class="item">报名截止时间：${cqjy.gonggaotodate_str }</div>
                 </c:if>
                 <div class="item">
                    <span class="f12"><i class="footprint"></i>${cqjy.click }次浏览</span>
                    <%@ include file="list_render_state.jsp" %>
                 </div>
            </li>
	   </c:forEach>
      </ul>

  </div> 
 <div id="kkpager" class="kkpager" style="display: block;">
    <div class="clearfix">
      <span class="pageBtnWrap">
	      <c:if test="${page>1}">
	      	 <a href="javascript:;" onclick="queryData(orderType,${page-1})" title="上一页">上一页</a>
		  </c:if>
		  <c:if test="${page-3 gt 0}">
		  	<a href="javascript:;" onclick="queryData(orderType,${page-3})">${page-3}</a>
		  </c:if>
		  <c:if test="${page-2 gt 0}">
		  	<a href="javascript:;" onclick="queryData(orderType,${page-2})">${page-2}</a>
		  </c:if>
		  <c:if test="${page-1 gt 0}">
		  	<a href="javascript:;" onclick="queryData(orderType,${page-1})">${page-1}</a>
		  </c:if>
		  <span class="curr">${page}</span>
		  <c:if test="${page+1 lt totalPage}">
		  	<a href="javascript:;" onclick="queryData(orderType,${page+1})">${page+1}</a>
		  </c:if>
		  <c:if test="${page+2 lt totalPage}">
		  	<a href="javascript:;" onclick="queryData(orderType,${page+2})">${page+2}</a>
		  </c:if>
		  <c:if test="${page+3 lt totalPage}">
		  	<a href="javascript:;" onclick="queryData(orderType,${page+3})">${page+3}</a>
		  </c:if>
        <c:if test="${page<totalPage}">
	      	 <a href="javascript:;" onclick="queryData(orderType,${page+1})" title="下一页">下一页</a></span>
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
<!--  通用底部b -->
<!--侧边快捷导航-->
<jsp:include page="rightbutton.jsp"></jsp:include>
<!--/侧边快捷导航-->
</body>
   



</body>

</html>

