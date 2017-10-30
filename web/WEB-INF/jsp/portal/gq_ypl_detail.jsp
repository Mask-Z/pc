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
	  <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
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
      });
      
      
      var r = 0;
      function reinitIframe() {
          var iframe_s = document.getElementsByTagName("iframe");
          for(var i=0 ;i < iframe_s.length; i++){
          	if(iframe_s[i].name === "gonggao_iframe"){
          		
          		var bHeight = 0;
                  r++;
                  if(iframe_s[i].contentWindow.document.body){
                  	bHeight = iframe_s[i].contentWindow.document.body.scrollHeight;
                  }
                  var dHeight = 0;
                  if(iframe_s[i].contentWindow.document.documentElement){
                  	dHeight = iframe_s[i].contentWindow.document.documentElement.scrollHeight;
                  }
                var height = Math.min(bHeight, dHeight);
              	iframe_s[i].height = height + 100;
          	}

          }
      }

      window.setInterval(reinitIframe, 1000);
      

      
  </script>

<body>
	 <!--  头部B-->
	  <jsp:include page="top.jsp"></jsp:include>
	 <!--  头部B-->
	   <div class="base-container clearfix">
	 	<div class="row clearfix">
		       <div class="crumbs clearfix">
		        <div class="fl">
		            <a href="" target="_blank">首页</a>
		              &gt;
		                <a href="<%=basePath %>ypl_more" target="_blank">项目预告</a>
		                &gt;${newsDetail.title}
		          </div>
		      </div>
        </div>
		   <div class="k1200">
		   <div class="detail-box">
		   <div class="liebiao-neirong">
			   <div class="ypl-detail-title">
				   <span class="item curr">标的企业信息</span>
				   <span class="item">项目预告详情</span>
			   </div>
			   <div class="ypl-detail-box" style="display:block;">
				   <table class="base-detail-table" border="0" bordercolor="black" cellspacing="0" cellpadding="0">
					   <tr>
						   <td width="120" class="title">标的企业名称</td>
						   <td colspan="5">${qyxxlist.objectName}</td>
					   </tr>
					   <tr>
						   <td class="title">标的企业统一社会信用代码</td>
						   <td>${qyxxlist.objectCode}</td>
						   <td class="title" width="120">标的企业经营规模</td>
						   <td>${qyxxlist.managerScale}</td>
						   <td class="title" width="120">标的企业所在地区</td>
						   <td>${qyxxlist.Zone_name}</td>
					   </tr>
					   <tr>
						   <td class="title">标的企业所属行业</td>
						   <td>${qyxxlist.industryCode_name}</td>
						   <td class="title">标的企业经济类型</td>
						   <td>${qyxxlist.economyType_name}</td>
						   <td class="title">标的企业企业类型</td>
						   <td>${qyxxlist.economyNature_name}</td>
					   </tr>

					   <tr>
						   <td class="title">标的企业职工人数</td>
						   <td>${qyxxlist.employeeQuantity}</td>
						   <td class="title">注册资本</td>
						   <td colspan="3">${qyxxlist.registeredCapital}</td>
					   </tr>
					   <tr>
						   <td width="120" class="title">主要业务、经营范围</td>
						   <td colspan="5">${qyxxlist.businessScope}</td>
					   </tr>
					   <tr>
						   <td class="title">本次拟转让产(股)权比例(%)</td>
						   <td>${qyxxlist.sellPercent}</td>
						   <td class="title">本次拟转让股份数</td>
						   <td><c:if test="${qyxxlist.gf!='0'}">${qyxxlist.gf}</c:if></td>
						   <td class="title">决策文件类型</td>
						   <td>${qyxxlist.decisionFileType}</td>
					   </tr>
				   </table>
			   </div>

			   <div class="ypl-detail-box" style="display:none;">
				   <div class="neirong-title">
					   ${newsDetail.title }
				   </div>
				   <div class="neirong-time">发布时间&nbsp;${newsDetail.infodate }&nbsp;&nbsp;&nbsp;&nbsp;${newsDetail.click }次阅读</div>
				   <div class="neirong-content">
					   <iframe frameborder="0" scrolling="auto" name="gonggao_iframe" src="content?infoid=${newsDetail.infoid}" width="1135px" id="contentIframe"></iframe>
					   <%--${newsDetail.content }--%>
				   </div>
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


<%--<script type="text/javascript">marqueeStart(1, "left");</script>--%>
<%--<script type="text/javascript">jQuery(".hasMoreTab").slide({ mainCell:".conWrap", targetCell:".more a", effect:"fold"});</script>--%>

</body>

</html>

