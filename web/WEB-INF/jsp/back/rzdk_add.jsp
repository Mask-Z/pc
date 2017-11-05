<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
<%--<link rel="stylesheet" href="<%=basePath%>html/css/global.css">--%>
<link rel="stylesheet" href="<%=basePath%>html/css/detail.css">
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-easyui-validtype.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>

<style>
    <!--
    tr {
        height: 30px;
    }

    td {
        text-align: left;
    }

    -->
</style>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'center',border:false">
        <table style="width: 100%;height: 100%;border-collapse: collapse;">
            <tr>
                <td colspan="4" style="background-color: #F2F2F1;">
                    <div style="float: left;width: 160px;height:120px;">
                        <img src="<%=basePath%>${gonggao.titlepic}" style="height: 120px;width: 160px">
                    </div>
                    <div style="float: left;">
                        <div  style="height: 120px;padding-left: 5px" >
                            <div >
                                <h1>${gonggao.title }</h1>
                            </div>
                            <div class="detail-characteristic clearfix">
                                <c:forEach items="${hotLabelNameList}" var="hotLabel" begin="0" end="2" varStatus="status">
                                    <c:if test="${status.index==0}"><span class="label"><b>${hotLabel}</b><i></i></span></c:if>
                                    <c:if test="${status.index==1}"><span class="label second"><b>${hotLabel}</b><i></i></span></c:if>
                                    <c:if test="${status.index==2}"><span class="label third"><b>${hotLabel}</b><i></i></span></c:if>
                                </c:forEach>
                            </div>
                            <br>
                        <c:if test="${gonggao.ispllr == '1'  }">
                            <div class="list wide">
                                <span class="laber">挂牌价 </span><span class="money small">详见交易公告</span>
                            </div>
                            <div class="list narrow">
                                <span class="laber">保证金 </span><span class="money small">详见交易公告</span>
                            </div>
                        </c:if>
                        <c:if test="${gonggao.ispllr != '1'  }">
                            <div class="list wide">
                                <span class="laber">挂牌价 </span><span class="money">${gonggao.guapaiprice }</span><span class=""><c:if test="${gonggao.guapaiprice ne '面议'}"> 元</c:if></span>
                            </div>
                            <div class="list narrow">
                                <span class="laber">保证金 </span><span class="money small">${gonggao.baozhengjprice }</span><span class="">元</span>
                            </div>
                        </c:if>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="border-bottom: 1px #E7E7E7 solid;font-size: 22px;padding: 5px;">
                    <span style="background-color: #CDCDCD">个人贷款</span>
                </td>
            </tr>
            <tr>
                <td rowspan="4" width="150px;" align="center">贷<br>款<br>信<br>息</td>
                <td>借款金额</td>
                <td>${zxdkApply.loaninfo_jkje}</td>
            </tr>
            <tr>
                <td>借款时间</td>
                <td>${zxdkApply.loaninfo_jksj}</td>
            </tr>
            <tr>
                <td>还款方式</td>
                <td>${zxdkApply.loaninfo_hkfs}</td>
            </tr>
            <tr>
                <td>主要还款来源</td>
                <td>${zxdkApply.loaninfo_zyhkly}</td>
            </tr>

            <c:if test="${zxdkApply.member_type eq 1}"><!--个人信息-->
            <tr >
                <td colspan="3" style="border-bottom: 1px #E7E7E7 solid;"></td>
            </tr>
            <tr>
                <td rowspan="5" width="150px;" align="center">基<br>本<br>信<br>息</td>
                <td>姓名</td>
                <td>${zxdkApply.individual_xm}</td>
            </tr>
            <tr>
                <td>身份证</td>
                <td>${zxdkApply.individual_sfzh}</td>
            </tr>
            <tr>
                <td>联系方式</td>
                <td>${zxdkApply.individual_lxfs}</td>
            </tr>
            <tr>
                <td>紧急联系人</td>
                <td>${zxdkApply.individual_jjlxr}</td>
            </tr>
            <tr>
                <td>联系方式</td>
                <td>${zxdkApply.individual_lxfs}</td>
            </tr>
            <tr>
                <td colspan="3" style="border-bottom: 1px #E7E7E7 solid;"></td>
            </tr>
            <tr>
                <td rowspan="9" width="150px;" align="center">填<br>报<br>信<br>息</td>
                <td>职业</td>
                <td>${zxdkApply.individual_zy}</td>
            </tr>
            <tr>
                <td>公司</td>
                <td>${zxdkApply.individual_gs}</td>
            </tr>
            <tr>
                <td>个人收入</td>
                <td>${zxdkApply.individual_grsr}</td>
            </tr>
            <tr>
                <td>家庭收入</td>
                <td>${zxdkApply.individual_jtsr}</td>
            </tr>
            <tr>
                <td>婚姻</td>
                <td>${zxdkApply.individual_hy}</td>
            </tr>
            <tr>
                <td>对方联系人</td>
                <td>${zxdkApply.individual_dflxr}</td>
            </tr>
            <tr>
                <td>对方联系方式</td>
                <td>${zxdkApply.individual_dflxfs}</td>

            </tr>
            <tr>
                <td><a href="javascript:void(0)" style="color: green">收入证明</a></td>
                <td></td>
            </tr>
            <tr>
                <td><a href="javascript:void(0)" style="color: green">资产证明</a></td>
                <td> </td>
            </tr>
            </c:if>
            <c:if test="${zxdkApply.member_type eq 0}"><!--单位信息-->
            <tr >
                <td colspan="3" style="border-bottom: 1px #E7E7E7 solid;"></td>
            </tr>
            <tr>
                <td rowspan="6" width="150px;" align="center">基<br>本<br>信<br>息</td>
                <td class="title">企业名称</td>
                <td>${zxdkApply.company_qymc}</td>
                <td class="title">营业执照编号</td>
                <td>${zxdkApply.company_yyzzbh}</td>
            </tr>
            <tr>
                <td class="title">法人</td>
                <td>${zxdkApply.company_frdb}</td>
                <td class="title">身份证</td>
                <td>${zxdkApply.company_frsfzh}</td>
            </tr>
            <tr>
                <td class="title">注册日期</td>
                <td>${zxdkApply.company_zcrq}</td>
                <td class="title">注册资本</td>
                <td>${zxdkApply.company_zczb}</td>
            </tr>
            <tr>
                <td class="title">实缴资本</td>
                <td>${zxdkApply.company_sjzb}</td>
                <td class="title">开户银行账号</td>
                <td>${zxdkApply.company_khyhzh}</td>
            </tr>
            <tr>
                <td class="title">开户行</td>
                <td>${zxdkApply.company_khyh}</td>
                <td class="title">联系人</td>
                <td>${zxdkApply.company_lxr}</td>
            </tr>
            <tr>
                <td class="title">联系方式</td>
                <td>${zxdkApply.company_lxfs}</td>
                <td class="title">联系邮箱</td>
                <td>${zxdkApply.company_lxyx}</td>
            </tr>

            <tr>
                <td colspan="3" style="border-bottom: 1px #E7E7E7 solid;"></td>
            </tr>
            <tr>
                <td rowspan="9" width="150px;" align="center">填<br>报<br>信<br>息</td>
                <td class="title">主要业务说明</td>
                <td>${zxdkApply.company_zyywsm}</td>
            </tr>
            <tr>
                <td class="title">近三年纳税情况</td>
                <td>${zxdkApply.company_jsnnsqk}</td>
            </tr>
            <tr>
                <td class="title">近三年是否连续盈利</td>
                <td>${zxdkApply.company_jsnsflxyl}</td>
            </tr>
            <tr>
                <td class="title">近三年企业收入</td>
                <td>${zxdkApply.company_jsnqysr}</td>
            </tr>
            <tr>
                <td class="title">近三年企业成本</td>
                <td>${zxdkApply.company_jsnqycb}</td>
            </tr>
            <tr>
                <td class="title">企业总资产</td>
                <td>${zxdkApply.company_qyzzc}</td>
            </tr>
            <tr>
                <td class="title">企业总负债</td>
                <td>${zxdkApply.company_qyzfz}</td>
            </tr>
            <tr>
                <td><a href="javascript:void(0)" style="color: green">收入证明</a></td>
                <td></td>
            </tr>
            <tr>
                <td><a href="javascript:void(0)" style="color: green">资产证明</a></td>
                <td> </td>
            </tr>
            </c:if>

        </table>
    </div>
    <div data-options="region:'south',border:false"
         style="height:45px;text-align: center;border-top: 1px #E7E7E7 solid;padding-top: 10px;">
        <a class="easyui-linkbutton" id="shenhe_operate">审核操作</a>
    </div>
</div>
<div id="w10"
     style="background:url('<%=basePath%>images/bg-header.png?07a751e') repeat-x scroll 0 0 #FFFFFF;">

</div>
<link rel="stylesheet" href="<%=basePath%>kindeditor-4.1.11/themes/default/default.css"/>
<link rel="stylesheet" href="<%=basePath%>kindeditor-4.1.11/plugins/code/prettify.css"/>
<script charset="utf-8" src="<%=basePath%>kindeditor-4.1.11/kindeditor-all.js"></script>
<script charset="utf-8" src="<%=basePath%>kindeditor-4.1.11/lang/zh-CN.js"></script>
<script charset="utf-8" src="<%=basePath%>kindeditor-4.1.11/plugins/code/prettify.js"></script>
<script>
    KindEditor.ready(function (K) {
        var editor1 = K.create('textarea[name="remark"]', {
            cssPath: '<%=basePath%>kindeditor-4.1.11/plugins/code/prettify.css',
            uploadJson: '<%=basePath%>fileUpload',
            fileManagerJson: '<%=basePath%>fileManager',
            allowFileManager: true,
            afterCreate: function () {
            },
            afterBlur: function () {
                this.sync();
            }
        });
        prettyPrint();
    });

    //function editZxdkApply(id){
    //   	showWindow("#w1",{
    //			title : "审核信息",
    //			width : 900,
    //			height : 600,
    //			content:"<iframe src='system/ZxdkApplyForm?id="+id+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
    //	});
    //}
    $("#shenhe_operate").on("click",function () {
        var url="<%=basePath%>"+"system/ZxdkApplyForm?type=iframe&id="+"${zxdkApply.id}";
        showWindow("#w10",{
            			title : "审核信息",
            			width : 900,
            			height : 600,
            			content:"<iframe src='"+url+"' style='width:100%;height:100%;' frameborder='0'></iframe>"
            	});
    })
</script>