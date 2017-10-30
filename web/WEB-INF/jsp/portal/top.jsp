<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://qiyukf.com/script/c6901c99a04ce38979ecbd172644fead.js"></script>

        <script type="text/javascript">
            window.url = function(){
                location.href = ysf.url();
            }

            window.openSDK = function(){
                ysf.open();
            }
        </script>
        
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//Object region=  request.getSession().getAttribute("region");
//Object city=  request.getSession().getAttribute("city");
//String regionstr="",citystr="";
//if(region!=null){
//	regionstr=region.toString();
//}
//if(city!=null){
//	citystr=city.toString();
//}
//String place="";
//if(regionstr.equals("")&&citystr.equals("")){
//	place="全国";
//}else {
//	if(!citystr.equals("")){
//		place=citystr;
//	}else if(!regionstr.equals("")){
//		place=regionstr;
//	}
//}
    String initype = "产权交易";
    String urls = request.getRequestURI();
    if(urls.indexOf("zbcg") >= 0){
        initype = "招标采购";
    } else if(urls.indexOf("kjcg") >= 0){
        initype = "快捷采购";
    }

%>
<script>
    $(function () {
        var place='';
        var city=$.cookie("cityCookie");
        var province=$.cookie("provinceCookie");
        if(typeof city==='undefined' || typeof province==='undefined' ||(city ==='' && province ==='')){
            $("#cityChoice").val("全国");
        }else{
            if(city !=='' ){
                $("#cityChoice").val(city);
            }else if(province !=''){
                $("#cityChoice").val(province);
            }else{
                $("#cityChoice").val("全国");
            }
        }


        var referrer = document.referrer;
        if (!referrer) {
            try {
                if (window.opener) {
                    // IE下如果跨域则抛出权限异常
                    // Safari和Chrome下window.opener.location没有任何属性
                    referrer = window.opener.location.href;
                }
            }
            catch (e) {}
        }


        var url=window.location.href;
        if (url.indexOf('kjcg')>=0){
            $("#index_search_type").html("快捷采购<i class='ico'></i>");
        }
        if (url.indexOf('index')>=0){
            $("#li1").addClass("curr");
        }else if (url.indexOf('jygg_more')>=0 && url.indexOf('jl_more')<0){
            $("#li2").addClass("curr");
        }else if(url.indexOf("infodetail")>=0){
            if (referrer.indexOf("jl_more")>=0){
                $("#li5").addClass("curr");
            }else {
                $("#li2").addClass("curr");
            }
        }else if (url.indexOf('zbcg_more')>=0 || url.indexOf('tag=zbcg')>=0){
            $("#li3").addClass("curr");
//        }else if (url.indexOf('zzcg_more')>=0 || url.indexOf('tag=cjgg')>=0 || url.indexOf('tag=cggg')>=0){
//            $("#li7").addClass("curr");
        }else if (url.indexOf('kjcg_more')>=0 || url.indexOf('tag=kjcg')>=0){
            $("#li4").addClass("curr");
        }else if (url.indexOf('jl_more')>=0){
            $("#li5").addClass("curr");
        }else if (url.indexOf("ehelp_more")>=0){
            $("#li6").addClass("curr");
        }else if(url.indexOf("news_more?catagoryNum=028")>=0||referrer.indexOf("news_more?catagoryNum=028")>=0){
            $("#li8").addClass("curr");
        };
    })
</script>
<script type="text/javascript" src="<%=basePath %>js/JSON.js"></script>
<script type="text/javascript" src="<%=basePath %>js/cqjy_compare.js"></script>
<base href="<%=basePath%>">
<div class="header_top">
  <div class="k1200">
   <div class="sub_left">
    <ul>
      <li><span class="fc55">欢迎来到e交易平台</span></li>
    </ul>
   </div>
   <div class="site-nav-fr">
          <ul class="clear1">
              <li><a href="<%=basePath%>news_more?catagoryNum=027001&page=1&rows=20" class="site-nav-user">帮助中心</a></li>
              <li class="spacer"></li>
              <li>客服电话：<b class="fcdd3 bold f14">400-990-1400</b></li>
          </ul>
      </div>

  </div>
</div>
  <div class="header">
    <div class="logo"><a href="<%=basePath%>index"><img src="<%=basePath%>html/images/logo.png" class="dsb"></a></div>
  <div class="head-location">
      <div class="location">
      	<i></i>
      	<input class="cite-defult" id="cityChoice"  type="text" style="cursor: pointer">
      	<input name="province" id="province" value="" type="hidden">
      	<input name="city" id="city" value="" type="hidden">
      </div>
 </div>
<div class="head-search">
   <div class="title-search">
 <div id="divselect" class="base-select  search-select">
     <cite id="index_search_type"><%=initype%><i class="ico"></i></cite>
     <ul>
         <li><a href="javascript:;" selectid="1">产权交易</a></li>
         <li><a href="javascript:;" selectid="2">招标采购</a></li>
         <li><a href="javascript:;" selectid="3">快捷采购</a></li>
     </ul>
 </div>
  <div class="field">
     <input type="text" name="nope" id="nope"  class="search-input" placeholder="关键字请以空格隔开 如：常州 新北区 二手车"  maxlength="40" value="${searchKey}"/>
 </div>
 <button  class="search-button" id="index_search_btn"><i></i>搜索</button>
 </div>

  </div>
  <%--<div class="hot-search">--%>
    <%--<h5>热门关键词：</h5>--%>
    <%--<a href="" onclick="searchByHotKey(this)">学区房</a>--%>
    <%--<a href="">厂房</a>--%>
    <%--<a href="">办公楼</a>--%>
    <%--<a href="">奥迪A6</a>--%>
    <%--</div>--%>
  <a href="javascript:showfbjywt();" class="head-fb-btn">发布交易委托</a>
</div>

<div class="menu">
 <div class="menu_box">

     <div class="nav_bar">
        <ul>
           <li id="li1"><a href="index">首页</a></li>
           <li id="li2"><a href="<%=basePath%>jygg_more">产权交易</a></li>
           <li id="li3"><a href="<%=basePath%>zbcg_more">招标采购</a></li>
           <li id="li4"><a href="<%=basePath%>kjcg_more">快捷采购</a></li>
           <%--<li id="li7"><a href="<%=basePath%>zzcg_more">自主采购</a></li>--%>
           <li id="li5"><a href="<%=basePath%>jygg_more?pagename=jl_more">捡漏</a></li>
           <li><a href="http://www.e-jr.com.cn/" target="_blank">金融资产</a></li>
           <%--<li><a href="http://www.e-nsh.com.cn/" target="_blank">股权托管</a></li>--%>
            <li id="li8"><a href="<%=basePath%>news_more?catagoryNum=028&page=1&rows=20">曝光台</a></li>
           <li id="li6"><a href="<%=basePath%>ehelp_more">e帮无忧</a></li>
         </ul>
        
   </div> 
   </div>
</div>
  <div class="visit-fix fbjywt" >
  <div class="fix-bg"></div>
        <div class="box">
            <div class="recharge-cz">
                <h3 class="bd_b f16 pb10 mb10 clearfix lh24">
                <a href="javascript:closefbjywt();" class="close">
                      <i class="fc99 f24 iconfont icon-error"></i>
                </a>
          		      发布交易委托 
                </h3>
                <dl>
                    <dt><font class="fcdd3">*</font>联系人：</dt>
                    <dd>
                        <input  type="text" class="form-control input input-sm" id="name" placeholder="姓名" maxlength="50">
                    </dd>
                </dl>
                <dl>
                    <dt><font class="fcdd3">*</font>手机号：</dt>
                    <dd>
                        <input  type="text" class="form-control input input-sm" id="telephone" placeholder="手机号">
                    </dd>
                </dl>
                <dl>
                    <dt><font class="fcdd3">*</font>交易主题：</dt>
                    <dd>
                        <input  type="text" class="form-control input input-sm" id="title" placeholder="标题" maxlength="100">
                    </dd>
                </dl>
                <dl>
                    <dt><font class="fcdd3">*</font>交易内容：</dt>
                    <dd>
                        <textarea type="text" id="content" class="form-control input input-sm" placeholder="内容" maxlength="1024" style="height:80px;padding:10px;"></textarea>
                    </dd>
                </dl>
                <dl>
                    <dt><font class="fcdd3">*</font>验证码：</dt>
                    <dd>
                        <input type="text" class="form-control input input-sm" maxlength="4" id="valcode" placeholder="请输入验证码" style="width:225px;">
                        <img  style="cursor: pointer;" title="点我刷新" onclick="this.src=this.src + '?' +Math.random()"
								src="<%=basePath %>valcode" alt="" width="120" height="40" class="dsb fr">
                    </dd>
                </dl>
            </div>
            <div class="pd10 ta-c recharge-btn ">
                <button type="button" class="fix-base-btn mr10 fix-btn-default" onclick="javascript:closefbjywt();">取消</button>
                <button type="button" class="fix-base-btn fix-btn-danger " onclick="wtjySave();">提交</button>
            </div>
        </div>
    </div>
    <form action="jygg_more" id="index_search_form" method="get">
        <input type="hidden" name="title" id="index_search_title" value="${title }">
    </form>
    <script type="text/javascript" src="<%=basePath%>html/js/hzw-city-picker.min.js"></script>

    <%--<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>

    --%>
<%--<script type="text/javascript" src="<%=basePath%>html/js/head.js"></script>--%>
    <script>
        function qgOk(){
            $.cookie("cityCookie", "", { expires: 2 });
            $.cookie("provinceCookie", "", { expires: 2 });
            $.cookie("qhCookie", '1', { expires: 2 });//全国也当成是自动切换
            window.location.reload();
            <%--$.ajax({--%>
                <%--type: "post",--%>
                <%--url: "<%=basePath%>index/otherUpdateSession",--%>
                <%--dataType: "json",--%>
                <%--data: {--%>
                    <%--city: "",--%>
                    <%--province: "",--%>
                    <%--qieHuanFlag: "-1"--%>
                <%--},--%>
                <%--method: "post",--%>
                <%--success : function(data) {--%>
                    <%--window.location.reload();--%>

                <%--},--%>
                <%--error:function (e) {--%>
                    <%--window.location.reload();--%>
                <%--}--%>
            <%--});--%>
        }
        $(function(){
            var times;
            function addQG() {
                if ($(".hzw-wrap p div").length>0){
                    window.setTimeout(times);
                }else{
                    $(".hzw-wrap p").html("选择省份 &nbsp;&nbsp;&nbsp;&nbsp;<div class='hzw-province-name' id='qg' onclick='qgOk()' style='cursor: pointer'>全国</div>");
                }
            }
            times=window.setInterval(addQG,500);


            jQuery.divselect = function(divselectid,inputselectid) {
                var inputselect = $(inputselectid);
                $(divselectid+" cite").click(function(){
                    var ul = $(divselectid+" ul");
                    if(ul.css("display")=="none"){
                        ul.slideDown("fast");
                    }else{
                        ul.slideUp("fast");
                    }
                });
                $(divselectid+" ul li a").click(function(){
                    var txt = $(this).text();
                    $(divselectid+" cite").html(txt + '<i class="ico"></i>');
                    var value = $(this).attr("selectid");
                    inputselect.val(value);
                    $(divselectid+" ul").hide();

                });
            };

            $.divselect("#divselect","#inputselect");

            $("#index_search_btn").click(function(){
            	var reg = new RegExp("<","g");
                var v = $("#nope").val().replace(reg,"");
                reg = new RegExp(">","g");
                v = v.replace(reg,"");
                $("#index_search_title").val(encodeURI(v));
                var type = $("#index_search_type").text();
                if ("产权交易" == type) {
                    $("#index_search_form").attr("action", "jygg_more_data");
                } else if ("招标采购" == type) {
                    $("#index_search_form").attr("action", "zbcg_more");
                } else if ("快捷采购" == type) {
                    $("#index_search_form").attr("action", "kjcg_more");
                }
                $("#index_search_form").submit();
            });
            
            $(document).keydown(function(event){
                var display =$('.theme-popover').css('display');
            	if(event.keyCode==13){
                    if (display == 'block') {
                        $(".ejy_huiyuan_dl").click();
                    }else{
                        $("#index_search_btn").click();
                    }
                } 
            });
        })

     var data = ${citys};
     var cityPicker = new HzwCityPicker({
     data: data,
     target: 'cityChoice',
     valType: 'k-v',
     hideCityInput: {
         name: 'city',
         id: 'city'
     },
     hideProvinceInput: {
         name: 'province',
         id: 'province'
     },
     callback: function(){       	 
//         var city=$("#city").val();
//         var province=$("#province").val();
         $.cookie("qhCookie", '-1', { expires: 2 });//-1代表不是自动切换城市操作
         var city=new Array();
         var province=new Array();
         city=$("#city").val().split('-');
         province=$("#province").val().split('-');

         $.cookie("cityCodeCookie",city[0], { expires: 2 });
         $.cookie("cityCookie",city[1], { expires: 2 });
         $.cookie("provinceCodeCookie",province[0], { expires: 2 });
         $.cookie("provinceCookie",province[1], { expires: 2 });

         var url = window.location.href;
         if (url.indexOf("jygg_more")>0){
             queryData("",1,"ignoreDQ");
         }else {
             window.location.reload();
         }
         <%--$.ajax({--%>
			 <%--url: "<%=basePath%>index/updateSession",--%>
			 <%--data: {--%>
				 <%--city: city,--%>
				 <%--province: province--%>
			 <%--},--%>
			 <%--method: "post",--%>
			 <%--success : function(data) {--%>
//                 var test = window.location.href;
//                 if (test.indexOf("jygg_more")>0){
//                     queryData("",1,"ignoreDQ");
//                 }else {
//                     window.location.reload();
//                 }
			 <%--}--%>
		 <%--});--%>
     }
 });
 cityPicker.init();
</script>
<script>
function showfbjywt() {
    $(".fbjywt").animate({ bottom: '0px' }, 300);
};

function closefbjywt() {
    $(".fbjywt").animate({ bottom: '-100%' }, 300);
    $("#name").val("");
    $("#telephone").val("");
    $("#title").val("");
    $("#content").val("");
    $("#valcode").val("");
};

function wtjySave(){
	var name=$("#name").val();
	
	var telephone=$("#telephone").val();
	var title=$("#title").val();
	var content=$("#content").val();
	var valcode=$("#valcode").val();
	if(name!=''&&telephone!=''&&title!=''&&content!='' &&valcode!=''){
		 if(!/^(13|14|15|17|18)\d{9}$/i.test(telephone)){
		 	alert("请输入正确的手机号！");
		 }else{
		 	$.ajax({
				url : "<%=basePath%>system/entrustSave/add",
				dataType: "json",
				data : {
					name:name,
					tel:telephone,
					title:title,
					content:content,
					valcode:valcode
				},
				method : "post",
				success : function(data) {
					if(data.code==0){
						closefbjywt();
						clearForm('');
						alert("发布成功！");
					}else if(data.code==1){
						alert("验证码错误！");
					}
				},
				error:function (data){
				    alert("你还未登录!");
                    window.location.href="<%=basePath%>login";
                }
		   });
		 }
	}else{
		alert("带*号的为必填项！");
	}
}

function clearForm(id){
	$("#"+id+"name").val("");
	$("#"+id+"telephone").val("");
	$("#"+id+"title").val("");
	$("#"+id+"content").val("");
	$("#"+id+"valcode").val("");
}

</script>