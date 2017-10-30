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
             <div id="img"> 
                <%-- <div class="item"><img src="${mediaInfo.d3 }" width="480" height="360" style="display: block;" rel="" /></div>
		     	<div class="item">
		     		<!--视频播放代码开始-->
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
					<!--视频播放代码结束-->
		     	</div> --%><%--
			    <div class="item"><div id="map" style="width:480px;height:360px"></div></div>
		     	--%><!-- 音频 -->
		     	<%-- <div class="item">
		     		<link href="<%=basePath%>mp3player/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" />
					<script src="<%=basePath%>mp3player/lib/jquery.min.js"></script>
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
		     	</div> --%>
		     	<div class="item"><img src="<%=basePath%>images/zzkg.png" width="480" height="360" ></div>
				<c:forEach items="${mediainfo.pics }" var="pic">
					<div class="item"><img src="http://www.e-jy.com.cn/${pic.bpath }" width="480" height="360" rel="http://www.e-jy.com.cn/${pic.bpath }" ></div>
				</c:forEach>
             </div>
              
             <div id="cbtn">
                <i class="picSildeLeft preview-control forward"></i> 
                <i class="picSildeRight preview-control backward"></i> 
                <div id="cSlideUl">
                    <ul>
                    	<%-- <!-- 优先显示360全景封面图 -->
	        			<li>
	        				<img src="<%=basePath%>${mediaInfo.d3 }">
        				</li>
        				<!-- 再显示视频封面图 -->
	        			<li id="videoli">
	        				<img src="<%=basePath%>${mediaInfo.video_pic }" ></a>
	        			</li> --%>
	        			<!-- 地图 -->
		        		<%--<li>
		       				<img src="<%=basePath%>images/map.png" >
		       			</li>
		       			--%><!-- 音频 -->
		        		<%-- <li id="audioli">
		       				<img src="<%=basePath%>images/audio.jpg" >
		       			</li> --%>
		       			<li>
		       				<img src="<%=basePath%>images/zzkg.png" >
		       			</li>
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
            
            	<a href="javascript:;" target="_blank" 	class="share-btn vr " ><i></i>360° 全景</a>
            	<%--<a class="share-btn vr" ><i></i>360° 全景</a>
            	<a class="share-btn video"><i></i>视频</a>
            	<a class="share-btn audio "><i></i>一键收听</a>
            	--%><a href="javascript:$('#videoli').click();" class="share-btn video "><i></i>视频</a>
            	
				<a href="javascript:$('#audioli').click();" class="share-btn audio "><i></i>一键收听</a>
	            
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
              <span class="label"><b>科学研究</b><i></i></span>
              <span class="label second"><b>技术服务</b><i></i></span>
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
	                    <span class="laber">拟募集金额</span><span class="money">350,000,000.00 </span> 元
	                </div>
	                <div class="list w100">
	                    <span class="laber">拟新增注册资本</span><span class="money">350,000,000.00 </span>元 
	                </div>
	              <!--  
	              <div class="list w100">
	                    <span class="laber">拟增资价格</span><span class="money">1,000.00 </span>元<span class="fc99">/股</span> 
	                </div>
	                 --> 
	                <div class="list w100">
	                    <span class="laber">保证金</span><span class="money">500,000.00 </span> 元
	                </div>
	                <div class="list w100">
	                    <span class="laber">行业</span><span class="fcdd3 f16">科学研究和技术服务</span> 
	                </div>
	                <div class="list w100">
	                    <span class="laber">所在地</span><span class="fcdd3 f16">山西省太原市</span> 
	                </div>
            </div>
            <div class="detail-bug-btn clearfix">
                <a href="javascript:void(0);" class="bond-btn fr btn-enroll">${info.status_name}</a>
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
            <li><a href="javascript:;" target="_blank"><img src="<%=basePath%>html/img2/czcq-ico-6.png" alt="山西省产权交易市场"  height="50"></a></li>
            <li><a href="javascript:;" target="_blank">山西省产权交易市场</a></li>
        </ul>
        <dl class="dispatching">
            <dt>联  系  人：</dt>
            <dd>郝女士</dd>
        </dl>
        <dl class="dispatching">
            <dt>联系电话：</dt>
            <dd>0351-7218463</dd>
        </dl>
        <dl class="dispatching">
            <dt>单位地址：</dt>
            <dd>太原市迎泽区桃园南路27号78幢楼</dd>
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
                <div class="pm-bid-flow-bz"><span>第四步</span><p>参与遴选</p></div>
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
                <li class="survey  curr" onclick="myclick(1)">项目概况</li>
                <li class="survey " onclick="myclick(1)">特别告知</li>
                <li class="survey " onclick="myclick(1)">增资方案</li>
                <li class="survey "  onclick="myclick(1)">投资条件</li>
                <li class="survey "  onclick="myclick(1)">投资指南</li>
                <li class="survey switch" onclick="myclick(2)">融资支持</li>
                <!-- <li class="survey switch" onclick="myclick(3)">成交公告</li> -->
            </ul>
            <div id="tab1_content" class="detail-tabcon clearfix" style="display: block;">
<div class="ph12">

<div   class="module-block"  id="d-bdgk">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="110" colspan="2" align="center" class="shheh" ><p align="" >项目名称 </p></td>
    <td width="158" colspan="6"><p align="left">中科潞安能源技术有限公司增资项目 </p></td>
    <td width="155" colspan="6" align="center" class="shheh" ><p align="">项目编号 </p></td>
    <td width="152" colspan="3"><p align="left">21ZZKG20170005 </p></td>
  </tr>
  <tr>
    <td width="110" colspan="2" class="shheh" ><p align="center">挂牌起始日期 </p></td>
    <td width="158" colspan="6"><p align="center">2017/7/14 </p></td>
    <td width="155" colspan="6" class="shheh" ><p align="center">挂牌截止日期 </p></td>
    <td width="152" colspan="3"><p align="center">2017/9/7 </p></td>
  </tr>
  <tr>
    <td width="110" colspan="2" class="shheh" ><p align="center">挂牌期满，如未征集到意向投资人 </p></td>
    <td width="464" colspan="15"><p align="center">延长信息发布：不变更挂牌条件，按照5个工作日为一个周期延长，直至征集到意向投资方。 </p></td>
  </tr>
  <tr>
    <td width="574" colspan="17" class="shheh" ><p align="left">一、项目概况 </p></td>
  </tr>
  <tr>
    <td width="109" rowspan="7" align="center" class="shheh" ><p align="">增资企业 <br />
      基本情况 </p></td>
    <td width="91" colspan="3" class="shheh" ><p align="left">企业名称 </p></td>
    <td width="374" colspan="13"><p align="left">中科潞安能源技术有限公司 </p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">注册地(地址)</p></td>
    <td width="374" colspan="13"><p align="left">太原市迎泽区桃园南路27号78幢楼 </p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">公司类型（经济性质） </p></td>
    <td width="92" colspan="5"><p align="left">有限责任公司 </p></td>
    <td width="87" colspan="4" class="shheh" ><p align="left">法定代表人 </p></td>
    <td width="195" colspan="4"><p align="left">孙志强 </p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">成立时间 </p></td>
    <td width="92" colspan="5"><p align="left">2015/5/13 </p></td>
    <td width="87" colspan="4" class="shheh" ><p align="left">注册资本 </p></td>
    <td width="195" colspan="4"><p align="left">5000万元人民币 </p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">统一社会信用代码 </p></td>
    <td width="374" colspan="13"><p align="left">34442566X </p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">经营范围 </p></td>
    <td width="374" colspan="13"><p align="left">开展新型能源化工技术的研究与开发；煤化工与石油炼化的技术研发；煤化工的技术推广及技术服务、咨询；催化材料的生产与销售；化工设备的生产与销售。（依法须经批准的项目，经相关部门批准后方可开展经营活动） </p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">职工人数 </p></td>
    <td width="374" colspan="13"><p align="left">12人 </p></td>
  </tr>
  <tr>
    <td width="109" rowspan="4" align="center" class="shheh" ><p align="">增资前股权 <br />
      结构 </p></td>
    <td width="91" colspan="3" class="shheh" ><p align="left">序号 </p></td>
    <td width="153" colspan="8" class="shheh" ><p align="left">前十位出资人名称 </p></td>
    <td width="221" colspan="5" class="shheh" ><p align="left">持股比例(%)</p></td>
  </tr>
  <tr>
    <td width="91" colspan="3"><p align="left">1</p></td>
    <td width="153" colspan="8"><p align="left">山西潞安矿业（集团）有限责任公司 </p></td>
    <td width="221" colspan="5"><p align="left">100</p></td>
  </tr>
  <tr>
    <td width="91" colspan="3"><p align="left">2</p></td>
    <td width="153" colspan="8"><p align="left">&nbsp;</p></td>
    <td width="221" colspan="5"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="91" colspan="3"><p align="left">3</p></td>
    <td width="153" colspan="8"><p align="left">&nbsp;</p></td>
    <td width="221" colspan="5"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="109" rowspan="14" align="center" class="shheh" ><p align="">主要 <br />
      财务 <br />
      指标 </p></td>
    <td width="465" colspan="16"><p align="left">以下数据出自审计报告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位：万元 </p></td>
  </tr>
  <tr>
    <td width="91" colspan="3"  class="shheh" ><p align="left">&nbsp;&nbsp; </p></td>
    <td width="153" colspan="8" class="shheh" ><p align="left">2015年度 </p></td>
    <td width="91" colspan="4" class="shheh" ><p align="left">2016年度 </p></td>
    <td width="131"  class="shheh" ><p align="left">年度 </p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">资产总额 </p></td>
    <td width="153" colspan="8"><p align="left">4992.08 </p></td>
    <td width="91" colspan="4"><p align="left">5083.06 </p></td>
    <td width="131"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">负债总额 </p></td>
    <td width="153" colspan="8"><p align="left">3.53 </p></td>
    <td width="91" colspan="4"><p align="left">77.71 </p></td>
    <td width="131"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">所有者权益 </p></td>
    <td width="153" colspan="8"><p align="left">4988.55 </p></td>
    <td width="91" colspan="4"><p align="left">5005.35 </p></td>
    <td width="131"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">营业收入 </p></td>
    <td width="153" colspan="8"><p align="left">0 </p></td>
    <td width="91" colspan="4"><p align="left">0 </p></td>
    <td width="131"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">利润总额 </p></td>
    <td width="153" colspan="8"><p align="left">-11.44 </p></td>
    <td width="91" colspan="4"><p align="left">18.57 </p></td>
    <td width="131"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">净利润 </p></td>
    <td width="153" colspan="8"><p align="left">-11.44 </p></td>
    <td width="91" colspan="4"><p align="left">16.79 </p></td>
    <td width="131"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="91" colspan="3" class="shheh" ><p align="left">审计机构名称 </p></td>
    <td width="153" colspan="8"><p align="left">山西国元会计师事务所 </p></td>
    <td width="91" colspan="4"><p align="left">立信会计师事务所（特殊合伙）山西分所 </p></td>
    <td width="131"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="465" colspan="16"><p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以下数据出自企业近期财务报表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位：万元 </p></td>
  </tr>
  <tr>
    <td width="116" colspan="6" class="shheh" ><p align="left">填报日期 </p></td>
    <td width="73" colspan="3" class="shheh" ><p align="left">营业收入 </p></td>
    <td width="55" colspan="2" class="shheh" ><p align="left">利润总额 </p></td>
    <td width="221" colspan="5" class="shheh" ><p align="left">净利润 </p></td>
  </tr>
  <tr>
    <td width="116" colspan="6"><p align="left">2017/6/30 </p></td>
    <td width="73" colspan="3"><p align="left">0 </p></td>
    <td width="55" colspan="2"><p align="left">-44.16    万元 </p></td>
    <td width="221" colspan="5"><p align="left">-44.16 </p></td>
  </tr>
  <tr>
    <td width="116" colspan="6" class="shheh" ><p align="left">报表类型 </p></td>
    <td width="73" colspan="3" class="shheh" ><p align="left">资产总额 </p></td>
    <td width="55" colspan="2" class="shheh" ><p align="left">负债总额 </p></td>
    <td width="221" colspan="5" class="shheh" ><p align="left">所有者权益 </p></td>
  </tr>
  <tr>
    <td width="116" colspan="6"  class="shheh" ><p align="left">月报 </p></td>
    <td width="73" colspan="3"><p align="left">4731.58 </p></td>
    <td width="55" colspan="2"><p align="left">-229.6    万元 </p></td>
    <td width="221" colspan="5"><p align="left">4961.18 </p></td>
  </tr>
  <tr>
    <td width="109" rowspan="5" align="center" class="shheh" ><p align="">评估情况 <br />
      （可选） </p>      <p align="left">&nbsp;</p></td>
    <td width="116" colspan="6" class="shheh" ><p align="left">评估机构 </p></td>
    <td width="73" colspan="3"><p align="left">中水致远资产评估有限公司 </p></td>
    <td width="55" colspan="2" class="shheh" ><p align="left">评估基准日 </p></td>
    <td width="221" colspan="5"><p align="left">2016/12/31 </p></td>
  </tr>
  <tr>
    <td width="116" colspan="6" class="shheh" ><p align="left">资产总额 </p></td>
    <td width="350" colspan="10"><p align="left">5082.37万元 </p></td>
  </tr>
  <tr>
    <td width="116" colspan="6" class="shheh" ><p align="left">负债总额 </p></td>
    <td width="350" colspan="10"><p align="left">77.71万元 </p></td>
  </tr>
  <tr>
    <td width="116" colspan="6" class="shheh" ><p align="left">净资产 </p></td>
    <td width="350" colspan="10"><p align="left">5004.66万元 </p></td>
  </tr>
  <tr>
    <td width="116" class="shheh"  colspan="6"><p align="left">每股对应估值 </p></td>
    <td width="350" colspan="10"><p align="left">元/每元注册资本 </p></td>
  </tr>
  <tr>
    <td width="109" rowspan="4" align="center"  class="shheh"><p align="">项目内容 </p></td>
    <td width="116" class="shheh"  colspan="6"><p align="left">拟募集资金总额 </p></td>
    <td width="208" class="shheh"  colspan="8"><p align="left">拟募集资金 <br />
      对应持股比例 </p></td>
    <td width="141" colspan="2"><p align="left">87.5% </p></td>
  </tr>
  <tr>
    <td width="116" class="shheh"  colspan="6"><p align="left">拟新增注册资本 </p></td>
    <td width="208" class="shheh"  colspan="8"><p align="left">增资认购底价 </p></td>
    <td width="141" colspan="2"><p align="left">35000万元 </p></td>
  </tr>
  <tr>
    <td width="116"  class="shheh" colspan="6"><p align="left">募集资金用途 </p></td>
    <td width="350" colspan="10"><p align="left">募集资金主要用于增资企业的技术研发及科技成果转化。 </p></td>
  </tr>
  <tr>
    <td width="116" class="shheh"  colspan="6"><p align="left">增资后企业 <br />
      股权结构 </p></td>
    <td width="350" colspan="10"><p align="left">增资企业原股东山西潞安矿业（集团）有限责任公司参与本次增资， <br />
      增资完成后，原股东持股比例不低于60%；新增股东持股比例不高于40%。 <br />
      具体各方股权比例按经备案的增资企业净资产评估值和各方出资额度确定。 </p></td>
  </tr>
  <tr>
    <td width="109"  class="shheh" rowspan="4"><p align="left">增资行为决策及批准情况 </p></td>
    <td width="116" class="shheh"  colspan="6"><p align="left">内部决策 </p></td>
    <td width="350" class=""  colspan="10"><p align="left">董事会决议 </p></td>
  </tr>
  <tr>
    <td width="116" class="shheh"  colspan="6"><p align="left">国资监管机构 </p></td>
    <td width="350" colspan="10"><p align="left">省（直辖市、自治区)级国资委监管 </p></td>
  </tr>
  <tr>
    <td width="116"  class="shheh" colspan="6"><p align="left">所属集团或主管部门 </p></td>
    <td width="350" colspan="10"><p align="left">山西潞安矿业（集团）有限责任公司 </p></td>
  </tr>
  <tr>
    <td width="116" class="shheh"  colspan="6"><p align="left">批准单位名称及文件名称（含文号） </p></td>
    <td width="350" colspan="10"><p align="left">山西潞安矿业（集团）有限责任公司 <br />
      潞安集团公司董事会决议 </p></td>
  </tr>
      </table>
  </div>
  <br />
<div   class="module-block"  id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="574" colspan="17" class="shheh" ><p align="left">二、特别告知 </p></td>
  </tr>
  <tr>
    <td width="109" rowspan="6" align="center" class="shheh" ><p align="">重 <br />
      要 <br />
      信 <br />
      息 <br />
      披 <br />
      露 </p></td>
    <td width="220" colspan="10" class="shheh" ><p align="left">对增资有重大影响的<br />
      相关信息 </p></td>
    <td width="245" colspan="6"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="220" colspan="10"  class="shheh" ><p align="left">审计报告和评估报告中的保留意见、重要揭示、特别事项说明中涉及转让产权的提示提醒等内容 </p></td>
    <td width="245" colspan="6"><p align="left">1、增资企业原股东山西潞安矿业（集团）有限责任公司参与本次增资， <br />
      增资完成后，原股东持股比例不低于60%；新增股东持股比例不高于40%。 <br />
      具体各方股权比例按经备案的增资企业净资产评估值和各方出资额度确定。 <br />
      2、本项目接受货币资金或无形资产出资，无形资产仅限于煤炭清洁利用领域的专有技术、专利技术等，不接受实物资产出资。 </p></td>
  </tr>
  <tr>
    <td width="220" colspan="10" class="shheh" ><p align="left">重大债权债务事项或会计报表附注中重大或有事项 </p></td>
    <td width="245" colspan="6"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="220" colspan="10" class="shheh" ><p align="left">原股东是否参与增资 </p></td>
    <td width="245" colspan="6"><p align="left">是 </p></td>
  </tr>
  <tr>
    <td width="220" colspan="10" class="shheh" ><p align="left">职工是否参与增资 </p></td>
    <td width="245" colspan="6"><p align="left">否 </p></td>
  </tr>
  <tr>
    <td width="220" colspan="10" class="shheh" ><p align="left">其他需披露事项 </p></td>
    <td width="245" colspan="6"><p align="left">&nbsp;</p></td>
  </tr>
          </table>
  </div>
  <br />
<div   class="module-block"   id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="574" colspan="17" class="shheh" ><p align="left" >三、增资方案 </p></td>
  </tr>
  <tr>
    <td width="214" colspan="6" align="center" class="shheh" ><p align="">遴选择优方式 </p></td>
    <td width="360" colspan="11"><p align="left">综合评议 </p></td>
  </tr>
  <tr>
    <td width="214" colspan="6" align="center" class="shheh" ><p align="">遴选择优内容 </p></td>
    <td width="360" colspan="11"><p align="left"><strong>综合评议评分要点：</strong></p>
      <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td width="84" class="shheh" >
            <strong>序号</strong></td>
          <td width="138" class="shheh" ><p align="center"><strong>评分指标</strong></p></td>
          <td width="108" class="shheh" ><p align="center"><strong>分值</strong></p></td>
        </tr>
        <tr>
          <td width="84"><p align="center"><strong>(</strong><strong>一)</strong></p></td>
          <td width="138"><p align="center"><strong>综合实力</strong></p></td>
          <td width="108"><p align="center">20分 </p></td>
        </tr>
        <tr>
          <td width="84"><p align="center"><strong>(</strong><strong>二)</strong></p></td>
          <td width="138"><p align="center"><strong>技术实力</strong></p></td>
          <td width="108"><p align="center">50分 </p></td>
        </tr>
        <tr>
          <td width="84"><p align="center"><strong>(</strong><strong>三)</strong></p></td>
          <td width="138"><p align="center"><strong>增资报价</strong></p></td>
          <td width="108"><p align="center">30分 </p></td>
        </tr>
        <tr>
          <td width="84"><p align="center"><strong>合计</strong></p></td>
          <td width="138"><p align="center"><strong>　</strong></p></td>
          <td width="108"><p align="center">100分 </p></td>
        </tr>
      </table>
      <a name="_GoBack" id="_GoBack"></a></td>
  </tr>
  <tr>
    <td width="214" colspan="6" class="shheh" ><p align="left">增资达成或终结的条件 </p></td>
    <td width="360" colspan="11" class="shheh" ><p align="left">增资达成条件： <br />
      本次增资征集到符合投资方资格、接受增资条件，并与增资企业就《增资协议》达成一致的投资方 </p></td>
  </tr>
        </table>
  </div>
  <br />
<div   class="module-block"   id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="574" colspan="17" class="shheh" ><p align="left">四、投资条件 </p></td>
  </tr>
  <tr>
    <td width="109"  class="shheh" ><p align="left" class="shheh" >投资人资格条件 </p></td>
    <td width="465" colspan="16"><p><strong>本次增资拟引入一家投资方，投资方资格条件如下：</strong> <br />
      1、意向投资方须为依法设立并有效存续的境内法人组织、自然人； <br />
      2、意向投资方须具有煤炭清洁利用领域的技术研发和科技成果转化优势； <br />
      3、意向受让方须具备良好的商业信誉、无欺诈和不良经营记录； <br />
      4、意向投资方须一次性缴足增资价款； <br />
      5、本项目接受货币资金或无形资产出资，无形资产仅限于煤炭清洁利用领域的专有技术、专利技术等，不接受实物资产出资。无形资产出资的，应提供相关证明及依法评估作价依据； <br />
      6、本项目接受联合体投资，以联合体参与投资的，联合体中至少有一家意向投资方应符合投资方资格条件的要求。 <br />
      7、意向投资方应符合国家相关法律法规规定的其他条件。 </p></td>
  </tr>
  <tr>
    <td width="109" align="center" class="shheh" ><p align="">增资条件 </p></td>
    <td width="465" colspan="16"><p align="left">1、本项目挂牌公告有效期即为尽职调查期，意向投资方可向原股东及增资企业了解本次交易的相关情况，增资企业对意向投资方实施的尽职调查给予必要的配合与支持，并签署《保密协议书》；增资企业可对意向投资方进行尽职调查，并在此基础上做出是否确定意向投资人资格的决定，意向投资人对此应当予以配合。 <br />
      2、本项目挂牌公告有效期满，如只征集到一个符合条件并通过资格审查的意向投资方时，由山西省产权交易市场组织增资企业与最终投资方不低于挂牌价格直接签约；如征集到两个及以上符合条件并通过资格审查的意向投资方时，山西省产权交易市场协助增资企业通过综合评议方式遴选投资方。 <br />
      3、意向投资方应在被确定为最终投资方之日起5个工作日内与增资企业及其原股东签订《增资协议》。 <br />
      4、本次增资完成后，增资企业继续聘用原有职工，职工的薪酬福利不低于现有水平，正常离退休人员待遇按照原有劳动合同执行。 <br />
      5、投资方承诺认可经审计、评估的公司债权债务以及增资款项全部交足之日前的债权债务，增资完成后，上述债权债务由股东变更后的公司全部承继。 <br />
      6、本次增资过程中涉及的交易服务费及权证变更过程中所涉及的相关税费由增资企业和投资方各自承担。 <br />
      7、增资企业自评估基准日至完成工商变更登记期间所发生的盈余或亏损，由新、老股东按照增资后持股比例共同享有或承担，不影响本次的增资价格和持股比例。 <br />
      8、自完成工商变更登记之日起，投资方即成为增资企业的新股东，并按其实缴出资依照法律和增资企业章程的规定享有股东权利并承担股东义务。 <br />
      9、本项目接受货币资金或无形资产出资，无形资产仅限于煤炭清洁利用领域的专有技术、专利技术等，不接受实物资产出资。 <br />
      10、本项目接受联合体投资。增资后，股东人数不得超过《公司法》对有限责任公司股东人数的相关规定。 </p></td>
  </tr>
  <tr>
    <td width="109" class="shheh" ><p align="center">标的交付 </p></td>
    <td width="465" colspan="16"><p align="left">（1）买受人应于合同约定的时间内，提交所需资料与委托人共同办理注册登记手续，向代理机构提交资料如下：自然人身份证签字复印件；加盖公章的法人或其他组织营业执照等身份证明复印件；委托方要求的其他材料。 <br />
      （2）（可选）若在本次转让成交后6个月内，如双方未能完成相关注册登记手续的，视为无法交付，有双方协商解决，解决不成的，任何乙方有权向增资公司所在地人民法院提起诉讼，代理机构根据双方协议或法院裁判文书退还已支付的成交款（不计息），但代理机构服务费不予退还。 </p></td>
  </tr>
   </table>
  </div>
  <br />
<div   class="module-block"   id="d-tzzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="574" class="shheh"  colspan="17"><p align="left">五、投资指南 </p></td>
  </tr>
  <tr>
    <td width="109" rowspan="7" align="center" class="shheh"  >投资指南 </td>
    <td width="102" class="shheh"  colspan="4"><p align="center">操作规则（+） </p></td>
    <td width="363" colspan="12"><p align="left">意向投资人在报名前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn/index">www.e-jy.com.cn</a>）的<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6&amp;categoryNum=027001">《e交易平台竞价交易规则》</a>、<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=ef7859f2-f1ae-4b0b-b002-eb62a59f8818&amp;categoryNum=034001">《e交易平台产权交易操作指南》</a>等要求，了解标的情况、资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 <br />
      以下由交易机构自行填制。 <br />
      （此处为固定版本） </p></td>
  </tr>
  <tr>
    <td width="102" colspan="4" class="shheh" ><p align="center">现场尽调（+） </p></td>
    <td width="363" colspan="12"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="39" colspan="2"  class="shheh" rowspan="3"><p align="center">意向投资报名 </p></td>
    <td width="63" colspan="2" class="shheh" ><p align="center">报名时间 </p></td>
    <td width="363" colspan="12"><p align="left"><u>2017</u>年<u>7</u>月<u>14</u>日至<u>2017</u>年<u>9</u>月<u>7</u>日<u>23</u>时 </p></td>
  </tr>
  <tr>
    <td width="63" colspan="2" class="shheh" ><p align="center">报名手续 </p></td>
    <td width="363" colspan="12"><p align="left">请意向投资方在增资公告有效期内的工作时间向山西省产权交易市场提交书面申请材料办理报名登记手续（报名时请携带相关证件的原件、复印件，法人报名请携带单位公章），通过资格确认的意向投资方在收到山西省产权交易市场书面通知之日起5个工作日内交纳履约保证金（以汇入指定账户的到账时间为准）。 <br />
      报名地址：①山西省太原市小店区平阳路101号国瑞大厦二层 <br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;②太原市坞城南路山西省公共资源交易中心B座2层47号窗口&nbsp; <br />
      联系人：庞先生 &nbsp;&nbsp;&nbsp;王女士 <br />
      咨询电话：0351-7218394 &nbsp;0351-7731738&nbsp;<u> </u></p></td>
  </tr>
  <tr>
    <td width="63" colspan="2" class="shheh" ><p align="center">保证金及处置方式 </p></td>
    <td width="363" colspan="12"><p align="left">1、项目成交后，最终投资方的保证金扣除其应交纳的交易服务费后，剩余部分无息原途径返还；<br />
      2、无上述&ldquo;保证内容&rdquo;中任何情形的其他意向投资方，山西省产权交易市场在投资方遴选活动结束之日起3个工作日内全额无息原途径返还保证金；<br />
      3、因增资企业原因，在投资方遴选活动前撤回标的，山西省产权交易市场在增资企业撤回标的之日起3个工作日内为各意向投资方全额无息原途径返还保证金。 </p></td>
  </tr>
  <tr>
    <td width="102" colspan="4" class="shheh" ><p align="center">服务费（+） </p></td>
    <td width="363" colspan="12"><p align="left">竞价成交后，买受人向产交所支付的服务费，代理机构开具服务费发票，不开具其他任何票据。 </p></td>
  </tr>
  <tr>
    <td width="102" colspan="4" class="shheh" ><p align="center">免责条款 </p></td>
    <td width="363" colspan="12"><p align="left">&nbsp;</p></td>
  </tr>
</table>
</div>
</div>
             </div>
             <div class="detail-tabcon module-block" id="tab2_content" style="display:none;">
				暂无
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
                                <a href="infodetail?infoid=19bebb63-b357-47d7-ae59-7462c3c64c6b&categoryNum=&pageName=gq1" title="">
                                    <img src="images/linshi/gq-pic-1.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[乌兰察布市]</span>包钢（乌兰察布市）普华实业有限公司24.5%股权交易公告</dt>
                                        <dd>
                                            <span>转让底价：<span  class="fcdd3">14,700,000元</span></span>
                                        </dd>
                                    </dl>
                                </a>
                            </li>
                            <li>
                                <a href="infodetail?infoid=88475f0a-dba2-442f-8c87-3a71982c1846&categoryNum=001001012&pageName=zzkg1" title="">
                                    <img src="images/linshi/zzkg-pic-1.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[益阳市]</span>湖南银城基础建设置业有限公司增资项目交易公告（国资监测编号G62017HN1000003）</dt>
                                        <dd>
                                            <span>转让底价：<span  class="fcdd3">73,434,300.00元</span></span>
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
    //幻灯片默认展示的判断
    <c:if test="${mediaInfo.d3 != null }">
	    $('#wrap').show();
		$('#mapwrap').hide();
		$('#videowrap').hide();
		$('#audiowrap').hide();
    </c:if>
    <c:if test="${mediaInfo.d3 == null and mediaInfo.video_pic == null }">
	    $('#wrap').hide();
		$('#videowrap').show();
		$('#mapwrap').hide();
		$('#audiowrap').hide();
	</c:if>
	<c:if test="${mediaInfo.d3 == null and mediaInfo.video_pic != null }">
	    $('#wrap').hide();
		$('#videowrap').hide();
		$('#mapwrap').show();
		$('#audiowrap').hide();
	</c:if>
    </script>

</body>

</html>
