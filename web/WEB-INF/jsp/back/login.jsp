<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>e交易-产权交易平台</title>
    <jsp:include page="/WEB-INF/jsp/portal/mate.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=basePath %>html/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath %>html/css/base.css">
    <link rel="stylesheet" href="<%=basePath %>html/css/header.css">
    <link rel="stylesheet" href="<%=basePath %>html/css/login.css">

</head>

<body>
     <div class="header_inner">
      <div class="k1200 clearfix">
        <a class="fl" href="index"><img src="<%=basePath %>images/logo.png" class="dsb"></a>
        <div class=" fl d-tel" title="" >
                欢迎登陆
         </div>
      </div>
    </div>
        <div class="wrap-user">
    <div class="login-contant">
    <form id="userForm" class="layui-form" method="post"  action="<%=basePath%>userLogin">
        <h4>账号登录 </h4>
          <ul class="box">
                 <li><label class="login-label"><i class="iconfont icon-my2shape"></i></label>
                 <input type="type" id="name" name="name" class="ivu-input" placeholder="请输入账号"></li>
                 <li><label class="login-label"><i class="iconfont icon-suoding"></i></label>
                 <input type="password" id="pwd" name="pwd" class="ivu-input" placeholder="请输入密码"></li>
                 <li>
		          <a href="javascript:;" class="code">
		          <img  style="cursor: pointer;" title="点我刷新" onclick="this.src=this.src + '?' +Math.random()"
										src="<%=basePath %>valcode?type=login" alt="" height="40px">
										</a>
                 <label class="login-label"><i class="iconfont icon-shouquan5"></i></label>
                 <input type="type" id="valcode" name="valcode" class="ivu-input yz-input" placeholder="请输入验证码">
                 </li>
                 <li>
                     <a style="cursor:pointer;" id="login" class="login-btn layui-btn layui-btn-primary layui-btn-mini" lay-submit="" lay-filter="login">登录</a>
                 </li>
                  <li>
                  	<span style="color:red" id="errormsg"></span>
                 </li>
            </ul>
    </form>
      </div>
      </div>

<div class="footer k1200 clearfix">
      <p class="ta-c f12 fc99 pt10">COPYRIGHT 2015 www.szjrb.suzhou.gov.cn All Rights Reserved.  <br>
版权信息：E交易电子平台版权所有</p>
        </div>


</body>
   <script src="<%=basePath%>html/js/jquery-1.7.2.min.js"></script>
   <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
    <script src="<%=basePath%>html/js/iconfont.js"></script>
    <script src="<%=basePath%>html/js/focus.js"></script>
   <script src="<%=basePath%>html/js/main.js"></script>
   <script src="<%=basePath%>html/js/glivia.js"></script>
   <script src="<%=basePath%>html/js/list.js"></script>
	<script type="text/javascript">
		var flag = "${flag}";
		if(flag=="success"){
			window.open("<%=basePath%>czcytzjt_first","_self");
		}
		$(function() {
            $(document).keydown(function(event) {
                if (event.keyCode == 13) {
                    $("#login").click();
                }
            });

                $("#login").click(function() {
				var name=$("#name").val();
				var pwd=$("#pwd").val();
				var valcode=$("#valcode").val();
				if(name==''){
					$("#errormsg").html("账号不能为空");
				}else if(pwd==''){
					$("#errormsg").html("密码不能为空");
				}else if(valcode==''){
					$("#errormsg").html("验证码不能为空");
				}else{
					$("#userForm").submit();
				}
			});
		});
	</script>
</body>

</html>

