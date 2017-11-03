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
    if ("${flag}" == "flag") {
        parent.$.messager.alert("提示", "${msg}");
        parent.closeWindow("#w10");
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
       onclick="javascript:parent.$('#w10').window('close');">取消</a>
    <div class="easyui-panel">
        <input id="id" type="hidden" name="apply_id" value="${zxdkApply.id }"/>
        <input type="hidden" name="audit_status" value="${zxdkApply.id }"/>
        <br/><br/>
        <div style="margin-bottom:20px">
             <span style="padding-left: 5px">
            <label class="label-top">进度:</label></span>
            <input class="easyui-textbox" style="width:50%;"
            <c:if test="${zxdkApply.reviewinfo_shzt==0}"> value="初审" </c:if>
            <c:if test="${zxdkApply.reviewinfo_shzt==1}"> value="材料审核" </c:if>
            <c:if test="${zxdkApply.reviewinfo_shzt==2}"> value="合同签署" </c:if>
            <c:if test="${zxdkApply.reviewinfo_shzt==3}"> value="放款监管" </c:if>
            <c:if test="${zxdkApply.reviewinfo_shzt==4}"> value="产权变更" </c:if>
            <c:if test="${zxdkApply.reviewinfo_shzt==5}"> value="线下打款" </c:if>
            <c:if test="${zxdkApply.reviewinfo_shzt==6}"> value="还款" </c:if>
                   data-options="readonly:true" >

        </div>
        <div style="margin-bottom:20px">
<span style="padding-left: 5px">
            <label class="label-top">状态:</label></span>
            <select labelPosition="top" style="width:50%;" name="audit_result">
                <c:if test="${zxdkApply.reviewinfo_shzt==0}"><!--初审-->
                <option value="-1"
                        <c:if test="${zxdkApply.reviewinfo_shjg==-1}">selected</c:if> >已失效
                </option>
                <option value="0"
                        <c:if test="${zxdkApply.reviewinfo_shjg==0}">selected</c:if> >待绑定
                </option>
                <option value="1"
                        <c:if test="${zxdkApply.reviewinfo_shjg==1}">selected</c:if> >待审核
                </option>
                <option value="2"
                        <c:if test="${zxdkApply.reviewinfo_shjg==2}">selected</c:if> >未通过
                </option>
                <option value="3"
                        <c:if test="${zxdkApply.reviewinfo_shjg==3}">selected</c:if> >已通过
                </option>
                </c:if>
                <c:if test="${zxdkApply.reviewinfo_shzt==1}"><!--材料审核-->
                <option value="-1"
                        <c:if test="${zxdkApply.reviewinfo_shjg==-1}">selected</c:if> >已失效
                </option>
                <option value="1"
                        <c:if test="${zxdkApply.reviewinfo_shjg==1}">selected</c:if> >待审核
                </option>
                <option value="4"
                        <c:if test="${zxdkApply.reviewinfo_shjg==4}">selected</c:if> >不完备
                </option>
                <option value="5"
                        <c:if test="${zxdkApply.reviewinfo_shjg==5}">selected</c:if> >已完备
                </option>
                </c:if>
                <c:if test="${zxdkApply.reviewinfo_shzt==2}"><!--合同签署-->
                <option value="-1"
                        <c:if test="${zxdkApply.reviewinfo_shjg==-1}">selected</c:if> >已失效
                </option>
                <option value="6"
                        <c:if test="${zxdkApply.reviewinfo_shjg==6}">selected</c:if> >待签署
                </option>
                <option value="7"
                        <c:if test="${zxdkApply.reviewinfo_shjg==7}">selected</c:if> >已签署
                </option>
                </c:if>
                <c:if test="${zxdkApply.reviewinfo_shzt==3}"><!--放款监管-->
                <option value="-1"
                        <c:if test="${zxdkApply.reviewinfo_shjg==-1}">selected</c:if> >已失效
                </option>
                <option value="8"
                        <c:if test="${zxdkApply.reviewinfo_shjg==8}">selected</c:if> >待放款
                </option>
                <option value="9"
                        <c:if test="${zxdkApply.reviewinfo_shjg==9}">selected</c:if> >已放款
                </option>
                </c:if>
                <c:if test="${zxdkApply.reviewinfo_shzt==4}"><!--产权变更-->
                <option value="-1"
                        <c:if test="${zxdkApply.reviewinfo_shjg==-1}">selected</c:if> >已失效
                </option>
                <option value="10"
                        <c:if test="${zxdkApply.reviewinfo_shjg==10}">selected</c:if> >待办理
                </option>
                <option value="11"
                        <c:if test="${zxdkApply.reviewinfo_shjg==11}">selected</c:if> >已提交
                </option>
                <option value="11"
                        <c:if test="${zxdkApply.reviewinfo_shjg==12}">selected</c:if> >已办理
                </option>
                </c:if>
                <c:if test="${zxdkApply.reviewinfo_shzt==5}"><!--线下打款-->
                <option value="-1"
                        <c:if test="${zxdkApply.reviewinfo_shjg==-1}">selected</c:if> >已失效
                </option>
                <option value="13"
                        <c:if test="${zxdkApply.reviewinfo_shjg==13}">selected</c:if> >待打款
                </option>
                <option value="14"
                        <c:if test="${zxdkApply.reviewinfo_shjg==14}">selected</c:if> >已打款
                </option>
                </c:if>
                <c:if test="${zxdkApply.reviewinfo_shzt==6}"><!--还款-->
                <option value="-1"
                        <c:if test="${zxdkApply.reviewinfo_shjg==-1}">selected</c:if> >已失效
                </option>
                <option value="15"
                        <c:if test="${zxdkApply.reviewinfo_shjg==15}">selected</c:if> >待打款
                </option>
                <option value="16"
                        <c:if test="${zxdkApply.reviewinfo_shjg==16}">selected</c:if> >已打款
                </option>
                </c:if>
                <%--0：初审；1：材料审核；2：合同签署；3：放款监管；4：产权变更；5：线下打款；6：还款--%>
                <%---1:已失效 0：待绑定；1：待审核；2：未通过；3：已通过   4:不完备  5:已完备  6:待签署 7:已签署 8:待放款 9:已放款 10:待办理 11:已提交 12:已办理   13:待打款 14:已打款 15:当月未还 16:当月已还--%>

            </select>

        </div>
        <div style="margin-bottom:20px">
    <span style="padding-left: 5px">
    <label class="label-top">额度:</label> </span>
            <input type="text" class="easyui-numberbox" style="width:50%;"
                   data-options="min:0,precision:2,prompt:'请输入,50.00~500.99(万元)之间'" name="apply_jkjeqr">

        </div>
        <div style="margin-bottom:20px">
    <span style="padding-left: 5px">
    <label class="label-top">说明:</label> </span>
            <input class="easyui-textbox" name="remark" style="width:50%; height:80px;" data-options="multiline:true,prompt:'请输入内容,最多50字'">
        </div>
    </div>
</form>

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
