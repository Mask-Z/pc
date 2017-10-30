<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.ccjt.ejy.web.vo.GongGao" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <span class="laber">挂牌价 </span><span class="money">${info.guapaiprice }</span><span class=""><c:if test="${info.guapaiprice ne '面议'}"> 元</c:if><c:if test="${info.danw ne '' && info.projectstyle eq '房产招租'}"> / ${info.danw}</c:if></span>
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
<c:choose>
    <c:when test="${info.projectstyle eq '房地产'}">
        <div class="list wide">
            <%
            GongGao gg= (GongGao) request.getAttribute("info");
            String guapaijia=gg.getGuapaiprice();
            String price="0.00";
            if(StringUtils.isNotBlank(guapaijia)){
            	if (guapaijia.equals("面议")){
                    price=guapaijia;
                }else if (!guapaijia.equals("-")){
                    if(request.getAttribute("optesthesiaContent")!=null){
                        Double area= Double.parseDouble (((Map<String,Object>)request.getAttribute("optesthesiaContent")).get("area").toString());
                        if(area !=null){
                            Double guapai = Double.valueOf(guapaijia.replace(",",""));
                            DecimalFormat df = new DecimalFormat("###,###,###,###,###,###,###.00");
                            price = df.format(guapai / area);
                        }
                    }
                }else{
                	price=guapaijia;
                }
            }
            request.setAttribute("price",price);
            %>
            <span class="laber">单价</span><span class="money small">${price}</span><span class="fcdd3"><c:if test="${price ne '面议'}">元/m²</c:if></span>
            </div>
            <div class="list narrow">
            	<span class="laber">房屋建筑面积</span><span class="money small">${optesthesiaContent.area}</span>m²
            </div>
    </c:when>
    <c:when test="${info.projectstyle eq '房产招租'}">
            <div class="list wide"><span class="laber">租期</span><span class="money small">${optesthesiaContent.Zlqx}</span>年</div>
            <div class="list narrow"><span class="laber">承租押金</span><span class="money small">${optesthesiaContent.CzPrice}</span>元</div>
            <div class="list wide"><span class="laber">租赁面积</span><span class="money small">${optesthesiaContent.Area}</span>m²</div>
            <div class="list "><span class="laber">租金支付方式</span><span class="money small">${optesthesiaContent.ZfType}</span></div>
    </c:when>
    <c:when test="${info.projectstyle eq '二手车'}">
            <div class="list wide"><span class="laber">里程</span><span class="money small">${optesthesiaContent.GongLi}</span>公里</div>
            <div class="list narrow"><span class="laber">注册日期</span><span class="money small">${fn:substring(optesthesiaContent.DengJiDate,0,10)}</span></div>
            <div class="list wide"><span class="laber">变速箱</span><span class="money small">${optesthesiaContent.BianSuXiang}</span></div>
    </c:when>
    <c:when test="${info.projectstyle eq '废旧物资'}">
        <div class="list wide"><span class="laber">存放地</span><span class="money small">${optesthesiaContent.CunFangAddress}</span></div>
    </c:when>
    <c:when test="${info.projectstyle eq '股权'}">
        <c:if test="${not empty optesthesiaContent.ZhuCeZiBen and optesthesiaContent.ZhuCeZiBen ne ''}">
        <div class="list wide"><span class="laber">注册资本</span><span class="money small">${optesthesiaContent.ZhuCeZiBen}</span>万元${optesthesiaContent.MoneyType}</div>
        </c:if>
        <c:if test="${not empty optesthesiaContent.SuoZaiAreaName and optesthesiaContent.SuoZaiAreaName ne ''}">
        <div class="list w100"><span class="laber">所在地</span><span class="money small">${optesthesiaContent.SuoZaiAreaName}</span></div>
        </c:if>
        <c:if test="${not empty optesthesiaContent.industryCode_name and optesthesiaContent.industryCode_name ne ''}">
        <div class="list w100"><span class="laber">行业</span><span class="money small">${optesthesiaContent.industryCode_name}</span></div>
        </c:if>
    </c:when>
    <c:when test="${info.projectstyle eq '债权'}">
        <div class="list wide"><span class="laber">债权本金</span><span class="money small">${optesthesiaContent.PrincipalBalance}</span>万元</div>
        <div class="list wide"><span class="laber">债权利息</span><span class="money small">${optesthesiaContent.Interest}</span>万元</div>
    </c:when>
    <c:otherwise>

    </c:otherwise>
</c:choose>