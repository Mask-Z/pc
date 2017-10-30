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
                
                <div class="item"><img src="images/gq.png" width="480" height="360" ></div>
                
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
	        			</li>
	        			<!-- 地图 --> --%>
		        		<li>
		       				<img src="<%=basePath%>images/gq.png" >
		       			</li>
		       			<%-- <!-- 音频 -->
		        		<li id="audioli">
		       				<img src="<%=basePath%>images/audio.jpg" >
		       			</li> --%>
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
            
            	<a href="javascript:;" target="_blank" 	class="share-btn vr" ><i></i>360° 全景</a>
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
              <span class="label"><b>高新技术企业</b><i></i></span>
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
	                    <span class="laber">转让底价</span><span class="money">14,700,000.00 </span> 元
	                </div>
	                <div class="list w100">
	                    <span class="laber">保证金 </span><span class="money">1,000,000.00 </span>元 
	                </div>
	                <div class="list w100">
	                    <span class="laber">注册资本</span><span class="money">60,000,000.00 </span>元 
	                </div>
	                <div class="list w100">
	                    <span class="laber">行业</span><span class="fcdd3 f16">黑色金属矿采选业 </span> 
	                </div>
	                <div class="list w100">
	                    <span class="laber">所在地</span><span class="fcdd3 f16">包头稀土高新区富强南路171号正大高科北楼104室 </span> 
	                </div>
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
					<a href="javascript:void(0);" class="bond-btn fr btn-default">竞价已结束</a>
				</c:if>
				<c:if test="${info.status_name == '未开始'}">
					<a href="javascript:void(0);" class="bond-btn fr btn-update">未开始</a>
				</c:if>
				<c:if test="${info.status_name == '报名已截止'}">
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
            <li><a href="javascript:;" target="_blank"><img src="<%=basePath%>html/img2/czcq-ico-2.png" alt="常州产权交易所"  height="50"></a></li>
            <li><a href="javascript:;" target="_blank">内蒙古产权交易中心</a></li>
        </ul>
        <dl class="dispatching">
            <dt>联  系  人：</dt>
            <dd>李永平 </dd>
        </dl>
        <dl class="dispatching">
            <dt>联系电话：</dt>
            <dd>0471-3473035 </dd>
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
    <td width="180" class="shheh"  colspan="2" valign="middle"><p align="center">项目<br />名称 </p></td>
    <td width="161" colspan="2"><p align="left">包钢（乌兰察布市）普华实业有限公司24.5%股权 </p></td>
    <td width="142" class="shheh"  colspan="4"><p align="center">项目编号 </p></td>
    <td width="156" colspan="4"><p align="left">09GQ20170028 </p></td>
  </tr>
  <tr>
    <td width="180" class="shheh"  colspan="2" valign="top"><p align="center">挂牌起始日期 </p></td>
    <td width="161" colspan="2"><p align="left">2017/8/3 </p></td>
    <td width="142" class="shheh"  colspan="4"><p align="center">挂牌截止日期 </p></td>
    <td width="156" colspan="4"><p align="left">2017/8/14 </p></td>
  </tr>
  <tr>
    <td width="105" class="shheh"  rowspan="33" valign="middle"><p align="center">标的概况 </p>      <p align="left">&nbsp;</p></td>
    <td width="76" rowspan="8"  class="shheh" ><p align="left">标的企业 <br />
      基本情况 </p></td>
    <td width="161" class="shheh"  colspan="2"><p align="left">标的企业名称 </p></td>
    <td width="298" colspan="8"><p align="left">包钢（乌兰察布市）普华实业有限公司 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">注册地(地址)</p></td>
    <td width="298" colspan="8"><p align="left">乌兰察布市集宁区解放路北侧皮毛（2号）5栋102号 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">公司类型（经济性质） </p></td>
    <td width="105" colspan="3"><p align="left">有限责任公司 </p></td>
    <td width="94" class="shheh"  colspan="4"><p align="left">法定代表人 </p></td>
    <td width="99"><p align="left">卢建刚 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">成立时间 </p></td>
    <td width="105" colspan="3"><p align="left"><br />
      2012/06/20 </p></td>
    <td width="94" class="shheh"  colspan="4"><p align="left">注册资本（股本） </p></td>
    <td width="99"><p align="left">6000.000000 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">统一社会信用代码 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="161"  class="shheh" colspan="2"><p align="left">经营范围 </p></td>
    <td width="298" colspan="8"><p align="left">矿产资源开发、利用；钢材深加工、铁精矿粉、煤炭、耐火材料；进出口业务；劳务服务；商务咨询；物流仓储等 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">职工人数 </p></td>
    <td width="298" colspan="8"><p align="left">8 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">是否含有国有划拨土地 </p></td>
    <td width="298" colspan="8"><p align="left">否 </p></td>
  </tr>
  <tr>
    <td width="76" class="shheh"  rowspan="4"><p align="center">公司 <br />
      股权 <br />
      结构 </p></td>
    <td width="161"  class="shheh" colspan="2"><p align="left">序号 </p></td>
    <td width="160" class="shheh"  colspan="5"><p align="left">前十位出资人名称 </p></td>
    <td width="138" class="shheh"  colspan="3"><p align="left">持股比例(%)</p></td>
  </tr>
  <tr>
    <td width="161" colspan="2"><p align="left">1</p></td>
    <td width="160" colspan="5"><p align="left"><strong>包钢矿业有限责任公司</strong></p></td>
    <td width="138" colspan="3"><p align="left"><strong>51.0000</strong></p></td>
  </tr>
  <tr>
    <td width="161" colspan="2"><p align="left">2</p></td>
    <td width="160" colspan="5"><p align="left"><strong>包头大普贸易有限公司</strong></p></td>
    <td width="138" colspan="3"><p align="left"><strong>24.5000</strong></p></td>
  </tr>
  <tr>
    <td width="161" colspan="2"><p align="left">3</p></td>
    <td width="160" colspan="5"><p align="left"><strong>包头市天马贸易有限责任公司</strong></p></td>
    <td width="138" colspan="3"><p align="left"><strong>24.5000</strong></p></td>
  </tr>
  <tr>
    <td width="236" colspan="3"  class="shheh" ><p align="left">转让行为内部决策情况 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="76"  class="shheh" rowspan="12"><p align="left">主要 <br />
      财务 <br />
      指标 </p></td>
    <td width="459" colspan="10"><p align="left">以下数据出自审计报告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
      单位：万元 </p></td>
  </tr>
  <tr>
    <td width="161"  class="shheh" colspan="2" rowspan="4"><p align="left">&nbsp; </p>
      <p align="left">2016  年度&nbsp; </p></td>
    <td width="95" class="shheh" ><p align="left">营业收入 </p></td>
    <td width="97" class="shheh"  colspan="5"><p align="left">利润总额 </p></td>
    <td width="106" class="shheh"  colspan="2"><p align="left">净利润 </p></td>
  </tr>
  <tr>
    <td width="95"><p align="left">26881.600000 </p></td>
    <td width="97" colspan="5"><p align="left">156.900000 </p></td>
    <td width="106" colspan="2"><p align="left">137.300000 </p></td>
  </tr>
  <tr>
    <td width="95" class="shheh" ><p align="left">资产总额 </p></td>
    <td width="97" class="shheh"  colspan="5"><p align="left">负债总额 </p></td>
    <td width="106" class="shheh"  colspan="2"><p align="left">所有者权益 </p></td>
  </tr>
  <tr>
    <td width="95"><p align="left">7471.900000 </p></td>
    <td width="97" colspan="5"><p align="left">1321.200000 </p></td>
    <td width="106" colspan="2"><p align="left">6150.700000 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">审计机构名称 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="459" colspan="10"><p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 以下数据出自企业近期财务报表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 单位：万元 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">填报日期 </p></td>
    <td width="104" class="shheh"  colspan="2"><p align="left">营业收入 </p></td>
    <td width="88" class="shheh"  colspan="4"><p align="left">利润总额 </p></td>
    <td width="106" class="shheh"  colspan="2"><p align="left">净利润 </p></td>
  </tr>
  <tr>
    <td width="161" colspan="2"><p align="left">2017/06/30 </p></td>
    <td width="104" colspan="2"><p align="left">4106.700000 </p></td>
    <td width="88" colspan="4"><p align="left">-71.700000 </p></td>
    <td width="106" colspan="2"><p align="left">-91.600000 </p></td>
  </tr>
  <tr>
    <td width="161"  class="shheh" colspan="2"><p align="left">报表类型 </p></td>
    <td width="104" class="shheh"  colspan="2"><p align="left">资产总额 </p></td>
    <td width="88" class="shheh"  colspan="4"><p align="left">负债总额 </p></td>
    <td width="106" class="shheh"  colspan="2"><p align="left">所有者权益 </p></td>
  </tr>
  <tr>
    <td width="161" colspan="2"><p align="left">月报 </p></td>
    <td width="104" colspan="2"><p align="left">6156.300000 </p></td>
    <td width="88" colspan="4"><p align="left">97.300000 </p></td>
    <td width="106" colspan="2"><p align="left">6059.000000 </p></td>
  </tr>
  <tr>
    <td width="161" colspan="2"><p align="left">&nbsp;</p></td>
    <td width="104" colspan="2"><p align="left">&nbsp;</p></td>
    <td width="88" colspan="4"><p align="left">&nbsp;</p></td>
    <td width="106" colspan="2"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="76" class="shheh"  rowspan="5"><p align="left">转让方基本况 </p></td>
    <td width="161" class="shheh"  colspan="2"><p align="left">转让方名称 </p></td>
    <td width="298" colspan="8"><p align="left">包头市天马贸易有限责任公司 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">统一社会信用代码 <br />
      注册地（住所） </p></td>
    <td width="298" colspan="8"><p align="left">包头稀土高新区富强南路171号正大高科北楼104室 </p></td>
  </tr>
  <tr>
    <td width="161" colspan="2" class="shheh" ><p align="left">持有产(股)权比例 </p></td>
    <td width="298" colspan="8"><p align="left"><br />
      24.5000 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">拟转让产(股)权比例 </p></td>
    <td width="298" colspan="8"><p align="left"><br />
      24.5000 </p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">内部决策形式 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="76" class="shheh"  rowspan="3"><p align="left">产权转让行为批准情况 </p></td>
    <td width="161"  class="shheh" colspan="2"><p align="left">国资监管机构 </p></td>
    <td width="298"  colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">所属集团或主管部门 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="161" class="shheh"  colspan="2"><p align="left">批准单位名称及文件名称（含文号） </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="105" class="shheh"  rowspan="5" valign="middle">
      <p align="center" >特别告知 </p></td>
    <td width="236" colspan="3"  class="shheh" ><p align="left">审计报告和评估报告中的保留意见、重要揭示、特别事项说明中涉及转让产权的提示提醒等内容 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="236"  class="shheh" colspan="3"><p align="left">重大债权债务事项或会计报表附注中重大或有事项 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="236" class="shheh"  colspan="3"><p align="left">原股东是否放弃优先受让权 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="236" class="shheh"  colspan="3"><p align="left">管理层拟参与受让意向 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="236" class="shheh"  colspan="3"><p align="left">其他披露内容 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="105" rowspan="7" valign="top"  class="shheh" ><p align="left"  >交易条件 </p></td>
    <td width="76" rowspan="4" class="shheh" ><p align="left">转让条件 </p></td>
    <td width="161" colspan="2" class="shheh" ><p align="left">转让底价 </p></td>
    <td width="298" colspan="8"><p align="left">1470.000000 </p></td>
  </tr>
  <tr>
    <td width="161" colspan="2" class="shheh" ><p align="left">交易价款 </p></td>
    <td width="298" colspan="8"><p align="left">付款方式：一次性支付/分期支付。 <br />
      付款期限：意向投资人被确定为最终投资人的，应在3个工作日内签订《产权交易合同》,并在《产权交易合同》签订之日起5个工作日内将全部/首期增资价款支付至增资人指定账户。 </p></td>
  </tr>
  <tr>
    <td width="161" colspan="2" class="shheh" ><p align="left">对转让标的企业职工有无继续聘用要求 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="161" colspan="2" class="shheh" ><p align="left">产权转让涉及的债权债务处置有无要求 </p></td>
    <td width="298" colspan="8"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="76"  class="shheh" ><p align="left" class="shheh" >受让方资格条件 </p></td>
    <td width="459" colspan="10"><p align="left">1、意向受让方为法人或其他组织的，应能承担民事责任； <br />
      2、意向受让方为自然人的，应当具有完全民事行为能力； <br />
      3、法律、法规、规章规定的其他条件。 </p></td>
  </tr>
  <tr>
    <td width="76" class="shheh" ><p align="left">与转让相关其他条件 </p></td>
    <td width="459" colspan="10"><p align="left">自填 </p></td>
  </tr>
  <tr>
    <td width="76" class="shheh" ><p align="left">标的 <br />
      交割 </p></td>
    <td width="459" colspan="10"><p align="left">（1）买受人应于合同约定的时间内，提交所需资料与委托人共同办理注册登记手续，向代理机构提交资料如下：自然人身份证签字复印件；加盖公章的法人或其他组织营业执照等身份证明复印件；委托方要求的其他材料。 <br />
      （2）（可选）若在本次转让成交后6个月内，如双方未能完成相关注册登记手续的，视为无法交付，有双方协商解决，解决不成的，任何乙方有权向增资公司所在地人民法院提起诉讼，代理机构根据双方协议或法院裁判文书退还已支付的成交款（不计息），但代理机构服务费不予退还。 <br />
      （3） <br />
      备注：建议此处做成可自主输入。 </p></td>
  </tr>
     </table>
  </div>
  <br />
<div   class="module-block"  id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="105"  rowspan="9" align="center" valign="middle" class="shheh"><p align=""  >交易指南 </p></td>
    <td width="76" class="shheh" ><p align="left">交易方式 </p></td>
    <td width="459" colspan="10"><p align="left">1、如：征集一家则直接确定其为受让方、转让动态报价、拍卖、网络竞价（自填）等 <br />
      2、挂牌期满后，如未征集到意向受让方，则 </p></td>
  </tr>
  <tr>
    <td width="76" class="shheh" ><p align="left">竞价须知（+可选） </p></td>
    <td width="459" colspan="10"><p align="left">竞买人在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn/index">www.e-jy.com.cn</a>）的<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6&amp;categoryNum=027001">《e交易平台竞价交易规则》</a>、<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=ef7859f2-f1ae-4b0b-b002-eb62a59f8818&amp;categoryNum=034001">《e交易平台产权交易操作指南》</a>等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 <br />
      以下由交易机构自行填制。 <br />
      （此处为固定版本） </p></td>
  </tr>
  <tr>
    <td width="76" class="shheh" ><p align="left">现场展示（+） <br />
      （无） </p></td>
    <td width="459" colspan="10"><p align="left"><u>可选</u></p></td>
  </tr>
  <tr>
    <td width="76" rowspan="3"  class="shheh" ><p align="left">竞买报名（+） </p></td>
    <td width="89" class="shheh" ><p align="left">报名时间 </p></td>
    <td width="370" colspan="9"><p align="left"><u>    </u>年<u>   </u>月<u>   </u>日至<u>   </u>年<u>   </u>月<u>   </u>日<u>   </u>时 </p></td>
  </tr>
  <tr>
    <td width="89" class="shheh" ><p align="left">报名手续 </p></td>
    <td width="370" colspan="9"><p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="89" class="shheh" ><p align="left">保证金及处置方式 </p></td>
    <td width="370" colspan="9"><p align="left">1.缴纳：金额<u>     </u>元，截止时间<u>   </u>年<u>   </u>月<u>   </u>日<u>   </u>时，按系统提示缴纳。<u> </u><br />
      2.退还：买受人缴纳的保证金在标的过户完毕后退还，其他竞价人的保证金将于成交后的<u>    </u>个工作日内退还。 <br />
      3.其他说明：<u>                   （如有其他，则机构自主输入）</u>。 </p></td>
  </tr>
  <tr>
    <td width="76" class="shheh" ><p align="left">竞价安排（+） </p></td>
    <td width="459" colspan="10"><p align="left">内容自填，参考如下： <br />
      竞价方式 <br />
      加价竞价 (字面解释提示框) <br />
      增价幅度<u>     </u>元 <br />
      自由竞价时间<u>   </u>年<u>   </u>月<u>  </u>日<u>   </u>时至<u>  </u>年<u>   </u>月<u>   </u>日<u>   </u>时 <br />
      延时竞价周期<u>     </u>秒 </p></td>
  </tr>
  <tr>
    <td width="76" class="shheh" ><p align="left">服务费（+） </p></td>
    <td width="459" colspan="10"><p align="left">1．成交价的<u>      </u>%，成交之日起<u>   </u>个工作日内按系统提示付清。 <br />
      2.竞价成交后，买受人向产交所支付的服务费，产交所开具服务费发票，产交所不开具其他任何票据。(如有其它资产适用)如买受人需要销售发票，由其自行向税务机关申报办理，税金由买受人另行承担。 </p></td>
  </tr>
  <tr>
    <td width="76"  class="shheh" ><p align="left">附件下载 </p></td>
    <td width="459" colspan="10"><p align="left">&nbsp;</p></td>
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
                                <a href="infodetail?infoid=3e3b9d1a-fc2d-4faa-8190-8d2953a1f259&categoryNum=001001002&pageName=gq2" title="">
                                    <img src="images/linshi/gq-pic-2.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[南京市]</span>南京工大开元化学有限公司102.67万元出资额（占注册资本10.267%）交易公告</dt>
                                        <dd>
                                            <span>转让底价：<span  class="fcdd3">1,210,000.00元</span></span>
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
