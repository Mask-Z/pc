<!DOCTYPE html>
<html lang="en">
<head>
    <title>e交易-产权交易平台</title>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta name="description" content="e交易,交易网,易交易,产权,产权交易,招标,招标采购,快捷采购,房产,资产招租,废旧物资,股权,增资扩股,二手设备,工美藏品,让交易更容易,二手车,房地产,粮食,土地">
<meta name="keyword" content="e交易,交易网,易交易,产权,产权交易,招标,招标采购,快捷采购,房产,资产招租,废旧物资,股权,增资扩股,二手设备,工美藏品,让交易更容易,二手车,房地产,粮食,土地">
<link rel="Shortcut Icon"  href="<%=basePath%>html/images/favicon.ico">
<link rel="stylesheet" href="http://www.e-jy.com.cn/eweb/html/css/base.css">
</head>
<script>
    function openView() {
        if(navigator.userAgent.indexOf("MSIE")>0) {//IE版本低于10会带MSIE
            var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
            reIE.test(navigator.userAgent);
            var fIEVersion = parseFloat(RegExp["$1"]);
            if (fIEVersion!==10) {
                $("#prompt").show();
                return;
            }
        }
        var url='https://www.720think.com/t/651hl23sl';
        window.open(url);

    }
    function closeView() {
        $("#prompt").hide();
    }
</script>
<body>
<div class="visit-fix fbjywt" style="bottom: 0px;display: none;" id="prompt" >
    <div class="fix-bg"></div>
    <div class="box">
        <div class="recharge-cz">
            <h3 class="bd_b f16 pb10 clearfix lh24">
                <a href="javascript:closeView();" class="close">
                    <i class="fc99 f24 iconfont icon-error"></i>
                </a>系统提示</h3>
        </div>
        <div class="pd15"><div class="bd_b pb15">抱歉，你的浏览器版本过低，可能无法正常使用VR全景功能，推荐使用IE10及以上版本，或chrome，火狐浏览器</div></div>
        <div class="pd10 ta-c recharge-btn ">
            <button type="button" class="fix-base-btn mr10 fix-btn-default" onclick="javascript:closeView();">关闭</button>

        </div>
    </div>
</div>




<style>
.kjc-box{width:100%;background: url(images/kjc-bg.jpg) no-repeat center top;}
.kjc-box .box{width: 100%; position: relative;}
.baselogo22{position:absolute; ;left:30px; top: 30px;width: 40%;z-index: 999;}
.baselogo22 img{width: 100%;}
@media screen and (min-width: 1201px) { 
  .kjc-box{min-width: 1200px;}
.kjc-box .box{width: 1200px;margin: 0px auto;}
.baselogo22 img{width: inherit;}
} 
</style>
    <div class="kjc-box">
       <div class="baselogo22"><img src="images/fix-pop-1.png" width="100%" class="dsb" alt=""></div>
        <div class="box">
          <%--<a href="https://www.720think.com/t/651hl23sl" target="_blank"><img src="images/kjc-1.jpg" width="100%" class="dsb" alt=""></a>--%>
          <a href="javascript:openView();" ><img src="images/kjc-1.jpg" width="100%" class="dsb" alt=""></a>
          <img src="images/kjc-2.jpg" width="100%" class="dsb" alt="">
          <img src="images/kjc-3.jpg" width="100%" class="dsb" alt="">
          <img src="images/kjc-4.jpg" width="100%" class="dsb" alt="">
          <img src="images/kjc-5.jpg" width="100%" class="dsb" alt="">
          <img src="images/kjc-6.jpg" width="100%" class="dsb" alt="">
          <img src="images/kjc-7.jpg" width="100%" class="dsb" alt="">
          <a href="fc_cz_kjc.pdf" target="_blank"><img src="images/kjc-8.jpg" width="100%" class="dsb" alt=""></a>
        </div>
</div>






</body>

</html>
