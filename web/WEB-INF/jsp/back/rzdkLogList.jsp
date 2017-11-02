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
</script>

<table class="myform" title="报名详情" style="width:100%;height:250px" border="1">
    <thead>
    <tr>
        <td class="title">审核日期</td>
        <td class="title">审核人</td>
        <td class="title">进度</td>
        <td class="title">状态</td>
        <td class="title">备注</td>
        <td class="title">金额</td>
    </tr>
    <c:forEach items="${result.rows}" var="list">
        <tr>
            <td>${list.operation_time}</td>
            <td>${list.operation_name}</td>
            <td>${list.audit_status}</td>
            <td>${list.audit_result}</td>
            <td>${list.remark}</td>
            <td>${list.apply_jkjeqr}</td>
        </tr>
    </c:forEach>
    </thead>
</table>
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