<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="detail-con-left">
    <div class="deatil-tabs-height"></div>
    <ul class="tab deatil-tabs" id="itemdetail_area">
        <c:choose>
            <c:when test="${info.status_name eq '终结'}">
                <li class="survey switch curr" onclick="myclick(2)">终结公告</li>
                <li class="survey switch base_moban" onclick="myclick(1)">标的概况</li>
            </c:when>
            <c:when test="${info.status_name eq '中止'}">
                <li class="survey switch curr" onclick="myclick(3)">中止公告</li>
                <li class="survey switch base_moban" onclick="myclick(1)">标的概况</li>
            </c:when>
            <c:otherwise><!--中止不为空,终结不为空,第一位是中止公告-->
                <li class="survey switch curr base_moban" onclick="myclick(1)">标的概况</li>
            </c:otherwise>
        </c:choose>
        <li class="survey base_moban" onclick="myclick(1)">特别告知</li>
        <li class="survey base_moban" onclick="myclick(1)">交易条件</li>
        <li class="survey base_moban"  onclick="myclick(1)">交易指南</li>
        <li >融资支持</li>
        <li class="survey switch" onclick="myclick(4)" id="jmlllllll">竞买记录</li>
        <c:if test="${info.cjgg_guid!=null }">
            <li class="survey switch" onclick="myclick(5)" id="jyjggs">交易结果公示</li>
        </c:if>

    </ul>

    <c:choose>
        <c:when test="${info.status_name eq '终结'}"><!--第一位是终结公告-->
            <div id="tab2_content" class="detail-tabcon clearfix" style="display: block;">
                <c:if test="${zjList.size() ==1}">
                    <div class="p"><!-- 终结公告内容 -->
                        <iframe frameborder="0" scrolling="auto" name="gonggao_iframe"
                                src="content?infoid=${zjList.get(0).infoid}" width="900px"></iframe>
                    </div>
                </c:if>
            </div>
            <div id="tab1_content" class="detail-tabcon" style="display: none;">
                <div class="ph12">
                    <div class="p"><!-- 公告内容 -->
                            ${info.content}
                            <a href="#" class="bds_more" data-cmd="more"></a><a href="#"
                                                                                class="bds_weixin"
                                                                                data-cmd="weixin"
                                                                                title="分享到微信"></a><a
                                href="#"
                                class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#"
                                                                                      class="bds_qzone"
                                                                                      data-cmd="qzone"
                                                                                      title="分享到QQ空间"></a><a
                                href="#"
                                class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#"
                                                                                          class="bds_tqq"
                                                                                          data-cmd="tqq"
                                                                                          title="分享到腾讯微博"></a><a
                                href="#"
                                class="bds_evernotecn" data-cmd="evernotecn" title="分享到印象笔记"></a>
                        </div>
                    </div>
                    <br/>
                </div>
            </div>
        </c:when>
        <c:when test="${info.status_name eq '中止'}"><!--第一位是中止公告-->
            <div id="tab3_content" class="detail-tabcon clearfix" style="display: block;">
                <c:if test="${zzList.size() >0}">
                    <div class="p"><!-- 中止公告内容 -->
                        <iframe frameborder="0" scrolling="auto" name="gonggao_iframe"
                                src="content?infoid=${zzList.get(0).infoid}" width="900px"></iframe>
                    </div>
                </c:if>
            </div>
            <div id="tab1_content" class="detail-tabcon " style="display: none;">
                <div class="p"><!-- 公告内容 -->
                        ${info.content}
                    <div class="bdsharebuttonbox">
                        <a href="#" class="bds_more" data-cmd="more"></a><a href="#"
                                                                            class="bds_weixin"
                                                                            data-cmd="weixin"
                                                                            title="分享到微信"></a><a
                            href="#"
                            class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#"
                                                                                  class="bds_qzone"
                                                                                  data-cmd="qzone"
                                                                                  title="分享到QQ空间"></a><a
                            href="#"
                            class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#"
                                                                                      class="bds_tqq"
                                                                                      data-cmd="tqq"
                                                                                      title="分享到腾讯微博"></a><a
                            href="#"
                            class="bds_evernotecn" data-cmd="evernotecn" title="分享到印象笔记"></a>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise><!--第一位是竞买公告------------------------------->
            <div id="tab1_content" class="detail-tabcon" style="display: block;">
                <div class="pd15"><!-- 公告内容 -->
                        ${info.content}
                    <div class="bdsharebuttonbox">
                        <a href="#" class="bds_more" data-cmd="more"></a><a href="#"
                                                                            class="bds_weixin"
                                                                            data-cmd="weixin"
                                                                            title="分享到微信"></a><a
                            href="#"
                            class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#"
                                                                                  class="bds_qzone"
                                                                                  data-cmd="qzone"
                                                                                  title="分享到QQ空间"></a><a
                            href="#"
                            class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#"
                                                                                      class="bds_tqq"
                                                                                      data-cmd="tqq"
                                                                                      title="分享到腾讯微博"></a><a
                            href="#"
                            class="bds_evernotecn" data-cmd="evernotecn" title="分享到印象笔记"></a>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    <%--<div id="tab7_content" class="detail-tabcon clearfix" style="display: none;">--%>
        <%--<div class="ph12">--%>
           <%----%>
        <%--</div>--%>
    <%--</div>--%>

    <div class="detail-tabcon" id="tab4_content" style="display:none;">
        <div id="jmjl" class="pd10">
            <iframe id="jmjlpage" scrolling="no" name="gonggao_iframe" src="jmjl?infoid=${info.infoid}" frameborder="0" style="width: 100%;" height="1500"></iframe>
        </div>
    </div>
<c:if test="${info.cjgg_guid!=null }">
    <div class="detail-tabcon " id="tab5_content" style="display:none;">
        <div class="p"><!-- 交易结果公示 -->
            <iframe name="gonggao_iframe" frameborder="0" scrolling="no" src="content?infoid=${info.cjgg_guid}"
                    width="890px" ></iframe>
        </div>
    </div>
</c:if>
</div>