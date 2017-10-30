<%@page import="com.ccjt.ejy.web.commons.OS"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
    
    	<%
    	try{

if(OS.isMobile((HttpServletRequest) request)){
	
	out.print("<meta content=\"0;url=mejy\" http-equiv=\"refresh\" />");
}else{
	out.print("<meta content=\"0;url=index\" http-equiv=\"refresh\" />");
}
    	}catch(Exception e){
    		e.printStackTrace();
    	}
%>
  </body>
</html>
