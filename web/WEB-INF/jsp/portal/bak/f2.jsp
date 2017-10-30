<%@page import="com.ccjt.ejy.web.vo.GongGao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<base href="<%=basePath%>">
    <title>e交易-产权交易平台</title>
    <jsp:include page="mate.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=basePath%>html/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/base.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/header.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/global.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/detail.css">
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=AESTptOW5fBvg7gLR6GGUaIwpv1Vdfei"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
    <style type="text/css">
    	.jygg_news_detail_tr{height: 35px;}
    	.jygg_news_detail_tr td {height: 35px;border:solid 1px black;padding: 5px;}
    	.new-jygg-btn{cursor: pointer;padding: 2px;}
    	
    </style>
</head>

<body>
       <!--  头部B-->  
       <jsp:include page="top.jsp"></jsp:include>
       <!--  头部E-->
        
       <div class="base-container clearfix">
        
       <div class="row clearfix">
       <div class="crumbs">
            <a href="" target="_blank">首页</a> &gt;
                <a href="" target="_blank">产权交易</a>
                &gt;
                <a href="" target="_blank">${info.title }</a>
        </div>
        <div class="important-note">
         <div class="box">
          重要提示：竞买人在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn" target="_blank" class="fcdd3 tdu">www.e-jy.com.cn</a>）的《<a href="http://www.e-jy.com.cn/newsinfo?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6" target="_blank" class="fcdd3 tdu">e交易平台竞价交易规则</a>》、《<a href="http://www.e-jy.com.cn/newsinfo?infoid=b74cf4d8-845e-42c0-9ed5-0720ab0d086e" target="_blank" class="fcdd3 tdu">e交易平台产权交易操作指南</a>》等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。
</div>
<a href="javascript:void(0)" class="note-btn"><i></i></a>
          
        </div>
  <div class="detail-head clearfix">      
<div class="product fl">
<div class="preview ">
  
  <!--滚动看图-->
  <div id="picSlideWrap" class="clearfix">
        <div class="imgnav" id="imgnav"> 
             <div id="img"> 
<!--                 <div class="item"><img src="${mediaInfo.d3 }" width="480" height="360" style="display: block;" rel="" /></div> -->
<!-- 		     	<div class="item"> -->
		     		<!--视频播放代码开始-->
<!-- 					<script type="text/javascript" src="<%=basePath%>cuplayer/images/swfobject.js"></script> -->
<!-- 					<div class="video" id="CuPlayer" style="950px;margin:0 auto;"> -->
<!-- 					<strong>提示：您的Flash Player版本过低！</strong></div> -->
<!-- 					<script type="text/javascript"> -->
<!-- 					var so = new SWFObject("<%=basePath%>cuplayer/CuPlayerMiniV4.swf","CuPlayerV4","480","360","9","#000000"); -->
<!-- 					so.addParam("allowfullscreen","true"); -->
<!-- 					so.addParam("allowscriptaccess","always"); -->
<!-- 					so.addParam("wmode","opaque"); -->
<!-- 					so.addParam("quality","high"); -->
<!-- 					so.addParam("salign","lt"); -->
<!-- 					so.addVariable("CuPlayerSetFile","<%=basePath%>cuplayer/CuPlayerSetFile.php"); //播放器配置文件地址 -->
<!-- 			// 		so.addVariable("CuPlayerFile","<%=basePath%>${mediaInfo.vide}"); //视频文件地址 -->
<!-- 			// 		so.addVariable("CuPlayerImage","<%=basePath%>${mediaInfo.video_pic}");//视频略缩图 -->
<!-- 					so.addVariable("CuPlayerFile","<%=basePath%>cuplayer/1.mp4"); //视频文件地址 -->
<!-- 					so.addVariable("CuPlayerImage","<%=basePath%>cuplayer/1.jpg");//视频略缩图 -->
<!-- 					so.addVariable("CuPlayerWidth","480"); //视频宽度 -->
<!-- 					so.addVariable("CuPlayerHeight","360"); //视频高度 -->
<!-- 					so.addVariable("CuPlayerAutoPlay","no"); //是否自动播放 -->
<!-- 					so.write("CuPlayer"); -->
<!-- 					</script> -->
					<!--视频播放代码结束-->
<!-- 		     	</div> -->
		     	<!-- 音频 -->
<!-- 		     	<div class="item"> -->
<!-- 		     		<link href="<%=basePath%>mp3player/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" /> -->
<!-- 					<script src="<%=basePath%>mp3player/lib/jquery.min.js"></script> -->
<!-- 					<script type="text/javascript" src="<%=basePath%>mp3player/jplayer/jquery.jplayer.min.js"></script> -->
<!-- 			    		<div id="jquery_jplayer_1" class="jp-jplayer"></div> -->
<!-- 						<div id="jp_container_1" class="jp-audio" role="application" aria-label="media player"> -->
<!-- 							<div class="jp-type-single"> -->
<!-- 								<div class="jp-gui jp-interface"> -->
<!-- 									<div class="jp-controls"> -->
<!-- 										<button class="jp-play" role="button" tabindex="0">play</button> -->
<!-- 										<button class="jp-stop" role="button" tabindex="0">stop</button> -->
<!-- 									</div> -->
<!-- 									<div class="jp-progress"> -->
<!-- 										<div class="jp-seek-bar"> -->
<!-- 											<div class="jp-play-bar"></div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="jp-volume-controls"> -->
<!-- 										<button class="jp-mute" role="button" tabindex="0">mute</button> -->
<!-- 										<button class="jp-volume-max" role="button" tabindex="0">max volume</button> -->
<!-- 										<div class="jp-volume-bar"> -->
<!-- 											<div class="jp-volume-bar-value"></div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="jp-time-holder"> -->
<!-- 										<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div> -->
<!-- 										<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div> -->
<!-- 										<div class="jp-toggles"> -->
<!-- 											<button class="jp-repeat" role="button" tabindex="0">repeat</button> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="jp-details"> -->
<!-- 									<div class="jp-title" aria-label="title">&nbsp;</div> -->
<!-- 								</div> -->
<!-- 								<div class="jp-no-solution"> -->
<!-- 									<span>Update Required</span> -->
<!-- 									To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>. -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<script type="text/javascript"> -->
<!-- 					    $("#jquery_jplayer_1").jPlayer({ -->
<!-- 							ready: function (event) { -->
<!-- 								$(this).jPlayer("setMedia", { -->
<!-- 			// 						title: "童话镇", -->
<!-- 			// 						mp3: "<%=basePath%>mp3player/thz.mp3" -->
<!-- 									mp3: "<%=basePath%>${mediaInfo.audio}" -->
<!-- 								}); -->
<!-- 							}, -->
<!-- 							swfPath: "<%=basePath%>mp3player/jplayer", -->
<!-- 							supplied: "mp3", -->
<!-- 							wmode: "window", -->
<!-- 							useStateClassSkin: true, -->
<!-- 							autoBlur: false, -->
<!-- 							smoothPlayBar: true, -->
<!-- 							keyEnabled: true, -->
<!-- 							remainingDuration: true, -->
<!-- 							toggleDuration: true -->
<!-- 						}); -->
<!-- 					    </script> -->
<!-- 		     	</div> -->
				<c:forEach items="${mediainfo.pics }" var="pic">
					<div class="item"><img src="http://www.e-jy.com.cn/${pic.bpath }" width="480" height="360" rel="http://www.e-jy.com.cn/${pic.bpath }" ></div>
				</c:forEach>
				<div class="item"><div id="allmap" style="width:480px;height:360px"></div></div>
             </div>
              
             <div id="cbtn">
                <i class="picSildeLeft preview-control forward"></i> 
                <i class="picSildeRight preview-control backward"></i> 
                <div id="cSlideUl">
                    <ul>
                    	<!-- 优先显示360全景封面图 -->
<!-- 	        			<li> -->
<!-- 	        				<img src="<%=basePath%>${mediaInfo.d3 }"> -->
<!--         				</li> -->
        				<!-- 再显示视频封面图 -->
<!-- 	        			<li id="videoli"> -->
<!-- 	        				<img src="<%=basePath%>${mediaInfo.video_pic }" ></a> -->
<!-- 	        			</li> -->
		       			<!-- 音频 -->
<!-- 		        		<li id="audioli"> -->
<!-- 		       				<img src="<%=basePath%>images/audio.jpg" > -->
<!-- 		       			</li> -->
			           <c:forEach items="${mediainfo.pics }" var="pic" varStatus="stat">
		        			<li>
			                    <img src="http://www.e-jy.com.cn/${pic.path }" ></a>
			                </li>
		        		</c:forEach>
		        		<!-- 地图 -->
		        		<li>
		       				<img src="<%=basePath%>images/map.png" onclick="initialize()">
		       			</li>
                    </ul>
                </div>
             </div>         
        </div>
    </div><!--end滚动看图-->

<div class="clear"></div>
            
            <div class="preview-share">
            
            	
            	<a class="share-btn vr" ><i></i>360° 全景</a>
            	<a class="share-btn video"><i></i>视频</a>
            	<a class="share-btn audio "><i></i>一键收听</a>
            	
<!--             	<a href="http://720yun.com/t/c02jzstwrw4?from=singlemessage&isappinstalled=0&pano_id=6174879" target="_blank" 	class="share-btn vr have" ><i></i>360° 全景</a> -->
<!--             	<a href="javascript:$('#videoli').click();" class="share-btn video have"><i></i>视频</a> -->
<!-- 				<a href="javascript:$('#audioli').click();" class="share-btn audio have"><i></i>一键收听</a> -->
	            
            	<div class="share-btn share "><i></i><span class="fl">分享至:</span>
                <div class="bdsharebuttonbox clear1 bdshare-button-style1-16" data-bd-bind="1501032382879" style="float:left;">
                    <a href="#" class="bds_more" data-cmd="more" style="margin:7px 0 0 10px;float:right;"></a>
                </div>
				</div>
                <script>window._bd_share_config = { "common": { "bdSnsKey": { "tsina": "2392816891", "tqq": "101034031" }, "bdText": "", "bdMini": "3", "bdMiniList": ["mshare", "weixin", "tsina", "qzone", "renren", "tqq", "tieba", "douban", "bdhome", "sqq", "taobao", "mail", "copy", "print"], "bdPic": "", "bdStyle": "1", "bdSize": "16" }, "share": {} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
            </div>
        </div>
        
        <div class="product-intro">
            <div id="Name">
                <h1>${info.title }</h1>
            </div>
			<div class="detail-characteristic clearfix">
              <span class="label"><b>商业区</b><i></i></span>
              <span class="label second"><b>配套成熟</b><i></i></span>
<!--               <span class="label third"><b>商住两用</b><i></i></span> -->
            </div>
            
            <div class="price clearfix">
                <c:choose>
                <c:when test="${info.status_name eq '未开始'}"><div class="label signup">报名<br>未开始</div></c:when>
            	<c:when test="${info.status_name eq '报名中'}"><div class="label signup">正在<br>报名</div></c:when>
            	<c:when test="${info.status_name eq '报名已截止'}"><div class="label signup">报名<br>截止</div></c:when>
            	<c:when test="${info.status_name eq '竞价中'}"><div class="label signup">正在<br>竞价</div></c:when>
            	<c:when test="${info.status_name eq '已成交'}"><div class="label signup">已经<br>成交</div></c:when>
            	<c:when test="${info.status_name eq '竞价结束'}"><div class="label signup">竞价<br>结束</div></c:when>
            	<c:otherwise><div class="label signup">${info.status_name}</div></c:otherwise>
            	</c:choose>
                <div class="price-fl ">
                    <dl>
                        <dd>
                          <p id="countdown">距竞价结束：
<!--                           <b class="org bold">10</b> 天 <b class="org bold">10</b> 时 <b class="org bold">10</b> 分 <b class="org bold">10</b>  秒 -->
                          </p>
                          <p class="mt5"><span class="fc99">${focusnum }</span> 人关注<span class="fc99 ml20">${info.click }</span> 次浏览</p>
                        </dd>
                        <dt>
                          <a href="javascript:addFocus();">
                              <i class="follow mt10"></i><br>
                              加关注
                            </a>
                        </dt>
                    </dl>
                </div>
                
            </div>
            <div class="promotion clearfix">
            	<c:if test="${info.ispllr == '1'  }">
           			<div class="list">
	                    <span class="laber">转让底价</span><span class="money">详见交易公告</span> 
	                </div>
	                <div class="list">
	                    <span class="laber">保证金 </span><span class="money">详见交易公告</span> 
	                </div>
            	</c:if>
                <c:if test="${info.ispllr != '1'  }">
                	<div class="list w100">
	                    <span class="laber">转让底价 </span><span class="money">2,000,000.00</span> 元
	                </div>
	                
	                <div class="list w100">
	                    <span class="laber">保证金 </span><span class="money">200,000.00</span> 元
	                </div>
	                <div class="list">
	                    <span class="laber">建筑面积 </span><span class="money">139.04</span>m²
	                </div>
	                <div class="list">
	                    <span class="laber">单价 </span><span class="money">14385</span> 元<span class="fc99">/m²</span>
	                </div>
	                
	               
                </c:if>
            </div>
            <div class="detail-bug-btn clearfix">
<!--                 <a href="" class="bond-btn">报名交保证金</a> -->
                <c:if test="${info.status_name == '报名中'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-enroll">报名中</a>
				</c:if>
				<c:if test="${info.status_name == '终结'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-default">终结</a>
				</c:if>
				<c:if test="${info.status_name == '中止'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-default">中止</a>
				</c:if>
				<c:if test="${info.status_name == '竞价结束'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-default">竞价已结束</a>
				</c:if>
				<c:if test="${info.status_name == '竞价未开始'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-default">竞价未开始</a>
				</c:if>
				<c:if test="${info.status_name == '未开始'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-update">未开始</a>
				</c:if>
				<c:if test="${info.status_name == '报名截止'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-default">报名已截止</a>
				</c:if>
				<c:if test="${info.status_name == '竞价中'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-bidding">竞价中</a>
				</c:if>
				<c:if test="${info.status_name == '已成交'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-default">已成交</a>
				</c:if>
                <!-- 如报名结束，则CLASS增加over -->
                <a href="javascript:void(0);" class="financing-btn over">在线融资申请</a>
                <!-- 如没有在线融资申请，则CLASS增加over -->
            </div>
            <div class="mod_main clearfix">
              提醒：如已缴纳保证金，并获得竞价账户密码，请<a href="http://www.e-jy.com.cn/ejyhy/login_07.aspx" class="fcdd3">登录</a>
            </div>
            <div class="detail-info-notice">
	            <c:if test="${info.ispllr == '1' }">
	            	 报名开始时间：详见标的列表<br/>
	            	 报名结束时间：详见标的列表
	            </c:if>
	            <c:if test="${info.ispllr != '1' }">
	            	 报名开始时间：<fmt:formatDate value="${info.gonggaofromdate }" type="date" dateStyle="medium" pattern="yyyy-MM-dd HH:mm:ss"/>  <br>     
					报名结束时间：<fmt:formatDate value="${info.gonggaotodate }" type="date" dateStyle="medium" pattern="yyyy-MM-dd HH:mm:ss"/>
	          	</c:if>
            </div>
        </div>
         </div>
        

<div class="product_about">
    <div class="buy-helper">
      <h2 class="hd">
        <a href="<%=basePath %>news_more?catagoryNum=question&page=1&rows=20" target="_blank" class="clearfix">
          <i class="iconfont-sf left"></i>常见问题 <i class="iconfont-sf right"></i>
        </a>
      </h2>
      <ul>
      	 <c:forEach items="${questions }" var="question">
      	 	<li><a href="<%=basePath%>questioninfo?infoid=${question.id}" target="_blank"><span class="helper-tag">${question.key_word}</span>${question.title }</a></li>
      	 </c:forEach>
       </ul>
    </div>
    <div class="merchants">
        <ul class="merchants-title">
            <li><a href="javascript:;" target="_blank"><img src="<%=basePath%>html/img2/czcq-ico-1.png" alt="常州产权交易所"  height="50"></a></li>
            <li><a href="javascript:;" target="_blank">常州产权交易所</a></li>
        </ul>
        <dl class="dispatching">
            <dt>联  系  人：</dt>
            <dd>侯先生</dd>
        </dl>
        <dl class="dispatching">
            <dt>联系电话：</dt>
            <dd>0519-86601526<br/>  18168811502 </dd>
        </dl>
        <dl class="dispatching">
            <dt>单位地址：</dt>
            <dd>常州市新北区龙锦路1259-2号</dd>
        </dl>

    </div>
    
    

        </div>
</div> 
    
<div class="pm-bid-flow clearfix">
  <a href="javascript:void(0);" class="close"></a>
          <div class="fl pm-bid-flow-title">项目<br>流程</div>
          <div class="fl pm-bid-flow-list">
            <ul class="clearfix">
              <li class="pm-bid-flow1">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第一步</span><p>阅读公告</p></div>
              </li>
              <li class="pm-bid-flow2">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第二步</span><p>报名登记</p></div>
              </li>
              <li class="pm-bid-flow3">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第三步</span><p>交保证金</p></div>
              </li>
              <li class="pm-bid-flow4">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第四步</span><p>参与报价</p></div>
              </li>
              <li class="pm-bid-flow5">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第五步</span><p>成交确认</p></div>
              </li>
              <li class="pm-bid-flow6">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第六步</span><p>资金结算</p></div>
              </li>
              <li class="pm-bid-flow7">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第七步</span><p>办理交割</p></div>
              </li>
            </ul>
          </div>
          <!--<a href="javascript:;" class="pm-flow-close">×</a>-->
        </div>

    <div id="Comment" class="clearfix">
        <div class="detail-con-left">
          <div class="deatil-tabs-height"></div>
            <ul class="tab deatil-tabs" id="itemdetail_area">
                <li class="survey  curr" onclick="myclick(1)">标的概况</li>
                <li class="survey " onclick="myclick(1)">特别告知</li>
                <li class="survey " onclick="myclick(1)">交易条件</li>
                <li class="survey "  onclick="myclick(1)">交易指南</li>
                <li class="survey switch" onclick="myclick(2)">融资支持</li>
                <li class="survey switch" onclick="myclick(3)">竞买记录</li>
<!--                 <li class="survey switch" onclick="myclick(4)">成交公告</li> -->
            </ul>
            <div id="tab1_content" class="detail-tabcon clearfix" style="display: block;">
<div class="ph12">
<div   class="module-block"  id="d-bdgk">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td colspan="2" class="shheh"><p align="center" >项目名称 </p></td>
    <td colspan="3"><p align="left">常州市五角场东村13幢8号房产转让公告 </p></td>
    <td colspan="3" class="shheh"><p align="center">项目编号 </p></td>
    <td colspan="2"><p align="left">01FC20170051</p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="center">挂牌起始日期 </p></td>
    <td colspan="3"><p align="">2017年6月30日 </p></td>
    <td colspan="3" class="shheh"><p align="center">挂牌截止日期 </p></td>
    <td colspan="2"><p>2017年7月13日 </p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="left">挂牌期满，如未征集到意向受让方 </p></td>
    <td colspan="8"><p align="left">挂牌期满后如未征集到意向受让方，按（5）个工作日为周期延牌，最多延长（24）个周期。 </p></td>
  </tr>
  <tr>
    <td width="84" rowspan="13" class="shheh"><p align="center">标的 <br />
      概况 </p></td>
    <td width="114" class="shheh"><p align="center">标的坐落 </p></td>
    <td colspan="8"><p align="">常州市怀德南路90号 </p></td>
  </tr>
  <tr>
    <td width="114" rowspan="4" class="shheh"><p align="center">基本属性 </p></td>
    <td colspan="2" class="shheh"><p align="center">房屋建筑面积 </p></td>
    <td colspan="3"><p align="left">139.04㎡ </p></td>
    <td colspan="2" class="shheh"><p align="center">套内建筑面积 </p></td>
    <td width="293"><p align="">--</p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="center">土地使用权面积 </p></td>
    <td colspan="3"><p align="">21.4 </p></td>
    <td colspan="2" class="shheh"><p align="center">使用期限 </p></td>
    <td width="293"><p align="">2036年7月14日 </p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="center">权利性质 </p></td>
    <td colspan="3"><p align="">（如：商品房/出让） </p></td>
    <td colspan="2" class="shheh"><p align="center"> 用   途 </p></td>
    <td width="293"><p align="">商业 </p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="center">房屋结构 </p></td>
    <td colspan="3"><p align="">混合 </p></td>
    <td colspan="2" class="shheh"><p align="center">所在层数 </p></td>
    <td width="293"><p align="">1 </p></td>
  </tr>
  <tr>
    <td width="114" rowspan="5" class="shheh"><p align="center">房屋现状 </p></td>
    <td colspan="2" class="shheh"><p align="center">房屋户型 </p></td>
    <td colspan="3"><p align="">—— </p></td>
    <td colspan="2" class="shheh"><p align="center">房屋朝向 </p></td>
    <td width="293"><p align="">南北 </p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="center">租赁情况 </p></td>
    <td colspan="3"><p align="">无 </p></td>
    <td colspan="2" class="shheh"><p align="center">装修情况 </p></td>
    <td width="293"><p align="">简装 </p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="center">抵押情况 </p></td>
    <td colspan="3"><p align="">无 </p></td>
    <td colspan="2" class="shheh"><p align="center">配备电梯 </p></td>
    <td width="293"><p align="">有 </p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="center">欠费情况 </p></td>
    <td colspan="6"><p align="">无 </p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="center">其它情况 </p></td>
    <td colspan="6"><p align="">无 </p></td>
  </tr>
  <tr>
    <td width="114" class="shheh"><p align="center">转让底价 </p></td>
    <td colspan="8"><p align="left">2000000元 </p></td>
  </tr>
  <tr>
    <td width="114" class="shheh"><p align="center">配套、环境、交通、亮点 </p></td>
    <td colspan="8"><p align="left">标的位于常州市天宁区五角场东村13幢8号，丽华北路以西，临近常州市南大街商业中心（约2公里），商业设施集聚商业氛围良好。标的所在区域道路体系为网格状，周边有城市主干道路丽华北路，道路通达条件较好，人流量大。 </p></td>
  </tr>
  <tr>
    <td width="114" class="shheh"><p align="center">附件 </p></td>
    <td colspan="8"><p><a href="http://www.e-jy.com.cn/ejyzx/uploadfile/20170629103320986.pdf" target="_blank">五角场东村13幢8号房屋租赁合同.pdf</a></p></td>
  </tr>
 
  </table>
  </div>
  <br />
<div   class="module-block"   id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw"> 
  <tr>
    <td width="143" class="shheh"><p align="center">特别 <br />
      告知 </p></td>
    <td width="746" colspan="9"><p>1.竞价标的列示的面积为权证面积，仅供参考。实测面积与权证面积若有差异，不调整标的成交价格。 <br />
      2.竞价标的成交价为含增值税价。 <br />
      3.委托方不保证竞价标的有关的建筑、规划、消防、安全、环保、装饰、附属设备设施的合同、图纸、竣工验收、许可证、说明书、保修卡、发票等资料的齐全性，如需上述资料，由买受人自行到相关部门查询和办理相关手续。 <br />
      4.本次竞价标的如有欠费（包括但不限于水、电、气、物业等费用），在标的交付前相关费用均由委托方承担。 <br />
      5.本次竞价标的如有欠缴的房屋维修基金，则由买受人承担。 <br />
      6.本次标的成交价格为不含装修及增设物价格，并不因此调整。 </p></td>
  </tr>
  <tr>
    </table>
  </div>
  <br />
<div   class="module-block"   id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw"> 
    <td width="141" class="shheh" rowspan="4"><p align="center" >交易 <br />
      条件 </p></td>
    <td width="156" class="shheh"><p align="center">交易价款 </p></td>
    <td width="592" colspan="8"><p>成交之日起<u> 5 </u>个工作日内按系统提示付清。 </p></td>
  </tr>
  <tr>
    <td width="156" class="shheh"><p align="center">与转让相关的其他条件 </p></td>
    <td width="592" colspan="8"><p align="left">一、意向受让方可在公告期内至现场查看转让标的，并自行向相关部门了解转让标的实际情况； <br />
      二、受让方必须付清所有款项后，转让方方能协助受让方办理转让标的变更登记等手续； <br />
      三、转让标的变更登记涉及的税费等相关费用，由转让方和受让方双方按国家规定各自承担，若出现按国家规定可以收取的而未明确由谁支付的费用由转让方和受让方双方各自承担一半； <br />
      四、上述房产是以现状转让并交付给受让方，水电气等相关费用由转让方当场结清，受让方不得以不了解上述房产为由拒绝按现状接受； <br />
      五、转让标的房屋所有权证、土地使用权证或不动产登记证登记面积若与实际测量面积出现误差，以房屋所有权证、土地使用权证或不动产登记证记载为准，转让方和受让方双方不再另行结算； <br />
      六、成交后，若因国家政策调整或不可抗力因素导致转让标的不能正常办理变更登记手续的，转让方受让方双方解除合同，受让方支付的交易价款全额退还，该交易价款不计息； <br />
      以上情况说明仅供参考，不排除有未知事项及瑕疵的存在（包括但不限于已告知的瑕疵），转让方及江苏省产权交易所对此不承担任何责任；受让方参与竞买，即表明受让方愿意按照转让标的实际状况竞买，受让方应充分考虑瑕疵风险因素及其他综合因素，慎重竞买。 </p></td>
  </tr>
  <tr>
    <td width="156" class="shheh"><p align="center">竞买资格 <br />
      条件 </p></td>
    <td width="592" colspan="8"><p>1.凡具有完全民事行为能力的自然人、法人或其他组织均可参与本项目。 <br />
      2.竞买人在报名前应自行了解国家及地方法律、法规等相关政策，判断是否具备竞价标的过户资格条件，并承担由此产生的相应责任及后果。 </p></td>
  </tr>
  <tr>
    <td width="156" class="shheh"><p align="center">标的交割 </p></td>
    <td width="592" colspan="8"><p>1.标的过户： <br />
      （1）买受人应向产交所提交以下资料：自然人身份证签字复印件；加盖公章的法人或其他组织营业执照等身份证明复印件；委托方要求的其他材料。 <br />
      （2）买受人应于付清全部成交价款及服务费后5个工作日内，携带房产过户所需资料与委托方共同办理房屋过户手续。本次竞价的房产过户，由产交所指定中介机构协助办理，除买受人需自行承担的各项税费，不需另行支付过户代办费用。 <br />
      （3）在房地产权属变更登记过程中涉及的相关税、费按国家规定各自承担。买受人如不及时办理过户手续造成的一切后果由买受人自负。 <br />
      2.标的交割： <br />
      （1）房产过户完成后5个工作日内，交易双方办理房产交割手续并签署《资产交割书》。 <br />
      （2）若标的不动产权证自成交之日起6个月内无法办理至买受人名下（买受人未配合的情况除外），买受人有权要求退标（不计息退还已支付的成交款及服务费），但不可主张退标以外的其他任何权利。 </p></td>
  </tr>
      </table>
  </div>
  <br />
<div   class="module-block"    id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw"> 
  <tr>
    <td width="138" class="shheh" rowspan="7"><p align="center" >交易 <br />
      指南 </p></td>
    <td width="201" class="shheh"><p align="center">竞价规则 </p></td>
    <td colspan="8"><p align="left">竞买方在竞价前请务必遵照ee交易平台（<a href="http://www.e-jy.com.cn" target="_blank" class="fcdd3 tdu">www.e-jy.com.cn</a>）的《<a href="http://www.e-jy.com.cn/newsinfo?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6" target="_blank" class="fcdd3 tdu">e交易平台竞价交易规则</a>》、《<a href="http://www.e-jy.com.cn/newsinfo?infoid=b74cf4d8-845e-42c0-9ed5-0720ab0d086e" target="_blank" class="fcdd3 tdu">e交易平台产权交易操作指南</a>》等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 </p></td>
  </tr>
  <tr>
    <td width="201" class="shheh"><p align="center">现场展示 </p></td>
    <td colspan="8"><p align="left">1.时间: 2017年7月5日至2017年7月6日（联系后组织察看，联系人：李先生 18168811572）。 <br />
      2.地点: 常州市五角场东村13幢8号（尼科尼亚电动车）。 </p></td>
  </tr>
  <tr>
    <td width="201" class="shheh" rowspan="2"><p align="center">竞买报名 </p></td>
    <td width="117" class="shheh"><p align="center">报名截止时间 </p></td>
    <td colspan="7"><p align="center">2017年7月13日 </p></td>
  </tr>
  <tr>
    <td width="117" class="shheh"><p align="center">保证金及处置方式 </p></td>
    <td colspan="7"><p align="left">1.缴纳：金额<u> 200000 </u>元，截止时间<u> 2017年7月13日 17:00 </u>，按系统提示缴纳。 <br />
      2.退还：买受人缴纳的保证金在标的过户完毕后退还，其他竞价人的保证金将于成交后的3个工作日内退还。 </p></td>
  </tr>
  <tr>
    <td width="201" class="shheh" rowspan="2"><p align="center">竞价安排 </p></td>
    <td width="117" class="shheh"><p align="center">竞价方式 </p></td>
    <td colspan="3"><p align="">加价竞价 </p></td>
    <td class="shheh" colspan="3"><p align="center">增价幅度 </p></td>
    <td width="167"><p align="">200000元 </p></td>
  </tr>
  <tr>
    <td width="117" class="shheh"><p align="center">自由竞价时间 </p></td>
    <td colspan="3"><p align="">2017年7月14日10:00至11:00止 </p></td>
    <td class="shheh" colspan="3"><p align="center">延时竞价周期 </p></td>
    <td width="167"><p align="">1分钟 </p></td>
  </tr>
  <tr>
    <td width="201" class="shheh"><p align="center">服务费 </p></td>
    <td colspan="8"><p align="">成交价的<u> 2 </u>%，成交之日起<u> 5 </u>个工作日内按系统提示付清。 </p></td>
  </tr>
  <tr>
    <td width="138" class="shheh" rowspan="5"><p align="center">联系 <br />
      方式 </p></td>
    <td width="201" class="shheh"><p align="center">标的咨询 </p></td>
    <td colspan="8"><p>侯先生0519-86601526&nbsp;    18168811502 </p></td>
  </tr>
  <tr>
    <td width="201" class="shheh"><p align="center">技术支持 </p></td>
    <td colspan="8"><p>杨先生 0519-89890395 </p></td>
  </tr>
  <tr>
    <td width="201" class="shheh"><p align="center">咨询时间 </p></td>
    <td colspan="8"><p>自公告之日起至2017年7月27日17:00止（节假日除外） </p></td>
  </tr>
  <tr>
    <td width="201" class="shheh"><p align="center">单位地址 </p></td>
    <td colspan="8"><p>常州市新北区龙锦路1259-2号 </p></td>
  </tr>
  <tr>
    <td width="201" class="shheh"><p align="center">其    他 </p></td>
    <td colspan="8"><p align="center">&nbsp;</p></td>
  </tr>
</table>
</div>
</div>
             </div>
             <div class="detail-tabcon module-block" id="tab2_content" style="display:none;">
				<div style="height:600px;">暂无</div>
             </div>
             <div class="detail-tabcon module-block" id="tab3_content" style="display:none;">
				<c:if test="${info.ispllr eq '1' }">
		    		<table id="jygg_news_detail_table">
		    			<tr>
			                <th width="350">标的名称</th>
			                <th>报名开始时间</th>
			                <th>报名结束时间</th>
			                <th>挂牌价(元)</th>
			                <th>当前价(元)</th>
			                <th>增值率</th>
			                <th>操作</th>
			            </tr>
			             <%
			             	GongGao gongGao = (GongGao)request.getAttribute("info");
				            Object plist = request.getAttribute("projectList");
				            if(plist!=null){
				            	List list = (List)plist;
				            	int len = list.size();
				            	for(Object o : list){
				            		Map jjdt = (Map)o;
				            		out.println("<tr class=\"jygg_news_detail_tr\">");
				            		out.println("<td>" + jjdt.get("ProjectName") + "</td>");
				            		out.println("<td>" + jjdt.get("GongGaoFromDate") + "</td>");
				            		out.println("<td>" + jjdt.get("GongGaoToDate") + "</td>");
				          			out.println("<td>" + jjdt.get("guapaiprice") + "</td>");
				          			String zzlS = "0";
				            		if("1".equals(jjdt.get("hasbid").toString())){
				            			out.println("<td>" + jjdt.get("maxPrice") + "</td>");
				            			Double gpj = Double.valueOf(jjdt.get("guapaiprice").toString());
					            		Double dqj = Double.valueOf(jjdt.get("maxPrice").toString());
					            		double g = gpj.doubleValue();
					            		double d = dqj.doubleValue();
					            		double zzl = (d-g)/g*100;
					            		DecimalFormat df = new DecimalFormat("0.00");
					            		zzlS = df.format(zzl);
				            		}else{
				            			out.println("<td> - </td>");
				            		}
				            		out.println("<td>"+zzlS+"%</td>");
// 				            		out.println("<td nowarp><button class=\"new-jygg-btn\" onclick=\"jjdt_detail(this ,'" + jjdt.get("projectGuid") + "')\">竞价详情</button></td>");
									out.println("<td nowarp><button class=\"new-jygg-btn\" onclick=\"jmjl('"+gongGao.getInfoid()+"','"+jjdt.get("projectGuid")+"')\">竞价详情</button></td>");				            		
									out.println("</tr>");
				            	}
				            }
				          %>
		    		</table>
		    	</c:if>
		    	<div id="jmjl" style="display: none;">
			    	<iframe id="jmjlpage" src="" frameborder="0" style="height: 880px;width: 100%;"></iframe>
		    	</div>
             </div>
             <div class="detail-tabcon module-block" id="tab4_content" style="display:none;">
				${info.chengjiaogg }
             </div>
       </div>
       
       <div class="detail-con-right">
            <div class="right-list clearfix">
                    <h3>猜你喜欢</h3>
                    <ul class="clearfix">
                            <li>
                                <a href="infodetail?infoid=b4d564c1-6bae-4bff-a13e-1fa1bf65516d&categoryNum=001001001&pageName=f1" title="">
                                    <img src="images/linshi/fang-pic-1.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[常州市]</span>常州市怀德南路90号（一层、五层）房产竞价公告</dt>
                                        <dd>
                                            <span>转让底价：<span  class="fcdd3">10,326,000.00</span></span>
                                        </dd>
                                    </dl>
                                </a>
                            </li>
                    </ul>
                </div>
                <div class="right-list clearfix">
                    <h3>推荐服务</h3>
                    <ul class="clearfix">
                    	<c:forEach var="ehelp" items="${tjfws.rows}">
				          	<li>
				                    <a href="<%=basePath%>ehelpinfo?id=${ehelp.id}" title="">
	                                    <img src="<%=basePath %>upload/ehelp/${ehelp.pic}" width="225" height="168px" title="">
	                                    <dl>
	                                        <dt><a href="<%=basePath%>ehelpinfo?id=${ehelp.id}">${ehelp.title }</a></dt>
	                                        <dd>
	                                            <span>价格：<span  class="fcdd3">${ehelp.price }元</span>起</span>
	                                        </dd>
	                                    </dl>
	                                </a>
				            </li>
					   </c:forEach>
                    </ul>
                </div>

       </div>
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
<!--     <script src="<%=basePath%>html/js/jquery-1.7.2.min.js"></script> -->
    <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
    <script src="<%=basePath%>html/js/iconfont.js"></script>
    <script src="<%=basePath%>html/js/focus.js"></script>
    <script src="<%=basePath%>html/js/main.js"></script>
    <script src="<%=basePath%>html/js/glivia.js"></script>
    <script src="<%=basePath%>html/js/detail.js"></script>
    <script src="<%=basePath%>html/js/jquery.imagezoom.min.js"></script>
	<script>
	$(document).ready(function(){
		//图片放大镜效果
		$(".jqzoom").imagezoom()
		$("#thumblist li a").click(function(){
			$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
			$(".jqzoom").attr('src',$(this).find("img").attr("mid"));
			$(".jqzoom").attr('rel',$(this).find("img").attr("big"));
// 			alert($(".jqzoom").attr('src'));
// 			alert($(".jqzoom").attr('rel'));
		});
	});
	
	//加关注
	function addFocus(){
		$.ajax({
			url:"<%=basePath%>addFocus",
			type:"post",
			dataType:"json",
			data:{infoid:'${info.infoid}'},
			success:function(data){
				alert(data.msg);
			}
		});
	}
    
    //与报名结束时间比较，计算倒计时
    function countdown(){
    	var date = new Date();
        var year = date.getFullYear();
        var newDate =new Date(Date.parse('<fmt:formatDate value="${info.gonggaotodate }" type="date" dateStyle="medium" pattern="yyyy/MM/dd HH:mm:ss"/>'));
//         newDate.setFullYear(year+1);
//         newDate.setMonth(0,1);
//         newDate.setHours(0,0,0);
        var itime = newDate.getTime()-date.getTime();
        var isecond = parseInt(itime/1000);
        var newDay = parseInt(isecond/24/60/60);
        var modeDay = isecond%(24*60*60);
        var newHour = parseInt(modeDay/60/60);
        var modeHour = modeDay%(60*60);
        var newMinute = parseInt(modeHour/60);
        var modeMinute = modeHour%60;
        var newSecond = parseInt(modeMinute);
        $("#countdown").html("距竞价结束：<b class=\"org bold\">"+newDay+"</b> 天 <b class=\"org bold\">"+newHour+"</b> 时 <b class=\"org bold\">"+newMinute+"</b> 分 <b class=\"org bold\">"+newSecond+"</b>  秒");
    }
	<c:if test="${info.status_name == '报名中' or info.status_name == '竞价中'}">
    	setInterval(countdown,1000);
    </c:if>
    <c:if test="${info.status_name != '报名中' and info.status_name != '竞价中'}">
    	$("#countdown").html("${info.status_name}");
	</c:if>
	
	var map = null;
    function initialize() {
    	setTimeout(function(){
    		if(map==null){
    			map = new BMap.Map("allmap");    
    			var point = new BMap.Point(119.989289,31.773253);    
    			map.centerAndZoom(point, 18);    
    			var marker = new BMap.Marker(point);        // 创建标注    
    			map.addOverlay(marker);                     // 将标注添加到地图中
     			map.enableScrollWheelZoom();
    			
     		    var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                '<img src="http://www.e-jy.com.cn//ejyzx/uploadfile/20170629101706001.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                '标的位于常州市天宁区五角场东村13幢8号，丽华北路以西，临近常州市南大街商业中心（约2公里），商业设施集聚商业氛围良好' +
				'</div>';

				//创建检索信息窗口对象
				var searchInfoWindow = null;
				searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
						title  : "五角场东村13幢8号",      //标题
						width  : 290,             //宽度
						height : 105,              //高度
						panel  : "panel",         //检索结果面板
						enableAutoPan : true,     //自动平移
						searchTypes   :[
							BMAPLIB_TAB_SEARCH,   //周边检索
							BMAPLIB_TAB_TO_HERE,  //到这里去
							BMAPLIB_TAB_FROM_HERE //从这里出发
						]
					});
				var marker = new BMap.Marker(point); //创建marker对象
				//marker.enableDragging(); //marker可拖拽
				marker.addEventListener("click", function(e){
				    searchInfoWindow.open(marker);
				})
				map.addOverlay(marker); //在地图中添加marker
    			
    			
    			
        	}
    	},500);

  	}  
    //批量挂牌项目直接显示竞价详情
    var ispllr = "${info.ispllr}";
    var infoid = "${info.infoid }";
    if(ispllr != '1'){
    	$("#jmjlpage").attr("src","jmjl?infoid="+infoid);
    	$("#jmjl").show();
    }
    //竞价详情
    function jmjl(infoid,projectGuid){
    	$("#jmjlpage").attr("src","jmjl?infoid="+infoid+"&projectGuid="+projectGuid);
    	$("#jygg_news_detail_table").hide();
    	$("#jmjl").show();
    }
    //从竞价详情页返回标的列表页
    function backobjects(){
    	$("#jygg_news_detail_table").show();
    	$("#jmjl").hide();
    }
    //切换wrap显示,传入要显示的wrap的id,其他的都隐藏
    function wrapshow(wrapid){
    	$('#wrap').hide();
		$('#mapwrap').hide();
		$('#videowrap').hide();
		$('#audiowrap').hide();
		$('#'+wrapid).show();
    }
    
    //展示中图
    function showmidpath(midpath){
    	$('#wrap').show();
    	$('#mapwrap').hide();
    	$('#videowrap').hide();
    	$(".jqzoom").attr("src",midpath);
    }
    </script>

</body>

</html>
