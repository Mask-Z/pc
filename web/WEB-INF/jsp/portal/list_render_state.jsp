<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${cqjy.status_name == '报名中'}">
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-enroll" target="_blank">正在报名</a>
</c:if>
<c:if test="${cqjy.status_name == '报名中竞价中'}">
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-bidding" target="_blank">竞价中</a><span style="padding: 1px;color: #FFffff" class="fr"></span>
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-enroll mr5" target="_blank">正在报名</a>
</c:if>
<c:if test="${cqjy.status_name == '终结'}">
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-default" target="_blank">项目终结</a>
</c:if>
<c:if test="${cqjy.status_name == '中止'}">
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-default" target="_blank">项目中止</a>
</c:if>
<c:if test="${cqjy.status_name == '竞价暂停'}">
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-default" target="_blank">竞价暂停</a>
</c:if>
<c:if test="${cqjy.status_name == '竞价已结束'}">
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-default" target="_blank">竞价截止</a>
</c:if>
<c:if test="${cqjy.status_name == '未开始'}">
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-update" target="_blank">未开始</a>
</c:if>
<c:if test="${cqjy.status_name == '报名已截止'}">
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-default" target="_blank">报名截止</a>
</c:if>
<c:if test="${cqjy.status_name == '竞价中'}">
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-bidding" target="_blank">竞价中</a>
</c:if>
<c:if test="${cqjy.status_name == '已成交'}">
	<a href="infodetail?infoid=${cqjy.infoid}&categoryNum=${cqjy.categorynum}" class="state-btn fr btn-default" target="_blank">已成交</a>
</c:if>
