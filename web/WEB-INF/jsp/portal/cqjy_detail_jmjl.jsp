<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ccjt.ejy.web.vo.GongGao" %>
<%@ page import="java.text.DecimalFormat" %>
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
    <title>产权交易</title>
	<jsp:include page="mate.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=basePath%>html/css/base.css">
    <link rel="stylesheet" href="<%=basePath%>html/css/detail.css">
    <script src="<%=basePath%>html/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/echarts.min.js"></script>
    <style type="text/css">
        .jygg_news_detail_tr td {height: 35px;border:solid 1px black;padding: 5px;}
        .new-jygg-btn{cursor: pointer;padding: 2px;}
    </style>
    <script type="text/javascript">
        //批量挂牌项目直接显示竞价详情

        <%
            String size = "";
            Object obj = request.getAttribute("his");
            if (obj != null) {
                List s = (List) obj;
                size = String.valueOf(s.size());
            }

        %>
            $(function(){
                var ispllr = "${gg.ispllr}";
                var fromFlag = "${fromFlag }";
                if(ispllr != '1'){
                    $("#jmjl").show();
                }else{
                	if(fromFlag == '1'){
                		$("#jmjl").show();
                		$("#jygg_news_detail_table").hide();
                	}else{
                		$("#jmjl").hide();
                		$("#jygg_news_detail_table").show();
                	}
                }
            });
            
        function jmjl(projectGuid){
                window.location.href="jmjl?infoid=${gg.infoid}&projectGuid=" +projectGuid;
        	<%--window.parent.document.getElementById("jmjlpage").src = "jmjl?infoid=${gg.infoid}&projectGuid="--%>
        			<%--+projectGuid;--%>
        }
        //从竞价详情页返回标的列表页
        function backobjects(){
            $("#jygg_news_detail_table").show();
            $("#jmjl").hide();
        }
    </script>
    <style type="text/css">
        .tr1{text-align: center;}
        .orange{text-align: center;color: orange;height:30px;padding: 2px;font-size: 14px;border-bottom: solid 1px #ccc;}
    </style>
</head>

<body>

<c:if test="${gg.ispllr eq '1' }">
<div class="pd5">
    <table id="jygg_news_detail_table" width="100%" style="display: none">
        <tr>
            <th width="300">标的名称</th>
            <th>报名开始时间</th>
            <th>报名截止时间</th>
            <th>挂牌价(元)</th>
            <th>当前价(元)</th>
            <th>增值率</th>
            <th>操作</th>
            <th>状态</th>
        </tr>
        <%
            GongGao gongGao = (GongGao) request.getAttribute("gg");
            Object plist = request.getAttribute("projectList");
            if (plist != null) {
                List list = (List) plist;
                int len = list.size();
                for (Object o : list) {
                    Map jjdt = (Map) o;
                    out.println("<tr class=\"jygg_news_detail_tr\">");
                    out.println("<td>" + jjdt.get("ProjectName") + "</td>");
                    if("101023".equals(gongGao.getXiaQuCode()) || "101024".equals(gongGao.getXiaQuCode())) {
                   	    String GongGaoFromDate = jjdt.get("GongGaoFromDate") + "";
                   	    String GongGaoToDate = jjdt.get("GongGaoToDate") + "";
                   	    out.println("<td>" + (GongGaoFromDate == null ? "" : GongGaoFromDate.substring(0, 10)) + "</td>");
                   	    out.println("<td>" + (GongGaoToDate == null ? "" : GongGaoToDate.substring(0, 10)) + "</td>");                	    
                    } else {
                    	out.println("<td>" + jjdt.get("GongGaoFromDate") + "</td>");
                        out.println("<td>" + jjdt.get("GongGaoToDate") + "</td>");
                    }                    
                    out.println("<td>" + jjdt.get("guapaiprice") + "</td>");
                    String zzlS = "0";
                    if ("1".equals(jjdt.get("hasbid").toString())) {
                        out.println("<td>" + jjdt.get("maxPrice") + "</td>");
                        Double gpj = Double.valueOf(jjdt.get("guapaiprice").toString());
                        Double dqj = Double.valueOf(jjdt.get("maxPrice").toString());
                        double g = gpj.doubleValue();
                        double d = dqj.doubleValue();
                        double zzl = (d - g) / g * 100;
                        DecimalFormat df = new DecimalFormat("0.00");
                        zzlS = df.format(zzl);
                    } else {
                        out.println("<td> - </td>");
                    }
                    out.println("<td>" + zzlS + "%</td>");
                    out.println("<td nowarp><button class=\"new-jygg-btn\" onclick=\"jmjl('"+jjdt.get("projectGuid")+"')\">竞价详情</button></td>");
                    String code= jjdt.get("code")+"";
                    if (code.equals("终结")) {
                    	String infoid= (String) jjdt.get("infoid");
                        out.println("<td><a class='new-jygg-btn' href='newsinfo?flag=gonggao&infoid="+infoid+"' target='_blank'>终结公告</a></td>");
                    }else if (code.equals("中止")) {
                        String infoid= (String) jjdt.get("infoid");
                        out.println("<td><a class='new-jygg-btn' href='newsinfo?flag=gonggao&infoid="+infoid+"' target='_blank'>中止公告</a></td>");
                    }else if(code.equals("报名中竞价中")){
                        out.println("<td>报名中</td>");
                    }else{
                        out.println("<td>"+code+"</td>");
                    }
                    out.println("</tr>");
                }
            }
        %>
    </table>
   </div>
</c:if>

<div id="jmjl" style="display: none;">
    <table >
        <tr>
            <td>
                <!-- 竞价历史 -->
                <c:if test="${gg.allowmorejqxt=='1' }">
                    <div style="text-align: center;width: 100%;">
                        <h3 class="clearfix pt10 pb10 ta-c">第一次竞价</h3>
                    </div>
                </c:if>
                <div style="width: 400px;float: left;margin-right: 10px;position: relative;z-index: 10000;">
                    <c:if test="${gg.ispllr == '1' }">
                        <div style="text-align: center;width: 100%;    padding: 10px;">
                            <button style="cursor: pointer; height: 30px; border: none; background-color: orange; padding: 0px 10px; color: #fff;"
                                    onclick="backobjects()">返回标的列表</button>
                        </div>
                    </c:if>
                    <div style="background:#f1f1f1;height: 25px;" class="celearfix">
                        <table style="width: 400px;float: left;font-size:14px;" class="table table-striped">
                            <tbody>
                            <tr class="tr1">
                                <td nowrap="nowrap" width="40px" >序号</td>
                                <td nowrap="nowrap" width="80px"> 竞买人编号</td>
                                <c:choose>
                                    <c:when test="${gg.currencyunit eq '2'}">
                                        <td width="100px" > 价格(万元) </td>
                                        <!-- <td width="100px" > 价格(元) </td> -->
                                    </c:when>
                                    <c:otherwise>
                                        <td nowrap="nowrap" width="80px"> 价格(元)</td>
                                    </c:otherwise>
                                </c:choose>
                                <td align="center"> 时间</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="overflow-y:auto;height:330px; float: left;overflow-x:hidden;">
                        <table style="width: 400px;float: left;font-size:14px;"
                               class="table table-striped">
                            <tbody>
                            <c:choose>
                                <c:when test="${his ==null || fn:length(his) ==0}">
                                    <tr>
                                        <td colspan="3" style="color: red;text-align: left;"  height="27" >暂无竞价
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${his }" var="obj" varStatus="jh">
                                        <tr>
                                                <%--获取倒序的序号--%>
                                            <td  width="40px"  height="27"  align="center">${his.size()-jh.index }</td>
                                            <c:choose>
                                                <c:when test="${jinjia_1=='3' }"><!-- 竞价结束 -->
                                                    <td width="80px" class="tr-end" height="27" >${obj.code }</td>
                                                    <td width="80px" class="tr-end "  align="center">${obj.price }</td>
                                                </c:when>
                                                <c:otherwise><!-- 竞价未结束 -->
                                                    <c:choose>
                                                        <c:when test="${gg.jingjiafangshi=='3'}"><!-- 密封式 -->
                                                            <td width="80px" height="27"  class="tr-end">*****</td>
                                                            <td width="80px" align="center" class="tr-end">*****</td>
                                                        </c:when>
                                                        <c:otherwise><!-- 正常报价 -->
                                                            <td width="80px"  height="27" class="tr-end">*****</td>
                                                            <td width="80px" align="center" class="tr-end">${obj.price }</td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                            <td class="tr-end" align="center" nowrap="nowrap">${obj.bj_time}</td>
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
                    <div style="width: 400px;float: left;margin-right: 10px;position: relative;z-index: 10000;">
                        <div style="background:#f1f1f1;height: 25px;padding: 5px 0px;" class="celearfix">
                            <table style="width: 400px;float: left;font-size:14px;" class="table table-striped;">
                                <tbody>
                                <tr class="tr1">
                                    <td width="100px"> 竞买人编号 </td>
                                    <c:choose>
                                        <c:when test="${gg.currencyunit eq '2'}">
                                            <td width="100px" > 价格(万元) </td>
                                            <!-- <td width="100px" > 价格(元) </td> -->
                                        </c:when>
                                        <c:otherwise>
                                            <td width="100px" > 价格(元) </td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td  align="center"> 时间 </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div style="overflow-y:auto;height:330px; float: left;">
                            <table style="width: 400px;float: left;font-size:14px; text-align:center;" class="table table-striped">
                                <tbody>
                                <c:choose>
                                    <c:when test="${his_erci ==null || fn:length(his_erci) ==0}">
                                        <tr><td colspan="3" style="color: red;text-align: left;">暂无竞价</td></tr>
                                    </c:when>

                                    <c:otherwise>
                                        <c:forEach items="${his_erci }" var="obj" varStatus="jh">
                                            <tr >

                                                <c:choose>
                                                    <c:when test="${jinjia_2=='3' }"><!-- 竞价结束 -->

                                                        <td width="100px" height="27" class="tr-end ">${obj.code }</td>
                                                        <td width="100px" class="tr-end ">${obj.price }</td>
                                                    </c:when>
                                                    <c:otherwise><!-- 竞价未结束 -->
                                                        <c:choose>
                                                            <c:when test="${gg.jingjiafangshi_1=='3'}"><!-- 密封式 -->
                                                                <td width="100px"height="27" class="tr-end ">*****</td>
                                                                <td width="100px" class="tr-end ">*****</td>
                                                            </c:when>
                                                            <c:otherwise><!-- 正常报价 -->
                                                                <td width="100px" height="27" class="tr-end ">*****</td>
                                                                <td width="100px" class="tr-end ">${obj.price }</td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td class="tr-end" nowrap="nowrap">${obj.bj_time}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
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
                                showSymbol: size2==1?true:false,
                                data : series_data
                            }
                        ]
                    };
                    myChart.setOption(option);
                </script>


</td>
</tr>
</table>
</c:if>
<!-- 二次挂牌  结束 -->
</div>




</body>
</html>
