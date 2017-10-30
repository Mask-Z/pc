<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<base href="<%=basePath%>">
    <title>e交易-产权交易平台</title>
    <jsp:include page="mate.jsp"></jsp:include>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
  <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=AESTptOW5fBvg7gLR6GGUaIwpv1Vdfei"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
</head>


<body>
<style type="text/css">
		body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap {width:100%; height: 500px;}
	</style>
      

<!-- 弹出地图 B -->
<div>
  <div></div>
     <div>
        <div>
                <!-- 地图begin -->
                <c:if test="${mappoint!=null && mappoint!=''}">
                <div class="item"><div id="allmap"></div></div>
                <script>                            
                var map = null;
                var point = null;
                var panorama = null;
            	function qj(){
                	panorama.setPosition(point);            		
            	};            	
                function initialize(){
                	setTimeout(function(){
                		if(map==null){
                			map = new BMap.Map("allmap");
                			point = new BMap.Point(${mappoint});
                			panorama = new BMap.Panorama('allmap'); 
                			panorama.setPov({heading: -40, pitch: 6});
                			map.centerAndZoom(point, 18);
                 			map.enableScrollWheelZoom();
                 			
                 			map.addTileLayer(new BMap.PanoramaCoverageLayer());
                 			
                 			var pic = '${pic }';
                 		    var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
                            '<img src="'+pic+'" alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
                            '联系人：${orgLXR}<br/>联系电话：${orgPhone}<br/>单位地址：${orgAddress}<br/>' +
                            '<a onclick="javascript:qj();" >进入全景&gt;&gt;</a>' +
            				'</div>';

            				//创建检索信息窗口对象
            				var searchInfoWindow = null;
            				searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
            						title  : "${projectname }",      //标题
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
                	document.getElementById("allmap").style.height = document.body.clientHeight + "px";
              	}
                initialize();
                </script>
                </c:if>
                <!-- 地图end -->
         </div>
         
  </div>
</div>
<!-- 弹出地图 E -->


</body>

</html>
