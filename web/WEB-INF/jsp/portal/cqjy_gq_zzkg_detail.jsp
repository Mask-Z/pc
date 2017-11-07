<%@page import="com.ccjt.ejy.web.vo.GongGao"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="java.net.URLEncoder" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    GongGao gongGao = (GongGao) request.getAttribute("info");
    String danweiName = gongGao.getDanweiname();
    if (StringUtils.isNotBlank(danweiName)) {
        danweiName = URLEncoder.encode(danweiName, "utf-8");
    }
    request.setAttribute("danweiName", danweiName);
%>

<c:set var="pic_index" value="1"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<base href="<%=basePath%>">
    <title>${info.title}</title>
    <jsp:include page="mate.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=basePath%>html/css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/base.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/header.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/global.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/detail.css?v1=0.1">
    <link rel="stylesheet" href="<%=basePath%>js/ejy_baoming/css/style.css">
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
  <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=AESTptOW5fBvg7gLR6GGUaIwpv1Vdfei"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<script src="<%=basePath%>html/js/detail.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
				
    <style type="text/css">


        .base-detail-table {
            border: solid 1px #add9c0;
            width: 100%;
            border-left: 1px #e5e5e5 solid;
            border-top: 1px #e5e5e5 solid;
            font-size: 14px;
        }
        .base-detail-table tr td {
            border-right: 1px #e5e5e5 solid;
            border-bottom: 1px #e5e5e5 solid;
            padding: 10px;
        }
        .base-detail-table tr td.title {
            background: #f1f1f1;
            text-align: center;
        }
    </style>
</head>

<body>
<c:if test="${page ne 'hide'}">
       <!--  头部B-->  
       <jsp:include page="top.jsp"></jsp:include>
       <!--  头部E-->
</c:if>
       
       <script type="text/javascript">
       $(function(){
           var infoids;
           var lljls = $.cookie("lljls");
           if(lljls){
               infoids = lljls.split(";");
               if($.inArray("${info.infoid }", infoids) < 0){
                   if(infoids.length > 10){
                       lljls = lljls.substring(lljls.indexOf(";"));
                       lljls = lljls + "${info.infoid }" + ";";
                   }else{
                       lljls = lljls + "${info.infoid }" + ";";
                   }
                   $.cookie("lljls", lljls, { expires: 2 }); 
               }               
           }else{
               $.cookie("lljls", "${info.infoid }" + ";", { expires: 2 }); 
           }

           $("#share-pop_a").click(function(){
               $("#share-pop").toggle();
           });

           $("#download").click(function(){
               var title='${info.title}';
               var content='';
               var d3='${mediainfo.d3}';
               if (typeof d3 !=='undefined' && d3 !='' ){
                   content=d3;
               }else{
                   var basepath='<%=basePath%>';
                   var infoid='${info.infoid}';
                   content=basepath+'infodetail?infoid='+infoid;
               }

               var form=$("<form></form>");//定义一个form表单
               form.attr("style","display:none");
               form.attr("target","");
               form.attr("method","post");
               form.attr("action","<%=basePath%>DownloadQRCode");
               var contentinput=$("<input type='hidden' name='content'/>");
               contentinput.attr("value",content);
               var titleinput=$("<input type='hidden' name='title'/>");
               titleinput.attr("value",title);
               var infoidinput=$("<input type='hidden' name='infoid'/>");
               infoidinput.attr("value",'${info.infoid}');

               $("body").append(form);//将表单放置在web中
               form.append(contentinput);
               form.append(titleinput);
               form.append(infoidinput);
               form.submit();//表单提交
               form.remove();
           });

           $(document).bind('click',function(e){
				var e = e || window.event; //浏览器兼容性
               var elem = e.target || e.srcElement;
               while (elem) { //循环判断至跟节点，防止点击的是div子元素
                   if (elem.id && elem.id=='share-pop_a') {
                       return;
                   }
                   elem = elem.parentNode;
               }
				$('#share-pop').css('display','none'); //点击的不是div或其子元素
			});
           
       });
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
           var url='${mediainfo.d3}';
           window.open(url);

       }
       function closeView() {
           $("#prompt").hide();
       }
       </script>
        
       <div class="base-container clearfix">
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
       <div class="row clearfix">
       <div class="crumbs">
            <a href="" target="_blank">首页</a> &gt;
                <a href="jygg_more" target="_blank">产权交易</a>
                &gt;
                <a target="_blank">${info.title }</a>
        </div>
        <div class="important-note">
         <div class="box">
             重要提示：竞买人在竞价前请务必遵照e交易平台（<a href="<%=basePath%>index" target="_blank" class="fc439 tdu">www.e-jy.com.cn</a>）的《<a href="<%=basePath%>newsinfo?infoid=fd28532d-0ae8-43f8-a482-2497e6f7f9f6" target="_blank" class="fc439 tdu">e交易平台竞价交易规则</a>》、《<a href="<%=basePath%>news_more?catagoryNum=034001&page=1&rows=20" target="_blank" class="fc439 tdu">e交易平台产权交易操作指南</a>》等要求，了解标的情况、竞买资格、注册报名、保证金缴纳、竞买操作及款项支付方式等内容。如未全面了解相关内容，违反相关规定，您将承担无法参与项目竞买、保证金不予退还等不利后果，请审慎参与竞买。
         </div>
<a href="javascript:void(0)" class="note-btn"><i></i></a>
          
        </div>
           <form action="jygg_more_map" id="map_form" method="post" target="_blank">
               <input type="hidden" name="mappoint" value="${mediainfo.mappoint }">
               <c:if test="${mediainfo.pics==null || fn:length(mediainfo.pics)==0}">
                   <input type="hidden" id="pic_value" name="pic" value="${info.titlepic }">
               </c:if>
               <c:if test="${mediainfo.pics != null && fn:length(mediainfo.pics)>0}">
                   <input type="hidden" id="pic_value" name="pic" value="${mediainfo.pics[0].bpath }">
               </c:if>
               <input type="hidden" name="orgLXR" value="${info.orgLXR }">
               <input type="hidden" name="orgPhone" value="${info.orgPhone }">
               <input type="hidden" name="orgAddress" value="${info.orgAddress }">
               <input type="hidden" name="projectname" value="${info.projectname }">
           </form>
  <div class="detail-head clearfix">      
<div class="product fl">
	<div class="preview ">

  <!--滚动看图-->
  <div id="picSlideWrap" class="clearfix">
        <div class="imgnav" id="imgnav">
             <div id="img"> 
                <%--<c:if test="${mediainfo.d3!=null && mediainfo.d3!='' }">--%>
                <%----%>
                <%--<div class="item"><a href="${mediainfo.d3}" href="_target"><img src="images/VR-moren.jpg" width="480" height="360"></a></div>--%>
                <%--</c:if>--%>
                <%----%>
                <%--<!-- 视频begin -->--%>
                <%--<c:if test="${mediainfo.vide != null && mediainfo.vide != ''}">--%>
                <%----%>
                <%--<div class="item">--%>
                <%--<object id="MediaPlayer" classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" width="480" height="360" standby="Loading Windows Media Player components…" type="application/x-oleobject" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,7,1112">--%>
					<%--<param name="FileName" value="${mediainfo.vide}">--%>
					<%--<param name="AutoStart" value="true">--%>
					<%--<param name="ShowControls" value="true">--%>
					<%--<param name="BufferingTime" value="2">--%>
					<%--<param name="ShowStatusBar" value="true">--%>
					<%--<param name="AutoSize" value="true">--%>
					<%--<param name="InvokeURLs" value="false">--%>
					<%--<param name="AnimationatStart" value="1">--%>
					<%--<param name="TransparentatStart" value="1">--%>
					<%--<param name="Loop" value="1">--%>
					<%--<embed type="application/x-mplayer2" src="${mediainfo.vide}" name="MediaPlayer" autostart="1" showstatusbar="1" showdisplay="1" showcontrols="1" loop="0" videoborder3d="0" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" width="480" height="360"></embed>--%>
					<%--</object>--%>
		    	<%--</div>--%>
		    	<%----%>
                <%--</c:if>--%>
                <%----%>
                <%--<!-- 视频eng -->--%>
                <%----%>
                <%----%>
                <%--<!-- 音频begin -->--%>
                <%--<c:if test="${mediainfo.audio!=null && mediainfo.audio!='' }">--%>
                <%----%>
                <%--<div class="item" style="background:url(images/voice-big.jpg)">--%>
				<%----%>
				<%--<div style="padding-top: 130px;    width: 422px; margin: 0px auto;">--%>
		    	<%--<link href="<%=basePath%>mp3player/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" />--%>
				<%----%>
				<%--<script type="text/javascript" src="<%=basePath%>mp3player/jplayer/jquery.jplayer.min.js"></script>--%>
		    		<%--<div id="jquery_jplayer_1" class="jp-jplayer"></div>--%>
					<%--<div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">--%>
						<%--<div class="jp-type-single">--%>
							<%--<div class="jp-gui jp-interface">--%>
								<%--<div class="jp-controls">--%>
									<%--<button class="jp-play" role="button" tabindex="0">play</button>--%>
									<%--<button class="jp-stop" role="button" tabindex="0">stop</button>--%>
								<%--</div>--%>
								<%--<div class="jp-progress">--%>
									<%--<div class="jp-seek-bar">--%>
										<%--<div class="jp-play-bar"></div>--%>
									<%--</div>--%>
								<%--</div>--%>
								<%--<div class="jp-volume-controls">--%>
									<%--<button class="jp-mute" role="button" tabindex="0">mute</button>--%>
									<%--<button class="jp-volume-max" role="button" tabindex="0">max volume</button>--%>
									<%--<div class="jp-volume-bar">--%>
										<%--<div class="jp-volume-bar-value"></div>--%>
									<%--</div>--%>
								<%--</div>--%>
								<%--<div class="jp-time-holder">--%>
									<%--<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>--%>
									<%--<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>--%>
									<%--<div class="jp-toggles">--%>
										<%--<button class="jp-repeat" role="button" tabindex="0">repeat</button>--%>
									<%--</div>--%>
								<%--</div>--%>
							<%--</div>--%>
							<%--<div class="jp-details">--%>
								<%--<div class="jp-title" aria-label="title">&nbsp;</div>--%>
							<%--</div>--%>
							<%--<div class="jp-no-solution">--%>
								<%--<span>Update Required</span>--%>
								<%--To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.--%>
							<%--</div>--%>
						<%--</div>--%>
					<%--</div>--%>
					<%--<script type="text/javascript">--%>
				    <%--$("#jquery_jplayer_1").jPlayer({--%>
						<%--ready: function (event) {--%>
							<%--$(this).jPlayer("setMedia", {--%>
		 						<%--mp3: "${mediainfo.audio}"--%>
							<%--});--%>
						<%--},--%>
						<%--swfPath: "<%=basePath%>mp3player/jplayer",--%>
						<%--supplied: "mp3",--%>
						<%--wmode: "window",--%>
						<%--useStateClassSkin: true,--%>
						<%--autoBlur: false,--%>
						<%--smoothPlayBar: true,--%>
						<%--keyEnabled: true,--%>
						<%--remainingDuration: true,--%>
						<%--toggleDuration: true--%>
					<%--});--%>
				    <%--</script>--%>
		    		<%--</div>--%>
						<%----%>
				<%----%>
				<%--</div>--%>
                <%--</c:if>--%>
                <%--<!-- 音频end -->--%>

                <%----%>
                <%--<!-- 地图begin -->--%>
                <%--<c:if test="${mediainfo.mappoint!=null && mediainfo.mappoint!=''}">--%>
                <%--<div class="item"><div id="allmap" style="width:480px;height:360px"></div></div>--%>
                <%--<script>--%>
                <%--var map = null;--%>
                <%--function initialize() {--%>
                	<%--setTimeout(function(){--%>
                		<%--if(map==null){--%>
                			<%--map = new BMap.Map("allmap");    --%>
                			<%--var point = new BMap.Point(${mediainfo.mappoint});    --%>
                			<%--map.centerAndZoom(point, 18);    --%>
                			<%--var marker = new BMap.Marker(point);        // 创建标注    --%>
                			<%--map.addOverlay(marker);                     // 将标注添加到地图中--%>
                 			<%--map.enableScrollWheelZoom();--%>
                			<%----%>
                 		    <%--var content = '<div style="margin:0;line-height:20px;padding:2px;">' +--%>
                            <%--'<img src="http://www.e-jy.com.cn//ejyzx/uploadfile/20170629101706001.jpg" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +--%>
                            <%--'标的位于常州市钟楼区常州市怀德南路90号，怀德中路旁，周边为商业街，临近常州市南大街商业中心，商业设施集聚、商业氛围良好' +--%>
            				<%--'</div>';--%>

            				<%--//创建检索信息窗口对象--%>
            				<%--var searchInfoWindow = null;--%>
            				<%--searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {--%>
            						<%--title  : "怀德南路90号",      //标题--%>
            						<%--width  : 290,             //宽度--%>
            						<%--height : 105,              //高度--%>
            						<%--panel  : "panel",         //检索结果面板--%>
            						<%--enableAutoPan : true,     //自动平移--%>
            						<%--searchTypes   :[--%>
            							<%--BMAPLIB_TAB_SEARCH,   //周边检索--%>
            							<%--BMAPLIB_TAB_TO_HERE,  //到这里去--%>
            							<%--BMAPLIB_TAB_FROM_HERE //从这里出发--%>
            						<%--]--%>
            					<%--});--%>
            				<%--var marker = new BMap.Marker(point); //创建marker对象--%>
            				<%--//marker.enableDragging(); //marker可拖拽--%>
            				<%--marker.addEventListener("click", function(e){--%>
            				    <%--//searchInfoWindow.open(marker);--%>
            				<%--})--%>
            				<%--map.addOverlay(marker); //在地图中添加marker--%>
                    	<%--}--%>
                	<%--},500);--%>
              	<%--}  --%>
                <%----%>
                <%--</script>--%>
                <%--</c:if>--%>
                <!-- 地图end -->
                
                
                <!-- 标题图片begin -->
                <%--<c:forEach items="${mediainfo.pics }" var="pic">--%>
                <%--<div class="item"><img src="${pic.bpath}" width="480" height="360"></div>--%>
                <%--</c:forEach>--%>
                <%--<!-- 标题图片end -->--%>
                <%----%>
                <%--<c:if test="${mediainfo.pics==null || fn:length(mediainfo.pics)==0}">--%>
                <%--<div class="item"><img src="${info.titlepic }" width="480" height="360"></div>--%>
                <%--</c:if>--%>
             <%--</div>--%>

            <!-- 标题图片begin -->
            <c:forEach items="${mediainfo.pics }" var="pic">
                <div class="item">
                    <img src="${pic.bpath}" rel="${pic.bpath}" width="480" height="360" class="jqzoom">
                </div>
            </c:forEach>
            <!-- 标题图片end -->

            <c:if test="${mediainfo.pics==null || fn:length(mediainfo.pics)==0}">
                <div class="item"><img src="${info.titlepic }" width="480" height="360"></div>
            </c:if>
        </div>

             <div id="cbtn">
                <i class="picSildeLeft preview-control forward"></i> 
                <i class="picSildeRight preview-control backward"></i> 
                <div id="cSlideUl">
                    <ul>
                    	<%--<c:set var="pic_index" value="1"/><!-- 计算图片数量 -->--%>
                    	<%--<c:if test="${mediainfo.d3!=null && mediainfo.d3!='' }"><!-- 360度小图 -->--%>
                    	<%--<c:set var="pic_index" value="${pic_index+1 }"/><!-- 计算图片数量 -->--%>
		                <%--<li><img src="images/vr-small.jpg"></li>--%>
		                <%--</c:if>--%>
		                <%----%>
		                <%--<c:if test="${mediainfo.vide!=null && mediainfo.vide!='' }"><!-- 视频大图 -->--%>
		                <%--<c:set var="pic_index" value="${pic_index+1 }"/><!-- 计算图片数量 -->--%>
		                <%--<li><img src="images/shipin-small.jpg" id="show_video"></li>--%>
		                <%--</c:if>--%>
		                <%----%>
		                <%--<c:if test="${mediainfo.audio!=null && mediainfo.audio!='' }"><!-- 音频小图 -->--%>
		                <%--<c:set var="pic_index" value="${pic_index+1 }"/><!-- 计算图片数量 -->--%>
		                <%--<li><img src="images/video_small.jpg" id="show_audio"></li>--%>
		                <%--</c:if>--%>
		                <%----%>
		                <%--<c:if test="${mediainfo.mappoint!=null && mediainfo.mappoint!=''}"><!-- 地图 -->--%>
		                <%--<c:set var="pic_index" value="${pic_index+1 }"/><!-- 计算图片数量 -->--%>
		                <%--<li><img onclick="initialize();" src="<%=basePath%>images/map.png" width="60" height="45"/></li>--%>
		                <%--</c:if>--%>
		                
                        <c:forEach items="${mediainfo.pics }" var="pic" varStatus="pp">
                        
                        <li <c:if test="${pic_index > 1 && pp.index==0}">class='hov'</c:if> ><img src="${pic.path}"></li>
                		</c:forEach>
                		
                		<c:if test="${mediainfo.pics==null || fn:length(mediainfo.pics)==0}">
		                <li><img src="${info.titlepic }"></li>
		                </c:if>
		                
		                
		                
                    </ul>
                </div>
             </div>         
        </div>
    </div><!--end滚动看图-->




<div class="clear"></div>
            
            <div class="preview-share">

                <c:if test="${mediainfo.d3 != null && mediainfo.d3 != ''}">
                    <a href="javascript:openView();" 	class="share-btn vr have"><i></i>全景</a>
                </c:if>
                <c:if test="${mediainfo.d3 == null || mediainfo.d3 == ''}">
                    <a class="share-btn vr"><i></i>全景</a>
                </c:if>
                <c:if test="${mediainfo.vide != null && mediainfo.vide != ''}">
                    <a  href="javascript:showpopvideo();" id="" class="share-btn video have"><i></i>视频</a>
                </c:if>
                <c:if test="${mediainfo.vide == null || mediainfo.vide==''}">
                    <a class="share-btn video"><i></i>视频</a>
                </c:if>
                <c:if test="${mediainfo.audio != null && mediainfo.audio != ''}">
                    <a  href="javascript:showpopmiuse();" class="share-btn audio have"><i></i>收听</a>
                </c:if>
                <c:if test="${mediainfo.audio == null || mediainfo.audio == ''}">
                    <a class="share-btn audio "><i></i>收听</a>
                </c:if>
                <c:if test="${mediainfo.mappoint != null && mediainfo.mappoint != ''}">
                    <a  href="javascript:showpopmap();" class="share-btn smap have"><i></i>地图</a>
                </c:if>
                <c:if test="${mediainfo.mappoint == null || mediainfo.mappoint == ''}">
                    <a class="share-btn smap "><i></i>地图</a>
                </c:if>

                <a  class="share-btn share have" id="share-pop_a" style="cursor: pointer"><i></i>分享</a>
                <div class="share-pop" id="share-pop" style="display: none">
                    <div class="box clearfix">
                        <div class="smc clearfix">
                            <div class="qr-code">
                                <c:choose>
                                    <c:when test="${mediainfo.d3 != null && mediainfo.d3 != ''}"><!--全景不为空,二维码中写入全景地址-->
                                        <img src="http://qr.topscan.com/api.php?text=${mediainfo.d3}&w=120&m=5" width="120" height="120" class="dsb"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="http://qr.topscan.com/api.php?text=<%=basePath%>infodetail?infoid=${info.infoid}&w=120&m=5" width="120" height="120" class="dsb"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="text">${info.title}</div>
                        </div>



                        <div class="smb clearfix">
                            <%--<div class="bdsharebuttonbox">
                                <a href="#" class="bds_weixin fx-btn" data-cmd="weixin" style="background:url(html/images/fx-ico-1.png) no-repeat center top;" title="分享到微信"></a>
                               <a href="#" class="bds_tsina fx-btn" data-cmd="tsina" title="分享到新浪微博" style="background:url(html/images/fx-ico-2.png) no-repeat center top;"></a>
                               <a href="#" class="bds_sqq fx-btn" data-cmd="sqq"  style="background:url(html/images/fx-ico-3.png) no-repeat center top;"" title="分享到QQ好友"></a>
                           </div>


                           --%>
                            <!-- JiaThis Button BEGIN -->
                            <div class="jiathis_style_32x32 ">
                                <a class="jiathis_button_weixin fx-btn" style="background:url(html/images/fx-ico-1.png) no-repeat center top;"></a>
                                <a class="jiathis_button_cqq fx-btn" style="background:url(html/images/fx-ico-3.png) no-repeat center top;"></a>
                                <a class="jiathis_button_tsina fx-btn" style="background:url(html/images/fx-ico-2.png) no-repeat center top;"></a>
                                <a class=" fx-btn" style="background:url(html/images/fx-ico-4.png) no-repeat center top;" id="download"></a>

                            </div>
                            <script type="text/javascript" >
                                var jiathis_config={
                                    sm:"weixin,cqq,tsina",
                                    summary:"",
                                    shortUrl:false,
                                    hideMore:false
                                }
                            </script>
                            <script type="text/javascript" src="http://v3.jiathis.com/code_mini/jia.js" charset="utf-8"></script>
                            <!-- JiaThis Button END -->

                        </div>
                        <div class="ta-c"><img src="html/images/erweima-tg.png" alt="" /></div>
                    </div>
                    <b></b>

                </div>
            </div>
        </div>
        
        <div class="product-intro">
            <div id="Name">
                <h1>${info.title }</h1>
            </div>
            <div class="detail-characteristic clearfix">
                <c:forEach items="${hotLabelNameList}" var="hotLabel" begin="0" end="2" varStatus="status">
                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                </c:forEach>
                <c:if test="${is_showCompare }">
                <script type="text/javascript">
                    $(function(){
                        var $btn_compare_add =$("#btn_compare_add");
                        var $btn_compare_remove =$("#btn_compare_remove");
                        if(compare_exists("${info.projectguid}")){
                            $btn_compare_add.hide();
                            $btn_compare_remove.show();
                        }else{
                            $btn_compare_add.show();
                            $btn_compare_remove.hide();
                        }

                        $btn_compare_add.click(function(){
                            if(compare_add(
                                    '${info.projecttype}'
                                    ,'${info.projectguid }'
                                    ,'${info.projectstyle }'
                                    ,'${info.title}'
                                    ,'${info.titlepic}'
                                    ,'${info.guapaiprice}'
                                    ,'${info.infoid}')){
                                $btn_compare_add.hide();
                                $btn_compare_remove.show();
                                alert("加入比一比成功");
                            }
                        });
                        $btn_compare_remove.click(function(){
                            if(compare_remove('${info.projectguid }')){
                                $btn_compare_add.show();
                                $btn_compare_remove.hide();
                                alert("删除比一比成功");
                            }
                        });
                    });
                </script>
                <a id="btn_compare_add" href="javascript:;" class="contrast-btn">比一比</a>
                <a id="btn_compare_remove" href="javascript:;" class="contrast-btn active">取消比一比</a>
                </c:if>
            </div>
			<div class="price clearfix">
                <c:choose>
                <c:when test="${info.status_name eq '未开始'}"><div class="label ">报名<br>未开始</div></c:when>
            	<c:when test="${info.status_name eq '报名中'}"><div class="label signup">正在<br>报名</div></c:when>
            	<c:when test="${info.status_name eq '报名中竞价中'}"><div class="label signup">正在<br>报名</div></c:when>
            	<c:when test="${info.status_name eq '报名已截止'}"><div class="label ">报名<br>截止</div></c:when>
            	<c:when test="${info.status_name eq '竞价中'}"><div class="label signup">正在<br>竞价</div></c:when>
            	<c:when test="${info.status_name eq '已成交'}"><div class="label signup">已经<br>成交</div></c:when>
            	<c:when test="${info.status_name eq '竞价已结束'}"><div class="label ">竞价<br>截止</div></c:when>
            	<c:when test="${info.status_name eq '竞价暂停'}"><div class="label ">竞价<br>暂停</div></c:when>
            	<c:when test="${info.status_name eq '中止'}"><div class="label ">项目<br>中止</div></c:when>
            	<c:when test="${info.status_name eq '终结'}"><div class="label ">项目<br>终结</div></c:when>
            	<c:otherwise><div class="label ">${info.status_name}</div></c:otherwise>
            	</c:choose>
                <div class="price-fl ">
                    <dl>
                        <dd>
                          <p id="countdown">
                          </p>
                          <p class="mt5"><span class="fc99">${focusnum }</span> 人关注<span class="fc99 ml20">${info.click }</span> 次浏览</p>
                        </dd>
<c:if test="${page ne 'hide'}">
                        <dt>
                                  <c:if test="${focused == 1 }">
                                  <a href="javascript:cancelFocus();" class="active">
                                      <i class="follow mt10"></i><br>取消关注</a>
                                  </c:if>
                                  <c:if test="${focused != 1 }">
                                  <a href="javascript:addFocus();">
                                      <i class="follow mt10"></i><br>加关注</a>
                                  </c:if>
                                  <i class="ejy_huiyuan_bm" skipType="web" id="cancelFocus" style="display: none;"></i>
                                  <i class="ejy_huiyuan_bm" skipType="web" id="addFocus" style="display: none;"></i>         
                        </dt>
</c:if>
                    </dl>
                </div>
                
            </div>
            <div class="promotion clearfix">
                <c:choose>
                    <c:when test="${is_showOptesthesia}">
                        <jsp:include page="optesthesia.jsp"/>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${info.ispllr == '1'  }">
                            <div class="list wide">
                                <span class="laber">挂牌价 </span><span class="money small">详见交易公告</span>
                            </div>
                            <div class="list narrow">
                                <span class="laber">保证金 </span><span class="money small">详见交易公告</span>
                            </div>
                        </c:if>
                        <c:if test="${info.ispllr != '1'  }">
                            <div class="list wide">
                                <c:if test="${info.systemtype != 'ZZKG' }"> 
                                    <span class="laber">挂牌价 </span><span class="money">${info.guapaiprice }</span><span class=""><c:if test="${info.guapaiprice ne '面议'}"> 元</c:if></span>
                                </c:if> 
                                <c:if test="${info.systemtype == 'ZZKG' }">
                                    <%--<span class="laber">挂牌价 </span><span class="money small">${info.zzkg_guapaiprice }</span>--%>
                                    <span class="laber">挂牌价 </span><span class="money ">${ fn:split(info.zzkg_guapaiprice, ' ')[0] }</span><span>${fn:split(info.zzkg_guapaiprice,' ')[1]}</span>
                                </c:if>
                            </div>
                            <div class="list narrow">
                                <span class="laber">保证金 </span><span class="money small">${info.baozhengjprice }</span><span class="">元</span>
                            </div>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="detail-bug-btn clearfix">
                <c:choose>
                    <c:when test="${info.status_name eq '报名中'}">
                        <a href="javascript:void(0);" class="bond-btn fr btn-enroll ejy_huiyuan_bm" id="${info.project_no }">报名交保证金</a>
                    </c:when>
                    <c:when test="${info.status_name eq '报名中竞价中'}">
                        <a href="javascript:void(0);" class="bond-btn fr btn-enroll ejy_huiyuan_bm" id="${info.project_no }">报名交保证金</a>
                    </c:when>
                    <c:when test="${info.status_name eq '竞价中'}">
                        <a href="javascript:void(0);" class="bond-btn fr btn-enroll ejy_huiyuan_bm" id="${info.project_no }">竞价中</a>
                    </c:when>
                    <c:when test="${info.status_name eq '中止'}">
                        <a href="javascript:void(0);" class="financing-btn over">项目中止</a>
                    </c:when>
                    <c:when test="${info.status_name eq '终结'}">
                        <a href="javascript:void(0);" class="financing-btn over">项目终结</a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:void(0);" class="financing-btn over">${info.status_name}</a>
                    </c:otherwise>
                </c:choose>
                <!-- 如报名结束，则CLASS增加over -->
                <a href="javascript:void(0);" class="financing-btn over">在线融资申请</a>
                <!-- 如没有在线融资申请，则CLASS增加over -->
            </div>
            <div class="mod_main clearfix">
              提醒：如已缴纳保证金，并获得竞价账户密码，请<a href="http://www.e-jy.com.cn/ejyhy/login_07.aspx" target="_blank" class="fcdd3">登录</a>
            </div>
            <div class="detail-info-notice">
	            <c:if test="${info.ispllr == '1' }">
	            	报名开始时间：详见标的列表<br/>
	            	报名截止时间：详见标的列表
	            </c:if>
	            <c:if test="${info.ispllr != '1' }">
	                <c:if test="${info.xiaQuCode != '101023' && info.xiaQuCode != '101024' }">
	             	            报名开始时间：<fmt:formatDate value="${info.gonggaofromdate }" type="date" dateStyle="medium" pattern="yyyy-MM-dd HH:mm:ss"/>  <br>
					    报名截止时间：<fmt:formatDate value="${info.gonggaotodate }" type="date" dateStyle="medium" pattern="yyyy-MM-dd HH:mm:ss"/>	          		          	
	          	    </c:if>
	                <c:if test="${info.xiaQuCode == '101023' || info.xiaQuCode == '101024' }">
	             	            报名开始时间：<fmt:formatDate value="${info.gonggaofromdate }" type="date" dateStyle="medium" pattern="yyyy-MM-dd"/>  <br>
					    报名截止时间：<fmt:formatDate value="${info.gonggaotodate }" type="date" dateStyle="medium" pattern="yyyy-MM-dd"/>       	
	          	    </c:if>
	            </c:if>	          	
            </div>
        </div>
    </div>

<c:if test="${page ne 'hide'}">
<div class="product_about">
    <div class="buy-helper">
      <h2 class="hd">
        <a href="<%=basePath %>questionList?page=1&rows=20" target="_blank" class="clearfix">
          <i class="iconfont-sf left"></i>常见问题 <i class="iconfont-sf right"></i>
        </a>
      </h2>
      <ul>
      	 <c:forEach items="${questions }" var="question">
      	 	<li><a href="<%=basePath%>questioninfo?infoid=${question.id}" target="_blank"><span class="helper-tag">${question.key_word }</span>${question.title }</a>
      	 	</li>
      	 </c:forEach>
       </ul>
    </div>
    <div class="merchants">
        <ul class="merchants-title">
            <li><a href="<%=basePath%>jygg_more?orgname=${danweiName}&page=1" target="_blank" ><img src="<%=basePath%>upload/ad/${info.orgPic}" alt="${info.danweiname}"  height="50"></a></li>
            <li><a href="javascript:;" >${info.danweiname}</a></li>
        </ul>
        <c:if test="${not empty info.orgLXR and info.orgLXR !=''}">
            <dl class="dispatching">
                <dt>联  系  人：</dt>
                <dd>${info.orgLXR}</dd>
            </dl>
        </c:if>

        <c:if test="${not empty info.orgPhone and info.orgPhone !=''}">
            <dl class="dispatching">
                <dt>联系电话：</dt>
                <dd>${info.orgPhone} </dd>
            </dl>
        </c:if>
        <c:if test="${not empty info.orgAddress and info.orgAddress !=''}">
            <dl class="dispatching">
                <dt>单位地址：</dt>
                <dd>${info.orgAddress}</dd>
            </dl>
        </c:if>
    </div>
    

        </div>
</c:if>
</div> 
    
<div class="pm-bid-flow clearfix">
  <a href="javascript:void(0);" class="close"></a>
          <div class="fl pm-bid-flow-title">项目<br>流程</div>
          <div class="fl pm-bid-flow-list">
            <ul class="clearfix">
              <li class="pm-bid-flow1">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第一步</span><p>阅读公告</p></div>
              </li>
              <li class="pm-bid-flow2">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第二步</span><p>报名登记</p></div>
              </li>
              <li class="pm-bid-flow3">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第三步</span><p>交保证金</p></div>
              </li>
              <li class="pm-bid-flow4">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第四步</span><p>参与报价</p></div>
              </li>
              <li class="pm-bid-flow5">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第五步</span><p>成交确认</p></div>
              </li>
              <li class="pm-bid-flow6">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第六步</span><p>资金结算</p></div>
              </li>
              <li class="pm-bid-flow7">
                <i></i>
                <div class="pm-bid-flow-bz"><span>第七步</span><p>办理交割</p></div>
              </li>
            </ul>
          </div>
          <!--<a href="javascript:;" class="pm-flow-close">×</a>-->
        </div>

<div id="Comment" class="clearfix">
    <c:choose>
        <c:when test="${info.isCommonTemplate eq '1'}">
            <jsp:include page="commonTemplate.jsp"></jsp:include>
        </c:when>
        <c:otherwise>
            <div class="detail-con-left">
                <div class="deatil-tabs-height"></div>
                <ul class="tab deatil-tabs" id="itemdetail_area">
                    <c:choose>
                        <c:when test="${info.status_name eq '终结'}">
                            <li class="survey switch curr" onclick="myclick(2)">终结公告</li>
                            <li class="survey switch" onclick="myclick(1)">竞买公告</li>
                        </c:when>
                        <c:when test="${info.status_name eq '中止'}">
                            <li class="survey switch curr" onclick="myclick(3)">中止公告</li>
                            <li class="survey switch" onclick="myclick(1)">竞买公告</li>
                        </c:when>
                        <c:otherwise><!--中止不为空,终结不为空,第一位是中止公告-->
                            <li class="survey switch curr" onclick="myclick(1)">竞买公告</li>
                        </c:otherwise>
                    </c:choose>
                    <c:choose >
                        <c:when test="${info.systemtype  eq 'ZZKG'}">
                            <li class="survey switch" onclick="myclick(4)">增资企业信息</li>
                        </c:when>
                        <c:otherwise>
                            <li class="survey switch" onclick="myclick(5)">标的企业信息</li>
                        </c:otherwise>
                    </c:choose>
                    <li class="survey switch" onclick="myclick(6)">重要披露事项</li>
                    <c:choose>
                        <c:when test="${info.ispllr eq '1' }">
                            <li class="survey switch" onclick="myclick(7)">标的列表</li>
                        </c:when>
                        <c:otherwise>
                            <li class="survey switch" onclick="myclick(7)">竞买记录</li>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${info.cjgg_guid!=null }">
                        <li class="survey switch" onclick="myclick(8)">交易结果公示</li>
                    </c:if>
                </ul>
                <c:choose>
                    <c:when test="${info.status_name eq '终结'}"><!--第一位是终结公告-->
                        <div id="tab2_content" class="detail-tabcon clearfix" style="display: block;">
                            <c:if test="${zjList.size() ==1}">
                                <div class="p"><!-- 终结公告内容 -->
                                    <iframe frameborder="0" scrolling="auto" name="gonggao_iframe"
                                            src="content?infoid=${zjList.get(0).infoid}" width="890px"></iframe>
                                </div>
                            </c:if>
                        </div>
                        <div id="tab1_content" class="detail-tabcon " style="display: none;">
                            <div class="ph12">
                                <div class="pd15"><!-- 公告内容 -->
                                    <iframe frameborder="0" scrolling="auto" name="gonggao_iframe"
                                            src="content?infoid=${info.infoid}" width="890px"></iframe>
                                    
                                </div>
                                <br/>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${info.status_name eq '中止'}"><!--第一位是中止公告-->
                        <div id="tab3_content" class="detail-tabcon clearfix" style="display: block;">
                            <c:if test="${zzList.size() >0}">
                                <div class="pd15"><!-- 中止公告内容 -->
                                    <iframe frameborder="0" scrolling="auto" name="gonggao_iframe"
                                            src="content?infoid=${zzList.get(0).infoid}" width="890px"></iframe>
                                </div>
                            </c:if>
                        </div>
                        <div id="tab1_content" class="detail-tabcon " style="display: none;">
                            <div class="pd15"><!-- 公告内容 -->
                                <iframe frameborder="0" scrolling="auto" name="gonggao_iframe"
                                        src="content?infoid=${info.infoid}" width="890px"></iframe>
                                
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise><!--第一位是竞买公告-->
                        <div id="tab1_content" class="detail-tabcon " style="display: block;">
                            <div class="pd15"><!-- 公告内容 -->
                                <iframe frameborder="0" scrolling="auto" name="gonggao_iframe"
                                        src="content?infoid=${info.infoid}" width="890px"></iframe>
                                
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <c:if test="${info.systemtype  eq 'ZZKG'}">
                    <div class="detail-tabcon " id="tab4_content" style="display:none;">
                        <div class="pd15">
                            <table class="base-detail-table" border="0" bordercolor="black" cellspacing="0"
                                   cellpadding="0">
                                <tr>
                                    <td width="120" class="title">增资企业名称</td>
                                    <td colspan="5">${qyxxlist.objectName}</td>
                                </tr>
                                <tr>
                                    <td class="title">监管机构（部门）</td>
                                    <td>${qyxxlist.monitorName_name}</td>
                                    <td class="title" width="120">监管机构（部门）地区代码</td>
                                    <td>${qyxxlist.monitorZone_name}</td>
                                    <td class="title" width="120">批准单位</td>
                                    <td>${qyxxlist.authorizeUnit}</td>
                                </tr>
                                <tr>
                                    <td class="title">批准文件类型</td>
                                    <td>${qyxxlist.authorizeFileType_name}</td>
                                    <td class="title">批准文件名称</td>
                                    <td>${qyxxlist.authorizeFileName}</td>
                                    <td class="title">国家出资企业统一社会信用代码</td>
                                    <td>${qyxxlist.HQCode}</td>
                                </tr>
                                <tr>
                                    <td width="120" class="title">国家出资企业</td>
                                    <td colspan="5">${qyxxlist.HQName}</td>
                                </tr>
                                <tr>
                                    <td class="title">增资企业统一社会信用代码</td>
                                    <td>${qyxxlist.objectCode}</td>
                                    <td class="title">增资企业经营规模</td>
                                    <td>${qyxxlist.managerScale_name}</td>
                                    <td class="title">增资企业所在地区</td>
                                    <td>${qyxxlist.zone_name}</td>
                                </tr>
                                <tr>
                                    <td class="title">增资企业所属行业</td>
                                    <td>${qyxxlist.industryCode_name}</td>
                                    <td class="title">增资企业经济类型</td>
                                    <td>${qyxxlist.economyType_name}</td>
                                    <td class="title">增资企业企业类型</td>
                                    <td>${qyxxlist.economyNature_name}</td>
                                </tr>
                                <tr>
                                    <td class="title">增资企业职工人数</td>
                                    <td>${qyxxlist.employeeQuantity}</td>
                                    <td class="title">注册资本</td>
                                    <td colspan="3">${qyxxlist.registeredCapital}</td>
                                </tr>
                                <tr>
                                    <td class="title">主要业务、经营范围</td>
                                    <td colspan="5">${qyxxlist.businessScope}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </c:if>
                <c:if test="${info.systemtype  eq 'GQ'}">
                    <div class="detail-tabcon " id="tab5_content" style="display:none;">
                        <div class="pd15">
                            <table class="base-detail-table" border="0" bordercolor="black" cellspacing="0"
                                   cellpadding="0">
                                <tr>
                                    <td width="120" class="title">标的企业名称</td>
                                    <td colspan="5">${qyxxlist.objectName}</td>
                                </tr>
                                <tr>
                                    <td class="title">标的企业统一社会信用代码</td>
                                    <td>${qyxxlist.objectCode}</td>
                                    <td class="title" width="120">标的企业经营规模</td>
                                    <td>${qyxxlist.managerScale}</td>
                                    <td class="title" width="120">标的企业所在地区</td>
                                    <td>${qyxxlist.Zone_name}</td>
                                </tr>
                                <tr>
                                    <td class="title">标的企业所属行业</td>
                                    <td>${qyxxlist.industryCode_name}</td>
                                    <td class="title">标的企业经济类型</td>
                                    <td>${qyxxlist.economyType_name}</td>
                                    <td class="title">标的企业企业类型</td>
                                    <td>${qyxxlist.economyNature_name}</td>
                                </tr>

                                <tr>
                                    <td class="title">标的企业职工人数</td>
                                    <td>${qyxxlist.employeeQuantity}</td>
                                    <td class="title">注册资本</td>
                                    <td>${qyxxlist.registeredCapital}</td>
                                </tr>
                                <tr>
                                    <td width="120" class="title">主要业务、经营范围</td>
                                    <td colspan="5">${qyxxlist.businessScope}</td>
                                </tr>
                                <tr>
                                    <td class="title">本次拟转让产(股)权比例</td>
                                    <td>${qyxxlist.sellPercent}</td>
                                    <td class="title">本次拟转让股份数</td>
                                    <td><c:if test="${qyxxlist.gf!='0'}">${qyxxlist.gf}</c:if></td>
                                    <td class="title">决策文件类型</td>
                                    <td>${qyxxlist.decisionFileType}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </c:if>
                <!--重要披露事项-->
                <div class="detail-tabcon " id="tab6_content" style="display:none;">
                        <%--<div style="height: 600px">  ${info.description}<br/>(以公告内容为准)</div>--%>
                    <div class="pd15">
                        <h4>受让方资格条件</h4>${info.zgtj}(以公告内容为准)
                        <c:if test="${info.systemtype eq 'GQ'}">
                            <h4>与转让相关其他条件</h4>${info.zhuanrangftj }(以公告内容为准)
                        </c:if>
                        <h4>重大事项披露</h4>${info.zhongdcontent }(以公告内容为准)
                        <c:if test="${info.systemtype eq 'ZZKG'}">
                            <h4>企业管理层或员工是否有参与融资意向</h4>
                            <c:choose>
                                <c:when test="${info.hasInvestIntent eq'1'}">
                                    是
                                </c:when>
                                <c:otherwise>
                                    否
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${info.systemtype eq 'GQ'}">
                            <h4>企业管理层是否参与受让</h4>
                            <c:choose>
                                <c:when test="${info.hasBuyIntent eq'1'}">
                                    是
                                </c:when>
                                <c:otherwise>
                                    否
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </div>
                </div>

                <div class="detail-tabcon " id="tab7_content" style="display:none;">

                    <div id="jmjl"  class="pd10">
                        <iframe id="jmjlpage" name="gonggao_iframe" src="jmjl?infoid=${info.infoid}" frameborder="0" style="width:100%;"></iframe>
                    </div>
                </div>
                <c:if test="${info.cjgg_guid!=null }">
                    <div class="detail-tabcon " id="tab8_content" style="display:none;">
                            <%--${info.chengjiaogg }--%>
                        <div class="pd15"><!-- 交易结果公示 -->
                            <iframe frameborder="0" scrolling="no" src="content?infoid=${info.cjgg_guid}" name="gonggao_iframe"
                                    width="890px" ></iframe>
                        </div>
                    </div>
                </c:if>
            </div>
        </c:otherwise>
    </c:choose>
<c:if test="${page ne 'hide'}">
<div class="detail-con-right">
<div class="right-list clearfix">
<h3>猜你喜欢</h3>
<ul class="clearfix">
<c:forEach var="cqjy" items="${list_like}" begin="0" end="1">
    <li>
    <a href="<%=basePath %>infodetail?infoid=${cqjy.infoid}"
    title="">
    <img src="${cqjy.titlepic}" width="100%" title="">
    <dl>
    <dt><span class="fcdd3">[${cqjy.s2 }]</span>${cqjy.title }</dt>
    <dd>
    <c:if test="${cqjy.systemtype != 'ZZKG' }"> 
    <span>挂牌价：<span class="fcdd3">${cqjy.guapaiprice }<c:if test="${cqjy.guapaiprice ne '面议'}"> 元</c:if></span></span>
    </c:if>
    <c:if test="${cqjy.systemtype == 'ZZKG' }"> 
    <span>挂牌价：<span class="fcdd3">${cqjy.zzkg_guapaiprice }</span></span>
    </c:if>
    </dd>
    </dl>
    </a>
    </li>
</c:forEach>
</ul>
</div>

</div>
</c:if>
</div>
  </div>      
  </div>
<c:if test="${page ne 'hide'}">
  		<!--  通用底部b -->
		<jsp:include page="bottom.jsp"></jsp:include>
        <!--  通用底部E -->
</c:if>
       <!-- 弹出视频B -->
       <div class="visit-fix popvideo" style="bottom: -100%;">
           <div class="fix-bg"></div>
           <div class="box">
               <div class="recharge-cz video">
                   <a href="javascript:closepopvideo();" class="close">
                       <i class="fc99 f24 iconfont icon-error"></i>
                   </a>
                   <c:if test="${mediainfo.vide != null && mediainfo.vide != ''}">
                       <div class="item">
                           <object id="MediaPlayer" classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" width="480" height="360" standby="Loading Windows Media Player components…" type="application/x-oleobject" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,7,1112">
                               <param name="FileName" value="${mediainfo.vide}">
                               <param name="AutoStart" value="true">
                               <param name="ShowControls" value="true">
                               <param name="BufferingTime" value="2">
                               <param name="ShowStatusBar" value="true">
                               <param name="AutoSize" value="true">
                               <param name="InvokeURLs" value="false">
                               <param name="AnimationatStart" value="1">
                               <param name="TransparentatStart" value="1">
                               <param name="Loop" value="1">
                               <embed type="application/x-mplayer2" src="${mediainfo.vide}" name="MediaPlayer" autostart="1" showstatusbar="1" showdisplay="1" showcontrols="1" loop="0" videoborder3d="0" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" width="480" height="360"></embed>
                           </object>
                       </div>
                   </c:if>
               </div>

           </div>
       </div>
       <!-- 弹出视频E -->



       <!-- 弹出音频 B -->
       <div class="visit-fix popmiuse" style="bottom: -100%;">
           <div class="fix-bg"></div>
           <div class="box">
               <div class="recharge-cz video">
                   <a href="javascript:closepopmiuse();" class="close">
                       <i class="fc99 f24 iconfont icon-error"></i>
                   </a>
                   <!-- 音频begin -->
                   <c:if test="${mediainfo.audio!=null && mediainfo.audio!='' }">

                       <div class="item" style="background:url(images/voice-big.jpg)">

                           <div style="padding-top: 130px;    width: 422px; margin: 0px auto;">
                               <link href="<%=basePath%>mp3player/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" />

                               <script type="text/javascript" src="<%=basePath%>mp3player/jplayer/jquery.jplayer.min.js"></script>
                               <div id="jquery_jplayer_1" class="jp-jplayer"></div>
                               <div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
                                   <div class="jp-type-single">
                                       <div class="jp-gui jp-interface">
                                           <div class="jp-controls">
                                               <button class="jp-play" role="button" tabindex="0">play</button>
                                               <button class="jp-stop" role="button" tabindex="0">stop</button>
                                           </div>
                                           <div class="jp-progress">
                                               <div class="jp-seek-bar">
                                                   <div class="jp-play-bar"></div>
                                               </div>
                                           </div>
                                           <div class="jp-volume-controls">
                                               <button class="jp-mute" role="button" tabindex="0">mute</button>
                                               <button class="jp-volume-max" role="button" tabindex="0">max volume</button>
                                               <div class="jp-volume-bar">
                                                   <div class="jp-volume-bar-value"></div>
                                               </div>
                                           </div>
                                           <div class="jp-time-holder">
                                               <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                                               <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                                               <div class="jp-toggles">
                                                   <button class="jp-repeat" role="button" tabindex="0">repeat</button>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="jp-details">
                                           <div class="jp-title" aria-label="title">&nbsp;</div>
                                       </div>
                                       <div class="jp-no-solution">
                                           <span>Update Required</span>
                                           To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                                       </div>
                                   </div>
                               </div>
                               <script type="text/javascript">
                                   $("#jquery_jplayer_1").jPlayer({
                                       ready: function (event) {
                                           $(this).jPlayer("setMedia", {
                                               mp3: "${mediainfo.audio}"
                                           });
                                       },
                                       swfPath: "<%=basePath%>mp3player/jplayer",
                                       supplied: "mp3",
                                       wmode: "window",
                                       useStateClassSkin: true,
                                       autoBlur: false,
                                       smoothPlayBar: true,
                                       keyEnabled: true,
                                       remainingDuration: true,
                                       toggleDuration: true
                                   });
                               </script>
                           </div>


                       </div>
                   </c:if>
                   <!-- 音频end -->
               </div>

           </div>
       </div>
       <!-- 弹出音频 E -->


       <!-- 弹出地图 B -->
       <div class="visit-fix popmap" style="bottom: -100%;">
           <div class="fix-bg"></div>
           <div class="box">
               <div class="recharge-cz video">
                   <a href="javascript:closepopmap();" class="close">
                       <i class="fc99 f24 iconfont icon-error"></i>
                   </a>
                   <!-- 地图begin -->
                   <!--
                <c:if test="${mediainfo.mappoint!=null && mediainfo.mappoint!=''}">
                <div class="item"><div id="allmap" style="width:480px;height:360px"></div></div>
                <script>

                var map = null;
                var point = null;
                var panorama = null;
            	function qj()
            	{
                	panorama.setPosition(point);

            	};

                function initialize() {
                	setTimeout(function(){
                		if(map==null){
                			map = new BMap.Map("allmap");
                			point = new BMap.Point(${mediainfo.mappoint});
                			panorama = new BMap.Panorama('allmap');
                			panorama.setPov({heading: -40, pitch: 6});
                			map.centerAndZoom(point, 18);
                 			map.enableScrollWheelZoom();

                 			map.addTileLayer(new BMap.PanoramaCoverageLayer());

                 			var pic = '${mediainfo.pics[0].bpath }';
                            if(pic){
                            }else{
                            	pic = '${info.titlepic }';
                            }

                 		    var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                            '<img src="'+pic+'" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                            '联系人：${info.orgLXR}<br/>联系电话：${info.orgPhone}<br/>单位地址：${info.orgAddress}<br/>' +
                            '<a onclick="javascript:qj();" >进入全景&gt;&gt;</a>' +
            				'</div>';

            				//创建检索信息窗口对象
            				var searchInfoWindow = null;
            				searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
            						title  : "${info.projectname }",      //标题
            						width  : 290,             //宽度
            						height : 105,              //高度
            						panel  : "panel",         //检索结果面板
            						enableAutoPan : true,     //自动平移
            						searchTypes   :[
            							BMAPLIB_TAB_SEARCH,   //周边检索
            							BMAPLIB_TAB_TO_HERE,  //到这里去
            							BMAPLIB_TAB_FROM_HERE //从这里出发
            						]
            					});
            				var marker = new BMap.Marker(point); //创建marker对象
            				marker.addEventListener("click", function(e){
            					searchInfoWindow.open(marker);
            				})
            				map.addOverlay(marker); //在地图中添加marker
                    	}
                	},500);
              	}
                </script>
                </c:if>
                -->
                   <!-- 地图end -->
               </div>

           </div>
       </div>
       <!-- 弹出地图 E -->

<c:if test="${page ne 'hide'}">
        <!--侧边快捷导航-->
        <jsp:include page="rightbutton.jsp"></jsp:include>
        <!--/侧边快捷导航-->
</c:if>
       <script src="<%=basePath%>html/js/jquery.autocompleter.js"></script>
    <script src="<%=basePath%>html/js/iconfont.js"></script>
    <script src="<%=basePath%>html/js/focus.js"></script>
    <script src="<%=basePath%>html/js/main.js"></script>
    <script src="<%=basePath%>html/js/glivia.js"></script>
    <script src="<%=basePath%>html/js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/ejy_baoming/js/ejy.js"></script>
       <script type="text/javascript" class="__web-inspector-hide-shortcut__">
           $(function() {
               $(".jqzoom").imagezoom();
               $("#cSlideUl li a").click(function() {
                   $(this).parents("li").addClass("hov").siblings().removeClass("hov");
                   $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                   $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
               });
           });
       </script>
	<script>
	
	$(document).ready(function(){
		
		$(".hov:last").click();
		
		//window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
		
	});


    var r = 0;
    function reinitIframe() {
        var iframe_s = document.getElementsByTagName("iframe");
        for(var i=0 ;i < iframe_s.length; i++){
            if(iframe_s[i].name === "gonggao_iframe"){
        		var bHeight = 0;
                r++;
                if(iframe_s[i].contentWindow.document.body){
                	bHeight = iframe_s[i].contentWindow.document.body.scrollHeight;
                }
                var dHeight = 0;
                if(iframe_s[i].contentWindow.document.documentElement){
                	dHeight = iframe_s[i].contentWindow.document.documentElement.scrollHeight;
                }


                if("jmjlpage"===iframe_s[i].id){

                    var height = Math.min(bHeight, dHeight);
                    iframe_s[i].height = height;
                }else{
                    var height = Math.max(bHeight, dHeight);
                    iframe_s[i].height = height;
                }


            }

        }
    }

    window.setInterval(reinitIframe, 800);
	
	
	//加关注
	function addFocus(){
		$.ajax({
			url:"<%=basePath%>addFocus",
			type:"post",
			dataType:"json",
			data:{infoid:'${info.infoid}'},
			success:function(data){
			    if (data.code == '1'){
			    	$("#ejy_huiyuan_logout").click();
			    	$("#addFocus").click();
                }else if(data.code == '0'){
			        alert(data.msg);
                    history.go(0);
                }else{
                   
                }
			}
		});
	}

    //取消关注
    function cancelFocus(){
        $.ajax({
            url:"<%=basePath%>cancelFocus",
            type:"post",
            dataType:"json",
            data:{infoid:'${info.infoid}'},
            success:function(data){
            	if (data.code == '1'){
            		$("#ejy_huiyuan_logout").click();
			    	$("#cancelFocus").click();
                }else if(data.code == '0'){
			        alert(data.msg);
                    history.go(0);
                }else{
                   
                }
            }
        });
    }
    
    var t1,t2;
    //与报名截止时间比较，计算倒计时
    function countdown(){
    	var date = new Date();
        var newDate =new Date(Date.parse('<fmt:formatDate value="${info.gonggaotodate }" type="date" dateStyle="medium" pattern="yyyy/MM/dd HH:mm:ss"/>'));
        var itime = newDate.getTime()-date.getTime();
        var isecond = parseInt(itime/1000);
        var newDay = parseInt(isecond/24/60/60);
        var modeDay = isecond%(24*60*60);
        var newHour = parseInt(modeDay/60/60);
        var modeHour = modeDay%(60*60);
        var newMinute = parseInt(modeHour/60);
        var modeMinute = modeHour%60;
        var newSecond = parseInt(modeMinute);
        if (newSecond<0){
            $("#countdown").html("报名截止");
            $(".label").removeClass("signup").html("报名<br/>截止");
            $(".btn-enroll").removeClass().addClass("financing-btn over").html("报名截止");
            clearTimeout(t1);
        }else{
            $("#countdown").html("距报名截止：<b class=\"org bold\">"+newDay+"</b> 天 <b class=\"org bold\">"+newHour+"</b> 时 <b class=\"org bold\">"+newMinute+"</b> 分 <b class=\"org bold\">"+newSecond+"</b>  秒");
        }
    }

    //与竞价结束时间比较，计算倒计时
    function jingjia_end(){
        var date = new Date();
        var year = date.getFullYear();
        var newDate =new Date(Date.parse('<fmt:formatDate value="${info.jingjia_end }" type="date" dateStyle="medium" pattern="yyyy/MM/dd HH:mm:ss"/>'));
        var itime = newDate.getTime()-date.getTime();
        var isecond = parseInt(itime/1000);
        var newDay = parseInt(isecond/24/60/60);
        var modeDay = isecond%(24*60*60);
        var newHour = parseInt(modeDay/60/60);
        var modeHour = modeDay%(60*60);
        var newMinute = parseInt(modeHour/60);
        var modeMinute = modeHour%60;
        var newSecond = parseInt(modeMinute);
        if (newSecond<0){
            $("#countdown").html("竞价截止");
            $(".label").removeClass("signup").html("竞价<br>截止");
            $(".btn-enroll").removeClass().addClass("financing-btn over").html("竞价截止");
            clearTimeout(t2);
        }else {
            $("#countdown").html("距竞价截止：<b class=\"org bold\">" + newDay + "</b> 天 <b class=\"org bold\">" + newHour + "</b> 时 <b class=\"org bold\">" + newMinute + "</b> 分 <b class=\"org bold\">" + newSecond + "</b>  秒");
        }
    }

    var status_name='${info.status_name}';
    if (status_name == '报名中'){
        t1=setInterval(countdown, 1000);
    }else if (status_name == '竞价中'){
        t2=setInterval(jingjia_end, 1000);
    }else if (status_name == '中止'){
        $("#countdown").html("项目中止");
    }else if (status_name == '终结'){
        $("#countdown").html("项目终结");
    }else{
        $("#countdown").html(status_name);
    }
    //百度地图显示

    //切换wrap显示,传入要显示的wrap的id,其他的都隐藏
    function wrapshow(wrapid){
    	$('#wrap').hide();
		$('#mapwrap').hide();
		$('#videowrap').hide();
		$('#audiowrap').hide();
		$('#'+wrapid).show();
    }
    
    //展示中图
    function showmidpath(midpath){
    	$('#wrap').show();
    	$('#mapwrap').hide();
    	$('#videowrap').hide();
    	$(".jqzoom").attr("src",midpath);
    }
    //幻灯片默认展示的判断
    <c:if test="${mediainfo.d3 != null }">
	    $('#wrap').show();
		$('#mapwrap').hide();
		$('#videowrap').hide();
		$('#audiowrap').hide();
    </c:if>
    <c:if test="${mediainfo.d3 == null and mediainfo.video_pic != null }">
	    $('#wrap').hide();
		$('#videowrap').show();
		$('#mapwrap').hide();
		$('#audiowrap').hide();
	</c:if>
	<c:if test="${mediainfo.d3 == null and mediainfo.video_pic == null }">
	    $('#wrap').hide();
		$('#videowrap').hide();
		$('#mapwrap').show();
		$('#audiowrap').hide();
	</c:if>
    </script>
<a style="display: none;" href="http://www.e-jy.com.cn/ejyhy/logout.aspx" target="ejy_huiyuan_logout"><i id="ejy_huiyuan_logout" ></i></a>
<iframe style="display: none;" name="ejy_huiyuan_logout"></iframe>
        
<jsp:include page="ejy_login.jsp"/>




</body>

</html>
