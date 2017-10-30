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
                    <c:forEach items="${mediainfo.pics }" var="pic" varStatus="stat">
		        			<li>
			                    <img src="http://www.e-jy.com.cn/${pic.path }" ></a>
			                </li>
		        		</c:forEach>
                    	<!-- 地图 -->
		        		<li>
		       				<img onclick="initialize();" src="<%=basePath%>images/map.png" >
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
            	<!-- <a href="http://720yun.com/t/c02jzstwrw4?from=singlemessage&isappinstalled=0&pano_id=6174879" target="_blank" 	class="share-btn vr have" ><i></i>360° 全景</a>
            	
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
              <span class="label"><b>近地铁</b><i></i></span>
              <span class="label second"><b>市中心</b><i></i></span>
              <span class="label third"><b>湖景房</b><i></i></span>
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
	                    <span class="laber">转让底价</span><span class="money">73,500,000.00</span>元
	                </div>
	                <div class="list w100">
	                    <span class="laber">保证金 </span><span class="money">10,000,000.00</span> 元
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
            <li><a href="javascript:;" target="_blank"><img src="<%=basePath%>html/img2/czcq-ico-7.png" alt="黑龙江联合产权交易所"  height="50"></a></li>
            <li><a href="javascript:;" target="_blank">黑龙江联合产权交易所</a></li>
        </ul>
        <dl class="dispatching">
            <dt>联  系  人：</dt>
            <dd>尹先生</dd>
        </dl>
        <dl class="dispatching">
            <dt>联系电话：</dt>
            <dd>0451-58894175 </dd>
        </dl>
        <dl class="dispatching">
            <dt>单位地址：</dt>
            <dd>黑龙江联合产权交易所</dd>
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
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tbody>
    <tr>
      <td width="201" class="shheh" align="center"  colspan="4"><strong  class="module-block"  id="d-bdgk">标的名称</strong></td>
      <td width="501" colspan="10"><p>宾县湖滨山庄房屋土地及设备车辆</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>项目编号</strong></p></td>
      <td width="501" colspan="10"><p>QY16HL0000057</p></td>
    </tr>
    <tr>
      <td width="201"  class="shheh" colspan="4"><p align="center"><strong>转让申请与承诺</strong></p></td>
      <td width="501" colspan="10"><p align="left">黑龙江联合产权交易所：</p>
        <p align="left">本转让方提出申请，将持有的资产公开转让，按本公告内容由贵所在网站及相关媒体公开发布资产转让公告信息并由贵所组织实施。本转让方依照公开、公平、公正、诚信的原则，作如下承诺：</p>
        <p align="left">1、本次产权转让是我方真实意愿表示，转让的实物资产权属清晰，我方对该资产拥有完全的处置权且处置权的实施不存在任何限制条件；</p>
        <p align="left">2、我方转让资产的相关行为已履行了相应程序，经过有效的内部决策，并获得相应批准；</p>
        <p align="left">3、我方对所填写内容及提交所有材料（包括原件、复印件）的真实性、合法性、完整性、有效性承担责任，不存在虚假记载、误导性陈述或重大遗漏，并同意黑龙江联合产权交易所对上述材料内容予以公告；</p>
        <p align="left">4、我方已对交易所的交易规则有了充分的理解和认可，并愿意遵守交易所的交易规则；</p>
        <p align="left">5、标的转让后，我方积极协助受让方办理资产交接及变更手续，如果由于我方提供资料存在瑕疵而未在公告中披露的原因，致使资产无法交接或变更等情形，我方承担全部责任；</p>
        <p align="left">我方保证遵守以上承诺，如因违反上述承诺，给贵所、意向受让方和经纪会员造成损失的，我方愿承担由此产生的法律责任。</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>资产占有方名称</strong></p></td>
      <td width="501" colspan="10"><p>中国石油天然气股份有限公司哈尔滨石化分公司</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>资产属性（资产来源）</strong></p></td>
      <td width="501" colspan="10"><p>企业实物资产</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>资产类型</strong></p></td>
      <td width="501" colspan="10"><p>房产  土地  设备  车辆</p></td>
    </tr>
    <tr>
      <td rowspan="3" class="shheh"  width="88"><p align="center"><strong>资产评估情况</strong></p></td>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>评估机构</strong></p></td>
      <td width="501" colspan="10"><p>黑龙江龙企华资产评估有限公司    黑龙江广拓土地房地产估价有</p>
        <p>限责任公司</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>资产基准日</strong></p></td>
      <td width="501" colspan="10"><p>2017年5月31日   2017年6月8日</p></td>
    </tr>
    <tr>
      <td width="113"  class="shheh" colspan="3"><p align="center"><strong>资产评估值</strong></p></td>
      <td width="501" colspan="10"><p>6997.78万元</p></td>
    </tr>
    <tr>
      <td rowspan="2"  class="shheh" width="88"><p align="center"><strong>核准(备案)情况</strong></p></td>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>核准（备案）机构</strong></p></td>
      <td width="501" colspan="10"><p>中国石油天然气集团公司</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>核准（备案）日期</strong></p></td>
      <td width="501" colspan="10"><p>2017年7月25日</p></td>
    </tr>
    <tr>
      <td width="201"  class="shheh" colspan="4"><p align="center" ><strong>批准文件名称</strong></p></td>
      <td width="501" colspan="10"><p>关于哈尔滨石化分公司湖滨山庄资产处置的批复</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>批准单位名称</strong></p></td>
      <td width="501" colspan="10"><p>中国石油天然气股份有限公司</p></td>
    </tr>
    <tr>
      <td width="201"  class="shheh" colspan="4"><p align="center"><strong>批准文号</strong></p></td>
      <td width="501" colspan="10"><p>油财务（2015）189号</p></td>
    </tr>
    <tr>
      <td width="201"  class="shheh" colspan="4"><p align="center"><strong>转让底价</strong></p></td>
      <td width="501" colspan="10"><p>7350万元</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>挂牌起始日期</strong></p></td>
      <td width="501" colspan="10"><p>2017年 8 月4 日</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>挂牌截止日期</strong></p></td>
      <td width="501" colspan="10"><p>2017年8 月31日</p></td>
    </tr>
    <tr>
      <td width="702" colspan="14"><p align="left"><strong >一、标的资产信息</strong></p></td>
    </tr>
    <tr>
      <td rowspan="4" class="shheh"  width="88"><p align="center"><strong>房屋</strong></p></td>
      <td width="113"  class="shheh" colspan="3"><p align="center"><strong>地理位置</strong></p></td>
      <td width="159" colspan="2"><p>哈尔滨市宾县二龙山风景区湖滨山庄</p></td>
      <td width="173" class="shheh"  colspan="5"><p align="center"><strong>建筑面积</strong></p></td>
      <td width="170" colspan="3"><p>26,648.8 平方米</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>房产证号</strong></p></td>
      <td width="159" colspan="2"><p>宾房权证二龙山字第ND00000036号、第ND00000037号、第ND00000038号、第ND00000039号</p></td>
      <td width="173" class="shheh"  colspan="5"><p align="center"><strong>已用年限</strong></p></td>
      <td width="170" colspan="3"><p>16、20、21年不等</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>附属设施</strong></p></td>
      <td width="501" colspan="10"><p>井房、发电机房、锅炉房等</p></td>
    </tr>
    <tr>
      <td width="113"  class="shheh" colspan="3"><p align="center"><strong>使用年限</strong></p></td>
      <td width="161" colspan="3"><p> </p></td>
      <td width="170" class="shheh"  colspan="3"><p><strong>目前用途</strong></p></td>
      <td width="170" colspan="4"><p>宾馆</p></td>
    </tr>
    <tr>
      <td rowspan="4" class="shheh"  width="88"><p align="center"><strong>土 地</strong></p></td>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>坐落位置</strong></p></td>
      <td width="501" colspan="10"><p>哈尔滨市宾县二龙山风景区湖滨山庄</p></td>
    </tr>
    <tr>
      <td width="113"  class="shheh" colspan="3"><p align="center"><strong>土地证号</strong></p></td>
      <td width="161" colspan="3"><p>宾国用（98）字第0204号、宾国用（2004）字第02010003号</p></td>
      <td width="170" class="shheh"  colspan="3"><p align="center"><strong>土地面积</strong><strong></strong></p></td>
      <td width="170" colspan="4"><p>34852.8平方米</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>类型</strong></p></td>
      <td width="161" colspan="3"><p>出让</p></td>
      <td width="170" class="shheh"  colspan="3"><p align="center"><strong>使用年限</strong></p></td>
      <td width="170" colspan="4"><p>40年</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>已用年限</strong></p></td>
      <td width="501" colspan="10"><p>18.87年、21.64年</p></td>
    </tr>
    <tr>
      <td width="88" class="shheh" ><p align="center"><strong>机 械</strong></p>
        <p align="center"><strong>设 备</strong></p></td>
      <td width="614" colspan="13"><p>详见明细表</p></td>
    </tr>
    <tr>
      <td rowspan="4" class="shheh"  width="88"><p align="center"><strong>机动车</strong></p></td>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>车牌号码</strong></p></td>
      <td width="161" colspan="3"><p>黑L9692A、黑L88L89</p></td>
      <td width="170" class="shheh"  colspan="3"><p align="center"><strong>车  型</strong><strong></strong></p></td>
      <td width="170" colspan="4"><p>金杯面包、猎豹吉普</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>所在地</strong></p></td>
      <td width="161" colspan="3"><p>中国石油天然气股份有限公司哈尔滨石化分公司宾县湖滨山庄资产</p></td>
      <td width="170" class="shheh"  colspan="3"><p align="center"><strong>行驶公里数</strong><strong></strong></p></td>
      <td width="170" colspan="4"><p>21.8万公里</p>
        <p>11万公里</p></td>
    </tr>
    <tr>
      <td width="113"  class="shheh" colspan="3"><p align="center"><strong>购置日期</strong></p></td>
      <td width="161" colspan="3"><p>2012.10.25</p>
        <p>2011.2.28</p></td>
      <td width="170" class="shheh"  colspan="3"><p align="center"><strong>登记日期</strong><strong></strong></p></td>
      <td width="170" colspan="4"><p>2012.10.19</p>
        <p>2011.2.24</p></td>
    </tr>
    <tr>
      <td width="113"  class="shheh" colspan="3"><p align="center"><strong>使用年限</strong></p></td>
      <td width="161" colspan="3"><p>5年、6年</p></td>
      <td width="57" class="shheh" ><p align="center"><strong>颜  色</strong><strong></strong></p></td>
      <td width="113" colspan="2"><p align="center">白</p></td>
      <td width="94" class="shheh"  colspan="3"><p align="center"><strong>数  量</strong><strong></strong></p></td>
      <td width="76"><p>共2台</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>附加信息</strong></p></td>
      <td width="501" colspan="10"><p><img border="0" src="http://www.e-jy.com.cn/ejyzx/uploadfile/20170803162416199.jpg" /></p>
        <p>&nbsp;</p>
        <p><img border="0" src="http://www.e-jy.com.cn/ejyzx/uploadfile/20170803162423323.jpg" /></p>
        <p>&nbsp;</p>
        <p><img border="0" src="http://www.e-jy.com.cn/ejyzx/uploadfile/20170803162429177.jpg" /> </p>
      <p>展样联系人：李女士，0451-55606398。</p></td>
    </tr>
    <tr>
      <td width="702" colspan="14"><p align="left"  class="module-block"   id="d-tbgz"><strong>二、交易条件与受让方资格条件</strong></p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>权利人是否有意向</strong></p>
        <p align="center"><strong>行使优先购买权</strong></p></td>
      <td width="501" colspan="10"><p>否</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh" colspan="4"><p align="center"><strong>价款支付方式</strong></p></td>
      <td width="501" colspan="10"><p align="left">银行转账，网上银行。</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>与转让相关其他条件</strong></p></td>
      <td width="501" colspan="10"><p>1、意向受让方须在挂牌截止日15:00前向黑龙江联合产权交易所指定账户交纳足额保证金（以资金到账为准）。保证金金额1000万元，逾期未交纳保证金的视为放弃受让资格。</p>
        <p>2、如受让成功，该保证金自动转为交易价款。在办理竞买登记手续时，自然人须提交身份证原件；法人单位须提交营业执照原件、组织机构代码证原件、法定代表人身份证原件、授权委托书。</p>
        <p>3、受让方如以协议转让方式成交须按照标的成交价的4‰比例向黑龙江联合产权交易所交纳服务费，如以网络竞价方式成交须按照所竞得标的成交价的5<u>‰</u>比例向黑龙江联合产权交易所交纳服务费。</p>
        <p>4、意向受让方须在被确定为受让方之日起3个工作日内将除保证金以外的剩余交易价款及交易服务费一次性支付至黑龙江联合产权交易所指定账户，并在转款结束后5个工作日内与转让方签订交易合同</p>
        <p>5、若竞买未成功，保证金在5个工作日内按原路径返回。</p>
        <p>6.竞买人在竞价前请务必遵照《电子竞价风险告知及接受确认书》、《黑龙江联合产权交易所竞买人条款》、《会员注册须知》等要求（可点击网页页首&ldquo;用户须知&rdquo;下&ldquo;用户交易规则&rdquo;处，进入查看），了解标的情况、竞买资格、注册报名、保证金交纳、竞买操作及款项支付方式等内容及规则。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买等不利后果，请审慎参与竞买。</p>
        <p>7.用户注册、项目报名及在线竞价具体操作方法可点击网页页首&ldquo;用户须知&rdquo;下&ldquo;用户交易指南&rdquo;处查看。操作过程中请仔细阅读各类系统提示。</p>
        <p>8.交易机构仅接受网上银行、手机银行及柜台转账方式支付保证金、成交价款及服务费等相关款项，不接受现金支付。具体细则请点击进入&ldquo;用户须知&rdquo;下&ldquo;用户交费须知&rdquo;处查看。</p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>受让方资格条件</strong></p></td>
      <td width="501" colspan="10"><p>1、意向受让方应为依法设立并有效存续的境内企业法人或具有完全民事行为能力的自然人。</p>
        <p>2、意向受让方应具有良好的财务状况和支付能力，应具有良好商业信用，无不良经营记录。</p>
        <p>3、意向受让方应符合国家法律、法规规定的其他条件。 </p></td>
    </tr>
    <tr>
      <td width="201" class="shheh"  colspan="4"><p align="center"><strong>重大事项披露</strong></p></td>
      <td width="501" colspan="10"><p>1、此次转让标的为宾县湖滨山庄房屋、土地、设备及车辆，为中国石油天然气股份有限公司哈尔滨石化分公司所有。标的包括房屋建筑、构筑物、管道沟槽、机器设备、电子设备、运输设备及土地资产。标的资产以现状转让，转让资产情况见《资产评估报告》等相关备查文件。</p>
        <p>2、房屋建筑物主要为教学楼、别墅、会馆等共10栋。建筑面积共计26648.8平方米，4号楼、6-10号楼没有产权证，建筑面积共计16864平方米。另外有井房、发电机房、锅炉房等附属设施，没有产权证，账载面积共计732平方米。</p>
        <p>3、土地使用权证号宾国用（2004）第02010003号，座落宾县二龙山地区，使用权面积14,377.80平方米，其中使用权类型为租赁的面积770.00平方米，使用权类型为出让的面积13,607.80平方米，终止日期2037年12月30日，四至分别为东至林地、西至白石山、南至林地、北至林地。</p>
        <p>4、土地使用权证号宾国用（98）第0204号，证载的发证日期为1998年7月26日，地号（98）0204，图号L-52-75-（55），总面积20,475平方米，四至分别为东至二龙山管理局林地、西至哈炼培训中心、南至二龙山管理局林地（冲沟）、北至二龙山管理局林地（道）。</p>
        <p>5、机器设备共计54项，主要是宾馆酒店服务设施及辅助设施等，均分布在湖滨山庄内。机器设备维护、保养、使用正常。</p>
        <p>6、运输设备2辆，分别为猎豹牌CFA6481B和金杯牌SY6513U1S1BH小型普通客车，车辆证照齐全、产权明晰，维护、保养良好。</p>
        <p>7、电子设备23项，详见《标的明细表》，主要为电视机、空调机、酒店家具等，电子设备主要用途为酒店用办公及服务设施，设备配件齐全。</p>
        <p>8、本标的资产中房屋建筑中，1-3号楼、5号楼具有产权证，建筑面积共计9052.8平方米，证载房屋所有权人为哈尔滨炼油厂二龙山职工培训中心。土地使用权证号为宾国用（2004）第02010003号的一期土地，证载土地使用权人为哈尔滨炼油厂二龙山职工学校。土地使用权证号为宾国用（98）第0204号的二期土地，证载土地使用权人为哈尔滨炼油厂。一期土地证载使用权人为哈尔滨炼油厂二龙山职工学校，土地用途是教育用地，使用权人和土地用途与实际使用情况存在差异。二期土地证载使用权人为哈尔滨炼油厂，无土地用途，未注明使用年限。具体情况提醒意向购买方重点关注评估报告（黑龙江）广拓（2017）（估）字第014号。上述资产已出具说明，承诺实际产权归其所有，不存在产权纠纷。详见《关于宾县湖滨山庄情况说明》</p>
        <p>9、本标的资产中，土地使用权证号为宾国用（98）第0204号的二期土地中13875平方米土地取得时由于当时的特殊原因原始手续不健全，档案中只有土地证没有其他资料，同时无建设规划部门批建手续。未来房产和土地涉及相关问题受让方需自行解决，同时转让方不承担房产和土地证过户更名过程中的任何费用。</p>
        <p>10、转让方不保证标的资产的完整性及品质，均以现场实物现状为准，转让方不负责技术质量保证。评估报告和信息发布所载清单、数量在转让范围之内，未在评估报告中体现的家具家电等资产不在转让范围之内。意向受让方在信息公告期间有权利和义务自行对标的资产进行全面了解并谨慎抉择，一经报价，即表明已完全了解与认可标的状况及相关约定，自愿接受转让标的的全部现状及瑕疵，并愿承担一切责任与风险，成为最终受让方后不得以不了解标的状况及资产质量、数量方面的瑕疵等为由退还标的物或拒付价款，否则将视为违约。</p>
        <p>11、标的按其现场展示的状况进行转让和交付，黑龙江联合产权交易所根据转让方提供的相关资料所作的陈述仅供参考，不构成对标的品质状况和可能存在瑕疵的任何保证，不作为标的现状的法律依据和移交凭据，也不作为对标的的任何担保。若实际情况与公告严重不符或故意隐瞒重大应披露事项，由此产生的法律问题及相关责任由转让方承担。</p>
        <p>12、此房产土地与设备车辆打包转让，不拆分。</p></td>
    </tr>
    <tr>
      <td rowspan="6" width="88" class="shheh" ><p align="center"><strong>保</strong></p>
        <p align="center"><strong>证</strong></p>
        <p align="center"><strong>金</strong></p>
        <p align="center"><strong>设</strong></p>
        <p align="center"><strong>定</strong></p></td>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>交纳金额</strong></p></td>
      <td width="501" colspan="10"><p>1000万元</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>交纳截止时间</strong></p></td>
      <td width="501" colspan="10"><p>2017年8月31日15:00前</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>交纳方式</strong></p></td>
      <td width="501" colspan="10"><p>银行转账，网上银行。</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>保证事项</strong></p></td>
      <td width="501" colspan="10"><p align="left">若非转让方原因，出现以下任何一种情况时，视为违约，意向受让方所交纳保证金将全部扣除作为对相关方的补偿：<br />
        ① 在被确定为受让方后未按约定时限与转让方签署交易合同的；<br />
        ② 在被确定为受让方后未按约定时限支付交易价款的；<br />
        ③ 在被确定为受让方后由于受让方原因未办理产权更名过户的；<br />
        ④ 意向受让方存在其他违反交易规则、挂牌条件要求的。</p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>处置方法</strong></p></td>
      <td width="501" colspan="10"><p align="left">意向受让方被确定为受让方的，其交纳的保证金自动转为交易价款；其他意向受让方所交纳的保证金予以全额无息退还。 </p></td>
    </tr>
    <tr>
      <td width="113" class="shheh"  colspan="3"><p align="center"><strong>保证金账户</strong></p></td>
      <td width="501" colspan="10"><p>户名：黑龙江联合产权交易所有限责任公司保证金户</p>
        <p>账号：23001866851052513062</p>
        <p>开户银行：中国建设银行股份有限公司哈尔滨松北支行</p>
        <p>银行行号：105261063000</p></td>
    </tr>
    <tr>
      <td width="702" colspan="14"><p align="left"  class="module-block"    id="d-jytj"><a ><strong>三、信息披露期</strong></a><strong></strong></p></td>
    </tr>
    <tr>
      <td width="146" class="shheh"  colspan="3"><p><strong>信息发布公告期</strong></p></td>
      <td width="214" colspan="3"><p>20个工作日<strong></strong></p></td>
      <td width="174" class="shheh"  colspan="6"><p><strong>信息发布期满后，如未征集到意向受让方</strong><strong></strong></p></td>
      <td width="169" colspan="2"><p>变更公告内容,重新申请信息发布<strong></strong></p></td>
    </tr>
    <tr>
      <td width="702" colspan="14"><p  class="module-block"    id="d-jyzn"><a name="a4" id="a4"><strong>四、竞价方式</strong></a><strong></strong></p></td>
    </tr>
    <tr>
      <td width="88" class="shheh" ><p><strong>竞价方式</strong></p></td>
      <td width="614" colspan="13"><p align="left">1.信息发布期满后，如征集到一家符合条件的意向受让方，则采取协议转让方式确定受让方</p>
        <p>2. 信息发布期满后，如征集到两家及以上符合条件的意向受让方，则采取网络竞价方式确定受让方<strong></strong></p></td>
    </tr>
    <tr>
      <td width="88" class="shheh" ><p><strong>其他附件</strong></p></td>
      <td width="614" colspan="13"><p align="left"><img border="0" src="http://www.e-jy.com.cn/ejyzx/ewebeditor/sysimage/icon16/doc.gif" /><a target="_blank" href="http://www.e-jy.com.cn/ejyzx/uploadfile/20170803161845198.doc">实物资产受让申请书.doc</a><img border="0" src="http://www.e-jy.com.cn/ejyzx/ewebeditor/sysimage/icon16/doc.gif" /><a target="_blank" href="http://www.e-jy.com.cn/ejyzx/uploadfile/20170803161854655.doc">网络竞买须知.doc</a></p></td>
    </tr>
    <tr>
      <td width="702" colspan="14"><p><strong>五、联系方式</strong></p></td>
    </tr>
    <tr>
      <td width="110" class="shheh"  colspan="2"><p><strong>交易机构</strong></p></td>
      <td width="131" colspan="3"><p>黑龙江联合产权交易所</p></td>
      <td width="119" class="shheh" ><p><strong>交易机构联系人</strong></p></td>
      <td width="111" colspan="3"><p align="center">尹先生</p></td>
      <td width="61" class="shheh" ><p><strong>交易机构联系电话</strong></p></td>
      <td width="170" colspan="4"><p align="">0451-58894175</p></td>
    </tr>
  </tbody>
</table>
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
                                <a href="/infodetail?infoid=b4d564c1-6bae-4bff-a13e-1fa1bf65516d&categoryNum=001001001&pageName=f1" title="">
                                    <img src="images/linshi/fang-pic-1.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[常州市]</span>常州市怀德南路90号（一层、五层）房产竞价公告</dt>
                                        <dd>
                                            <span>转让底价：<span class="fcdd3">10,326,000.00元</span></span>
                                        </dd>
                                    </dl>
                                </a>
                            </li>
                            <li>
                                <a href="infodetail?infoid=d655a5e6-e66b-45c9-b86d-48657c9b8fed&categoryNum=001001001&pageName=f2" title="">
                                    <img src="images/linshi/fang-pic-2.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[常州市]</span>常州市五角场东村13幢8号房产竞价公告</dt>
                                        <dd>
                                            <span>转让底价：<span class="fcdd3">2,000,000.00元</span></span>
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
    			var point = new BMap.Point(127.42905,45.72713);    
    			map.centerAndZoom(point, 18);    
    			var marker = new BMap.Marker(point);        // 创建标注    
    			map.addOverlay(marker);                     // 将标注添加到地图中
     			map.enableScrollWheelZoom();
    			
     		    var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                '<img src="http://www.e-jy.com.cn//ejyzx/uploadfile/20170629101706001.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                '哈尔滨湖滨山庄地处国家AAAA级旅游胜地——宾县二龙山，位于二龙山景区内，集旅游度假、会议、餐饮、住宿于一体' +
				'</div>';

				//创建检索信息窗口对象
				var searchInfoWindow = null;
				searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
						title  : "宾县湖滨山庄",      //标题
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
