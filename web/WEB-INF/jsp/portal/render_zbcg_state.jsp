<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${info.status_name == '报名中'}">
	<%--<a  class="state-btn fr btn-enroll">报名中</a>--%>
	<div class="info2"><a  class="state-btn  btn-enroll">报名中</a></div>
</c:if>
<c:if test="${info.status_name == '未开始'}">
	<%--<a  class="state-btn fr btn-update">未开始</a>--%>
	<div class="info2"><a  class="state-btn  btn-update">未开始</a></div>
</c:if>
<c:if test="${info.status_name == '报名已截止'}">
	<%--<a  class="state-btn fr btn-default">报名已截止</a>--%>
	<div class="info2"><a  class="state-btn  btn-default">报名截止</a></div>
</c:if>
