<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
</head>
<script>
    var listSize='${list.size()}';
</script>
<body>
	<!--  头部B-->
	<jsp:include page="../top.jsp"></jsp:include>
	<!--  头部E-->
	<div class="base-container clearfix">
		<div class="row clearfix">
			<div class="crumbs clearfix">
				<div class="fl">
					<a href="<%=basePath%>index">首页</a> &gt; <a href="<%=basePath%>compare_list?projectType=cl" target="_blank">比一比</a>
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
							<li>标的(车牌号)</li>
							<li>注册日期</li>
							<li>年审期限</li>
							<li>品牌型号</li>
							<li>发动机号码</li>
							<li>车架号</li>
							<li>排量(ml)</li>
							<li>燃油种类</li>
							<li>变速箱</li>
							<li>里程表公里数(仅供参考)</li>
							<li>车辆类型</li>
							<li>车辆颜色</li>
							<li>商业险</li>
							<li>交强险</li>
							<li>转让底价</li>
							<li>评估价</li>
							<li>评估基准日</li>
							<li>评估机构</li>
							<li>行为批准或备案机构</li>
							<li class="other cheng2">转让方情况</li>
							<li class="cheng2">车辆现状、违章、亮点</li>
						</ul>
					</div>
					</c:if>
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
							<li>${empty project.chelno ?"--" :project.chelno }</li>
							<li>${empty project.dengjidate ?"--" :project.dengjidate}</li>
							<li>${empty project.nianjtodate ?"--" :project.nianjtodate }</li>
							<li>${empty project.chelname ?"--" :project.chelname }</li>
							<li>${empty project.fadongjino ?"--" :project.fadongjino }</li>
							<li>${empty project.chejiano ?"--" :project.chejiano }</li>
							<li>${empty project.pailiang ?"--" :project.pailiang } ml</li>
							<li>${empty project.ranyoutype ?"--" :project.ranyoutype }</li>
							<li>${empty project.biansuxiang ?"--" :project.biansuxiang }</li>
							<li>${empty project.gongli ?"--" :project.gongli }</li>
							<li>${empty project.cheltype ?"--" :project.cheltype }</li>
							<li>${empty project.color ?"--" :project.color }</li>
							<li>${empty project.shangyexian ?"--" :project.shangyexian }</li>
							<li>${empty project.jiaoqiangxian ?"--" :project.jiaoqiangxian }</li>
							<li>${empty project.price ?"--" :project.price } 元</li>
							<li>${empty project.pingguprice ?"--" :project.pingguprice } 元</li>
							<li>${empty project.pinggudate ?"--" :project.pinggudate }</li>
							<li>${empty project.pingguorg ?"--" :project.pingguorg }</li>
							<li>${empty project.hezhunorg ?"--" :project.hezhunorg }</li>
							<li class="other cheng2"><div class="scoll ssheight">${empty project.zhaunrfinfo ?"--" :project.zhaunrfinfo }</div></li>
							<li><div class="scoll mxheight">${empty project.descs ?"--" :project.descs }</div></li>
						</ul>
					</div>
					</c:forEach>
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