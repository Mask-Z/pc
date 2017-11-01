<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">

<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js"></script>
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
<script type="text/javascript">
   if ("${flag}"=="flag"){
        parent.$("#rzdkList_table").datagrid('reload');
        parent.$.messager.alert("提示", "${msg}");
        parent.closeWindow("#w1");
   }
    $(function () {
        $("#rzdk_save").click(function () {
            if ($("#rzdk_addform").form('validate')) {
                $("#rzdk_addform").submit();
            }
        });
    });
</script>

<form id="rzdk_addform" style="margin: 5px 5px;" method="post" action="zxdkApplyLogSave">
    <a href="javascript:;" class="easyui-linkbutton" iconCls="icon-ok" id="rzdk_save">提交</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:parent.$('#w1').window('close');">取消</a>
    <div class="sztab">
        <table id="zxdk_addtable">
            <input id="id" type="hidden" name="apply_id" value="${zxdkApply.id }"/>

            <c:if test="${zxdkApply.member_type eq 0}"><!--个人信息-->
            <tr>
                <td class="title">姓名</td>
                <td>${zxdkApply.individual_xm}</td>
                <td class="title">身份证号</td>
                <td>${zxdkApply.individual_sfzh}</td>
            </tr>
            <tr>
                <td class="title">联系方式</td>
                <td>${zxdkApply.individual_lxfs}</td>
                <td class="title">紧急联系人</td>
                <td>${zxdkApply.individual_jjlxr}</td>
            </tr>
            <tr>
                <td class="title">紧急联系人联系方式</td>
                <td>${zxdkApply.individual_jjlxrlxfs}</td>
                <td class="title">职业</td>
                <td>${zxdkApply.individual_zy}</td>
            </tr>
            <tr>
                <td class="title">公司</td>
                <td>${zxdkApply.individual_gs}</td>
                <td class="title">个人收入</td>
                <td>${zxdkApply.individual_grsr}</td>
            </tr>
            <tr>
                <td class="title">家庭收入</td>
                <td>${zxdkApply.individual_jtsr}</td>
                <td class="title">婚姻</td>
                <td>${zxdkApply.individual_hy}</td>
            </tr>
            <tr>
                <td class="title">对方联系人</td>
                <td>${zxdkApply.individual_dflxr}</td>
                <td class="title">对方联系方式</td>
                <td>${zxdkApply.individual_dflxfs}</td>
            </tr>
            </c:if>
            <c:if test="${zxdkApply.member_type eq 1}"><!--单位信息-->
            <tr>
                <td class="title">企业名称</td>
                <td>${zxdkApply.company_qymc}</td>
                <td class="title">身份证</td>
                <td>${zxdkApply.company_frsfzh}</td>
            </tr>
            <tr>
                <td class="title">营业执照编号</td>
                <td>${zxdkApply.company_yyzzbh}</td>
                <td class="title">法人</td>
                <td>${zxdkApply.company_frdb}</td>
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
                <td class="title">邮箱</td>
                <td>${zxdkApply.company_lxyx}</td>
            </tr>
            <tr>
                <td class="title">主要业务说明</td>
                <td>${zxdkApply.company_zyywsm}</td>
                <td class="title">近三年纳税情况</td>
                <td>${zxdkApply.company_jsnnsqk}</td>
            </tr>
            <tr>
                <td class="title">近三年是否连续盈利</td>
                <td>${zxdkApply.company_jsnsflxyl}</td>
                <td class="title">近三年企业收入</td>
                <td>${zxdkApply.company_jsnqysr}</td>
            </tr>
            <tr>
                <td class="title">近三年企业成本</td>
                <td>${zxdkApply.company_jsnqycb}</td>
                <td class="title">企业总资产</td>
                <td>${zxdkApply.company_qyzzc}</td>
            </tr>
            <tr>
                <td class="title">企业总负债</td>
                <td>${zxdkApply.company_qyzfz}</td>
            </tr>
            </c:if>
            <tr>
                <td class="title">申请时间</td>
                <td>${zxdkApply.create_time_str}</td>
                <td class="title">上次更新时间</td>
                <td>${zxdkApply.lastupdate_time_str}</td>
            </tr>
            <tr>
                <td class="title">借款金额</td>
                <td>${zxdkApply.loaninfo_jkje}</td>
                <td class="title">借款日期</td>
                <td>${zxdkApply.loaninfo_jksj}</td>
            </tr>
            <tr>
                <td class="title">还款方式</td>
                <td>${zxdkApply.loaninfo_hkfs}</td>
                <td class="title">还款来源</td>
                <td>${zxdkApply.loaninfo_zyhkly}</td>
            </tr>
            <tr>
                <td class="title">审核状态</td>
                <td>
                    <select name="audit_status">
                        <option value="0"
                                <c:if test="${zxdkApply.reviewinfo_shzt==0}">selected</c:if> >初审
                        </option>
                        <option value="1"
                                <c:if test="${zxdkApply.reviewinfo_shzt==1}">selected</c:if> >资料审核
                        </option>
                        <option value="2"
                                <c:if test="${zxdkApply.reviewinfo_shzt==2}">selected</c:if> >三方合同签署
                        </option>
                        <option value="3"
                                <c:if test="${zxdkApply.reviewinfo_shzt==3}">selected</c:if> >放款到监管账户
                        </option>
                        <option value="4"
                                <c:if test="${zxdkApply.reviewinfo_shzt==4}">selected</c:if> >过户抵押办理
                        </option>
                        <option value="5"
                                <c:if test="${zxdkApply.reviewinfo_shzt==5}">selected</c:if> >放款
                        </option>
                    </select>
                </td>
                <td class="title">审核状态</td>
                <td>
                    <select name="audit_result">
                        <option value="0"
                                <c:if test="${zxdkApply.reviewinfo_shjg==0}">selected</c:if> >待审核
                        </option>
                        <option value="1"
                                <c:if test="${zxdkApply.reviewinfo_shjg==1}">selected</c:if> >审核通过
                        </option>
                        <option value="2"
                                <c:if test="${zxdkApply.reviewinfo_shjg==2}">selected</c:if> >审核不通过
                        </option>
                        <option value="3"
                                <c:if test="${zxdkApply.reviewinfo_shjg==3}">selected</c:if> >已失效
                        </option>
                        <option value="4"
                                <c:if test="${zxdkApply.reviewinfo_shjg==4}">selected</c:if> >办理中
                        </option>
                        <option value="5"
                                <c:if test="${zxdkApply.reviewinfo_shjg==5}">selected</c:if> >已完成
                        </option>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="title">审核备注</td>
                <td style="text-align: left">
                    <textarea name="remark" cols="100" rows="8"
                              style="width:95%;height:350px;visibility:hidden;"></textarea>
                </td>
            </tr>
            <tr>
                <td class="title">借款额度确认</td>
                <td >
                   <input name="apply_jkjeqr" type="number">元
                </td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    var resroot = "<%=basePath%>";//用到UEDITOR的地方必须配置
</script>
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
</script>