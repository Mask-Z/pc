<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>捡漏</title>
	<jsp:include page="mate.jsp"></jsp:include>
	<script src="<%=basePath%>html/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>ext/echarts.min.js"></script>
	<script type="text/javascript">
	<%
	    String size = "";
	    Object obj = request.getAttribute("his");
	    if (obj != null) {
	        List s = (List) obj;
	        size = String.valueOf(s.size());
	    }
	
	%>
	</script>
	<style type="text/css">
		.tr1{text-align: center;}
		.orange{text-align: center;color: orange;height:30px;padding: 2px;font-size: 14px;border-bottom: solid 1px #ccc;}
	</style>
  </head>
  
  <body>
  	<table>
  		<tr>
  			<td>
  			 <!-- 竞价历史 -->
  		 <c:if test="${gg.allowmorejqxt=='1' }">
  		 <div style="text-align: center;width: 100%;">
            <h3 class="clearfix pt10 pb10 ta-c">第一次竞价</h3>
         </div>
         </c:if>
         <div style="width: 400px;float: left;    margin-right: 10px;">
         	 <c:if test="${gg.ispllr == '1' }">
	  		 	<div style="text-align: center;width: 100%;">
	  		 		<button style="cursor: pointer;height: 45px;border: none;background-color: orange;"
	  		 		onclick="parent.backobjects();">返回标的列表</button>
	  		 	</div>
	  		 </c:if>
             <table style="width: 400px;float: left;" class="table table-striped">
                 <tbody>
                 <tr class="tr1">
                     <td nowrap="nowrap" width="30px"> 序号</td>
                     <td nowrap="nowrap" width="80px"> 竞买人编号</td>
                     <td nowrap="nowrap" width="80px"> 价格(元)</td>
                     <td align="center"> 时间</td>
                 </tr>
                 </tbody>
             </table>
             <div style="overflow-y:auto;height:330px; float: left;overflow-x:hidden;">
                 <table style="width: 400px;float: left;"
                        class="table table-striped">
                     <tbody>
                     <c:choose>
                         <c:when test="${his ==null || fn:length(his) ==0}">
                             <tr>
                                 <td colspan="3"
                                     style="color: red;text-align: left;">暂无竞价
                                 </td>
                             </tr>
                         </c:when>
                         <c:otherwise>
                             <c:forEach items="${his }" var="obj" varStatus="jh">
                                 <tr style="font-size: 11px;">
                                     <%--获取倒序的序号--%>
                                     <td>${his.size()-jh.index }</td>
                                     <c:choose>
                                         <c:when test="${jinjia_1=='3' }"><!-- 竞价结束 -->
                                             <td width="80px" class="tr-end orange">${obj.code }</td>
                                             <td width="80px" class="tr-end orange">${obj.price }</td>
                                         </c:when>
                                         <c:otherwise><!-- 竞价未结束 -->
                                             <c:choose>
                                                 <c:when test="${gg.jingjiafangshi=='3'}"><!-- 密封式 -->
                                                     <td width="80px" class="tr-end orange">*****</td>
                                                     <td width="80px" class="tr-end orange">*****</td>
                                                 </c:when>
                                                 <c:otherwise><!-- 正常报价 -->
                                                     <td width="80px" class="tr-end orange">*****</td>
                                                     <td width="80px" class="tr-end orange">${obj.price }</td>
                                                 </c:otherwise>
                                             </c:choose>
                                         </c:otherwise>
                                     </c:choose>
                                     <td class="tr-end orange" nowrap="nowrap">${obj.bj_time}</td>
                                 </tr>
                             </c:forEach>
                         </c:otherwise>
                     </c:choose>
                     </tbody>
                 </table>
             </div>
         </div>
  			</td>
  			<td>
  			<!-- 竞价曲线 -->
        <div id="main" style="padding-left:5px;width: 500px;height:400px;float: right;overflow: auto;"></div>
        <script type="text/javascript">
            var xAxis_data = [];
            var series_data = [];
        </script>
        <c:forEach items="${baojiaHis }" var="info">
            <script type="text/javascript">
                xAxis_data.push('${fn:substring(info.date ,0 ,10)}\n${fn:substring(info.date ,10 ,23)}');
                <c:choose>
                <c:when test="${jinjia_1=='3' }"><!-- 竞价结束 -->
                	series_data.push('${info.price}');
                </c:when>
                <c:otherwise><!-- 竞价未结束 -->
                    <c:choose>
                        <c:when test="${gg.jingjiafangshi=='3'}"><!-- 密封式 -->
                        	series_data.push('****');
                        </c:when>
                        <c:otherwise><!-- 正常报价 -->
                        	series_data.push('${info.price}');
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            	</c:choose>
            </script>
        </c:forEach>
        <script type="text/javascript">
            //baojiaHis
            //曲线图
            var myChart = echarts.init(document.getElementById('main'));
            var option = {
                title: {
                    //text: '竞价曲线',
                    subtext: '竞价走势'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['竞价曲线']
                },
                toolbox: {
                    x: 'center',
                    show: true
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        boundaryGap: false,
                        data: xAxis_data
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        axisLabel: {
                            inside: true
                        },
                        min: 'dataMin'
                        //offset:-50,
                    }
                ],
                series: [
                    {
                        name: '报价金额',
                        type: 'line',
                        stack: '总量',
                        smooth: true,
                        <% if("1".equals(size)){ %>
                        showSymbol: true,
                        <% } else { %>
                        showSymbol: false,
                        <% } %>
                        data: series_data
                    }
                ]
            };
            myChart.setOption(option);
        </script>
  			</td>
  		</tr>
  	</table>
  		
  	<!-- 二次竞价  开始-->
    <c:if test="${gg.allowmorejqxt=='1' }">
    <table>
    	<tr>
    		<td>
    			<div class="p clearfix" >
                        	<!-- 二次竞价历史 -->
                        	<div style="text-align: center;width: 100%;">
					            <h3 class="clearfix pt10 pb10 ta-c">第二次竞价</h3>
					         </div>
                        	<div style="width: 400px;float: left;    margin-right: 10px;">
                            <table style="width: 400px;float: left;" class="table table-striped">
                                <tbody>
                                <tr class="tr1">
                                    <td width="100px"> 竞买人编号 </td>
                                    <td width="100px" > 价格(元) </td>
                                    <td  align="center"> 时间 </td>
                                </tr>
                                </tbody>
                         	</table>
                         	<div style="overflow-y:auto;height:330px; float: left;">
                         	<table style="width: 400px;float: left;" class="table table-striped">
                                <tbody>
                                <c:choose>
                                	<c:when test="${his_erci ==null || fn:length(his_erci) ==0}">
                                		<tr><td colspan="3" style="color: red;text-align: left;">暂无竞价</td></tr>
                                 </c:when>
                                 
                               		<c:otherwise>
                               		<c:forEach items="${his_erci }" var="obj" varStatus="jh">
                               		<tr style="font-size: 11px;">
                               		
                               		<c:choose>
                               		<c:when test="${jinjia_2=='3' }"><!-- 竞价结束 -->
                               		
                               		<td width="100px" class="tr-end orange">${obj.code }</td>
                               		<td width="100px" class="tr-end orange">${obj.price }</td>
                               		</c:when>
                               		<c:otherwise><!-- 竞价未结束 -->
                               			<c:choose>
									    	<c:when test="${gg.jingjiafangshi_1=='3'}"><!-- 密封式 -->
									    	<td width="100px" class="tr-end orange">*****</td>
									    	<td width="100px" class="tr-end orange">*****</td>
									    	</c:when>
									    	<c:otherwise><!-- 正常报价 -->
									    	<td width="100px" class="tr-end orange">*****</td>
									    	<td width="100px" class="tr-end orange">${obj.price }</td>
									    	</c:otherwise>
									    	</c:choose>	
                               		</c:otherwise>
                               		</c:choose>
                                     <td class="tr-end orange" nowrap="nowrap">${obj.bj_time}</td>
                                 </tr>
                               		</c:forEach>
                               		</c:otherwise>
                                </c:choose>
                                </tbody>
                         	</table>
                         	</div>
                         	</div>
    		</td>
    		<td>
				<!-- 二次竞价曲线 -->
			    <div id="main_2" style="padding-left:5px;width: 500px;height:400px;float: right;overflow: auto;"></div>
			    <script type="text/javascript">
			    	var xAxis_data =[];
			    	var series_data =[];
			   	</script>
			   	
			   	<c:forEach items="${baojiaHis_erci }" var="info">
			   		<script type="text/javascript">
			   			xAxis_data.push('${fn:substring(info.date ,0 ,10)}\n${fn:substring(info.date ,10 ,23)}');
			   			
			   			<c:choose>
			                               		<c:when test="${jinjia_2=='3' }"> //竞价结束
			                               		series_data.push('${info.price}');
			                               		</c:when>
			                               		<c:otherwise>//竞价未结束
			                               			<c:choose>
					    	<c:when test="${gg.jingjiafangshi_1=='3'}">// 密封式 
					    	series_data.push('****');
					    	</c:when>
					    	<c:otherwise>//正常报价
					    	series_data.push('${info.price}');
					    	</c:otherwise>
					    	</c:choose>	
			                               		
			                               		</c:otherwise>
			                               		</c:choose>
			   			
			    	</script>
			   	</c:forEach>
			    <script type="text/javascript">
			    	//baojiaHis
			    	//曲线图
			        var myChart = echarts.init(document.getElementById('main_2'));
			        var size2=0;
			        size2='${his_erci.size()}';
			        var option = {
			       		title : {
							//text: '竞价曲线',
							subtext: '竞价走势'
						},
			       	    tooltip : {
			       	        trigger: 'axis'
			       	    },
			       	    legend: {
			       	        data:['竞价曲线']
			       	    },
			       	    toolbox: {
			       	    	x :'center',
			       	        show : true
			       	    },
			       	    calculable : true,
			       	    xAxis : [
			       	        {
			       	            type : 'category',
			       	            boundaryGap : false,
			       	            data : xAxis_data
			       	        }
			       	    ],
			       	    yAxis : [
			       	        {
			       	            type : 'value',
			       	            axisLabel:{
			       	                inside:true
			       	            },
			       	            min:'dataMin'
			       	            //offset:-50,
			       	        }
			       	    ],
			       	    series : [
			       	        {
			       	            name:'报价金额',
			       	            type:'line',
			       	            stack: '总量',
			       	            smooth:true,
			       	            showSymbol: size2==1?true:false,
			       	            data : series_data
			       	        }
			       	    ]
			       	};
			        myChart.setOption(option);
			    </script>
	                  	</div>    				
    				
    		</td>
    	</tr>
    </table>	
    </c:if>
    <!-- 二次挂牌  结束 -->

        
                      	
                      	
                         	
        
  </body>
</html>
