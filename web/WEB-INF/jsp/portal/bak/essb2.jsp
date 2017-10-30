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
证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您
将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。
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
                    
                     <c:forEach items="${mediainfo.pics }" var="pic" varStatus="stat">
		        			<li>
			                    <img src="http://www.e-jy.com.cn/${pic.path }" ></a>
			                </li>
		        		</c:forEach>
                    	<%-- <!-- 优先显示360全景封面图 -->
	        			<li>
	        				<img src="<%=basePath%>${mediaInfo.d3 }">
        				</li>
        				<!-- 再显示视频封面图 -->
	        			<li id="videoli">
	        				<img src="<%=basePath%>${mediaInfo.video_pic }" ></a>
	        			</li>
	        			<!-- 地图 --> --%>
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
              <span class="label"><b>罐车</b><i></i></span>
              <span class="label second"><b>七成新</b><i></i></span>
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
	                    <span class="laber">转让底价</span><span class="money">14,057,900.00 </span> 元
	                </div>
	                <div class="list w100">
	                    <span class="laber">保证金 </span><span class="money">1,000,000.00 </span> 元
	                </div>
	                <div class="list w100">
	                    <span class="laber">储存地</span><span class="fcdd3 f16">呼和浩特市 金桥新技术开发区</span> 
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
            <li><a href="javascript:;" target="_blank"><img src="<%=basePath%>html/img2/czcq-ico-2.png" alt="内蒙古产权交易中心"  height="50"></a></li>
            <li><a href="javascript:;" target="_blank">内蒙古产权交易中心</a></li>
        </ul>
        <dl class="dispatching">
            <dt>联  系  人：</dt>
            <dd>王丽娟 </dd>
        </dl>
        <dl class="dispatching">
            <dt>联系电话：</dt>
            <dd>18147163459 </dd>
        </dl>
        <dl class="dispatching">
            <dt>单位地址：</dt>
            <dd>内蒙古产权交易中心</dd>
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
                <!-- <li class="survey switch" onclick="myclick(4)">成交公告</li> -->
            </ul>
            <div id="tab1_content" class="detail-tabcon clearfix" style="display: block;">
<div class="ph12">
<div   class="module-block"  id="d-bdgk">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="44" class="shheh" ><p align="left" >项目名称 </p></td>
    <td colspan="4"><p align="left">中海石油天野化工有限责任公司150辆自备G75K型罐车转让 </p></td>
    <td class="shheh"  colspan="4"><p align="left">项目编号 </p></td>
    <td width="193"><p align="left">&nbsp;09WZ20170148 </p></td>
  </tr>
  <tr>
    <td width="44" class="shheh" ><p align="left">挂牌起始日期 </p></td>
    <td colspan="4"><p align="left">2017/6/28 </p></td>
    <td class="shheh"  colspan="4"><p align="left">挂牌截止日期 </p></td>
    <td width="193"><p align="left">2017/7/25 </p></td>
  </tr>
  <tr>
    <td width="44" class="shheh" ><p align="left">挂牌期满，如未征集到意向受让方 </p></td>
    <td colspan="9"><p align="left">挂牌期满后如未征集到意向受让方，信息发布终结。 </p></td>
  </tr>
  <tr>
    <td width="44"  rowspan="7" align="center" class="shheh"><p align="">标的 <br />
      概况 </p></td>
    <td colspan="9"><p align="left">标的清单 </p></td>
  </tr>
  <tr>
    <td width="110" class="shheh" ><p align="left">序号 </p></td>
    <td width="73" class="shheh" ><p align="left">标的名称 </p></td>
    <td class="shheh"  colspan="2"><p align="left">规格 </p></td>
    <td  class="shheh" colspan="2"><p align="left">数量 </p></td>
    <td class="shheh"  colspan="2"><p align="left">单位 </p></td>
    <td width="193" class="shheh" ><p align="left">评估价/价格（元） </p></td>
  </tr>
  <tr>
    <td width="110"><p align="left">1</p></td>
    <td width="73"><p align="left">中海石油天野化工有限责任公司150辆自备G75K型罐车转让       </p>      <p align="left">&nbsp;</p></td>
    <td colspan="2">&nbsp;</td>
    <td colspan="2"><p align="left">1</p></td>
    <td colspan="2"><p align="left">批 </p>      <p align="left">&nbsp;</p></td>
    <td width="193"><p align="left">14057900.00 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="8"><p align="left">合计 </p></td>
    <td width="193"><p align="left">14057900.00 </p></td>
  </tr>
  <tr>
    <td width="110" class="shheh" ><p align="left">转让底价 </p></td>
    <td colspan="8"><p align="left">14057900.00元 </p></td>
  </tr>
  <tr>
    <td width="110" class="shheh" ><p align="left">标的现状 </p></td>
    <td colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="110" class="shheh" ><p align="left">附件 </p></td>
    <td colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="44" class="shheh" ><p align="center" >特别 <br />
      告知 </p></td>
    <td colspan="9"><p align="left">&nbsp;</p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="44" class="shheh"  rowspan="4"><p align="center" >交易 <br />
      条件 </p></td>
    <td  class="shheh" colspan="2"><p align="center">交易价款 </p></td>
    <td colspan="7"><p>付款方式：银行转账; <br />
      付款期限：挂牌公告期内交纳 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="center">与转让相关的其他条件 </p></td>
    <td colspan="7"><p align="center"><strong>1</strong><strong>、意向受让方须在标的勘验期间内亲自勘验标的，标的状况以勘验时的实际情况为准，勘验时需携带《现场勘验确认表》。意向受让方须在对标的状况及交易风险进行充分调查研判后，签署《现场勘验确认表》（签署《现场勘验确认表》，勘验人须与受让登记联系人一致，不一致的须提供授权委托书），按照公告的要求向中心提出受让申请并提交《现场勘验确认表》, </strong><strong>同时交纳保证金到中心指定银行账户。 2</strong><strong>、意向受让方一旦提交受让资料并交纳保证金，即表明已完全了解与认可标的状况及相关约定，自愿接受标的的全部现状与瑕疵，并愿承担一切责任与风险，被确定受让资格后不得以不了解标的状况、标的有瑕疵等为由而拒绝履行相关受让义务，否则视为违约，转让方将按照约定处置保证金。</strong>&nbsp;3、竞价结束时的最高报价者即为最终受让方，最终受让方须在竞价结束之日起3个工作日内将纸质报名资料递交至中心，报名资料纸质版原件须与报名时间提交的电子版报名资料保持一致。转受双方须在竞价结束之日起20个工作日内签订《实物资产交易合同》及转让方要求签订的其他协议。最终受让方应当在《实物资产交易合同》签订之日起5个工作日内将全部交易价款、交易服务费交付至中心指定账户。中心在收到全部交易价款、交易服务费、《实物资产交易合同》（原件）后3个工作日内出具交易凭证，在收到转让方出具的转付价款通知书后3个工作日内向转让方转付全部交易价款。&nbsp;<strong>4</strong><strong>、转让方在收到全部交易价款后3</strong><strong>个月内分批次与受让方办理标的交接手续。</strong><strong>受让方须承担交接过程中产生的费用及一切责任。标的过户工作由最终受让方负责，转让方协助办理。</strong><strong>5</strong><strong>、标的交接前，由转让方负责保管，标的交接后的保管责任、标的灭失、毁损等一切风险均由最终受让方承担。 6</strong><strong>、本次转让资产属于特种危化车辆，最终受让方受让后需按照国家法律、法规等相关规定进行处理。 7</strong><strong>、本次标的转让不允许受让方联合受让。</strong></p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="center">竞买资格 <br />
      条件 </p></td>
    <td colspan="7"><p align="left"><strong>1</strong><strong>、意向受让方须是经中国铁路总公司批准的自备铁路车辆经国家铁路过轨运输资质的企业法人；工商登记的名称须与中国铁路总公司批准的自备铁路车辆经国家铁路过轨运输资质的企业名称一致，且经营范围包含自备铁路车辆经国家铁路过轨运输内容；</strong><br />
      <strong>2</strong><strong>、具备企业铁路自备罐车经国家铁路过轨运输许可证；</strong><br />
      <strong>3</strong><strong>、具有</strong><strong>2017</strong><strong>年签订的自备铁路车辆过轨运输协议（协议中的企业需具备铁路自有自备罐车</strong><strong>100</strong><strong>辆以上）</strong><br />
      <strong>4</strong><strong>、企业注册资金必须在</strong><strong>8000</strong><strong>万元以上，注册资金截止日期为</strong><strong>2016</strong><strong>年</strong><strong>12</strong><strong>月</strong><strong>31</strong><strong>日。</strong></p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="center">标的交割 </p></td>
    <td colspan="7"><p align="center">&nbsp;</p></td>
  </tr>
   </table>
  </div>
  <br />
<div   class="module-block"  id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="44" class="shheh"  rowspan="8"><p align="center" >交易 <br />
      指南 </p></td>
    <td  colspan="2" align="center" class="shheh"><p align="">竞价规则 </p></td>
    <td colspan="7"><p align="left">竞买方在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn/index">www.e-jy.com.cn</a>）的<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6&amp;categoryNum=027001">《e交易平台竞价交易规则》</a>、<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=ef7859f2-f1ae-4b0b-b002-eb62a59f8818&amp;categoryNum=034001">《e交易平台产权交易操作指南》</a>等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 <br />
      以下由交易机构自行填制。 <br />
      （此处为固定版本） </p></td>
  </tr>
  <tr>
    <td  colspan="2" align="center" class="shheh"><p align="">现场展示 </p></td>
    <td colspan="7"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td  colspan="2" rowspan="3" align="center" class="shheh"><p align="">竞买报名 </p></td>
    <td width="109" class="shheh" ><p align="left">报名时间 </p></td>
    <td colspan="6"><p align="left">2017-06-28 00:00:00至2017-07-25    23:59:59 </p></td>
  </tr>
  <tr>
    <td width="109" class="shheh" ><p align="left">报名手续 </p></td>
    <td colspan="6"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="109" class="shheh" ><p align="left">保证金及处置方式 </p></td>
    <td colspan="6"><p align="left">保证金:<br />
      交易保证金应交1000000.00元人民币(或等值外币), 挂牌公告期内交纳 <br />
      处置方式:<br />
      1、最终受让方的交易保证金在最终受让方将剩余交易价款、交易服务费全部缴纳至中心指定账户后，自动转为交易价款的等额部分； 2、无&ldquo;保证内容&rdquo;中任何行为的其他意向受让方，其保证金将在竞价结束后3个工作日内由中心无息原渠道退还 </p></td>
  </tr>
  <tr>
    <td colspan="2" rowspan="2" align="center"  class="shheh" ><p align="">竞价安排（建议设为可选项，） </p></td>
    <td width="109" class="shheh" ><p align="">竞价方式 </p></td>
    <td colspan="2"><p align="left">&nbsp;</p></td>
    <td  class="shheh" colspan="2"><p align="">增价幅度 </p></td>
    <td colspan="2"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="109" class="shheh" ><p align="">自由竞价时间 </p></td>
    <td colspan="2"><p align="left">&nbsp;</p></td>
    <td class="shheh"  colspan="2"><p align="">延时竞价周期 </p></td>
    <td colspan="2"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td  colspan="2" align="center" class="shheh"><p align="">服务费（建议设为可选项） </p></td>
    <td colspan="7"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="44" class="shheh"  rowspan="5"><p align="center">联系 <br />
      方式 </p></td>
    <td  colspan="2" align="center" class="shheh"><p align="">标的咨询 </p></td>
    <td colspan="7"><p align="left">王经理18147163454、0471-3473035 </p></td>
  </tr>
  <tr>
    <td  colspan="2" align="center" class="shheh"><p align="">技术支持 </p></td>
    <td colspan="7"><p align="left">李经理18147163468、0471-3473040 </p></td>
  </tr>
  <tr>
    <td  colspan="2" align="center" class="shheh"><p align="">咨询时间 </p></td>
    <td colspan="7"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td  colspan="2" align="center" class="shheh"><p align="">单位地址 </p></td>
    <td colspan="7"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td  colspan="2" align="center" class="shheh"><p align="">其他 </p></td>
    <td colspan="7"><p align="left">&nbsp;</p></td>
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
                                <a href="infodetail?infoid=ea701b9e-7f50-46f2-a68d-f61728abd246&categoryNum=001001004&pageName=essb1" title="">
                                    <img src="images/linshi/essb-pic-1.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[内蒙古自治区]</span>内蒙古自治区冶金研究院3台报废锅炉转让交易公告</dt>
                                        <dd>
                                            <span>转让底价：<span class="fcdd3">58,700.00元</span></span>
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
