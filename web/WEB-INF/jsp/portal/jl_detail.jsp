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
    <link rel="stylesheet" href="<%=basePath%>mp3player/css/52player.css" type="text/css" />
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
                <a href="" target="_blank">捡漏</a>
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
<div class="preview_top">
     <div id="wrap" style="top:0px;z-index:99;position:relative;display: none;">
	     <a href="http://img.cm0519.com/GoodsImages//2014-06-18/20140618184038093.jpg" class="cloud-zoom" 
	     		id="zoom1" rel="adjustY:-4,adjustX:10" style="position: relative; display: block;">
	     	<c:if test="${mediaInfo.d3 != null}">	
	     		<img src="${mediaInfo.d3 }" class="jqzoom" width="480" height="360" style="display: block;">
	     	</c:if>
			<c:if test="${mediaInfo.d3 == null and mediaInfo.pics != null}">
	        	<img src="${mediaInfo.pics[0].bpath }" class="jqzoom" width="480" height="360" style="display: block;">
	        </c:if>
	        <c:if test="${mediaInfo.d3 == null and mediaInfo.pics == null}">
	        	<img src="" class="jqzoom" width="480" height="360" style="display: block;">
	        </c:if>
    	</a>
    	<div class="mousetrap" style="background-image: url(&quot;.&quot;); z-index: 98; position: absolute; width:480px; 
    	height: 360px; left: 0px; top: 0px; cursor: move;"></div>
    </div>
    <div id="videowrap" style="display: none;">
    	<c:if test="${mediaInfo.video_pic != null}">
    	<!--酷播迷你CuPlayerMiniV4.0/代码开始-->
		<script type="text/javascript" src="<%=basePath%>cuplayer/images/swfobject.js"></script>
		<div class="video" id="CuPlayer" style="950px;margin:0 auto;">
		<strong>提示：您的Flash Player版本过低！</strong></div>
		<script type="text/javascript">
		var so = new SWFObject("<%=basePath%>cuplayer/CuPlayerMiniV4.swf","CuPlayerV4","480","360","9","#000000");
		so.addParam("allowfullscreen","true");
		so.addParam("allowscriptaccess","always");
		so.addParam("wmode","opaque");
		so.addParam("quality","high");
		so.addParam("salign","lt");
		so.addVariable("CuPlayerSetFile","<%=basePath%>cuplayer/CuPlayerSetFile.php"); //播放器配置文件地址
// 		so.addVariable("CuPlayerFile","<%=basePath%>${mediaInfo.vide}"); //视频文件地址
// 		so.addVariable("CuPlayerImage","<%=basePath%>${mediaInfo.video_pic}");//视频略缩图
		so.addVariable("CuPlayerFile","<%=basePath%>cuplayer/1.mp4"); //视频文件地址
		so.addVariable("CuPlayerImage","<%=basePath%>cuplayer/1.jpg");//视频略缩图
		so.addVariable("CuPlayerWidth","480"); //视频宽度
		so.addVariable("CuPlayerHeight","360"); //视频高度
		so.addVariable("CuPlayerAutoPlay","no"); //是否自动播放
		so.write("CuPlayer");
		</script>
		<!--酷播迷你CuPlayerMiniV4.0/代码结束-->
		</c:if>
    </div>
    <div id="mapwrap">
    	<div id="map" style="width:480px;height:360px"></div>
    </div>
    <!-- 音频播放 -->
    <div id="audiowrap" style="padding-top: 130px;">
    	<link href="<%=basePath%>mp3player/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=basePath%>mp3player/lib/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>mp3player/jplayer/jquery.jplayer.min.js"></script>
    		<div id="jquery_jplayer_1" class="jp-jplayer"></div>
			<div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
				<div class="jp-type-single">
					<div class="jp-gui jp-interface">
						<div class="jp-controls">
							<button class="jp-play" role="button" tabindex="0">play</button>
							<button class="jp-stop" role="button" tabindex="0">stop</button>
						</div>
						<div class="jp-progress">
							<div class="jp-seek-bar">
								<div class="jp-play-bar"></div>
							</div>
						</div>
						<div class="jp-volume-controls">
							<button class="jp-mute" role="button" tabindex="0">mute</button>
							<button class="jp-volume-max" role="button" tabindex="0">max volume</button>
							<div class="jp-volume-bar">
								<div class="jp-volume-bar-value"></div>
							</div>
						</div>
						<div class="jp-time-holder">
							<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
							<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
							<div class="jp-toggles">
								<button class="jp-repeat" role="button" tabindex="0">repeat</button>
							</div>
						</div>
					</div>
					<div class="jp-details">
						<div class="jp-title" aria-label="title">&nbsp;</div>
					</div>
					<div class="jp-no-solution">
						<span>Update Required</span>
						To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
					</div>
				</div>
			</div>
			<script type="text/javascript">
		    $("#jquery_jplayer_1").jPlayer({
				ready: function (event) {
					$(this).jPlayer("setMedia", {
// 						title: "童话镇",
// 						mp3: "<%=basePath%>mp3player/thz.mp3"
						mp3: "<%=basePath%>${mediaInfo.audio}"
					});
				},
				swfPath: "<%=basePath%>mp3player/jplayer",
				supplied: "mp3",
				wmode: "window",
				useStateClassSkin: true,
				autoBlur: false,
				smoothPlayBar: true,
				keyEnabled: true,
				remainingDuration: true,
				toggleDuration: true
			});
		    </script>
    </div>
</div>
<div class="preview_bot">
    <a href="#" class="preview-control forward disabled"></a> <a href="#" class="preview-control backward"></a>
    <div class="items">
        <ul id="thumblist">
        		<!-- 优先显示360全景封面图 -->
        		<c:if test="${mediaInfo.d3 != null }">
        			<li>
        				<a href="javascript:showmidpath('<%=basePath%>${mediaInfo.d3 }');" target="_blank">
        					<img src="<%=basePath%>${mediaInfo.d3 }" mid="<%=basePath%>${mediaInfo.d3 }" big="<%=basePath%>${mediaInfo.d3 }">
        				</a>
        			</li>
        		</c:if>
        		<!-- 再显示视频封面图 -->
        		<c:if test="${mediaInfo.video_pic != null }">
        			<li>
        				<a href="javascript:$('#wrap').hide();$('#mapwrap').hide();$('#videowrap').show();$('#audiowrap').hide();"><img src="<%=basePath%>${mediaInfo.video_pic }" mid="<%=basePath%>${mediaInfo.video_pic }" big="<%=basePath%>${mediaInfo.video_pic }"></a>
        			</li>
        		</c:if>
        		<li>
       				<a href="javascript:$('#wrap').hide();$('#mapwrap').show();$('#videowrap').hide();$('#audiowrap').hide();"><img src="<%=basePath%>images/map.png" ></a>
       			</li>
        		<c:forEach items="${mediaInfo.pics }" var="pic" varStatus="stat">
        			<c:if test="${stat.first }">
        				<c:if test="${mediaInfo.d3 == null and mediaInfo.video_pic ==null }">
        					<li class="tb-selected">
        				</c:if>
        			</c:if>
        			<c:if test="${!stat.first }">
        				<li>
        			</c:if>
	                     <a href="javascript:showmidpath('<%=basePath%>${pic.bpath }');"><img src="<%=basePath%>${pic.path }" mid="<%=basePath%>${pic.bpath }" big="<%=basePath%>${pic.bpath }"></a>
	                </li>s
        		</c:forEach>
        </ul>
    </div>
</div>
<div class="clear"></div>
            
            <div class="preview-share">
            
            <c:if test="${mediaInfo.d3 != null}">
            	<a href="${mediaInfo.d3 }" target="_blank" 	class="share-btn vr have" ><i></i>360° 全景</a>
            </c:if>
            <c:if test="${mediaInfo.d3 == null}">
            	<a target="_blank"	class="share-btn vr" ><i></i>360° 全景</a>
            </c:if>
            <c:if test="${mediaInfo.video_pic != null}">
            	<a href="javascript:$('#wrap').hide();$('#mapwrap').hide();$('#videowrap').show();$('#audiowrap').show();" class="share-btn video have"><i></i>视频</a>
            </c:if>
            <c:if test="${mediaInfo.video_pic == null}">
            	<a class="share-btn video"><i></i>视频</a>
            </c:if>
            <a href="javascript:
            $('#wrap').hide();$('#videowrap').show();
			$('#mapwrap').hide();$('#audiowrap').show();" class="share-btn audio "><i></i>一键收听</a>
            <div class="share-btn share "><i></i><span class="fl">分享至:</span>
                <div class="bdsharebuttonbox clear1 bdshare-button-style1-16" data-bd-bind="1501032382879" style="float:left;">
                    <!-- <a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a>
                    <a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a>
                    <a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a>
                    <a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren"></a>
                    <a title="分享到百度贴吧" href="#" class="bds_tieba" data-cmd="tieba"></a>
                    <a title="分享到百度新首页" href="#" class="bds_bdhome" data-cmd="bdhome"></a>
                    <a title="分享到我的淘宝" href="#" class="bds_taobao" data-cmd="taobao"></a>
                    <a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a>
                    <a title="分享到复制网址" href="#" class="bds_copy" data-cmd="copy"></a> -->
                    <a href="#" class="bds_more" data-cmd="more" style="margin:7px 0 0 10px;float:right;"></a>
                </div>
              </div>

                
            </div>
        </div>
        
        <div class="product-intro">
            <div id="Name">
                <h1>${info.title }</h1>
            </div>
<div class="detail-characteristic clearfix">
                                <span class="label"><b>近地铁</b><i></i></span>
                                <span class="label second"><b>学区房</b><i></i></span>
                                <span class="label third"><b>有地铁</b><i></i></span>
                              </div>
            
            <div class="price clearfix">
                <c:if test="${info.status_name eq '已成交'}">
                 <div class="label signup">已经<br>成交</div>
                </c:if>
                <c:if test="${info.status_name eq '报名中'}">
                 <div class="label signup">正在<br>竞价</div>
                </c:if>
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
	                    <span class="laber">挂牌价 </span><span class="money">详见交易公告</span> 
	                </div>
	                <div class="list">
	                    <span class="laber">保证金 </span><span class="money">详见交易公告</span> 
	                </div>
            	</c:if>
                <c:if test="${info.ispllr != '1'  }">
                	<div class="list">
	                    <span class="laber">挂牌价 </span><span class="money">${info.guapaiprice }</span> 元
	                </div>
	                <div class="list">
	                    <span class="laber">保证金 </span><span class="money">${info.baozhengjprice }</span> 元
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
				<c:if test="${info.status_name == '竞价已结束'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-default">竞价截止</a>
				</c:if>
				<c:if test="${info.status_name == '未开始'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-update">未开始</a>
				</c:if>
				<c:if test="${info.status_name == '报名已截止'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-default">报名截止</a>
				</c:if>
				<c:if test="${info.status_name == '竞价中'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-bidding">竞价中</a>
				</c:if>
				<c:if test="${info.status_name == '已成交'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-default">已成交</a>
				</c:if>
                <!-- 如报名结束，则CLASS增加over -->
                <a href="" class="financing-btn over">在线融资申请</a>
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
      	 	<li><a href="<%=basePath%>questioninfo?infoid=${question.id}" target="_blank"><span class="helper-tag">${question.title }</span>
      	 	${question.key_word }</a>
      	 	</li>
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
            <dd>0519-86601526 <br>18147163465 </dd>
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
                <li class="survey switch" onclick="myclick(4)">成交公告</li>
            </ul>
            <div id="tab1_content" class="detail-tabcon clearfix" style="display: block;">
<div class="ph12">

<table border="1" cellspacing="0" cellpadding="0"  width="890" style="" class="base-sw  module-block" id="d-bdgk">
  <tr>
      <td width="95" class="shheh"><p align="center"><strong>标的概况</strong></p></td>
      <td width="611"><p>${info.content }</p></td>
    </tr>
</table>
<p>&nbsp;</p>
<div align="center"  class="module-block" id="d-tbgz">
  <table border="1" cellspacing="0" cellpadding="0"  width="890" style="" class="base-sw">
    <tr>
      <td width="95" class="shheh"><p align="center"><strong>特别告知 </strong></p></td>
      <td width="611"><p>1.标的以展示时的品质现状、权利属性以及权益状况进行公开竞价，竞买人应在车辆展示期间现场查看车况，自行了解车辆性能、质量、权属和欠费等信息。 <br />
        2.产交所不保证车辆能否正常使用以及所有部件、配件的完整性和完好性。发生影响车辆使用的情形均由买受人负责解决并承担费用。 <br />
        3.竞买人必须充分估计二手车市场风险，包括但不限于二手车市场价变化、车辆交易规定调整、车辆多日停驶造成的故障等。 <br />
        4.…… </p></td>
    </tr>
  </table>
</div>
<br />
<div align="center"  class="module-block"  id="d-jytj">
  <table border="1" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
    <tr>
      <td width="95" class="shheh"><p align="center"><strong>融资支持 </strong></p></td>
      <td width="611"><p>1.常州本地客户/竞买人如有融资需求，可申请贷款产品-产权贷，详情请咨询：唐先生18168811577。 <br />
        2.常州本地客户/竞买人如有保证金融资需求，可申请保函产品-交E融，详情点击<a href="http://www.e-jy.com.cn/ejy/tzjr/038004/038004003/">[产品介绍]</a>。 </p></td>
    </tr>
  </table>
</div>
<p>&nbsp;</p>
<div align="center"  class="module-block"  id="d-jyzn">
  <table border="1" cellspacing="0" cellpadding="0"  width="890" style="" class="base-sw">
    <tr>
      <td width="121" class="shheh" rowspan="10"><p align="center"><strong>交易指南 </strong></p></td>
      <td width="82" class="shheh"><p align="center"><strong>竞价规则 </strong></p></td>
      <td width="504" colspan="5"><p>竞买人在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn" target="_blank" class="fcdd3 tdu">www.e-jy.com.cn</a>）的《<a href="http://www.e-jy.com.cn/newsinfo?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6" target="_blank" class="fcdd3 tdu">e交易平台竞价交易规则</a>》、《<a href="http://www.e-jy.com.cn/newsinfo?infoid=b74cf4d8-845e-42c0-9ed5-0720ab0d086e" target="_blank" class="fcdd3 tdu">e交易平台产权交易操作指南</a>》等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 </p></td>
    </tr>
    <tr>
      <td width="82" class="shheh"><p align="center"><strong>竞买资格 </strong></p></td>
      <td width="504" colspan="5"><p align="left">1.凡具有完全民事行为能力的自然人、法人或其他组织均可参与本项目。 <br />
        2.竞买人在报名前应自行了解国家及地方法律、法规等相关政策，判断是否具备竞价标的过户资格条件，并承担由此产生的相应责任及后果。 <br />
        <strong>3.</strong><strong>竞买人自备终端进行网络竞价，本所不提供竞价场所。 </strong></p></td>
    </tr>
    <tr>
      <td width="82" class="shheh"><p align="center"><strong>现场展示 </strong></p></td>
      <td width="504" colspan="5"><p>1.时间:年月日至年月日（联系后统一组织）（可选：不统一组织，看房请联系委托方：） <br />
        2.地点:</p></td>
    </tr>
    <tr>
      <td width="82" class="shheh" rowspan="2"><p align="center"><strong>竞买报名 </strong></p></td>
      <td width="106" class="shheh"><p align="left"><strong>报名截止时间 </strong></p></td>
      <td width="397" colspan="4"><p align="left"><strong>&nbsp;</strong></p></td>
    </tr>
    <tr>
      <td width="106" class="shheh"><p align="left"><strong>保证金 </strong></p></td>
      <td width="397" colspan="4"><p>1.缴纳：金额元，截止时间，按系统提示缴纳。 <br />
        （专厅适用）1.缴纳：1万元/份, 竞买人按系统提示缴纳，可以缴纳多份保证金。截止时间年月日。竞买人交纳了保证金后，即可参与任意车辆的竞买，但一份保证金只能对一辆车进行最高报价，在最高报价成交后，该份保证金不能再参与其他车辆的竞买。<strong><u> </u></strong><br />
        2.退还：买受人缴纳的保证金在标的过户完毕后退还，其他竞价人的保证金将于成交后的3个工作日内退还。<strong> </strong></p></td>
    </tr>
    <tr>
      <td width="82" class="shheh" rowspan="2"><p align="center"><strong>竞价安排 </strong></p></td>
      <td width="107" class="shheh" colspan="2"><p align="center"><strong>竞价方式</strong></p></td>
      <td width="113"><p>加价竞价(字面解释提示框)<strong> </strong></p></td>
      <td width="107" class="shheh"><p align="center"><strong>增价幅度</strong></p></td>
      <td width="176"><p>元 </p></td>
    </tr>
    <tr>
      <td width="107" class="shheh" colspan="2"><p align="center"><strong>自由竞价时间</strong></p></td>
      <td width="113"><p>年月日时至时止<strong> </strong></p></td>
      <td width="107" class="shheh"><p><strong>延时竞价周期</strong></p></td>
      <td width="176"><p>1分钟<strong> </strong></p></td>
    </tr>
    <tr>
      <td width="82" class="shheh"><p align="center"><strong>服务费 </strong></p></td>
      <td width="504" colspan="5"><p>1．成交价的%，成交之日起个工作日内按系统提示付清。 <br />
        2.竞价成交后，买受人向产交所支付的服务费，产交所开具服务费发票，产交所不开具其他任何票据。(如有其它资产适用)如买受人需要销售发票，由其自行向税务机关申报办理，税金由买受人另行承担。 </p></td>
    </tr>
    <tr>
      <td width="82" class="shheh"><p align="center"><strong>成交款 </strong></p></td>
      <td width="504" colspan="5"><p>1.成交之日起个工作日内按系统提示付清。 </p></td>
    </tr>
    <tr>
      <td width="82" class="shheh"><p align="center"><strong>标的交割 </strong></p></td>
      <td width="504" colspan="5"><p><strong>1.</strong><strong>交割时间: </strong>年月日时前办理。<strong> </strong><br />
        <strong>2.</strong><strong>交割方式:</strong><br />
        （1）竞买人在缴纳全部成交款及交易服务费后，年月日（星期）前至本所签署《成交确认书》并领取服务费发票后办理交割。为确保车辆过户安全，本次竞价的车辆过户，由产交所指定中介机构在要求时间内集中办理相关手续，买受人必须服从指定中介机构的安排，不可委托其他经纪人或中介机构办理车辆变更登记手续。办理过户手续时，需要通知买受人到车辆管理部门配合办理手续的，买受人应准时到场。如因买受人原因造成手续无法及时办理的，买受人应承担由此产生的一切费用及标的可能发生损毁、灭失的风险。交割完成后双方签订《资产交割书》。 <br />
        （2）买受人在办理车辆过户时应提交车辆过户所需的材料。逾期未办理的，责任自负。车辆过户材料如下： <br />
        ①买受人为单位，需提供企业营业执照副本、组织机构代码证原件、复印件及单位公章。 <br />
        ②买受人为个人的，需提供本人身份证、户口簿原件及复印件，非常州地区的买受人还必须提供有效的常州地区居住证（注：必须上公安人口信息网，居住证登记时间不少于6个月），上海户籍的买受人还须提供能证明其拥有常州房产的不动产登记证（房产登记证）。 <br />
        ③车辆转出市外，只代办提供常州市车管所车辆档案、附加费档案，如暂缺附加费证的可以补办。转入外地登记手续均由买受人自行办理，本地档案一律不得返回。竞买人须自行了解车辆转入区域入籍手续的要求及车辆有关使用年限等规定，竞价成交的车辆一旦办理完转出手续后发生不能入籍的情况，涉及的一切责任均由买受人承担。 <br />
        （3）买受人办理车辆过户手续，应支付下述款项： <br />
        ①车辆交易费及税金（具体以二手车交易市场办理为准）。 <br />
        车辆交易费（具体以二手车交易市场办理为准）。（如委托方承担税金） <br />
        ②按国家有关规定应支付的车辆相关过户费用，包括牌照号费、评估手续费、市场服务费、刮号费、脱牌费等。 <br />
        ③支付车辆的市内过户服务费200元/辆或转籍服务费300元/辆。 <br />
        ④车辆的保险从单位过户到个人可能需补交的差额费用（车辆保险过户手续由买受人自行办理）。 <br />
        （4）车辆过户时，原车牌号码一律收回，不随车转让。 <br />
        （5）如车辆已脱年审，买受人须自行承担补年审费用及罚款。 <br />
        （6）如车辆车身有相关执法部门专用字样，买受人须在过户前现场自行清除并承担相关改色费用。 <br />
        （7）办理好车辆过户手续并取得相关证件后，如车辆有随车交强险，则由买受人自行办理保险过户手续（从单位过户至个人可能需补交相关差额费用）；如车辆的交强险已脱保，买受人须在过户前自行购买。 <br />
        （8）办理好车辆过户手续并取得相关证件后，在指定办证中介机构通知的时间和地点，买受人自行提取车辆，买受人逾期提车的，应当按停车场规定承担停车费。买受人取得证件后的各项税费（包括但不限于保险费、车船税等）由买受人承担。提取成交车辆后所发生的一切风险和责任均由买受人承担。 <br />
        （9）部分车辆使用年限久远，买受人过户申领环保标志时，应按环保局相关规定办理。 <br />
        （10）如有部分车辆缺失证件和材料，必须按有关规定补办，费用由买受人自行承担，由此影响车辆变更进程，买受人取得新的车辆证件、提取车辆时间将会延期，敬请买受人谅解。 <br />
        （11）鉴于车辆转让的特殊性，竞价成交的车辆如遇特殊情况（包括但不限于车辆过户等政策变更、黄标车辆，已披露的除外），致使车辆无法办理过户手续，买受人有权要求退还车辆成交款及服务费，但不得要求委托人和产交所承担责任。 <br />
        <strong>3.</strong><strong>争议处理:</strong><img border="0" width="561" height="229" src="" /></p></td>
    </tr>
  </table>
</div>
<br />
<div align="center" style="clear:both;margin:0px auto;">
<table border="1" cellspacing="0" cellpadding="0" align="left"  width="890" style="" class="base-sw">
  <tr>
    <td width="101" class="shheh"><p><strong>竞买记录</strong><strong> </strong></p></td>
    <td width="605"><p>&nbsp;</p></td>
  </tr>
</table>
</div>
<br /><br />
<div align="center" style="clear:both">
  <table border="1" cellspacing="0" cellpadding="0"  width="890" style="" class="base-sw">
    <tr>
      <td width="101" class="shheh"><p align="center"><strong>成交公告 </strong></p></td>
      <td width="605"><p><strong><img border="0" width="466" height="294" src="" /></strong><strong> </strong></p></td>
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
                                <a href="/Line/Detail/LineId/6731.html" title="">
                                    <img src="<%=basePath%>html/img2/pic-fang.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[常州市]</span>虹景金桂园21幢甲单元602室竞价公告</dt>
                                        <dd>
                                            <span>挂牌价：<span  class="fcdd3">9799元</span></span>
                                        </dd>
                                    </dl>
                                </a>
                            </li>
                            <li>
                                <a href="/Line/Detail/LineId/6731.html" title="">
                                    <img src="<%=basePath%>html/img2/pic-fang.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[常州市]</span>虹景金桂园21幢甲单元602室竞价公告</dt>
                                        <dd>
                                            <span>挂牌价：<span  class="fcdd3">9799元</span></span>
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
	                                    <img src="<%=basePath %>upload/ehelp/${ehelp.pic}" width="100%" title="">
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
<!--    <script src="<%=basePath%>html/js/jquery-1.7.2.min.js"></script> -->
   <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
    <script src="<%=basePath%>html/js/iconfont.js"></script>
    <script src="<%=basePath%>html/js/focus.js"></script>
   <script src="<%=basePath%>html/js/main.js"></script>
   <script src="<%=basePath%>html/js/glivia.js"></script>
   <script src="<%=basePath%>html/js/detail.js"></script>
   <script src="<%=basePath%>html/js/jquery.imagezoom.min.js"></script>
<script>
	$(document).ready(function(){
		
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
	
	//图片轮播 JS
	$(".jqzoom").imagezoom();
	$("#thumblist li a").click(function(){
	        $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
	        $(".jqzoom").attr('src',$(this).find("img").attr("mid"));
	        $(".jqzoom").attr('rel',$(this).find("img").attr("big"));
	    });
    
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
//         document.write(year+"年还剩"+newDay+"天"+newHour+"时"+newMinute+"分"+newSecond+"秒");
    }
	<c:if test="${info.status_name == '报名中' or info.status_name == '竞价中'}">
    	setInterval(countdown,1000);
    </c:if>
    <c:if test="${info.status_name != '报名中' and info.status_name != '竞价中'}">
    	$("#countdown").html("${info.status_name}");
	</c:if>
    //百度地图显示
    function initialize() {  
  	  var mp = new BMap.Map('map');  
  	  mp.centerAndZoom(new BMap.Point(119.990808,31.814817), 18);  
  	}  
    initialize();
    //批量挂牌项目直接显示竞价详情
    var ispllr = "${info.ispllr}";
    var infoid = "${info.infoid }";
    if(ispllr != '1'){
    	$("#jmjlpage").attr("src","jl_jmjl?infoid="+infoid);
    	$("#jmjl").show();
    }
    //竞价详情
    function jmjl(infoid,projectGuid){
    	$("#jmjlpage").attr("src","jl_jmjl?infoid="+infoid+"&projectGuid="+projectGuid);
    	$("#jygg_news_detail_table").hide();
    	$("#jmjl").show();
    }
    //从竞价详情页返回标的列表页
    function backobjects(){
    	$("#jygg_news_detail_table").show();
    	$("#jmjl").hide();
    }
    
    //展示中图
    function showmidpath(midpath){
    	$('#wrap').show();
    	$('#mapwrap').hide();
    	$('#videowrap').hide();
    	$(".jqzoom").attr("src",midpath);
    }
    //幻灯片默认展示的判断
    <c:if test="${mediaInfo.d3 != null }">
	    $('#wrap').show();
		$('#mapwrap').hide();
		$('#videowrap').hide();
		$('#audiowrap').hide();
    </c:if>
    <c:if test="${mediaInfo.d3 == null and mediaInfo.video_pic != null }">
	    $('#wrap').hide();
		$('#videowrap').show();
		$('#mapwrap').hide();
		$('#audiowrap').hide();
	</c:if>
	<c:if test="${mediaInfo.d3 == null and mediaInfo.video_pic == null }">
	    $('#wrap').hide();
		$('#videowrap').hide();
		$('#mapwrap').show();
		$('#audiowrap').hide();
	</c:if>
    </script>

</body>

</html>
