<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${cqjy.status_name == '报名中'}">
	<a  class=" state-btn fr btn-enroll"  id="${cqjy.project_no }">正在报名</a>
</c:if>
<c:if test="${cqjy.status_name == '报名中竞价中'}">
	<a  class=" state-btn fr btn-bidding" >竞价中</a><span style="padding: 1px;color: #FFffff" class="fr"></span>
	<a  class=" state-btn fr btn-enroll" >正在报名</a>
</c:if>
<c:if test="${cqjy.status_name == '终结'}">
	<a  class=" state-btn fr btn-default" >项目终结</a>
</c:if>
<c:if test="${cqjy.status_name == '中止'}">
	<a  class=" state-btn fr btn-default" >项目中止</a>
</c:if>
<c:if test="${cqjy.status_name == '竞价暂停'}">
	<a  class=" state-btn fr btn-default" >竞价暂停</a>
</c:if>
<c:if test="${cqjy.status_name == '竞价已结束'}">
	<a  class=" state-btn fr btn-default" >竞价截止</a>
</c:if>
<c:if test="${cqjy.status_name == '未开始'}">
	<a  class=" state-btn fr btn-update" >未开始</a>
</c:if>
<c:if test="${cqjy.status_name == '报名已截止'}">
	<a  class=" state-btn fr btn-default" >报名截止</a>
</c:if>
<c:if test="${cqjy.status_name == '竞价中'}">
	<a  class=" state-btn fr btn-bidding">竞价中</a>
</c:if>
<c:if test="${cqjy.status_name == '已成交'}">
	<a  class=" state-btn fr btn-default" >已成交</a>
</c:if>
