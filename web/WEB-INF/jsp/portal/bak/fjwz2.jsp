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
    <script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script><!-- 百度地图API -->
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
             <div id="img" style="width: 480px;height: 360px;">
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
<!-- 			    <div class="item"><div id="map" style="width:480px;height:360px"></div></div> -->
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
	        			<!-- 地图 -->
<!-- 		        		<li> -->
<!-- 		       				<img src="<%=basePath%>images/map.png" > -->
<!-- 		       			</li> -->
		       			<!-- 音频 -->
<!-- 		        		<li id="audioli"> -->
<!-- 		       				<img src="<%=basePath%>images/audio.jpg" > -->
<!-- 		       			</li> -->
			           <c:forEach items="${mediainfo.pics }" var="pic" varStatus="stat">
		        			<li>
			                    <img src="http://www.e-jy.com.cn/${pic.path }" ></a>
			                </li>
		        		</c:forEach>
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
<!--               <span class="label"><b>报废资产</b><i></i></span> -->
<!--               <span class="label second"><b>大金</b><i></i></span> -->
<!--               <span class="label third"><b>医疗设备</b><i></i></span> -->
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
	                    <span class="laber">转让底价 </span><span class="money">57,000.00</span> 元
	                </div>
	                
	                <div class="list w100">
	                    <span class="laber">保证金 </span><span class="money">10,000.00</span> 元
	                </div>
<!-- 	                <div class="list"> -->
<!-- 	                    <span class="laber">存放地 </span><span class="money">139.04</span>m² -->
<!-- 	                </div> -->
<!-- 	                <div class="list"> -->
<!-- 	                    <span class="laber">单价 </span><span class="money">14,384.34</span> 元<span class="fc99">/m²</span> -->
<!-- 	                </div> -->
                </c:if>
            </div>
            <div class="detail-bug-btn clearfix">
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
    <td width="158" colspan="2" class="shheh" ><p align="center">项目名称 </p></td>
    <td width="151" colspan="2"><p align="left">草包一批废旧资产转让公告 </p></td>
    <td width="153" colspan="4" class="shheh" ><p align="center">项目编号 </p></td>
    <td width="143" colspan="2"><p align="left">01WZ20170073 </p></td>
  </tr>
  <tr>
    <td width="158" colspan="2" class="shheh" ><p align="center">挂牌起始日期 </p></td>
    <td width="151" colspan="2"><p align="left">—— </p></td>
    <td width="153" colspan="4" class="shheh" ><p align="center">挂牌截止日期 </p></td>
    <td width="143" colspan="2"><p align="left">—— </p></td>
  </tr>
  <tr>
    <td width="158" colspan="2" class="shheh" ><p align="left">挂牌期满，如未征集到意向受让方 </p></td>
    <td width="447" colspan="8"><p align="left">挂牌期满后如未征集到意向受让方，按（5）个工作日为周期延牌，最多延长（24）个周期。 </p></td>
  </tr>
  <tr>
    <td width="84" rowspan="5" class="shheh" ><p align="center">标的概况 </p></td>
    <td width="73" class="shheh" ><p align="center">序号 </p></td>
    <td width="85" class="shheh" ><p align="center">标的名称 </p></td>
    <td width="66" class="shheh" ><p align="center">规格 </p></td>
    <td width="69" class="shheh" ><p align="center">数量 </p></td>
    <td width="82" class="shheh"  colspan="2"><p align="center">单位 </p></td>
    <td width="145" class="shheh"  colspan="3"><p align="center">评估价/价格（元） </p></td>
  </tr>
  <tr>
    <td width="73"><p align="left">1</p></td>
    <td width="85"><p align="left">草包 </p></td>
    <td width="66"><p align="left">&nbsp;</p></td>
    <td width="69"><p align="left">28.5</p></td>
    <td width="82" colspan="2"><p align="left">万只 </p></td>
    <td width="145" colspan="3"><p align="left">­­ 57000</p></td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="center">转让低价 </p></td>
    <td width="447" colspan="8"><p align="left">57000元 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="center">标的现状 </p></td>
    <td width="447" colspan="8"><p align="left">1.标的为报废资产，均无随机附件及图纸、说明书、保修单、维修手册等相关资料，部分资产已破损、残缺，以实物现状为准，常州产权交易所对竞价标的所涉及的具体范围、品名、型号、数量、品质等均不作承诺保证，不承担一切瑕疵担保责任。 <br />
      2.零值资产不作价，数量仅供参考，以现场交接数量为准，交割时须一并提清。 <br />
      3.上述资产存放于常州市新北区单位内，部分标的需买受人自行拆除，人工、运输成本较大，清单仅供参考，成交后按资产实际现状交接，不调整成交价格。 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="left">附件 </p></td>
    <td width="447" colspan="8"><p align="center">&nbsp;</p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="84" class="shheh" ><p align="center">特别<br />
      告知 </p></td>
    <td width="520" colspan="9"><p>1.竞价成交后，买受人向产交所支付的服务费，产交所开具服务费发票，产交所不开具其他任何票据。如买受人需要销售发票，由其自行向税务机关申报办理，税金由买受人另行承担。 <br />
      2.注册会员参与项目时，应严格遵照《<a href="http://www.czcq.com.cn/jygz/cqjy/88903.shtml">常州产权交易所注册会员管理办法</a>》、<a href="http://www.czcq.com.cn/jygz/cqjy/88901.shtml">《常州产权交易所低值资产交易办法》</a>的相关规定。资产占有单位（委托方）将对其服务进行评价，评价结果列入考核。 <br />
      3.买受人提取标的完毕须将《资产交割书》交至常州产权交易所，否则常州产权交易所有权暂停其注册会员资格，并限制其参与常州产权交易所组织的其它竞价活动，直至提交资料后恢复其会员资格。 <br />
      4.买受人对标的物有争议的，在争议处理期间，常州产权交易所有权暂停其注册会员资格，并限制其参与常州产权交易所组织的其它竞价活动，直至争议处理完毕后恢复其会员资格。 </p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="84" rowspan="3"  class="shheh" ><p align="center">交易<br />
      条件 </p></td>
    <td width="73"  class="shheh" ><p align="center">交易价款 </p></td>
    <td width="447" colspan="8"><p>成交之日起<u> 5 </u>个工作日内按系统提示付清。 </p></td>
  </tr>
  <tr>
    <td width="73"  class="shheh" ><p align="center">竞买资格 </p></td>
    <td width="447" colspan="8"><p>竞买人必须为常州产权交易所低值实物资产竞买人注册会员，申请成为低值实物资产注册竞买人会员详见《<a href="http://www.czcq.com.cn/jygz/cqjy/88903.shtml">常州产权交易所注册会员管理办法</a>》。 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="center">标的交割 </p></td>
    <td width="447" colspan="8"><p align="left"><strong>1.</strong><strong>交割时间: </strong>2017年8月14日17时前办理交割，2017年8月25日17时前提取完毕。 <br />
      <strong>2.</strong><strong>交割方式:</strong> <br />
      （1）买受人提取标的时应向资产占有单位（委托方）提供：自然人身份证原件或法人、其他组织工商执照复印件、授权委托书以及委托人要求的其他材料。 <br />
      （2）如买受人对交割标的无异议，签署《资产交割书》。如买受人办理交割前发现交割标的的范围、数量、品种、品质等与公告标的不符，应及时提出异议并提供两者差异存在的有效书面证据。如经查实，异议成立，停止办理交割并按下述&ldquo;争议处理&rdquo;办法解决；如异议不成立，买受人拒绝办理标的交接手续的，视违约处理。 <br />
      （3）标的交割后，买受人及其工作人员在提取标的期间，应服从资产占有单位（委托方）管理安排，不得扰乱资产占有单位（委托方）正常的工作秩序；不能有吵闹、辱骂、斗殴、吸烟、赌博等不文明行为；标的的拆解与搬迁必须服从资产占有单位（委托方）安排；搬迁结束后不得遗留任何标的附属物。否则，由此造成的不良后果及损失由买受人承担。 <br />
      （4）该标的必须在上述规定标的物提取时间内搬运完毕，买受人如在上述规定期间内未按期搬运完毕，除非征得资产占有单位同意，否则每逾期1日须承担场地占用费500元，以此类推，直至搬清之日止。场地占用费从标的保证金中扣除，如场地占用费超过保证金，则买受人还应另行支付。 <br />
      （5）买受人负责标的的拆卸和搬运，在标的拆卸和搬运过程中必须严格遵守国家、地方安全和环境保护等方面有关法律、法规，如发生安全、环境等事故的，由买受人承担责任。 <br />
      （6）买受人不得损坏标的清单以外的其它资产、建（构）筑物及辅助、配套设施，不得破墙刨地，确需破墙才能搬运设备的，应征得资产占有单位（委托方）同意，并在标的搬迁后恢复原样。 <br />
      （7）买受人标的提取过程中，如发生逾期提取、损坏非竞价范围内物品，破坏建筑物及相关附着物的完整、安全等情形的，常州产权交易所有权扣除保证金，如造成的损失大于保证金的，由买受人另行承担。 <br />
      <strong>3.</strong><strong>争议处理: </strong> <br />
      （1）交易公告未对交易标的数量、型号、品牌等信息作出描述，且申明不承担瑕疵担保责任的，交割以实物现状为准，买受人不得要求退标及任何补偿。 <br />
      （2）交易公告已对交易标的数量、型号、品牌等信息作出明确描述，交割时，实物现状与公告内容不符，如不符标的评估（认定，下同）价格小于全部标的评估总价5%（含）的，不对成交款及交易佣金作任何调整，买受人不得要求退标；如不符标的评估价占比大于5%但小于20%（含），或虽大于20%但委托方、买受人均同意进行交割的，由委托方按下述补偿价差计算公式计算补偿价对买受人予以补偿，本所退还相应的交易佣金，买受人不得要求退标或其他损失赔偿。委托方补偿后可收回不符标的；不符标的评估价格占比大于20%，且委托方、买受方有一方不同意交割的，委托方收回标的，常州产权交易所退还交易佣金、成交款，委托方、常州产权交易所不承担其它责任。 <br />
      补偿价差计算公式为:（不符标的评估价÷全部标的评估总价）×成交总价 <br />
      佣金退付计算公式为：不符标的成交价×佣金收取比例 <br />
      （3）竞价成交后，如发现买受人不具备公告所示受让条件（包括但不限于环保、安全、拆卸等资质要求），常州产权交易所有权取消其受让资格，并要求其承担相关违约责任。 <br />
      （4）因交易双方原因致使标的不能按期进行交割的，过错方应承担违约责任。 <br />
      （5）因交易标的为废旧资产，买受<a name="_GoBack" id="_GoBack"></a>人不得以受让标的缺少铭牌、技术资料、整机缺件等为理由提出赔偿或退标。 </p></td>
  </tr>
      </table>
  </div>
  <br />
<div   class="module-block"  id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="84" class="shheh"  rowspan="7"><p align="center">交易<br />
      指南 </p></td>
    <td width="73" class="shheh" ><p align="center">竞价规则 </p></td>
    <td width="447" colspan="8"><p align="left">竞买方在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn/index">www.e-jy.com.cn</a>）的<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6&amp;categoryNum=027001">《e交易平台竞价交易规则》</a>、<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=ef7859f2-f1ae-4b0b-b002-eb62a59f8818&amp;categoryNum=034001">《e交易平台产权交易操作指南》</a>等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="center">现场展示 </p></td>
    <td width="447" colspan="8"><p>1.时间: 2017年8月4日9:00（看样请联系王工：13776811216 ）。 <br />
      2.地点: 常州市新北区黄河西路2号河道湖泊管理处 </p></td>
  </tr>
  <tr>
    <td width="73"  class="shheh" rowspan="2"><p align="center">竞买报名 </p></td>
    <td width="151" class="shheh"  colspan="2"><p align="center">报名截止时间 </p></td>
    <td width="296" colspan="6"><p>2017年8月9日 </p></td>
  </tr>
  <tr>
    <td width="151" class="shheh"  colspan="2"><p align="center">保证金及处置方式 </p></td>
    <td width="296" colspan="6"><p align="left">1.缴纳：金额<u> 10000 </u>元，截止时间<u> 2017年8月10日14:00 </u>，按系统提示缴纳。 <br />
      2.退还：买受人缴纳的保证金在标的提取完毕后退还，其他竞价人的保证金将于成交后的3个工作日内退还。 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh"  rowspan="2"><p align="center">竞价安排 </p></td>
    <td width="151" class="shheh"  colspan="2"><p align="center">竞价方式 </p></td>
    <td width="104" colspan="2"><p align="left">加价竞价 </p></td>
    <td width="94"  class="shheh" colspan="3"><p align="center">增价幅度 </p></td>
    <td width="98"><p align="left">100元 </p></td>
  </tr>
  <tr>
    <td width="151" class="shheh"  colspan="2"><p align="center">自由竞价时间 </p></td>
    <td width="104" colspan="2"><p align="left">2017年8月10日14:00至14:30 </p></td>
    <td width="94" class="shheh"  colspan="3"><p align="center">延时竞价周期 </p></td>
    <td width="98"><p align="left">1分钟 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="center">服务费 </p></td>
    <td width="447" colspan="8"><p align="left">成交价的<u>&nbsp;5 %</u>，成交之日起<u>1</u>个工作日内按系统提示付清。 </p></td>
  </tr>
  <tr>
    <td width="84" class="shheh"  rowspan="5"><p align="center">联系<br />
      方式 </p></td>
    <td width="73" class="shheh" ><p align="center">标的咨询 </p></td>
    <td width="447" colspan="8"><p align="left">王先生 0519-86626778 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="center">技术支持 </p></td>
    <td width="447" colspan="8"><p>杨先生 0519-89890395 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="center">咨询时间 </p></td>
    <td width="447" colspan="8">自公告之日起至2017年8月10日14:00止（节假日除外）</td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="center">单位地址 </p></td>
    <td width="447" colspan="8"><p>常州市新北区龙锦路1259-2号 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="center">其    他 </p></td>
    <td width="447" colspan="8"><p align="center">&nbsp;</p></td>
  </tr>
</table>
</div>
				</div>
             </div>
             <div class="detail-tabcon module-block" id="tab2_content" style="display:none;">
				<div style="height:600px; padding:15px;">暂无</div>
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
                                <a href="eweb/infodetail?infoid=b32860e4-7ca7-4df5-b999-68e3e9f884fd&categoryNum=001001004&pageName=fjwz1" title="">
                                    <img src="images/linshi/20170613122613001.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[常州市]</span>[常州产权交易所]吊机、电子汽车衡等一批报废资产竞价公告</dt>
                                        <dd>
                                            <span>转让底价：<span  class="fcdd3">10,106.86元</span></span>
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
	<c:if test="${info.status_name == '正在报名' or info.status_name == '正在竞价'}">
    	setInterval(countdown,1000);
    </c:if>
    <c:if test="${info.status_name != '正在报名' and info.status_name != '正在竞价'}">
    	$("#countdown").html("${info.status_name}");
	</c:if>
    //百度地图显示
    function initialize() {  
  	  var mp = new BMap.Map('map');  
  	  mp.centerAndZoom(new BMap.Point(119.94758,31.78474), 18); 
  	  mp.enableScrollWheelZoom();

  	}  
    //initialize();
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
