<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	Exception e = (Exception)request.getAttribute("exception");
	e.printStackTrace(response.getWriter());
	;
%>