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
			 		so.addVariable("CuPlayerFile","<%=basePath%>${mediaInfo.vide}"); //视频文件地址
			 		so.addVariable("CuPlayerImage","<%=basePath%>${mediaInfo.video_pic}");//视频略缩图
					so.addVariable("CuPlayerFile","<%=basePath%>cuplayer/1.mp4"); //视频文件地址
					so.addVariable("CuPlayerImage","<%=basePath%>cuplayer/1.jpg");//视频略缩图
					so.addVariable("CuPlayerWidth","480"); //视频宽度
					so.addVariable("CuPlayerHeight","360"); //视频高度
					so.addVariable("CuPlayerAutoPlay","no"); //是否自动播放
					so.write("CuPlayer");
					</script>
					<!--视频播放代码结束-->
		     	</div> --%>
		     	<c:forEach items="${mediainfo.pics }" var="pic">
					<div class="item"><img src="http://www.e-jy.com.cn/${pic.bpath }" width="480" height="360" rel="http://www.e-jy.com.cn/${pic.bpath }" ></div>
				</c:forEach>
			    <div class="item"><div id="map" style="width:480px;height:360px"></div></div>
		     	<%-- <!-- 音频 -->
		     	<div class="item">
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
				
             </div>
              
             <div id="cbtn">
                <i class="picSildeLeft preview-control forward"></i> 
                <i class="picSildeRight preview-control backward"></i> 
                <div id="cSlideUl">
                    <ul>
                    	<!-- 优先显示360全景封面图 -->
	        			<%-- <li>
	        				<img src="<%=basePath%>${mediaInfo.d3 }">
        				</li>
        				<!-- 再显示视频封面图 -->
	        			<li id="videoli">
	        				<img src="<%=basePath%>${mediaInfo.video_pic }" ></a>
	        			</li>
	        			<!-- 地图 --> --%>
	        			<c:forEach items="${mediainfo.pics }" var="pic" varStatus="stat">
		        			<li>
			                    <img src="http://www.e-jy.com.cn/${pic.path }" ></a>
			                </li>
		        		</c:forEach>
		        		<li>
		       				<img src="<%=basePath%>images/map.png" >
		       			</li>
		       			<%-- <!-- 音频 -->
		        		<li id="audioli">
		       				<img src="<%=basePath%>images/audio.jpg" >
		       			</li> --%>
			           
                    </ul>
                </div>
             </div>         
        </div>
    </div><!--end滚动看图-->

<div class="clear"></div>
            
            <div class="preview-share">
            
            	<a href="javascript:;" target="_blank" 	class="share-btn vr" ><i></i>360° 全景</a>
            	<%--<a class="share-btn vr" ><i></i>360° 全景</a>
            	<a class="share-btn video"><i></i>视频</a>
            	<a class="share-btn audio "><i></i>一键收听</a>
            	--%><a href="javascript:$('#videoli').click();" class="share-btn video"><i></i>视频</a>
            	
				<a href="javascript:$('#audioli').click();" class="share-btn audio"><i></i>一键收听</a>
	            
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
              <span class="label"><b>交通便利</b><i></i></span>
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
	                    <span class="laber">转让底价</span><span class="money">103,740.00 </span> 
	                </div>
	                <div class="list ">
	                    <span class="laber">保证金 </span><span class="money">50,000.00 </span> 
	                </div>
	                <div class="list ">
	                    <span class="laber">单价</span><span class="money">6067</span>  元<span class="fc99">/亩</span>
	                </div>
	                <div class="list ">
	                    <span class="laber">租期</span><span class="money">88</span>个月
	                </div>
	                <div class="list ">
	                    <span class="laber">支付方式</span><span class="fcdd3 f16">一次性付清</span> 
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
            <li><a href="javascript:;" target="_blank"><img src="<%=basePath%>html/img2/czcq-ico-3.png" alt="常州产权交易所"  height="50"></a></li>
            <li><a href="javascript:;" target="_blank">安徽长江产权交易所</a></li>
        </ul>
        <dl class="dispatching">
            <dt>联  系  人：</dt>
            <dd>张经理 </dd>
        </dl>
        <dl class="dispatching">
            <dt>联系电话：</dt>
            <dd>0553-3117525 </dd>
        </dl>
        <dl class="dispatching">
            <dt>单位地址：</dt>
            <dd>安徽省芜湖市渡春路1号（芜湖市人大原办公楼）</dd>
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
                <li class="survey switch" onclick="myclick(3)">竞买记录</li><!-- 
                <li class="survey switch" onclick="myclick(4)">成交公告</li> -->
            </ul>
            <div id="tab1_content" class="detail-tabcon clearfix" style="display: block;">
<div class="ph12">
<div   class="module-block"  id="d-bdgk">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="98" class="shheh" ><p align="center">项目名称 </p></td>
    <td colspan="3"><p align="left">无为县鹤毛镇洪家玥17.1亩集体土地承包经营权 </p></td>
    <td class="shheh"  colspan="2"><p align="center">项目编号 </p></td>
    <td width="298"><p align="left">22TD20170008 </p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="center">挂牌起始日期 </p></td>
    <td colspan="3"><p align="left">2017/6/29 </p></td>
    <td class="shheh"  colspan="2"><p align="center">挂牌截止日期 </p></td>
    <td width="298"><p align="left">2017/07/26</p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="center">挂牌期满，如未征集到意向受让方 </p></td>
    <td colspan="6"><p align="left"><strong>按照</strong><strong>5</strong><strong>个工作日为一个周期延长，其他挂牌条件不变，直至征集到意向竞租方数量不少于</strong><strong>1</strong><strong>个且至该延长周期结束时，本项目挂牌公告期结束（如出租方或相关管理部门在公告延长期间提出终止，则本项目挂牌公告期结束）。</strong></p></td>
  </tr>
  <tr>
    <td  colspan="2" rowspan="8" align="center" class="shheh"><p align="" id="d-bdgk">标的概况 </p></td>
    <td class="shheh"  colspan="2"><p align="left">标的基本情况 </p></td>
    <td colspan="3"><p align="left">无为县鹤毛镇洪家玥17.1亩集体土地位于无为县鹤毛镇洪家玥内，东至安徽兴科门窗有限公司，西至鹤毛社区邢墩组耕地，南至鹤毛社区邢墩组水沟，北至鹤毛社区邢墩组水沟<strong>。</strong></p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="left">转让底价 </p></td>
    <td colspan="3"><p align="left">人民币103,740.00元 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="left">资产评估情况 </p></td>
    <td colspan="3"><p align="left">无为县鹤毛镇人民政府根据市场行情、周边情况及土地状况等，确定无为县鹤毛镇洪家玥17.1亩土地承包经营权自2017年9月1日至2024年12月31日的租金基准价为：人民币103,740.00元。 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="left">决策及批准情况 </p></td>
    <td colspan="3"><p align="left">（一）2017年3月8日，无为县鹤毛镇人民政府向无为县人民政府提交了《关于要求将镇集体土地承包经营权进行出租的请示》。 <br />
      （二）2017年3月9日，无为县人民政府办公室抄告单（抄告单[2017]622号），同意无为县鹤毛镇洪家玥17.1亩集体土地承包经营权对外出租。 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="left">土地承包经营权出租期限 </p></td>
    <td colspan="3"><p align="left">（自2017年9月1日至2024年12月31日）。 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="left">其他 </p></td>
    <td colspan="3"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td  class="shheh" colspan="2"><p align="left">委托方名称 </p></td>
    <td colspan="3"><p align="left">无为县鹤毛镇人民政府 </p></td>
  </tr>
  <tr>
    <td  class="shheh" colspan="2"><p align="left">委托方承诺 </p></td>
    <td colspan="3"><p>本出租方（无为县鹤毛镇人民政府）现委托安徽长江农林产权交易所有限公司（以下简称&ldquo;安徽长江农林产权交易所&rdquo;）公开挂牌出租无为县鹤毛镇洪家玥17.1亩集体土地承包经营权，按本公告内容由安徽长江农林产权交易所在其网站及相关媒体上公开发布产权出租信息并由安徽长江农林产权交易所组织实施交易活动。 <br />
      本出租方依照公开、公平、公正、诚信的原则作如下承诺： <br />
      <strong>1</strong><strong>、本次产权出租是我方真实意愿表示，出租的产权权属清晰，我方对该产权拥有合法的处置权且实施不存在限制条件。</strong> <br />
      <strong>2</strong><strong>、我方出租产权的相关行为已履行了相应程序，经过有效的内部决策，并获得相应批准。</strong> <br />
      <strong>3</strong><strong>、我方所提交的《无为县鹤毛镇洪家玥17.1亩集体土地承包经营权挂牌交易公告》及附件材料内容真实、完整、合法、有效，不存在虚假记载、误导性陈述或重大遗漏，并对其承担相关的经济和法律责任。</strong> <br />
      <strong>4</strong><strong>、我方在出租过程中，遵守法律法规规定和安徽长江农林产权交易所的相关规则，按照有关要求履行我方义务。</strong> <br />
      <strong>5</strong><strong>、我方保证遵守以上承诺，如我方违反上述承诺或有违规违约行为，给安徽长江农林产权交易所、意向竞租方等交易相关方造成损失的，我方愿意承担法律责任及经济赔偿责任，以本项目设定的交易保证金同等金额承担赔偿责任，保证金金额不足以弥补上述损失的，利益受损方可以向我方进行追偿。</strong></p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td  colspan="2" align="center" class="shheh"><p align="">特别告知 </p></td>
    <td colspan="5"><p align="left">无为县鹤毛镇鹤毛社区集体经济组织成员享有优先权，如行使优先权，应取得无为县鹤毛镇鹤毛社区出具的证明后，并按照本公告的要求到安徽长江农林产权交易所有限公司或无为分公司办理报名手续，应参与竞价活动，在竞价过程中，与其他意向竞租方报同等价格条件时享有优先权，否则视同放弃行使优先权。 </p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"   id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td  colspan="2" rowspan="4" align="center" class="shheh"><p align=""  >交易条件 </p></td>
    <td width="98"  class="shheh" ><p align="left">交易价款 </p></td>
    <td colspan="4"><p align="left">付款方式：一次性付清 <br />
      付款期限：自《土地承包经营权租赁合同》生效之日起5个工作日内 </p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="left">受让资格条件 </p></td>
    <td colspan="4"><p align="left">意向竞租方应为中国大陆境内依法设立并有效存续的单位或具有完全民事行为能力的中国公民 </p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="left">其他交易条件 </p></td>
    <td colspan="4"><p>（1）意向竞租方承诺：已对标的的情况和现状进行了详细了解和调研，对出租标的现状完全知悉且无异议，对其存在的投资风险已做了充分预判，投资风险自行承担，与出租方、安徽长江农林产权交易所无关。 <br />
      （2）意向竞租方承诺：承租方凭安徽长江农林产权交易所出具的《产权交易凭证》，在3个工作日内按照出租标的移交日现状与出租方办理出租标的移交，自办理完毕出租标的移交手续之日起，出租标的一切安全、风险、责任等均由承租方自行负责，与出租方无关。 <br />
      （3）意向竞租方承诺：如出租标的实际土地面积与本公告公示面积存在差异时，不调整成交价款。 <br />
      （4）意向竞租方承诺：在租赁期限内，不得以任何形式对外转让、抵押、转租土地承包经营权。 <br />
      （5）意向竞租方承诺：在租赁期限内，承租方必须遵守国家法律、法规和政策，守法经营，依法纳税，应根据有关法律、法规规定自行办理相关手续。 <br />
      （6）意向竞租方承诺：在租赁期限内，承租方不得改变土地租赁用途，不得利用土地进行违法活动及非法使用出租标的；若从事开发经营项目，需经出租方批准同意后方可实施，否则将承担违约责任。 <br />
      （7）意向竞租方承诺：在租赁期限内，自觉接受有关部门或出租方安全生产、社会治安等方面的监督和检查；因安全事故、社会治安、自然灾害等原因产生的一切经济、法律责任由承租方自行承担，与出租方无关。 <br />
      （8）意向竞租方承诺：在租赁期限内，因承租方原因违反有关法律、法规规定被处罚的，应自觉缴纳相应的罚款，违法违约行为给第三人造成损失的，由承租方自行承担相应民事责任。 <br />
      （9）意向竞租方承诺：在租赁期限内，土地周边如有污染问题或其它矛盾纠纷而影响生产经营的，由出租方协助承租方调解处理，产生的相关费用由承租方承担；承租方通过司法途径解决的，与出租方无关。 <br />
      （10）意向竞租方承诺：在租赁期限内，因镇或县规划建设，或因行政区划调整，需要中途终止合同的，承租方无条件服从终止合同。终止时，租赁期限有剩余的，按租金价款总额以月（不足一个月的不计）为单位折租费，退还承租方，对地上附属农作物的补偿（如有），届时按国家相关政策规定执行。 <br />
      （11）意向竞租方承诺：在出租过程中如产生相关税费，则根据相关法律、法规规定由双方各自承担。 <br />
      （12）意向竞租方承诺：合同期满或提前终止时，承租方在10个工作日内负责清理地上附作物（包括地上未成熟的附着农作物、未收获的农作物、农作物秸秆），将土地进行平整并恢复原状。对在承租期间的建设等投入不要求补偿。承租方逾期交回的，以日租金的双倍标准按实际逾期天数计算并支付占用使用费。 <br />
      （13）意向竞租方承诺：对出租方拟定的《土地承包经营权租赁合同》（样本）内容无异议并遵照执行。 </p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="left">标的交割 </p></td>
    <td colspan="4"><p align="left">&nbsp;</p></td>
  </tr>
      </table>
  </div>
  <br />
<div   class="module-block"  id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td  colspan="2" rowspan="7" align="center" class="shheh"><p align="" >交易指南 </p></td>
    <td width="98" class="shheh" ><p align="left">竞价规则 </p></td>
    <td colspan="4"><p align="left">竞买方在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn/index">www.e-jy.com.cn</a>）的<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6&amp;categoryNum=027001">《e交易平台竞价交易规则》</a>、<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=ef7859f2-f1ae-4b0b-b002-eb62a59f8818&amp;categoryNum=034001">《e交易平台产权交易操作指南》</a>等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 <br />
      以下由交易机构自行填制。 <br />
      （此处为固定版本） </p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="left">现场踏勘 </p></td>
    <td colspan="4"><p align="left">1.时间: <br />
      2.地点:</p></td>
  </tr>
  <tr>
    <td width="98" class="shheh"  rowspan="2"><p align="left">竞买报名 </p></td>
    <td class="shheh"  colspan="2"><p align="left">报名时间<u> </u></p></td>
    <td colspan="2"><p align="left">自2017年7月12日至2017年7月26日。（每工作日8：00至11:30,14:00至16:30） </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="left">报名手续 </p></td>
    <td colspan="2"><p><strong>报名地点：</strong> <br />
      安徽长江农林产权交易所有限公司或安徽长江农林产权交易所有限公司无为分公司。 <br />
      <strong>报名时应提交的主要资料：</strong><strong> </strong><br />
      每套报名资料费人民币200元，不论成交与否，资料费概不退还；购买资料时，意向竞租方应向安徽长江农林产权交易所有限公司提供相关报名资料。 </p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="left">&nbsp;</p></td>
    <td class="shheh"  colspan="2"><p align="left">保证金及处置方式 </p></td>
    <td colspan="2"><p align="left">1、交易保证金金额：人民币5万元。 <br />
      2、交易保证金交纳时间：报名截止时间前，（如挂牌公告期延长，按延长公告期作相应顺延）意向竞租方将交易保证金全额支付到安徽长江农林产权交易所指定账户(以实际到达指定账户时间为准)，否则视同意向竞租方自动放弃对标的的竞租。 <br />
      3、交易保证金处理： <br />
      （1）意向竞租方在交纳保证金后，如非出租方或安徽长江农林产权交易所的原因，出现以下任何一种情况时，安徽长江农林产权交易所有权扣除意向竞租方交纳的交易保证金，作为支付安徽长江农林产权交易所的违约金；并有权取消该意向竞租方的受让资格。 <br />
      a.挂牌期间，（含延长挂牌公告期）在出租方设定条件未发生变化的情况下，意向竞租方已提出有效竞租申请并资格审查合格后单方撤回竞租申请的。 <br />
      b.挂牌公告期结束，只产生一个符合条件的意向竞租方，该意向竞租方未在规定的时间内进行有效报价或未按要求签订《网络报价成交确认单》的。 <br />
      c.挂牌公告期结束，产生两个或两个以上符合条件的意向竞租方时未参加后续竞价程序的或参加后续竞价程序但均未报有效报价导致标的流标的。 <br />
      d.竞价结束后，意向竞租方未按要求签订《网络报价成交确认单》的。 <br />
      e.承租方在签订《网络报价成交确认单》后的次日起3个工作日内，未按要求与出租方签订《土地承包经营权租赁合同》的。 <br />
      （2）意向竞租方在交纳保证金后，如非出租方或安徽长江农林产权交易所的原因，出现以下情况时，出租方有权扣除意向竞租方交纳的交易保证金（扣除双方的交易服务费），作为违约金；并有权取消该意向竞租方的承租资格。 <br />
      a.承租方按要求与出租方签订《土地承包经营权租赁合同》后，承租方未按《土地承包经营权租赁合同》要求履约的。 <br />
      （3）意向竞租方发生以上（1）或（2）项下的违约行为，导致《土地承包经营权租赁合同》无法履行的，出租方有权对挂牌标的进行重新挂牌。重新挂牌交易时，违约的意向竞租方不得报名参加竞租；重新交易的标的成交价款低于本次交易的标的成交价款造成的差价、费用损失、本次交易中的交易服务费及因意向竞租方违约而重新挂牌导致交易的标的成交价款迟延履行期间的滞纳金（交易的标的成交价款迟延履行期间为本次挂牌交易付款期限届满次日起至重新挂牌交易付款期截止之日，滞纳金按银行同期贷款基准利率双倍计算），均由违约的意向竞租方承担，由出租方追究违约的意向竞租方的相关经济和法律责任。 <br />
      （4）签订《网络报价成交确认单》后2个工作日内，成交双方向安徽长江农林产权交易所支付约定的交易服务费，否则，安徽长江农林产权交易所于签订《网络报价成交确认单》后的次日起第3个工作日在交易保证金中扣除成交双方的交易服务费。 <br />
      （5）自《土地承包经营权租赁合同》生效之日起5个工作日内，交易保证金（如承租方未支付交易服务费，则为扣除承租方应支付的交易服务费后的余款）作为承租方对《土地承包经营权租赁合同》约定租金的一部分。 <br />
      （6）未竞得标的的意向竞租方所交纳的交易保证金，在标的成交后的次日起3个工作日内退还。 </p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="left">交易方式 </p></td>
    <td colspan="4"><p>1、挂牌公告期结束，如征集到一个符合条件的意向竞租方，采取协议出租方式。意向竞租方在安徽长江农林产权交易所的组织下进行一人&ldquo;定时&rdquo;报价，意向竞租方的报价不得低于出租底价，并在规定的时间内签订《网络报价成交确认单》（如意向竞租方采取非现场网络竞价的，则应于报价结束后3个工作日内到安徽长江农林产权交易所无为分公司签订《网络报价成交确认单》；如意向竞租方采取现场网络竞价的，则应于报价结束后现场签订《网络报价成交确认单》）。 <br />
      2、挂牌公告期结束，如征集到两个及以上符合条件的意向竞租方，采取网络竞价（多次报价）的交易方式。确定最终承租价格及承租方后，在规定的时间内签订《网络报价成交确认单》（如意向竞租方采取非现场网络竞价的，则应于竞价结束后3个工作日内到安徽长江农林产权交易所无为分公司签订《网络报价成交确认单》；如意向竞租方采取现场网络竞价的，则应于竞价结束后现场签订《网络报价成交确认单》）。 <br />
      3、交易方式由安徽长江农林产权交易所确定，并另行通知。 <br />
      4、加价幅度由安徽长江农林产权交易所确定，并另行通知。<a name="_GoBack" id="_GoBack"></a></p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="left">服务费（设为可选项） </p></td>
    <td colspan="4"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td  colspan="2" rowspan="5" align="center" valign="middle" class="shheh"><p align="">联系方式 </p></td>
    <td width="98" class="shheh" ><p align="left">标的咨询 </p></td>
    <td colspan="4"><p align="left"><strong>安徽长江农林产权交易所有限公司或安徽长江农林产权交易所有限公司无为分公司</strong></p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="">技术支持 </p></td>
    <td colspan="4"><p align="left">张经理<strong>或</strong>马经理 0553-3117525<strong>或</strong>0553-6922788 </p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="left">咨询时间 </p></td>
    <td colspan="4"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="left">单位地址 </p></td>
    <td colspan="4"><p align="left">安徽省芜湖市渡春路1号（芜湖市人大原办公楼）<strong>或</strong>无为县交通局办公大楼裙楼一楼 </p></td>
  </tr>
  <tr>
    <td width="98" class="shheh" ><p align="left">其他 </p></td>
    <td colspan="4"><p align="left"><a href="">www.ahcjnjs.com</a></p></td>
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
                                <a href="infodetail?infoid=9f660b82-9afe-4e18-bf93-27304e0c0086&categoryNum=001001011&pageName=td2" title="">
                                    <img src="images/linshi/td-pic-2.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[芜湖市]</span>无为县陡沟镇西河村黄田河约170亩水面5年期承包经营权交易公告</dt>
                                        <dd>
                                            <span>转让底价：<span class="fcdd3">50,000.00元</span></span>
                                        </dd>
                                    </dl>
                                </a>
                            </li>
                            <li>
                                <a href="infodetail?infoid=88475f0a-dba2-442f-8c87-3a71982c1846&amp;categoryNum=001001012&amp;pageName=zzkg1" title="">
                                    <img src="images/linshi/zzkg-pic-1.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[益阳市]</span>湖南银城基础建设置业有限公司增资项目交易公告（国资监测编号G62017HN1000003）</dt>
                                        <dd>
                                            <span>转让底价：<span class="fcdd3">73,434,300.00元</span></span>
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
    initialize();
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
