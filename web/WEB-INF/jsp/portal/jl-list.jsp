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
      <script src="<%=basePath%>html/js/iconfont.js"></script>
      <script src="<%=basePath%>html/js/focus.js"></script>
      <script src="<%=basePath%>html/js/jquery.SuperSlide.js"></script>
      <script src="<%=basePath%>html/js/index.js"></script>
      <script src="<%=basePath%>html/js/main.js"></script>
      <script src="<%=basePath%>html/js/glivia.js"></script>
      <script src="<%=basePath%>js/jl/list.js"></script>
  </head>
<body>
   <!--  头部B-->  
   <jsp:include page="top.jsp"></jsp:include>
   
   <div class="base-container clearfix">
       <div class="row clearfix">
       <div class="crumbs clearfix">
        <div class="fl">
            <a href="" target="_blank">首页</a>
            &gt; <a href="" target="_blank">全部分类</a> &gt;
                <a href="" target="_blank">捡漏</a>
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
            <li class="select-list">
              <dl id="select2">
                <dt>标的所在地：</dt>
                <dd class="select-all selected"><a href="javascript:;">全部</a></dd>
                  <c:forEach var="province" items="${allprovince}">
                  	<dd><a href="javascript:;">${province.name }</a></dd>
                  </c:forEach>
                <div class="clear"></div>
                <div id="subcity" class="sub-condition J_SubCondition" style="display:none;">
                    <ul class="clearfix" id="subcityul">
                    </ul>
                  </div>
              </dl>
            </li>
            <li class="select-list">
              <dl id="select3">
                <dt>业务类型：</dt>
                <dd class="select-all selected"><a href="javascript:;">全部</a></dd>
                <dd><a href="javascript:;">国有企业资产</a></dd>
                <dd><a href="javascript:;">金融企业资产</a></dd>
                <dd><a href="javascript:;">行政事业单位资产</a></dd>
                <dd><a href="javascript:;">涉诉资产</a></dd>
              </dl>
            </li>
            <li class="select-list">
              <dl id="select4">
                <dt>项目状态：</dt>
                <dd class="select-all selected"><a href="javascript:;">全部</a></dd>
                <dd><a href="javascript:;">未开始</a></dd>
                <dd><a href="javascript:;">正在报名</a></dd>
                <dd><a href="javascript:;">报名已截止</a></dd>
                <dd><a href="javascript:;">竞价中</a></dd>
                <dd><a href="javascript:;">竞价已截止</a></dd>
                <dd><a href="javascript:;">已成交</a></dd>
              </dl>
            </li>
            <li class="select-list-bot clearfix">
                    <span class="fl mr30">当前记录 <span class="fcdd3">${total }</span> 条</span>
                  <span class="fl">
                          <span class="fl">价格：</span>
                          <div class="boxTop">
                            <input id="startPrice" class="ip1" type="text" placeholder="¥" value="${startPrice }" style="height:25px;width:55px" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"><span class="fl">−</span><input id="endPrice" value="${endPrice }" class="ip2" type="text" placeholder="¥" style="height:25px;width:55px;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                            <a href="javascript:;" class="fl money-btn" onclick="queryData();">确定</a>
                         </div>
                  </span>
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
       <c:forEach var="jl" items="${list}">
          	<li>
				<div class="pic">
                   <a href="<%=basePath %>jl_infodetail?infoid=${jl.infoid}"><img src="${jl.titlepic}" alt="" class="p"></a>
                 </div>
                 <div class="title"><a href="<%=basePath %>jl_infodetail?infoid=${jl.infoid}"><b>${jl.s2 }</b>${jl.title }</a></div>
                 <div class="item">
                    		 挂牌价：<span class="fcdd3"><span class="bold">${jl.guapaiprice }</span> 元</span>
                 </div>
                 <div class="item">报名截止时间：${jl.gonggaotodate }</div>
                 <div class="item">
                    <span class="f12"><i class="footprint"></i>${jl.click }次浏览</span>
                    <%@ include file="render_state.jsp" %>
                 </div>
            </li>
	   </c:forEach>
      </ul>

  </div> 
 <div id="kkpager" class="kkpager" style="display: block;">
    <div class="clearfix">
      <span class="pageBtnWrap">
	      <c:if test="${page>1}">
	      	 <a href="javascript:;" onclick="queryData('',${page-1})" title="上一页">上一页</a>
		  </c:if>
		  <c:if test="${page-3 gt 0}">
		  	<a href="javascript:;" onclick="queryData('',${page-3})">${page-3}</a>
		  </c:if>
		  <c:if test="${page-2 gt 0}">
		  	<a href="javascript:;" onclick="queryData('',${page-2})">${page-2}</a>
		  </c:if>
		  <c:if test="${page-1 gt 0}">
		  	<a href="javascript:;" onclick="queryData('',${page-1})">${page-1}</a>
		  </c:if>
		  <span class="curr">${page}</span>
		  <c:if test="${page+1 lt totalPage}">
		  	<a href="javascript:;" onclick="queryData('',${page+1})">${page+1}</a>
		  </c:if>
		  <c:if test="${page+2 lt totalPage}">
		  	<a href="javascript:;" onclick="queryData('',${page+2})">${page+2}</a>
		  </c:if>
		  <c:if test="${page+3 lt totalPage}">
		  	<a href="javascript:;" onclick="queryData('',${page+3})">${page+3}</a>
		  </c:if>
        <c:if test="${page<totalPage}">
	      	 <a href="javascript:;" onclick="queryData('',${page+1})" title="下一页">下一页</a></span>
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

<script type="text/javascript">
var selectA='${selectA}';
var selectB='${selectB}';
var selectB_='${selectB_}';
var selectC='${selectC}';
var selectD='${selectD}';
var orderType='${orderType}';
var basePath='<%=basePath%>';
$(function(){
  $("div.list_lh").myScroll({
    speed:40, //数值越大，速度越慢
    rowHeight:52 //li的高度
  });
});
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
   	   queryData("",1);
   }else if(page>tPage){
   	   queryData("",tPage);
   }else{
       queryData("",page);
   }
}
</script>
<script type="text/javascript">marqueeStart(1, "left");</script>
<script type="text/javascript">jQuery(".hasMoreTab").slide({ mainCell:".conWrap", targetCell:".more a", effect:"fold"});</script>

</body>

</html>

