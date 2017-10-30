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
	                    <span class="laber">转让底价</span><span class="money">465,000.00 </span> 
	                </div>
	                <div class="list">
	                    <span class="laber">保证金 </span><span class="money">50,000.00</span> 
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
            <li><a href="javascript:;" target="_blank"><img src="<%=basePath%>html/img2/czcq-ico-4.png" alt="江苏省产权交易所"  height="50"></a></li>
            <li><a href="javascript:;" target="_blank">江苏省产权交易所</a></li>
        </ul>
        <dl class="dispatching">
            <dt>联  系  人：</dt>
            <dd>郜先生</dd>
        </dl>
        <dl class="dispatching">
            <dt>联系电话：</dt>
            <dd>025-83163361<br/>  025-83163361 </dd>
        </dl>
        <dl class="dispatching">
            <dt>单位地址：</dt>
            <dd>江苏省产权交易所</dd>
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
    <td width="73"  class="shheh" ><p align="left">项目名称 </p></td>
    <td colspan="4"><p align="left">一批茅台酒公开转让公告 </p></td>
    <td class="shheh"  colspan="3"><p align="left">项目编号 </p></td>
    <td colspan="3"><p align="left">17QT20170013</p></td>
  </tr>
  <tr>
    <td width="73"  class="shheh" ><p align="left">挂牌起始日期 </p></td>
    <td colspan="4"><p align="left">2017-07-28</p></td>
    <td class="shheh"  colspan="3"><p align="left">挂牌截止日期 </p></td>
    <td colspan="3"><p align="left">2017-08-14</p></td>
  </tr>
  <tr>
    <td width="73" class="shheh" ><p align="left">挂牌期满，如未征集到意向受让方 </p></td>
    <td colspan="10"><p align="left">公告期内如无意向受让方报名，则本公告自动延期5个工作日。 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh"  rowspan="6"><p align="center">标的<br />
      概况 </p></td>
    <td  class="shheh" colspan="10"><p align="left">标的清单 </p></td>
  </tr>
  <tr>
    <td width="174" class="shheh" ><p align="left">序号 </p></td>
    <td width="178" class="shheh" ><p align="left">标的名称 </p></td>
    <td class="shheh"  colspan="4"><p align="left">规格 </p></td>
    <td class="shheh"  colspan="2"><p align="left">数量 </p></td>
    <td width="116" class="shheh"  colspan="2"><p align="left">单位 </p></td>
  </tr>
  <tr>
    <td width="174"><p align="left">1</p></td>
    <td width="178"><p align="left">50年茅台 </p></td>
    <td colspan="4"><p align="left">53度，500ml,出厂日期为2000年至2009年不等，具体日期以实际移交时为准。 </p></td>
    <td colspan="2"><p align="left">30</p></td>
    <td width="116" colspan="2"><p align="left">件 </p></td>
  </tr>
  <tr>
    <td width="174" class="shheh" ><p align="left">转让底价 </p></td>
    <td colspan="9"><p align="left">50000元 </p></td>
  </tr>
  <tr>
    <td width="174" class="shheh" ><p align="left">标的现状 </p></td>
    <td colspan="9"><p align="left">——</p></td>
  </tr>
  <tr>
    <td width="174" class="shheh" ><p align="left">附件 </p></td>
    <td colspan="9"><p align="left">承诺函 </p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-tbgz">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="133" class="shheh" ><p align="center">特别<br />
      告知 </p></td>
    <td width="756" colspan="10"><p align="left">一、转让方合法持有转让标的物并对转让标的物拥有完整的处置权。转让标的物的真伪已由贵州茅台酒股份有限公司知识产权部门进行鉴定，转让方及江苏省产权交易所不对酒水的真伪和质量作出承诺或承担责任； <br />
      二、本批转让标的物为合计30件贵州茅台酒； <br />
      三、该批酒水出厂时间及存放年限各异，对在保存过程中因酒水本身物理化学性质而导致的重量、浓度、性状变化，需由意向受让方自行评判，转让方及江苏省产权交易所对此不做任何形式的保证，不承担任何责任； <br />
      四、转让标的物现存放于江苏省产权交易所仓库中，实际状况以实物现状为准，照片仅供参考，一旦成交，受让方须按转让标的物的现状受让，不得以不了解转让标的物现状为理由拒绝受让； <br />
      五、受让方须在江苏省产权交易所规定时限内完成酒水的搬运和转移； <br />
      六、受让方须付清所有款项后，方可办理转让标的物的交接、装运等工作，转让标的物的装箱、搬送、运输等工作及产生的费用均由受让方自行承担，在装箱、搬送、运输过程中转让标的物的安全性和完整性均由受让方负责，如因受让方原因造成转让标的物损坏，由受让方自行承担相应损失； <br />
      七、意向受让方在申请受让前应当认真仔细阅读本公告，一旦成为受让方，须接受本公告相应条款的约束； <br />
      以上情况说明仅供参考，不排除有未知事项及瑕疵的存在（包括但不限于已告知的瑕疵），转让方及江苏省产权交易所对此不承担任何责任；受让方参与竞买，即表明受让方愿意按照转让标的物的实际状况竞买，受让方应充分考虑瑕疵风险因素及其他综合因素，慎重竞买。 </p></td>
  </tr>
    </table>
  </div>
  <br />
<div   class="module-block"  id="d-jytj">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="129" class="shheh"  rowspan="4"><p align="center">交易<br />
      条件 </p></td>
    <td width="141" class="shheh" ><p align="center">交易价款 </p></td>
    <td width="619" colspan="9"><p>付款方式：银行转账 <br />
      付款期限：挂牌公告期内交纳 </p></td>
  </tr>
  <tr>
    <td width="141" class="shheh" ><p align="center">与转让相关的其他条件 </p></td>
    <td width="619" colspan="9"><p align="left">——</p></td>
  </tr>
  <tr>
    <td width="141" class="shheh" ><p align="center">竞买资格 <br />
      条件 </p></td>
    <td width="619" colspan="9"><p>一、意向受让方应具有完全民事行为能力的自然人或依法设立并有效存续的企业法人； <br />
      二、应具有良好的支付能力，受让资金来源合法； <br />
      三、应符合国家法律、行政法规规定的其他条件，参与本次收购不存在其他法律、法规规定的禁止性情形。 </p></td>
  </tr>
  <tr>
    <td width="141" class="shheh" ><p align="center">标的交割 </p></td>
    <td width="619" colspan="9"><p>——</p></td>
  </tr>
      </table>
  </div>
  <br />
<div   class="module-block"   id="d-jyzn">
<table border="0" cellspacing="0" cellpadding="0" width="890" style="" class="base-sw">
  <tr>
    <td width="73" class="shheh"  rowspan="8"><p align="center">交易<br />
      指南 </p></td>
    <td width="104" class="shheh" ><p align="left">竞价规则 </p></td>
    <td colspan="9"><p align="left">竞买方在竞价前请务必遵照e交易平台（<a href="http://www.e-jy.com.cn/index">www.e-jy.com.cn</a>）的<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6&amp;categoryNum=027001">《e交易平台竞价交易规则》</a>、<a href="http://www.e-jy.com.cn/ejy/infodetail/?infoid=ef7859f2-f1ae-4b0b-b002-eb62a59f8818&amp;categoryNum=034001">《e交易平台产权交易操作指南》</a>等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="left">现场展示 </p></td>
    <td colspan="9"><p align="left">—— </p></td>
  </tr>
  <tr>
    <td width="104"  class="shheh" rowspan="3"><p align="left">竞买报名 </p></td>
    <td class="shheh"  colspan="2"><p align="left">报名时间 </p></td>
    <td colspan="7"><p align="left">2017-07-28—2017-08-14</p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="left">报名手续 </p></td>
    <td colspan="7"><p>意向受让方须上传材料如下：<br />
      （一）意向受让方为企业法人的应提供： <br />
      1.企业法人营业执照复印件和组织机构代码证或其他主体资格证明文件（复印件加盖公章）； <br />
      2.现行有效的公司章程（原件）； <br />
      3.公司制企业应提供股东会（或有权的董事会）同意受让的决定（原件）； <br />
      4.对上述&ldquo;意向受让方须承诺事项&rdquo;的书面承诺（原件）。 <br />
      （二）意向受让方为自然人的应提供： <br />
      1.身份证复印件； <br />
      2.对上述&ldquo;意向受让方须承诺事项&rdquo;的书面承诺（原件）。 </p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="left">保证金及处置方式 </p></td>
    <td colspan="7"><p align="left">一、意向受让方在公告期内向江苏省产权交易所提交交易保证金，以确定其参与竞买； <br />
      二、在被确定为受让方后3个工作日内一次性将交易价款付至江苏省产权交易所指定账户。 <br />
      三、按照江苏省产权交易所制定的《产权交易资金结算规则》执行。 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh"  rowspan="2"><p align="left">竞价安排 </p></td>
    <td class="shheh"  colspan="2"><p align="left">竞价方式 </p></td>
    <td colspan="2"><p align="left">动态报价 </p></td>
    <td class="shheh"  colspan="3"><p align="left">增价幅度 </p></td>
    <td width="85"><p align="left">200元 </p></td>
    <td width="21"><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td class="shheh"  colspan="2"><p align="left">自由竞价时间 </p></td>
    <td colspan="2"><p align="left">2017-08-16</p></td>
    <td class="shheh"  colspan="3"><p align="left">延时竞价周期 </p></td>
    <td width="85"><p align="left">180秒 </p></td>
    <td width="21"><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="left">服务费 </p></td>
    <td colspan="9"><p align="left">受让方按成交额的1.2%向江苏省产权交易所支付交易服务费。 </p></td>
  </tr>
  <tr>
    <td width="73" class="shheh"  rowspan="5"><p align="center">联系 <br />
      方式 </p></td>
    <td width="104" class="shheh" ><p align="left">标的咨询 </p></td>
    <td colspan="9"><p>江苏省产权交易所：郜先生；025-83163361</p>
      <p align="left">&nbsp;</p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="left">技术支持 </p></td>
    <td colspan="9"><p align="left">——</p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="left">咨询时间 </p></td>
    <td colspan="9"><p align="left">——</p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="left">单位地址 </p></td>
    <td colspan="9"><p align="left">江苏省产权交易所 </p></td>
  </tr>
  <tr>
    <td width="104" class="shheh" ><p align="left">其他 </p></td>
    <td colspan="9"><p align="left">&nbsp;</p></td>
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
