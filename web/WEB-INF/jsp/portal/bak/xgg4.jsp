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
<!-- 			 		so.addVariable("CuPlayerFile","<%=basePath%>${mediaInfo.vide}"); //视频文件地址 -->
<!-- 			 		so.addVariable("CuPlayerImage","<%=basePath%>${mediaInfo.video_pic}");//视频略缩图 -->
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
<!--               <span class="label"><b>近地铁</b><i></i></span> -->
<!--               <span class="label second"><b>市中心</b><i></i></span> -->
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
	                    <span class="laber">转让底价 </span><span class="money">800,000.00</span> 元
	                </div>
	                
	                <div class="list w100">
	                    <span class="laber">保证金 </span><span class="money">50,000.00</span> 元
	                </div>
<!-- 	                <div class="list"> -->
<!-- 	                    <span class="laber">建筑面积 </span><span class="money">1376.65</span>m² -->
<!-- 	                </div> -->
<!-- 	                <div class="list"> -->
<!-- 	                    <span class="laber">单价 </span><span class="money">7500</span> 元<span class="fc99">/m²</span> -->
<!-- 	                </div> -->
	                
	               
                </c:if>
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
    <td colspan="3" class="shheh"  valign="top"><p align="center">项目名称 </p></td>
    <td colspan="2"><p align="left">鸡血石（序号12）转让公告  </p></td>
    <td width="191" class="shheh" ><p align="center">项目编号 </p></td>
    <td width="216"><p align="left">——</p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="3" valign="top"><p align="center">挂牌起始日期 </p></td>
    <td colspan="2"><p>2017年1月20&nbsp; </p></td>
    <td width="191" class="shheh" ><p align="center">挂牌截止日期 </p></td>
    <td width="216"><p align="left">2017年3月7日 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="3" valign="top"><p align="center">挂牌期满，如未征集到意向受让方 </p></td>
    <td colspan="4"><p align="left">公告期内如未征集到意向受让方则不变更挂牌条件，按照5个工作日为一个周期延长公告期。 </p></td>
  </tr>
  <tr>
    <td width="119"  rowspan="7" align="center" valign="middle" class="shheh"><p align="">标的概况 </p></td>
    <td  colspan="2" align="center" class="shheh"><p align="">转让方名称 </p></td>
    <td colspan="4"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td  colspan="2" rowspan="2" align="center" class="shheh"><p align="">标的概况 </p></td>
    <td colspan="4"><p>本期处置的罚没物品意向受让方可由中心统一组织集中进行现场实物看样（看样时间初步安排为公告截止前5个工作日）。请各意向受让方仔细查看并留意标的相关说明谨慎选择。 </p></td>
  </tr>
  <tr>
    <td  colspan="2" align="center" class="shheh"><p>其他披露事项 </p></td>
    <td colspan="2"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td  colspan="2" align="center" class="shheh"><p align="">转让底价 </p></td>
    <td colspan="4"><p align="left">800000元 </p></td>
  </tr>
  <tr>
    <td  colspan="2" align="center" class="shheh"><p align="">转让行为批准 </p></td>
    <td colspan="4"><p align="left">无 </p></td>
  </tr>
  <tr>
    <td  colspan="2" rowspan="2" align="center" class="shheh"><p align="">鉴定评估情况(可选)</p></td>
    <td  colspan="2" align="center" class="shheh"><p align="">机构名称 </p></td>
    <td colspan="2"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td  colspan="2" align="center" class="shheh"><p align="">鉴定评估结果 </p></td>
    <td colspan="2"><p align="left">&nbsp;</p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="126" align="center"  valign="middle" class="shheh"><p align="">特别告知 </p></td>
    <td width="763" colspan="6"><p align="left">1、本次转让的物品属罚没资产，请各意向受让方根据自身受让条件判断项目风险及评估自身风险承受能力。委托方与中心不对物品进行质量和真假甄别，不承担瑕疵担保责任。 <br />
      2、意向受让方需仔细观看并阅读实物现状图片及相关说明，物品状况以图片为准。意向受让方须在对标的状况及交易风险进行充分调查研判后，向中心提出受让申请并交纳保证金到指定银行账户。各意向受让方一旦提交受让资料并交纳保证金，即表明已完全了解与认可标的状况及相关约定，自愿接受标的的全部现状与瑕疵，并愿承担一切责任与风险，被确定受让资格后不得以不了解标的状况或标的有瑕疵等为由拒绝履行相应受让义务。否则视为违约，委托方将按照约定处置保证金。<br />
      3、受让方应在竞价结束之日起3个工作日内将签字盖章的《竞价结果通知书》及纸质报名资料递交至内蒙古产权交易中心有限责任公司，并在《竞价结果通知书》签订之日起3个工作日内将全部交易价款及交易服务费交纳至内蒙古产权交易中心有限责任公司指定账户。 <br />
      4、受让方交清全部款项次日起3个工作日内，中心出具交易凭证。受让方需由本人持有效身份证件（法人持营业执照、法定代表人身份证复印件、授权委托书及提取人本人身份证件）在中心统一组织下至指定地点凭交易凭证、物品图片及《竞价结果通知书》提取物品并办理物品交接手续，委托方以实物现状予以交付，涉及发票事项及相关税费由受让方自行办理并承担。<br />
      5、物品交接前所发生的标的毁损灭失等一切风险由委托方承担，交接后的一切风险由受让方承担。 </p></td>
  </tr>
      </table>
  </div>
  <br />
<div   class="module-block"  id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="136"  rowspan="4" align="center" valign="middle" class="shheh"><p align="center">交易条件 </p></td>
    <td width="131" align="center" class="shheh" ><p align="">交易价款 </p></td>
    <td width="622" colspan="5"><p align="left">一次性付款 </p></td>
  </tr>
  <tr>
    <td width="131" align="center" class="shheh" ><p align="">与转让相关的其他条件 </p></td>
    <td colspan="5"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td align="center" class="shheh" ><p align="">受让资格条件 </p></td>
    <td colspan="5"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td align="center" class="shheh" ><p align="">标的交割 </p></td>
    <td colspan="5"><p align="left">&nbsp;</p></td>
  </tr>
        </table>
  </div>
  <br />
<div   class="module-block"  id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="95"  rowspan="6" align="center" valign="middle" class="shheh"><p align="left">&nbsp;</p>
      <p align="left">&nbsp;</p>
      <p align="left">&nbsp;</p>
      <p align="">交易指南 </p></td>
    <td width="134" colspan="" align="center" class="shheh" ><p align="">竞价规则 </p></td>
    <td colspan="3"><p align="left">竞买方在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn/index">www.e-jy.com.cn</a>）的<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6&amp;categoryNum=027001">《e交易平台竞价交易规则》</a>、<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=ef7859f2-f1ae-4b0b-b002-eb62a59f8818&amp;categoryNum=034001">《e交易平台产权交易操作指南》</a>等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 </p></td>
  </tr>
  <tr>
    <td  colspan="" rowspan="3" align="center" valign="middle" class="shheh"><p align="">意向受让报名 </p></td>
    <td width="120" align="center" valign="middle"  class="shheh" ><p align="">报名时间</p></td>
    <td width="540" colspan="3"><p>2017年1月20—2017年3月7 </p></td>
  </tr>
  <tr>
    <td width="120" align="center" class="shheh" ><p align="">报名手续 </p></td>
    <td colspan="2"><p align="left">意向受让方应在2017年3月7日（银行到帐为准）前将保证金缴纳至指定账户并凭有效证件到产权交易中心办理意向受让登记手续方可取得竞买资格，逾期不予办理。 </p></td>
  </tr>
  <tr>
    <td width="120" align="center" class="shheh" ><p align="">保证金及处置方式 </p></td>
    <td colspan="2"><p align="left">（1）最终受让方的保证金在其交纳全部交易价款及交易费用次日起3个工作日内由内蒙古产权交易中心有限责任公司无息原路退还； &nbsp;<br />
      （2）无&ldquo;保证内容&rdquo;中任何行为的其他意向受让方，其保证金将在竞价结束后3个工作日内由内蒙古产权交易中心有限责任公司无息原路退还。 </p></td>
  </tr>
  <tr>
    <td  align="center" class="shheh"><p align="">交易方式 </p></td>
    <td colspan="4"><p align="left">1、本次罚没物品处置采用网络竞价方式进行。 <br />
      2、取得竞买资格的意向受让方可对本次罚没资产处置清单中的所有标的进行报价，但根据意向受让方所交纳保证金的额度，只能对保证金额度小于等于该额度的一个标的进行最高报价且只能成交保证金额度小于等于该额度的一个标的，即意向受让方当前最高有效报价项目保证金额度小于等于所交保证金额度。 </p></td>
  </tr>
  <tr>
    <td  align="center" class="shheh"><p align="">备查文件 </p></td>
    <td colspan="4"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="95"  rowspan="5" align="center" valign="middle" class="shheh"><p align="">联系方式 </p></td>
    <td  align="center" class="shheh"><p align="">标的咨询 </p></td>
    <td colspan="4"><p align="left">李先生 田女士；0471-3473039 &nbsp;3473042 &nbsp;&nbsp; </p></td>
  </tr>
  <tr>
    <td  align="center" class="shheh"><p align="">技术支持 </p></td>
    <td colspan="4"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td  align="center" class="shheh"><p align="">咨询时间 </p></td>
    <td colspan="4"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td align="center" class="shheh"><p align="">单位地址 </p></td>
    <td colspan="4"><p align="left">呼和浩特市赛罕区翠柳路3号 </p></td>
  </tr>
  <tr>
    <td  align="center" class="shheh"><p align="">其    他 </p></td>
    <td colspan="4"><p align="left">&nbsp;</p></td>
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
                                  <a href="infodetail?infoid=ca2008cd-353f-4945-94ea-dd979f37bfc1&categoryNum=001001008&pageName=xgg3" title="">
                                    <img src="images/linshi/xgg-pic-3.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[内蒙古产权交易中心]</span>罚没物品-劳力士金表（序号34）交易公告 （第二次）交易公告 </dt>
                                        <dd>
                                            <span>转让底价：<span  class="fcdd3">375,500.00元</span></span>
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