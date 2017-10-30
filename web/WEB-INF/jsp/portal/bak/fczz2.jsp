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
<!--             	<a href="http://720yun.com/t/c02jzstwrw4?from=singlemessage&isappinstalled=0&pano_id=6174879" target="_blank" 	class="share-btn vr have" ><i></i>360° 全景</a>
            	<a href="javascript:$('#videoli').click();" class="share-btn video have"><i></i>视频</a>
				<a href="javascript:$('#audioli').click();" class="share-btn audio have"><i></i>一键收听</a> -->
	            
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
              <span class="label second"><b>市中心</b><i></i></span>
              <span class="label third"><b>配套成熟</b><i></i></span>
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
            	    <div class="list w100">
	                    <span class="laber">租金底价</span><span class="money">296,164.00</span> 元/年
	                </div>
	                <div class="list w100">
	                    <span class="laber">租赁期限</span><span class="money">3</span> 年
	                </div>
	                <div class="list">
	                    <span class="laber">租赁面积</span><span class="money">1,287.95 </span> m²
	                </div>
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
            <dd>杨女士 李先生 </dd>
        </dl>
        <dl class="dispatching">
            <dt>联系电话：</dt>
            <dd>0519-86677336 </dd>
        </dl>
        <dl class="dispatching">
            <dt>单位地址：</dt>
            <dd>常州市新北区龙锦路1259-2号11楼</dd>
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
               <!--  <li class="survey switch" onclick="myclick(4)">成交公告</li> -->
            </ul>
            <div id="tab1_content" class="detail-tabcon clearfix" style="display: block;">
<div class="ph12">

<div   class="module-block"  id="d-bdgk">

<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td colspan="2" class="shheh"><p align="left" >项目名称 </p></td>
    <td width="198"><p align="left">常州市南大街28-404室等16处房产招租公告 </p></td>
    <td colspan="3" class="shheh"><p align="left">项目编号 </p></td>
    <td width="255" colspan="2"><p align="left">01FCZZ20170074 </p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="left">挂牌起始日期 </p></td>
    <td width="198"><p align="left">2017年7月25日 </p></td>
    <td colspan="3" class="shheh"><p align="left">挂牌截止日期 </p></td>
    <td width="255" colspan="2"><p align="left">2017年8月2日 </p></td>
  </tr>
  <tr>
    <td colspan="2" class="shheh"><p align="left">挂牌期满，如未征集到意向受让方 </p></td>
    <td colspan="6"><p align="left">挂牌期满后如未征集到意向受让方，按（5）个工作日为周期延牌，最多延长（24）个周期。 </p></td>
  </tr>
  <tr>
    <td width="101" rowspan="8" class="shheh"   align="center"><p align="">标的 <br />概况 </p></td>
    <td width="130"  class="shheh"><p align="center">标的坐落 </p></td>
    <td width="198"><p align="center">常州市钟楼区南大街28-404室至408室、28-410室、28-417室至426室 </p></td>
    <td colspan="2" class="shheh"><p align="center">所在层数 </p></td>
    <td colspan="3"><p align="">——</p></td>
  </tr>
  <tr>
    <td width="130" class="shheh"><p align="center">标的类型 </p></td>
    <td width="198"><p align="">商铺 </p></td>
    <td class="shheh" colspan="2"><p align="center">标的状态 </p></td>
    <td colspan="3"><p align="">空置 </p></td>
  </tr>
  <tr>
    <td width="130"  class="shheh" ><p align="center">租赁面积约 <br />
      （㎡） </p></td>
    <td width="198"><p align="">1287.95</p></td>
    <td  class="shheh"  colspan="2"><p align="center">规划用途 </p></td>
    <td colspan="3"><p align="">­­—— </p></td>
  </tr>
  <tr>
    <td width="130"  class="shheh" ><p align="center">租赁期限（年） </p></td>
    <td width="198"><p align="">3</p></td>
    <td  class="shheh"  colspan="2"><p align="center">租金支付方式 </p></td>
    <td colspan="3"><p align="">半年一付，先付后用 </p></td>
  </tr>
  <tr>
    <td width="130"  class="shheh" ><p align="center">年租金底价 <br />
      （元） </p></td>
    <td width="198"><p align="">296164</p></td>
    <td  class="shheh"  colspan="2"><p align="center">承租押金 <br />
      (元) </p></td>
    <td colspan="3"><p align="">90000</p></td>
  </tr>
  <tr>
    <td width="130"  class="shheh" ><p align="center">配套、环境、交通、亮点 </p></td>
    <td colspan="6"><p align="">无 </p></td>
  </tr>
  <tr>
    <td width="130"  class="shheh" ><p align="left">其他情况 </p></td>
    <td colspan="6"><p>标的物不得用于经营餐饮行业。 <br />
      2.&nbsp;&nbsp;&nbsp;&nbsp; 物业费由承租人直接交予物业公司并服从物业公司管理。 <br />
      3.&nbsp; 承租人享有两个月免租金装修期，但由原承租人继续承租的除外。 <br />
      4.&nbsp;&nbsp;&nbsp;&nbsp; 标的物无下水通道。 <br />
      5.&nbsp;&nbsp;为保证承租人合理并善意地使用租赁房屋及配套设施，承租人在签订房屋租赁合同时须向出租人支付承租押金90000元，承租押金分为履约保证金50000元和结构保证金40000元。若承租人发生违约行为，出租人有权扣除履约保证金；如承租人对房屋的内部结构进行改变，应在合同到期日前将房屋恢复原状并交还给出租人，如承租人拒不履行该义务的，出租人可以自行或委托第三方整修至原状，费用由出租人从结构保证金中扣除。 </p></td>
  </tr>
  <tr>
    <td width="130"  class="shheh" ><p align="left">附件 </p></td>
    <td colspan="6"><p align="left">&nbsp;</p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="135"  class="shheh"  align="center"><p align="">特别<br />告知 </p></td>
    <td width="754" colspan="7"><p>1.本次招租标的不含装修和配备，按交付时实际情况出租。 <br />
      2.房屋租赁面积以现场展示为准，出租人及产交所不承担招租标的中租赁面积与实测面积差异等责任，不调整相应的租金价格。 <br />
      3. 意向承租人有责任自行或委托专人了解招租标的的状况，决定报价，并对自己的出价行为承担法律责任。 <br />
      4.&nbsp;招租标的的底价、成交价均不含承租人在租赁中应缴纳的水电、物业等有关费用。 <br />
      5.&nbsp;本次招租标的租金为含增值税价。 </p></td>
  </tr>
      </table>
  </div>
  <br />
<div   class="module-block"  id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="138" rowspan="3"   align="center" class="shheh" ><p align="" >交易 <br />条件 </p></td>
    <td width="169"  class="shheh" ><p align="left">交易价款 </p></td>
    <td width="582" colspan="6"><p align="left">成交之日起<u> 5 </u>个工作日内按系统提示付清。 </p></td>
  </tr>
  <tr>
    <td width="169"  class="shheh" ><p align="left">竞买资格 </p></td>
    <td width="582" colspan="6"><p align="left">凡具有完全民事行为能力的自然人、法人或其他组织均可参与本项目。 </p></td>
  </tr>
  <tr>
    <td width="169"  class="shheh"   align="center"><p align="">标的交割 </p></td>
    <td width="582" colspan="6"><p>1.承租人必须于竞价结束后出租人通知时间内至出租人处签署《房屋租赁合同书》并提交以下资料：&nbsp;&nbsp; <br />
      &nbsp;&nbsp; ① 自然人身份证原件； <br />
      &nbsp;&nbsp; ② 法人或其他组织工商执照复印件、授权委托书与公章； <br />
      &nbsp;&nbsp; ③ 出租人要求的其他材料。 <br />
      2.承租人未履行上述规定的，产交所或出租人有权视作承租人放弃标的。承租人放弃或视作放弃招租标的，该标的可再次招租，如租金低于原成交租金的，违约承租人应当补足差额。 <br />
      3.在被确认为承租人前，若因招租标的撤销等情形致使意向承租人无法竞价时，无论何种情况，意向承租人不得向产交所主张除退取保证金之外的任何权利。成交后，如标的因出租人原因最终不能完成交付手续的，与产交所无关，承租人仅有权要求产交所退还保证金（不计息）。 <br />
      4.本次招租产交所系受出租人委托，出租人已承诺在《房屋租赁合同书》规定的租赁起算日前将租赁房屋交付给承租人，因承租人未及时付清应付款项的，出租人有权拒绝交付标的且不承担违约责任，实际租赁期不进行顺延，由此造成的经济损失全部由承租人自行承担。本次招租标的以交付时现状进行交付，出租人不保证房屋及附属的设施、设备的完好，交付房屋时如含装修部分，承租人不需使用的，经出租人书面同意后由承租人自行拆除，费用自理。 <br />
      5.承租人在承租期内应以自用的方式直接使用所租赁的经营场地，未经出租人同意不得擅自将该场地以转租、出租、转借、调换等形式给予第三方使用，否则视为承租人违约。承租人应向出租人支付违约金。同时，出租人有权单方面终止合同，及不返还承租人的押金和已付租金，并就因承租人所造成的损失向承租人索赔。对于虽不属于上述方式，但具有同等性质的行为也一律将视为违约行为，应由承租人承担相应违约责任金。 </p></td>
  </tr>
        </table>
  </div>
  <br />
<div   class="module-block" id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="119"  rowspan="7" align="center"  class="shheh"><p  >交易 <br />指南 </p></td>
    <td width="141"  class="shheh" ><p align="left">竞价规则 </p></td>
    <td colspan="6"><p align="left">竞买方在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn" target="_blank" class="fcdd3 tdu">www.e-jy.com.cn</a>）的《<a href="http://www.e-jy.com.cn/newsinfo?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6" target="_blank" class="fcdd3 tdu">e交易平台竞价交易规则</a>》、《<a href="http://www.e-jy.com.cn/newsinfo?infoid=b74cf4d8-845e-42c0-9ed5-0720ab0d086e" target="_blank" class="fcdd3 tdu">e交易平台产权交易操作指南</a>》等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 </p></td>
  </tr>
  <tr>
    <td width="141"  class="shheh" ><p align="left">现场展示 </p></td>
    <td colspan="6"><p>1.时间:2017年7月25日至2017年8月2日（联系后组织察看标的）。 <br />
      2.地点:标的所在地。 </p></td>
  </tr>
  <tr>
    <td width="141"  class="shheh"  rowspan="2"><p align="left">竞买报名 </p></td>
    <td width="149"  class="shheh" ><p align="left">报名截止时间 </p></td>
    <td colspan="5"><p align="left">2017年8月2日 </p></td>
  </tr>
  <tr>
    <td width="149"  class="shheh" ><p align="left">保证金及处置方式 </p></td>
    <td colspan="5"><p>1.缴纳：金额<u>360000</u>元，截止时间<u>2017年8月7日24:00</u>，按系统提示缴纳。 <br />
      2.退还：承租人缴纳房租并签署《房屋租赁合同书》后退还，其他竞价人的保证金将于成交后的3个工作日内退还。 </p></td>
  </tr>
  <tr>
    <td width="141"  class="shheh"  rowspan="2"><p align="left">竞价安排 </p></td>
    <td width="149"  class="shheh" ><p align="left">竞价方式 </p></td>
    <td width="121"><p align="left">加价竞价 </p></td>
    <td   class="shheh" colspan="3"><p align="left">增价幅度 </p></td>
    <td width="148"><p align="left">12000元 </p></td>
  </tr>
  <tr>
    <td width="149"  class="shheh" ><p align="left">自由竞价时间 </p></td>
    <td width="121"><p align="left">2017年8月8日14:00至15:00止 </p></td>
    <td  class="shheh"  colspan="3"><p align="left">延时竞价周期 </p></td>
    <td width="148"><p align="left">1分钟 </p></td>
  </tr>
  <tr>
    <td width="141"  class="shheh" ><p align="left">服务费 </p></td>
    <td colspan="6"><p align="left">租金成交总价的<u>1.5</u>%，成交之日起<u> 5 </u>个工作日内按系统提示付清。 </p></td>
  </tr>
  <tr>
    <td width="119"  class="shheh"  align="center"  rowspan="5"><p align="left">联系 <br />
      方式 </p></td>
    <td width="141"  class="shheh" ><p align="left">标的咨询 </p></td>
    <td colspan="6"><p align="left">杨女士 李先生 0519-86677336</p></td>
  </tr>
  <tr>
    <td width="141"  class="shheh" ><p align="left">技术支持 </p></td>
    <td colspan="6"><p align="left">杨先生 0519-89890395 </p></td>
  </tr>
  <tr>
    <td width="141"  class="shheh" ><p align="left">咨询时间 </p></td>
    <td colspan="6"><p align="left">自公告之日起至2017年8月7日17:00止（节假日除外） </p></td>
  </tr>
  <tr>
    <td width="141"  class="shheh" ><p align="left">单位地址 </p></td>
    <td colspan="6"><p align="left">常州市新北区龙锦路1259-2号 </p></td>
  </tr>
  <tr>
    <td width="141"  class="shheh" ><p align="left">其    他 </p></td>
    <td colspan="6"><p align="left">&nbsp;</p></td>
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
                                <a href="<%=basePath%>infodetail?infoid=d75439dd-6bfa-4f84-b2db-3117a0be0cba&categoryNum=001001009&pageName=fczz1" title="">
                                    <img src="images/linshi/fczz1.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[常州产权交易所]</span>公园路18-302号等27处房产整体招租竞价公告</dt>
                                        <dd>
                                            <span>转让底价：<span  class="fcdd3">1,207,750.00元</span></span>
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
    
	//百度地图显示
    var map = null;
    function initialize() {
    	setTimeout(function(){
    		if(map==null){
    			map = new BMap.Map("allmap");    
    			var point = new BMap.Point(119.960966,31.781416);    
    			map.centerAndZoom(point, 18);    
    			var marker = new BMap.Marker(point);        // 创建标注    
    			map.addOverlay(marker);                     // 将标注添加到地图中
     			map.enableScrollWheelZoom();
    			
     		    var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                '<img src="http://www.e-jy.com.cn//ejyzx/uploadfile/20170629101706001.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                '房屋租赁面积以现场展示为准，出租人及产交所不承担招租标的中租赁面积与实测面积差异等责任，不调整相应的租金价格' +
				'</div>';

				//创建检索信息窗口对象
				var searchInfoWindow = null;
				searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
						title  : "南大街28-404室",      //标题
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
