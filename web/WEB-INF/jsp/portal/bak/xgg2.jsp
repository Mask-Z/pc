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
             	<div class="item"><div id="map" style="width:480px;height:360px"></div></div>
				<c:forEach items="${mediainfo.pics }" var="pic">
					<div class="item"><img src="http://www.e-jy.com.cn/${pic.bpath }" width="480" height="360" rel="http://www.e-jy.com.cn/${pic.bpath }" ></div>
				</c:forEach>
             </div>
              
             <div id="cbtn">
                <i class="picSildeLeft preview-control forward"></i> 
                <i class="picSildeRight preview-control backward"></i> 
                <div id="cSlideUl">
                    <ul>
                    	<!-- 地图 -->
		        		<li>
		       				<img src="<%=basePath%>images/map.png" >
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
	                    <span class="laber">租金底价</span><span class="money">185,600</span> 元/年
	                </div>
	                <div class="list">
	                    <span class="laber">承租押金</span><span class="money">40,000</span> 元
	                </div>
	                <div class="list">
	                    <span class="laber">租赁期限</span><span class="money">3</span> 年
	                </div>
	                <div class="list">
	                    <span class="laber">租赁面积</span><span class="money">670</span> m²
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
            <li><a href="javascript:;" target="_blank"><img src="<%=basePath%>html/img2/czcq-ico-1.png" alt="常州产权交易所"  height="50"></a></li>
            <li><a href="javascript:;" target="_blank">常州产权交易所</a></li>
        </ul>
        <dl class="dispatching">
            <dt>联  系  人：</dt>
            <dd>杨女士<br/>李先生</dd>
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
               <!-- <li class="survey switch" onclick="myclick(4)">成交公告</li>-->
            </ul>
            <div id="tab1_content" class="detail-tabcon clearfix" style="display: block;">
<div class="ph12">
<div   class="module-block"  id="d-bdgk">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td class="shheh"  colspan="3"><p align="center">项目名称 </p></td>
    <td colspan="2"><p align="left">丁塘河湿地公园内北面第二艘龙舟招租公告 </p></td>
    <td class="shheh"  colspan="2"><p align="center">项目编号 </p></td>
    <td width="182" colspan="3"><p>01FCZZ20170076</p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="3"><p align="center">挂牌起始日期 </p></td>
    <td colspan="2"><p align="left">2017年7月25日 </p></td>
    <td class="shheh"  colspan="2"><p align="center">挂牌截止日期 </p></td>
    <td colspan="3"><p align="left">2017年8月2日 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="3"><p align="center">挂牌期满，如未征集到意向承租方 </p></td>
    <td colspan="7"><p>挂牌期满后，如未征集到意向受让方，变更挂牌条件，重新挂牌 </p></td>
  </tr>
  <tr>
    <td width="53" class="shheh"  rowspan="6"><p align="center">标的 <br />
      概况 </p></td>
    <td class="shheh"  colspan="2"><p align="center">标的坐落 </p></td>
    <td colspan="2"><p align="left">常州市丁塘河湿地公园 </p></td>
    <td class="shheh"  colspan="2"><p align="center">标的状态 </p></td>
    <td colspan="3"><p>空置 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="center">租赁面积约（㎡） </p></td>
    <td colspan="2"><p>670</p></td>
    <td class="shheh"  colspan="2"><p align="center">租赁期限（年） </p></td>
    <td colspan="3"><p>3</p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="center">承租押金(元)</p></td>
    <td colspan="2" valign="top"><p>40000</p></td>
    <td class="shheh"  colspan="2" valign="top"><p align="center">租金支付方式 </p></td>
    <td colspan="3" valign="top"><p>半年一付，先付后用 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="center">年租金底价（元） </p></td>
    <td colspan="7" valign="top"><p align="left">租金底价租金底价为第1年租金185600元；第2年租金191200元；第3年租金196800元。为第1年租金185600元；第2年租金191200元；第3年租金196800元。 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="center">其他情况 </p></td>
    <td colspan="7" valign="top"><p>1.物业费管理按照承租人与公园管理处签订的物管协议执行（暂定约2.5元/平方米/月）。 <br />
      2.标的物无下水通道。 <br />
      3.为保证承租人合理并善意地使用租赁房屋及配套设施，承租人在签订《房屋租赁合同书》时须向出租人支付承租押金40000元，承租押金分为履约保证金35000元和结构保证金5000元。若承租人发生违约行为，出租人有权扣除履约保证金；如使用过程中出现装修破损由承租人自行维修，如房屋交接时承租人仍未维修，对于门、窗、地板等固定装饰破损，出租人有权扣除结构保证金。 <br />
      4.承租人享有二个月免租金装修期。 <br />
      5.承租人为民营企业的，需提供个人担保。 </p></td>
  </tr>
  <tr>
    <td colspan="2"  class="shheh" ><p align="center">附件 </p></td>
    <td colspan="7"><p align="center">&nbsp;</p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="103" class="shheh" ><p align="center">特别 <br />
      告知 </p></td>
    <td width="786" colspan="9"><p><a name="OLE_LINK3" id="OLE_LINK3">1.</a>本次招租标的按现状出租。 <br />
      2.房屋租赁面积以现场展示为准，出租人及产交所不承担招租标的中租赁面积与实测面积差异等责任，不调整相应的租金价格。 <br />
      3.意向承租人有责任自行或委托专人了解招租标的的状况，决定报价，并对自己的出价行为承担法律责任。 <br />
      4.招租标的的底价、成交价均不含承租人在租赁中应缴纳的水电、物业等有关费用。 <br />
      5.本次招租标的租金为含增值税价。 <br />
      6.招租标的尚未办理不动产权证，承租人应接受该标的现状，成交后，不能以该现状影响其工商、消防手续办理，致使不能按预想方案使用房屋为由，要求解除、变更《房屋租赁合同书》，并要求出租人承担赔偿责任。 <br />
      <a name="OLE_LINK4" id="OLE_LINK4">7. </a>竞买人自备终端进行网络竞价，本所不提供竞价场所。 <br />
      8. 本次招租公告到期后若未征集到符合条件的意向承租人，出租人在不变更信息发布内容的情况下延长信息发布期限。详情点击<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=81b2a91d-7638-4531-a985-1be3489ea5ab&amp;categoryNum=031001">《2017年房地产长期公开招租竞价公告》</a>。 </p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="83" class="shheh"  rowspan="4"><p align="center">交易 <br />
      条件 </p></td>
    <td width="119" class="shheh" ><p align="center">交易价款 </p></td>
    <td width="687" colspan="8"><p align="left">承租人应在租赁起始日前，将租金、承租押金支付至出租人指定账户，若逾期付款，每日按逾期额的千分之五向出租人支付违约金。逾期付款超过30天，视承租人根本违约。 </p></td>
  </tr>
  <tr>
    <td width="119" class="shheh" ><p align="center">与租赁相关的其他条件 </p></td>
    <td colspan="8"><p align="left">—— </p></td>
  </tr>
  <tr>
    <td width="119" class="shheh" ><p align="center">竞租资格 <br />
      条件 </p></td>
    <td colspan="8"><p align="left">凡具有完全民事行为能力的自然人、法人或其他组织均可参与本项目。 </p></td>
  </tr>
  <tr>
    <td width="119" class="shheh" ><p align="center">标的交割 </p></td>
    <td colspan="8"><p>1.承租人必须于竞价结束后出租人通知时间内至出租人处签署《房屋租赁合同书》并提交以下资料：&nbsp;&nbsp; <br />
      ① 自然人身份证原件； <br />
      ② 法人或其他组织工商执照复印件、授权委托书与公章； <br />
      ③ 出租人要求的其他材料。 <br />
      2.承租人未履行上述规定的，产交所或出租人有权视作承租人放弃标的。承租人放弃或视作放弃招租标的，该标的可再次招租，如租金低于原成交租金的，违约承租人应当补足差额。 <br />
      3.在被确认为承租人前，若因招租标的撤销等情形致使意向承租人无法竞价时，无论何种情况，意向承租人不得向产交所主张除退取保证金之外的任何权利。成交后，如标的因出租人原因最终不能完成交付手续的，与产交所无关，承租人仅有权要求产交所退还保证金（不计息）。 <br />
      4.承租人必须于竞价结束后出租人通知时间内至出租人处签署《房屋租赁合同书》。 <br />
      5.本次招租产交所系受出租人委托，出租人已承诺在《房屋租赁合同书》规定的租赁起算日前将租赁房屋交付给承租人，因承租人未及时付清应付款项的，出租人有权拒绝交付标的且不承担违约责任，实际租赁期不进行顺延，由此造成的经济损失全部由承租人自行承担。本次招租标的以交付时现状进行交付，出租人不保证房屋及附属的设施、设备的完好，交付房屋时如含装修部分，承租人不需使用的，经出租人书面同意后由承租人自行拆除，费用自理。 <br />
      6.承租人在承租期内应以自用的方式直接使用所租赁的经营场地，未经出租人同意不得擅自将该场地以转租、出租、转借、调换等形式给予第三方使用，否则视为承租人违约。承租人应向出租人支付违约金。同时，出租人有权单方面终止合同，及不返还承租人的押金和已付租金，并就因承租人所造成的损失向承租人索赔。对于虽不属于上述方式，但具有同等性质的行为也一律将视为违约行为，应由承租人承担相应违约责任金。 </p></td>
  </tr>
      </table>
  </div>
  <br />
<div   class="module-block"  id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="53" class="shheh"  rowspan="8"><p align="center">交易 <br />
      指南 </p></td>
    <td width="122" class="shheh" ><p align="center">竞价规则 </p></td>
    <td colspan="8"><p align="left">竞买人在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn/index">www.e-jy.com.cn</a>）的<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6&amp;categoryNum=027001">《e交易平台竞价交易规则》</a>、<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=ef7859f2-f1ae-4b0b-b002-eb62a59f8818&amp;categoryNum=034001">《e交易平台-产权交易操作指南》</a>等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 </p></td>
  </tr>
  <tr>
    <td width="122" class="shheh" ><p align="center">现场展示 </p></td>
    <td colspan="8"><p>1.时间:2017年7月25日至2017年8月2日（联系后组织察看标的)。 <br />
      2.地点:标的所在地。 </p></td>
  </tr>
  <tr>
    <td width="122" class="shheh"  rowspan="3"><p align="center">竞买报名 </p></td>
    <td class="shheh"  colspan="2"><p align="center">报名时间 </p></td>
    <td colspan="6"><p>2017年7月25日——2017年8月2日 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="center">报名手续 </p></td>
    <td colspan="6"><p>—— </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="center">保证金及处置方式 </p></td>
    <td colspan="6"><p>1.缴纳：金额<u>56000</u>元，截止时间<u>2017年8月2日24:00</u>，按系统提示缴纳。 <br />
      2.退还：承租人缴纳房租并签署《房屋租赁合同书》后退还，其他竞价人的保证金将于成交后的3个工作日内退还。 </p></td>
  </tr>
  <tr>
    <td width="122" class="shheh"  rowspan="2"><p align="center">竞价安排 </p></td>
    <td class="shheh"  colspan="2"><p align="center">竞价方式 </p></td>
    <td colspan="2"><p align="left">加价竞价 </p></td>
    <td class="shheh"  colspan="2"><p align="center">增价幅度 </p></td>
    <td width="181" colspan="2"><p align="left">2000元 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="center">自由竞价时间 </p></td>
    <td colspan="2"><p align="left">2017年8月3日14:00至15:00止 </p></td>
    <td class="shheh"  colspan="2"><p align="center">延时竞价周期 </p></td>
    <td colspan="2"><p>1分钟 </p></td>
  </tr>
  <tr>
    <td width="122" class="shheh" ><p align="center">服务费 </p></td>
    <td colspan="8"><p align="left">租金成交总价的<u>0</u>% </p></td>
  </tr>
  <tr>
    <td width="53" class="shheh"  rowspan="5"><p align="center">联系 <br />
      方式 </p></td>
    <td width="122" class="shheh" ><p align="center">标的咨询 </p></td>
    <td colspan="8"><p align="left">杨女士 李先生 0519-86677336</p></td>
  </tr>
  <tr>
    <td width="122" class="shheh" ><p align="center">技术支持 </p></td>
    <td colspan="8"><p align="left">杨先生 0519-89890395</p></td>
  </tr>
  <tr>
    <td width="122" class="shheh" ><p align="center">咨询时间 </p></td>
    <td colspan="8"><p align="left">自公告之日起至2017年8月2日17:00止（节假日除外） </p></td>
  </tr>
  <tr>
    <td width="122" class="shheh" ><p align="center">单位地址 </p></td>
    <td colspan="8"><p align="left">常州市新北区龙锦路1259-2号11楼 </p></td>
  </tr>
  <tr>
    <td width="122" class="shheh" ><p align="center">其他 </p></td>
    <td colspan="8"><p align="left">——</p></td>
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
                                  <a href="infodetail?infoid=cccdcd27-b6ad-43bf-bab1-77eba03b49cb&categoryNum=001001009&pageName=fczz2" title="">
                                    <img src="images/linshi/fczz2.jpg" width="100%" title="">
                                    <dl>
                                        <dt><span class="fcdd3">[常州产权交易所]</span>南大街28-404室等16处房产整体招租竞价公告</dt>
                                        <dd>
                                            <span>租金底价：<span  class="fcdd3">296,164.00元/年 </span></span>
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
