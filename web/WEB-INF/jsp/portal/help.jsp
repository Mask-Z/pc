<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
 <div class="new-list-left clearfix">
       <h2>帮助中心</h2>
       <dl>
          <dt>关于我们</dt>
          <dd>
              <a href="<%=basePath%>newsinfo?catagoryNum=029">关于e交易</a>
              <a href="<%=basePath%>cpycinfo?id=1036" target="_blank">诚聘英才</a>
          </dd>
       </dl>
       <dl>
          <dt>会员中心</dt>
          <dd>
              <!--  
              <a href="<%=basePath%>news_more?catagoryNum=004001&page=1&rows=20" <c:if test="${catagoryName=='制度规则' }">style="color:red;"</c:if>>制度规则</a>
              -->
              <a href="<%=basePath%>news_more?catagoryNum=004002&page=1&rows=20" <c:if test="${catagoryName=='会员帮助' }">style="color:red;"</c:if>>会员帮助</a>
              <a href="<%=basePath%>news_more?catagoryNum=035001&page=1&rows=20" <c:if test="${catagoryName=='视频教程' }">style="color:red;"</c:if>>视频教程</a>
              <a href="<%=basePath%>news_more?catagoryNum=036&page=1&rows=20" <c:if test="${catagoryName=='软件下载' }">style="color:red;"</c:if>>软件下载</a>
              <a href="<%=basePath%>questionList?page=1&rows=20" <c:if test="${catagoryName=='常见问题' }">style="color:red;"</c:if>>常见问题</a>
          </dd>
       </dl>
       <dl>
          <dt>操作指南</dt>
          <dd>
              <a href="<%=basePath%>news_more?catagoryNum=034001&page=1&rows=20" <c:if test="${catagoryName=='产权交易-操作指南' }">style="color:red;"</c:if>>产权交易-操作指南</a>
              <a href="<%=basePath%>news_more?catagoryNum=034002&page=1&rows=20" <c:if test="${catagoryName=='招标采购-操作指南' }">style="color:red;"</c:if>>招标采购-操作指南</a>
          </dd>
       </dl>
       <dl>
          <dt>新闻中心</dt>
          <dd>
   			  <a href="<%=basePath%>news_more?catagoryNum=030&page=1&rows=20" <c:if test="${catagoryName=='平台公告' }">style="color:red;"</c:if>>平台公告</a>
              <a href="<%=basePath%>news_more?catagoryNum=006&page=1&rows=20" <c:if test="${catagoryName=='业界资讯' }">style="color:red;"</c:if>>业界资讯</a>
              <a href="<%=basePath%>news_more?catagoryNum=028&page=1&rows=20" <c:if test="${catagoryName=='曝光台' }">style="color:red;"</c:if>>曝光台</a>
          </dd>
       </dl>
       <dl>
          <dt>政策法规</dt>
          <dd>
               <a href="<%=basePath%>news_more?catagoryNum=032001&page=1&rows=20" <c:if test="${catagoryName=='产权交易-政策法规' }">style="color:red;"</c:if>>产权交易-政策法规</a>
               <a href="<%=basePath%>news_more?catagoryNum=032002&page=1&rows=20" <c:if test="${catagoryName=='招标采购-政策法规' }">style="color:red;"</c:if>>招标采购-政策法规</a>
          </dd>
       </dl>
       <dl>
          <dt>交易规则</dt>
          <dd>
                <a href="<%=basePath%>news_more?catagoryNum=027001&page=1&rows=20" <c:if test="${catagoryName=='产权交易-交易规则' }">style="color:red;"</c:if>>产权交易-交易规则</a>
                <a href="<%=basePath%>news_more?catagoryNum=027002&page=1&rows=20" <c:if test="${catagoryName=='招标采购-交易规则' }">style="color:red;"</c:if>>招标采购-交易规则</a>
          </dd>
       </dl>
       <dl>
          <dt>加盟机构</dt>
          <dd>
                <a href="<%=basePath%>newsinfo?catagoryNum=014001" >加盟流程</a>
                <a href="<%=basePath%>newsinfo?catagoryNum=014002" >加盟优势</a>
                <a href="<%=basePath%>newsinfo?catagoryNum=014003">加盟条件</a>
          </dd>
       </dl>

      </div>