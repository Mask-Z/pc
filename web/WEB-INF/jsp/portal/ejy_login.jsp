<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!-- E交易快捷报名 -->
<div id="ejy_huiyuan_baoming">
    <div class="theme-popover">
        <div class="theme-poptit">
            <a href="javascript:;" title="关闭" class="close">×</a>
            E交易竞买人会员登录
        </div>
        <div class="theme-popbod dform">
            <form class="theme-signin" name="loginform" action="" method="post">
                <input type="hidden" name="projectNo"/>
                <input type="hidden" name="skipType"/>
                <input type="hidden" name="callback"/>
                <p><strong>会员：</strong><input class="ipt" type="text" name="username" size="20"/></p>
                <p><strong>密码：</strong><input class="ipt" type="password" name="password" size="20"/></p>
                <p style="text-align:center;">
                    <a class="ejy_huiyuan_baoming_btn ejy_huiyuan_dl">登 录</a>
                    <a class="ejy_huiyuan_baoming_btn" target="_blank" style="background-color:#fea63a;border:#fea63a"
                       href="http://www.e-jy.com.cn/ejyhy/HuiYuanInfoMis2_CZCQ/Pages/HuiYuanRegisterTwo/Agree.aspx">我要注册</a>
                </p>
            </form>
            <font id="error" style="font-size: 12px;color: red;"></font>
        </div>
    </div>
    <div class="theme-popover-mask"></div>
</div>