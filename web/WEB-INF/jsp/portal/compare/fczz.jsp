<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ccjt.ejy.web.vo.Zulin" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<c:set var="root" value="<%=basePath %>" scope="page"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../mate.jsp"></jsp:include>
<link rel="stylesheet" href="${root }html/css/iconfont.css">
<link rel="stylesheet" href="${root }html/css/base.css">
<link rel="stylesheet" href="${root }html/css/header.css">
<link rel="stylesheet" href="${root }html/css/global.css">
<link rel="stylesheet" href="${root }html/css/list.css">
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
	<script>
        var listSize='${list.size()}';
	</script>
</head>

<%
	List<Zulin> zulins= (List<Zulin>) request.getAttribute("list");
	List<String> priceList=new ArrayList<String>();
	String price="0.00";
	for (Zulin zulin:zulins){
		String tempPrice=zulin.getPrice();
		String tempArea=zulin.getArea();
		if (StringUtils.isNotBlank(tempPrice)) {
			if (StringUtils.isNotBlank(tempArea) && !tempPrice.equals("--")) {
				Double p1 = Double.parseDouble(tempPrice);
				Double p2 = Double.parseDouble(tempArea);
				DecimalFormat df = new DecimalFormat("###,###,###,###,###,###,###.00");
				price = df.format(p1 / p2);
			} else {
				price = zulin.getPrice();
			}
		}
		priceList.add(price);
	}
	request.setAttribute("priceList",priceList);
%>
<body>
	<!--  头部B-->
	<jsp:include page="../top.jsp"></jsp:include>
	<!--  头部E-->
	<div class="base-container clearfix">
		<div class="row clearfix">
			<div class="crumbs clearfix">
				<div class="fl">
					<a href="<%=basePath%>index">首页</a> &gt; <a href="<%=basePath%>compare_list?projectType=fczz" target="_blank">比一比</a>
				</div>
				<li class="select-result">
					<dl>
						<dd class="select-no"></dd>
					</dl></li>
			</div>
		</div>

		<div class="compareHouseTitleFixedContainer">
			<div class="compareHouseTitle">
				<div class="houseTitleContainer">
					<div class="houseTitleOptions">
						<div class="houseTitleName">标的比一比</div>
						<div class="compareOption mt10" id="showAdvantage">
							<label class="mt10"><input type="checkbox"
								class="checkbox" name="chkBest"> 隐藏相同项</label>
						</div>
					</div>
					
					<c:if test="${gglist ==null || fn:length(gglist) ==0 }">
						<div class="houseNameCal" style="color: red">
						 	提示：请先将项目加入到比一比。
						</div>
					</c:if>
					<c:forEach var="info" items="${gglist }">
					<div class="houseNameCal">
						<a href="infodetail?infoid=${info.infoid}" target="_blank"> <img class="housePicture"
							src="${info.titlepic }"
							width="236" height="177" class="dsb" alt=""> </a>
						<div class="houseName">
							<a href="infodetail?infoid=${info.infoid}" target="_blank">${info.title }</a>
						</div>
						<div class="housePrice">${info.guapaiprice }元</div>
						<a href="javascript:compare_remove('${info.projectguid}');history.go(0);" class="close"></a>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<c:if test="${gglist !=null && fn:length(gglist) >0 }">
		<div class="mainContent">
			<div class="contentContainer">
				<div class="compareType">
					<span class="typeName">核心信息</span>
				</div>
				<div class="Newcompretable clearfix mt15 mb15">
					<c:if test="${list ==null ||fn:length(list) ==0 }">
						<div style="color: red;padding: 5px;">
							提示：暂时没有项目的详细信息。
						</div>
					</c:if>
					<c:if test="${list !=null &&fn:length(list) >0 }">
					<div class="baseTable name" id="info_detail_title">
						<ul>
							<li class="Highlights">标的亮点</li>
							<li>租金底价</li>
							<%--<li>单价</li>--%>
							<li>租赁面积约（㎡）</li>
							<li>租赁期限（年）</li>
							<li>所在层数</li>
							<li>标的状态</li>
							<li>规划用途</li>
							<li>装修期限</li>
							<li>承租押金(元)</li>
							<li>租金递增方式</li>
							<li class="cheng2">是否设置原承租人优先权</li>
							<li>租金支付方式</li>
							<li class="other cheng2">其它情况</li>
							<li>联系方式</li>
						</ul>
					</div>
					<c:forEach items="${list }" var="project" varStatus="pstatus">
					<div class="baseTable info_detail_list">
						<ul>
							<li class="Highlights">
								<div class="search-characteristic clearfix">
									<c:forEach items="${gglist[pstatus.index].hotLabelName}" var="hotLabel" begin="0" end="2" varStatus="status">
					                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
					                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
					                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
					                </c:forEach>
								</div></li>
							<li>${empty project.rent ?"--" :project.rent } 元<c:if test="${project.danw ne ''}"> / ${project.danw}</c:if></li>
							<%--<li>${priceList[pstatus.index]} 元/m²</li>--%>
							<%--<li>${empty project.price ?"--" :project.price} 元/m²</li>--%>
							<li>${empty project.area ?"--" :project.area } 平米</li>
							<li>${empty project.zlqx ?"--" :project.zlqx } 年</li>
							<li>${empty project.suozaicengshu ?"--" :project.suozaicengshu }</li>
							<li>${empty project.biaodistatus ?"--" :project.biaodistatus }</li>
							<li>${empty project.zlyt ?"--" :project.zlyt }</li>
							<li>${empty project.zhuangxiuqixian ?"--" :project.zhuangxiuqixian }</li>
							<li>${empty project.czprice ?"--" :project.czprice } 元</li>
							<li>${empty project.zujindizengtype ?"--" :project.zujindizengtype }</li>
							<li class="cheng2"><div class="scoll ssheight">${empty project.setyxq ?"--" :project.setyxq }</div></li>
							<li>${empty project.zftype ?"--" :project.zftype }</li>
							<li class="other cheng2"><div class="scoll ssheight">${empty project.czyq ?"--" :project.czyq }</div></li>
							<li>${empty project.tel ?"--" :project.tel }</li>
						</ul>
					</div>
					</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		</c:if>
	</div>

	<!--  通用底部b -->
	<jsp:include page="../bottom.jsp"></jsp:include>
	<!--  通用底部E -->

	<!--侧边快捷导航-->
	<div class="rc_box  new-base-login" id="baseLogin">
		<em
			style="position: absolute; left: 375px; top:0px;width: 150px;height: 200px;"></em>
		<span class="rc_arrow"><i></i> </span>
		<div class="rt_login_box">
			<div class="login_box_inner">
				<div class="login_tit">
					<a href="javascript:closeLogin();" class="close"> <i
						class="fcff f24 iconfont icon-error"></i> </a>登录
				</div>
				<div class="login_con">
					<div class="bd" style="padding-left: 0px;">
						<div class="item">
							<ul>
								<li class="li1"><input type="text" maxlength="25"
									class="txt" name="loginName" id="login_name" value=""
									placeholder="请输入登录名"> <i class="arr"></i> <i
									class="icon s1"></i>
								</li>
								<li class="li2"><input type="password" maxlength="25"
									class="txt" name="passWord" id="pass_word" value=""
									placeholder="请输入密码"> <i class="arr"></i> <i
									class="icon s2"></i>
								</li>
								<li class="li2"><input type="text" maxlength="25"
									class="txt code" name="vercode" id="ver_code" value=""
									placeholder="请输入验证码"> <i class="arr"></i> <i
									class="icon s2"></i> <img src="" alt="" width="120" height="40"
									id="authimg" class="dsb fr">
								</li>

								<li><a href="javascript:void(0)" onclick="loginR()"
									style="width:100%;">
										<button class="btn yahei">登录</button> </a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../rightbutton.jsp"></jsp:include>
	<!--/侧边快捷导航-->

	<script src="${root }html/js/jquery.autocompleter.js"></script>
	<script src="${root }html/js/iconfont.js"></script>
	<script src="${root }html/js/focus.js"></script>
	<script src="${root }html/js/main.js"></script>
	<script src="${root }html/js/glivia.js"></script>
	<script src="${root }html/js/list.js"></script>
	<script type="text/javascript">
		function CoLeeSelect(thisObj) {
			var thisinput = thisObj.getElementsByTagName("input");
			var thisul = thisObj.getElementsByTagName("ul");
			var thisli = thisul[0].getElementsByTagName("li");
			if (thisObj.id != "CoLeeSelect") {
				thisObj.id = "CoLeeSelect";
				thisObj.focus();
				thisul[0].style.display = "";
				for ( var i = 0; i < thisli.length; i++) {
					thisli[i].onmouseover = function() {
						for ( var j = 0; j < thisli.length; j++) {
							thisli[j].className = "";
						}
						this.className = "on";
					}
					thisli[i].onclick = function() {
						thisinput[0].value = this.innerHTML;
					}
				}
			} else {
				ObjBlur();
			}
			thisObj.onblur = ObjBlur;
			function ObjBlur() {
				thisObj.id = "";
				thisul[0].style.display = "none";
				thisObj.blur();
			}
		}
	</script>
</body>
</html>