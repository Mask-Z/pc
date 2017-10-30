<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${cqjy.status_name == '报名中'}">
	<span  class="index-floor-btn state-btn btn-enroll"  id="${cqjy.project_no }">正在报名</span>
</c:if>
<c:if test="${cqjy.status_name == '报名中竞价中'}">
	<span  class="index-floor-btn state-btn   btn-enroll" >正在报名</span>
</c:if>
<c:if test="${cqjy.status_name == '终结'}">
	<span  class=" index-floor-btn state-btn btn-default" >项目终结</span>
</c:if>
<c:if test="${cqjy.status_name == '中止'}">
	<span  class=" index-floor-btn state-btn btn-default" >项目中止</span>
</c:if>
<c:if test="${cqjy.status_name == '竞价暂停'}">
	<span  class=" index-floor-btn state-btn btn-default" >竞价暂停</span>
</c:if>
<c:if test="${cqjy.status_name == '竞价已结束'}">
	<span  class="index-floor-btn state-btn btn-default" >竞价截止</span>
</c:if>
<c:if test="${cqjy.status_name == '未开始'}">
	<span  class=" index-floor-btn state-btn btn-update" >未开始</span>
</c:if>
<c:if test="${cqjy.status_name == '报名已截止'}">
	<span  class=" index-floor-btn state-btn btn-default" >报名截止</span>
</c:if>
<c:if test="${cqjy.status_name == '竞价中'}">
	<span  class=" index-floor-btn state-btn btn-bidding">竞价中</span>
</c:if>
<c:if test="${cqjy.status_name == '已成交'}">
	<span  class=" index-floor-btn state-btn btn-default" >已成交</span>
</c:if>
