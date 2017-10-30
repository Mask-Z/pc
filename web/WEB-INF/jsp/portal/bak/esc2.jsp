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
				<c:forEach items="${mediainfo.pics }" var="pic">
					<div class="item"><img src="http://www.e-jy.com.cn/${pic.bpath }" width="480" height="360" rel="http://www.e-jy.com.cn/${pic.bpath }" ></div>
				</c:forEach>
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
              <span class="label"><b>自动档</b><i></i></span>
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
            		<div class="list">
	                    <span class="laber">转让底价</span><span class="money">5,600.00</span>元
	                </div>
	                <div class="list">
	                    <span class="laber">保证金 </span><span class="money">2,000.00</span>元 
	                </div>
	                <div class="list">
	                    <span class="laber">里程 </span><span class="money">25,9945</span> 公里
	                </div>
	                <div class="list">
	                    <span class="laber">变速箱 </span><span class="fcdd3 f16">自动</span> 
	                </div>
	                 <div class="list">
	                    <span class="laber">注册日期</span><span class="fcdd3 f16">2002年5月</span> 
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
            <dd>沈先生 </dd>
        </dl>
        <dl class="dispatching">
            <dt>联系电话：</dt>
            <dd>0519-86626778<br/>  18912303519 </dd>
        </dl>
        <dl class="dispatching">
            <dt>单位地址：</dt>
            <dd>常州市新北区龙锦路1259-2号11楼1106室（奥体明都饭店东侧大楼）</dd>
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
    <td width="167" colspan="2" class="shheh" ><p align="center">项目名称 </p></td>
    <td width="161" colspan="2"><p align="left">苏D-19039帕萨特牌轿车转让公告 </p></td>
    <td width="132" colspan="3" class="shheh" ><p align="center">项目编号 </p></td>
    <td width="145" colspan="3"><p align="left">01CL20160161 </p></td>
  </tr>
  <tr>
    <td width="167" colspan="2" class="shheh" ><p align="center">挂牌起始日期 </p></td>
    <td width="161" colspan="2"><p align="left">2016年11月18日 </p></td>
    <td width="132" colspan="3" class="shheh" ><p align="center">挂牌截止日期 </p></td>
    <td width="145" colspan="3"><p>2016年11月28日 </p></td>
  </tr>
  <tr>
    <td width="167" colspan="2" class="shheh" ><p align="center">挂牌期满，如未征集到意向受让方 </p></td>
    <td width="438" colspan="8"><p align="left">挂牌期满后如未征集到意向受让方，按（5）个工作日为周期延牌，最多延长（24）个周期。 </p></td>
  </tr>
  <tr>
    <td width="63" rowspan="8" class="shheh" ><p align="center">标的<br />
      概况 </p></td>
    <td width="104" class="shheh" ><p align="center">标的（车牌号） </p></td>
    <td width="81"><p align="left">苏D-19039 </p></td>
    <td width="80" class="shheh" ><p align="center">注册日期 </p></td>
    <td width="109" colspan="2"><p align="left">2002.5</p></td>
    <td width="79" class="shheh"  colspan="2"><p align="center">年审期限 </p></td>
    <td width="89" colspan="2"><p align="left">2016.5</p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">品牌型号 </p></td>
    <td width="81"><p align="left">帕萨特SVW7183BG1</p></td>
    <td width="80" class="shheh" ><p align="center">发动机号码 </p></td>
    <td width="109" colspan="2"><p align="left">ANQ0064931</p></td>
    <td width="79" class="shheh"  colspan="2"><p align="center">车架号 </p></td>
    <td width="89" colspan="2"><p align="left">LSVCB49F812085775</p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">排量（ml） </p></td>
    <td width="81"><p align="left">1781</p></td>
    <td width="80" class="shheh" ><p align="center">燃油种类 </p></td>
    <td width="109" colspan="2"><p align="left">汽油 </p></td>
    <td width="80" class="shheh"  colspan="3"><p align="center">变速箱 </p></td>
    <td width="88"><p align="left">自动 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">历程表公里数（仅供参考） </p></td>
    <td width="81"><p align="left">259945</p></td>
    <td width="80" class="shheh" ><p align="center">车辆类型 </p></td>
    <td width="109" colspan="2"><p align="left">轿车 </p></td>
    <td width="80"  class="shheh" colspan="3"><p align="center">车辆颜色 </p></td>
    <td width="88"><p align="left">黑 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">商业险 </p></td>
    <td width="81"><p align="left">无 </p></td>
    <td width="80" class="shheh" ><p align="center">交强险 </p></td>
    <td width="277" colspan="6"><p align="left">2016.12.26</p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">转让底价 </p></td>
    <td width="438" colspan="8"><p align="left">5600元 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">车辆现状、违章、亮点 </p></td>
    <td width="438" colspan="8"><p align="left">发动机渗油、油漆一般，内饰一般。<strong>(信息摘自评估报告，仅供参考）</strong> <br />
      <strong>车辆无前进挡。</strong>需承担补年审费及罚款 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">附件 </p></td>
    <td width="438" colspan="8"><p align="left">无 </p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="63" class="shheh" ><p align="center" >特别<br />
      告知 </p></td>
    <td width="542" colspan="9"><p align="left">1.标的以展示时的品质现状、权利属性以及权益状况进行公开竞价，竞买人应在车辆展示期间现场查看车况，自行了解车辆性能、质量、权属和欠费等信息。 <br />
      2.产交所不保证车辆能否正常使用以及所有部件、配件的完整性和完好性。发生影响车辆使用的情形均由买受人负责解决并承担费用。 <br />
      3.竞买人必须充分估计二手车市场风险，包括但不限于二手车市场价变化、车辆交易规定调整、车辆多日停驶造成的故障等。 <br />
      <strong>4.</strong><strong>竞买人须自备终端进行网络竞价，本所不提供竞价场所。</strong></p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"   id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="63" class="shheh"  rowspan="4"><p align="center" >交易<br />
    条件 </p></td>
    <td width="104" class="shheh" ><p align="center">交易价款 </p></td>
    <td width="438" colspan="8"><p>成交之日起<u> 5 </u>个工作日内按系统提示付清。 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">与转让相关的其他条件 </p></td>
    <td width="438" colspan="8"><p align="left">无 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">竞买资格 <br />
      条件 </p></td>
    <td width="438" colspan="8"><p>凡具有完全民事行为能力的自然人、法人或其他组织均可参与本项目 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">标的交割 </p></td>
    <td width="438" colspan="8"><p align="left"><strong>1.</strong><strong>交割时间: </strong>买受人付清全部标的成交款和服务费后<strong>5个工作日内</strong>过户完毕。 <br />
      <strong>2.</strong><strong>交割方式:</strong> <br />
      （1）为确保车辆过户安全，本次竞价的车辆过户，由产交所指定中介机构在要求时间内集中办理相关手续，买受人必须服从指定中介机构的安排，不可委托其他经纪人或中介机构办理车辆变更登记手续。交割完成后双方签订《资产交割书》。 <br />
      （2）买受人在办理车辆过户时应提交车辆过户所需的材料。逾期未办理的，责任自负。车辆过户材料如下： <br />
      ① 买受人为单位，需提供企业营业执照副本、组织机构代码证原件、复印件及单位公章。 <br />
      ② 买受人为个人的，需提供本人身份证、户口簿原件及复印件，非常州地区的买受人还必须提供有效的常州地区居住证（注：必须上公安人口信息网，居住证登记时间不少于6个月）。 <br />
      ③ 车辆转出市外，只代办提供常州市车管所车辆档案、附加费档案，如暂缺附加费证的可以补办。转入外地登记手续均由买受人自行办理，本地档案一律不得返回。竞买人须自行了解车辆转入区域入籍手续的要求及车辆有关使用年限等规定，竞价成交的车辆一旦办理完转出手续后发生不能入籍的情况，涉及的一切责任均由买受人承担。 <br />
      （3）买受人办理车辆过户手续，应支付下述款项： <br />
      ① 单位车辆支付车价3%的交易费及税金，个人车辆支付车价1%的交易费。 <br />
      ② 按国家有关规定应支付的车辆相关过户费用，包括牌照号费、评估手续费、市场服务费、刮号费、脱牌费等。 <br />
      ③ 支付车辆的市内过户服务费200元/辆或转籍服务费300元/辆。 <br />
      ④ 车辆的保险从单位过户到个人可能需补交的差额费用<strong>（车辆保险过户手续由买受人自行办理）</strong>。 <br />
      （4）办理好车辆过户手续并取得相关证件后，在指定办证中介机构通知的时间和地点，买受人自行提取车辆，买受人逾期提车的，应当按停车场规定承担停车费。买受人取得证件后的各项税费（包括但不限于保险费、车船税等）由买受人承担。提取成交车辆后所发生的一切风险和责任均由买受人承担。 <br />
      （5）部分车辆使用年限久远，买受人过户申领环保标志时，应按环保局相关规定办理。 <br />
      （6）如有部分车辆缺失证件和材料，必须按有关规定补办，费用由买受人自行承担，由此影响车辆变更进程，买受人取得新的车辆证件、提取车辆时间将会延期，敬请买受人谅解。 <br />
      （7）鉴于车辆转让的特殊性，竞价成交的车辆如遇特殊情况（包括但不限于车辆过户等政策变更、黄标车辆，已披露的除外），致使车辆无法办理过户手续，买受人有权要求退还车辆成交款及服务费，但不得要求委托人和产交所承担责任。 </p></td>
  </tr>
      </table>
  </div>
  <br />
<div   class="module-block"   id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="63" rowspan="7" class="shheh" ><p align="center" >交易<br />
      指南 </p></td>
    <td width="104" class="shheh" ><p align="center">竞价规则 </p></td>
    <td colspan="8"><p align="left">竞买方在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn/index">www.e-jy.com.cn</a>）的<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6&amp;categoryNum=027001">《e交易平台竞价交易规则》</a>、<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=ef7859f2-f1ae-4b0b-b002-eb62a59f8818&amp;categoryNum=034001">《e交易平台产权交易操作指南》</a>等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">现场展示 </p></td>
    <td colspan="8"><p align="left">1.展示时间：2016年11月22日至2016年11月23日（联系后统一组织看样）。 <br />
      2.展示地点：常州市新北区昆仑路1号福隆汽修厂内。 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh"  rowspan="2"><p align="center">竞买报名 </p></td>
    <td class="shheh"  colspan="2"><p align="center">报名截止时间 </p></td>
    <td colspan="6"><p align="left">2016年11月28日 </p></td>
  </tr>
  <tr>
    <td  class="shheh" colspan="2"><p align="center">保证金及处置方式 </p></td>
    <td colspan="6"><p align="left">1.缴纳：金额<u>&nbsp;2000&nbsp; </u>元，截止时间<u> 2016年11月28日</u>，按系统提示缴纳。 <br />
      2.退还：买受人缴纳的保证金在标的过户完毕后退还，其他竞价人的保证金将于成交后的3个工作日内退还。 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh"  rowspan="2"><p align="center">竞价安排 </p></td>
    <td class="shheh"  colspan="2"><p align="center">竞价方式 </p></td>
    <td width="193"><p align="left">加价竞价 </p></td>
    <td class="shheh"  colspan="4"><p align="center">增价幅度 </p></td>
    <td width="105"><p align="left">500元 </p></td>
  </tr>
  <tr>
    <td  class="shheh" colspan="2"><p align="center">自由竞价时间 </p></td>
    <td width="193"><p align="left">2016年11月29日10:25至14:25 </p></td>
    <td class="shheh"  colspan="4"><p align="center">延时竞价周期 </p></td>
    <td width="105"><p align="left">1分钟 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">服务费 </p></td>
    <td colspan="8"><p>成交价的<u> 5 </u>%，成交之日起<u> 1 </u>个工作日内按系统提示付清。 </p></td>
  </tr>
  <tr>
    <td width="63" class="shheh"  rowspan="5"><p align="center">联系<br />
      方式 </p></td>
    <td width="104" class="shheh" ><p align="center">标的咨询 </p></td>
    <td colspan="8"><p align="left">沈先生&nbsp; 0519-86626778&nbsp; 18912303519</p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">技术支持 </p></td>
    <td colspan="8"><p align="left">陈先生&nbsp; 0519-89890395&nbsp; 18168811556</p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">咨询时间 </p></td>
    <td colspan="8"><p>公告之日起至2016年11月28日止接受咨询（节假日除外） </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">单位地址 </p></td>
    <td colspan="8"><p>常州市新北区龙锦路1259-2号 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="center">其    他 </p></td>
    <td colspan="8"><p align="center">&nbsp;</p></td>
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
                               <a href="infodetail?infoid=3d444313-fcda-44e2-a2a1-e339da9c7a28&categoryNum=001001003&pageName=esc1" title="">
                                    <img src="images/linshi/che-pic-1.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[常州市]</span>苏D61037别克牌商务车竞价公告</dt>
                                        <dd>
                                            <span>转让底价：<span  class="fcdd3">55,100.00元</span></span>
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
