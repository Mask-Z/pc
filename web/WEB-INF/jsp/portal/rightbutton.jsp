<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>
    $(function () {
        function setHeight() {
            var height=600;
            //获取页面高度
            if (window.innerHeight) {
                height = window.innerHeight - 40 + "px";
            } else if ((document.body) && (document.body.clientHeight)) {
                height = document.body.clientHeight-40;
            }
            $(".mxheight").height(height);
        }
        window.setInterval(setHeight,1000);
    })
</script>
<c:set var="root" value="<%=basePath %>" scope="page"></c:set>

       <div class="sideTools glivia">
  <div class="fixedleft">
    <a href="javascript:void(0);" class="fix-close blank_hook" style="display: none;"></a>
    <div class="side-tab">

       <div class="tab-logo">
        <a id="jjz" href="javascript:showJjz();" class="logo-name jingjia fix-subtop"></a>
        <div class="base-tip">
          竞价中
          <i></i>
        </div>
      </div>
      <div class="tab-logo">
        <a id="wdgz" href="javascript:showWdgz(1);" class="logo-name guanzhu fix-subtop"></a>
        <div class="base-tip">
          我的关注
          <i></i>
        </div>
      </div>
       <div class="tab-logo">
        <a id="lljl" href="javascript:showLljl();" class="logo-name liulan fix-subtop">
        </a>
        <div class="base-tip">
          浏览记录
          <i>
          </i>
        </div>
      </div> 
      <div class="tab-logo">
        <a href="javascript:void(0)" class="logo-name search">
        </a>
        <div class="base-tip search">
           <div class="item"><a href="<%=basePath%>jygg_more"">产权交易</a></div>
           <div class="item"><a href="<%=basePath%>zbcg_more">招标采购</a></div>
           <div class="item"><a href="<%=basePath%>kjcg_more">快捷采购</a></div>
          <i></i>
        </div>
      </div>

      
    </div>
    <div class="side-bottom">
      <div class="tab-logo">
        <a id="webqq" href="javascript:openSDK()" class="logo-name qq"></a>
        <div class="base-tip">
          在线客服
          <i></i>
        </div>
      </div>
      <div class="tab-logo">
        <a id="webqq" href="javascript:showCompare();"  class="logo-name fix-subtop duibi"><!-- <b></b> --></a>
        <div class="base-tip">
          比一比
          <i></i>
        </div>
      </div>
      <div class="tab-logo">
        <a id="webqq" href="http://www.e-jy.com.cn/ejy/showinfo_new/moreinfo_zjcx.aspx" class="logo-name money"></a>
        <div class="base-tip">
         	 资金查询
          <i></i>
        </div>
      </div>
      <div class="tab-logo">
        <a id="webqq" href="javascript:showRule1();" class="logo-name jianyi"></a>
        <div class="base-tip">
          意见建议
          <i></i>
        </div>
      </div>
      
      <div class="tab-logo">
        <a id="webqq" href="" class="logo-name erweima"></a>
        <div class="base-tip erweima">
           <div class="item"><img src="${root }html/images/right-ico-wx.jpg" alt=""><br>微信公众号</div>
           <div class="item"><a href="https://passport.weibo.com/visitor/visitor?entry=miniblog&a=enter&url=http%3A%2F%2Fweibo.com%2Fp%2F1006066345971954%2Fhome%3Ffrom%3Dpage_100606%26mod%3DTAB%26pids%3Dplc_main%26sudaref%3Dweibo.com%26retcode%3D6102%26is_hot%3D1&domain=.weibo.com&ua=php-sso_sdk_client-0.6.23&_rand=1503470485.5409" target="_blank"><img src="${root }html/images/right-ico-wb.jpg" alt=""></a><br>微博官网</div>
		   <div class="item"><a href="http://i.youku.com/i/UNDkyNTQ2NjcwOA==?spm=a2hww.20023042.uerCenter.5~5!2~5~5~5~5~5~A" target="_blank"><img src="${root }html/images/right-ico-yk.jpg" alt=""></a><br>优酷官网</div>
          <i></i>
        </div>
      </div>
      
      <div class="tab-logo">
        <a href="javascript:void(0)" class="logo-name return" style="display: block;">
        </a>
      </div>
      
    </div>
  </div>
  
  
  <div class="fixedright">
    <div class="new-plugin">
            <div class="box clearfix" id="common_rightbutton">
              <!--
              <h3>我的关注</h3>                
              <ul>
                  <c:if test="${loginInfo !=null }">                                   
                  <c:forEach items="${loginInfo.listGg }" var="gg">
                      <li>
                            <a href="infodetail?infoid=${gg.infoid }&categoryNum=${gg.categorynum }" target="_blank" class="content4-detail">
                                
                                
                                <img src="">
                                
                                <div class="content4-text">
                                    <p class="title">${gg.title }</p>
                                    <p class="info">  
                                    <span></span><span class="price"><b>${gg.guapaiprice }</b> 元</span>
                                    </p>
                                </div>
                            </a>
                        </li>
		
				  </c:forEach> 
				  </c:if>
              </ul>
              -->
            </div>
            <div class="box clearfix">
              
            </div> 
            </div>    
    
  </div>
</div>


<div class="visit-fix visit-fix1" >
<div class="fix-bg"></div>
        <div class="box">
            <div class="recharge-cz">
                <h3 class="bd_b f16 pb10 mb10 clearfix lh24">
                <a href="javascript:closeRule1();" class="close">
                      <i class="fc99 f24 iconfont icon-error"></i>
                </a>
                意见建议 
                </h3>
                <dl>
                    <dt><font class="fcdd3">*</font>联系人：</dt>
                    <dd>
                        <input type="text" class="form-control input input-sm" id="advice_name" placeholder="姓名">
                    </dd>
                </dl>
                <dl>
                    <dt><font class="fcdd3">*</font>手机号：</dt>
                    <dd>
                        <input type="text"  class="form-control input input-sm" id="advice_telephone" placeholder="手机号">
                    </dd>
                </dl>
                <dl>
                    <dt><font class="fcdd3">*</font>留言主题：</dt>
                    <dd>
                        <input type="text" class="form-control input input-sm" id="advice_title" placeholder="标题">
                    </dd>
                </dl>
                <dl>
                    <dt><font class="fcdd3">*</font>留言内容：</dt>
                    <dd>
                        <textarea type="text" id="advice_content" class="form-control input input-sm" placeholder="内容" style="height:80px;padding:10px;"></textarea>
                    </dd>
                </dl>
                <dl>
                    <dt><font class="fcdd3">*</font>验证码：</dt>
                    <dd>
                        <input type="text" class="form-control input input-sm"   id="advice_valcode"  placeholder="请输入验证码" style="width:225px;">
                       <img  style="cursor: pointer;" title="点我刷新" onclick="this.src=this.src + '?' +Math.random()"
								src="<%=basePath %>valcode" alt="" width="120" height="40" class="dsb fr">
                    </dd>
                </dl>
            </div>
            <div class="pd10 ta-c recharge-btn ">
                <button type="button" class="fix-base-btn mr10 fix-btn-default" onclick="javascript:closeRule1();">取消</button>
                <button type="button" class="fix-base-btn fix-btn-danger " onclick="yjjySave();">提交</button>
            </div>
        </div>
    </div>
<script type="text/javascript">
var get_lljls;

function showRule1() {
    $(".visit-fix1").animate({ bottom: '0px' }, 300);
};

function closeRule1() {
    $(".visit-fix1").animate({ bottom: '-100%' }, 300);
};
function yjjySave(){
	var name=$("#advice_name").val();
	var telephone=$("#advice_telephone").val();
	var title=$("#advice_title").val();
	var content=$("#advice_content").val();
	var valcode=$("#advice_valcode").val();
	if(name!=''&&telephone!=''&&title!=''&&content!=''
			&&valcode!=''){
		 if(!/^(13|14|15|17|18)\d{9}$/i.test(telephone)){
		 	alert("请输入正确的手机号！");
		 }else{
		 	$.ajax({
				type : "post",
				url : "<%=basePath%>system/adviceSave/add",
				dataType: "json",
				data : {
					name:name,
					tel:telephone,
					title:title,
					content:content,
					valcode:valcode
				},
				method : "POST",
				success : function(data) {
					if(data.code==0){
						closeRule1();
						clearForm_('advice_');
						alert("发布成功！");
					}else if(data.code==1){
						alert("验证码错误！");
					}
				},
				error:function (data){
				}
		   });
		 }
	}else{
		alert("带*号的为必填项！");
	}
}

function showCompare(){
	$("#common_rightbutton").empty();
	var html ="";
	var project_list =compare_list();
	var projectType =compare_projectType();
	html +='<h3>标的比一比</h3>';
	if(project_list ==null ||project_list.length ==0){
		html +='<font color="red">提示：暂无项目。</font>';
	}else{
		html +='<ul>';
		//循环组装项目信息start
		for(var i in project_list){
			var info =project_list[i];
			var html_project ="";//项目信息html
			var price =info.price;
			var imgurl =info.imgurl;
			var title =info.title;
			var infoid =info.infoid;
			var projectGuid ="'" +info.projectGuid +"'";
			html_project +='<li>';
			html_project +='<a href="javascript:compare_remove('+projectGuid+');history.go(0)" class="close"></a>';
			html_project +='<a href="infodetail?infoid='+infoid+'" target="_blank" class="content4-detail">';
			html_project +='<img src="'+imgurl+'">';
			html_project +='<div class="content4-text">';
			html_project +='<p class="title">'+title+'</p>';
			html_project +='<p class="info">  ';
			html_project +='<span></span><span class="price"><b>'+price+'</b> 元</span>';
			html_project +='</p>';
			html_project +='</div>';
			html_project +='</a>';
			html_project +='</li>';
			html +=html_project;
		}
		//循环组装项目信息end
		html +='</ul>';
		html +='<div class=""><a href="compare_list?projectType='+projectType+'" target="_blank" class="btn-search-box">开始比一比</a></div>';
	}
	$("#common_rightbutton").html(html);
}

function showJjz() {
    $("#common_rightbutton").empty();
    $.ajax({
		url: 'get_jjz',
		type: 'post',
		data: '',
		dataType:'json',
		success: function(datas){
			var data = datas.all_jjzs;
			var html = '<h3>竞价中</h3>' + '<ul>';
			var data_html = '';
			for(var i in data){
				if(data[i].projectType=='pt'){
					var gpj = '';
					if(data[i].systemtype!='ZZKG'){
						gpj = '<span></span><span class="price"><b>'+data[i].guapaiprice+'</b> 元</span>';
					}else{
						gpj = '<span></span><span class="price"><b>'+data[i].zzkg_guapaiprice+'</b></span>';
					}
					data_html = data_html + '<li>' +
	                '<a href="infodetail?infoid='+data[i].infoid+'&categoryNum='+data[i].categorynum+'" target="_blank" class="content4-detail">' +
	                '<img src="'+data[i].titlepic+'">' +
	                '<div class="content4-text">' +
	                '<p class="title">'+'['+data[i].areaName+']'+data[i].title+'</p>' +
	                '<p class="info">' +  
	                gpj +
	                '</p>' +
	                '</div>' +
	                '</a>' +
	                '</li>';
				}else{
					data_html = data_html + '<li>' +
	                '<a href="javascript:void(0)" class="content4-detail">' +
	                '<img src="<%=basePath %>image/default/vip.jpg">' +
	                '<div class="content4-text">' +
	                '<p class="title">'+'[专厅项目]'+data[i].title+'</p>' +
	                '<p class="info">' +  
	                '</p>' +
	                '</div>' +
	                '</a>' +
	                '</li>';
				}				
			}
			html = html + data_html + '</ul>';
			$("#common_rightbutton").html(html);    			
		}, error: function (XMLHttpRequest, textStatus, errorThrown) {
            //异步错误，Http错误状态码               
        }
    });
};

function showWdgz(currentPage) {
    var url='get_wdgz?page='+currentPage;
    $("#common_rightbutton").empty();
    $.ajax({
		url: url,
		type: 'post',
		data: '',
		dataType:'json',
		success: function(datas){
			var data = datas.all_wdgzs;
			var page = datas.page;
			var total = datas.total;
			var totalPage = datas.totalPage;
			var html = '<h3>我的关注</h3>' + '<ul class="mxheight">';
			var data_html = '';
			for(var i in data){
				var gpj = '';
				if(data[i].systemtype!='ZZKG'){
					gpj = '<span></span><span class="price"><b>'+data[i].guapaiprice+'</b> 元</span>';
				}else{
					gpj = '<span></span><span class="price"><b>'+data[i].zzkg_guapaiprice+'</b></span>';
				}
				data_html = data_html + '<li>' +
                '<a href="infodetail?infoid='+data[i].infoid+'&categoryNum='+data[i].categorynum+'" target="_blank" class="content4-detail">' +
                '<img src="'+data[i].titlepic+'">' +
                '<div class="content4-text">' +
                '<p class="title">'+'['+data[i].areaName+']'+data[i].title+'</p>' +
                '<p class="info">' +  
                gpj +
                '</p>' +
                '</div>' +
                '</a>' +
                '</li>';
			}
            if(data.length>=10){
                data_html+='<div class="clearfix">';
                data_html+='<span class="wdgz"><a class="more" href="<%=basePath%>ygz_more?danWeiGuid=${loginAccount.danWeiGuid}">更多</a></span>';
            }
			html = html + data_html + '</ul>';

			$("#common_rightbutton").html(html);    			
		}, error: function (XMLHttpRequest, textStatus, errorThrown) {
            //异步错误，Http错误状态码               
        }
    });
};

function showLljl() {
	get_lljls = $.cookie("lljls");
	$("#common_rightbutton").empty();
    if(get_lljls){
    	$.ajax({
    		url: 'get_lljl',
    		type: 'post',
    		data: "get_lljls="+get_lljls,
    		dataType:'json',
    		success: function(datas){
    			var data = datas.all_lljls;
    			var html = '<h3>浏览记录</h3>' + '<ul class="mxheight">';
    			var data_html = '';
    			for(var i in data){
    				var gpj = '';
    				if(data[i].systemtype!='ZZKG'){
    					gpj = '<span></span><span class="price"><b>'+data[i].guapaiprice+'</b> 元</span>';
    				}else{
    					gpj = '<span></span><span class="price"><b>'+data[i].zzkg_guapaiprice+'</b></span>';
    				}
    				data_html = data_html + '<li>' +
                    '<a href="infodetail?infoid='+data[i].infoid+'&categoryNum='+data[i].categorynum+'" target="_blank" class="content4-detail">' +
                    '<img src="'+data[i].titlepic+'">' +
                    '<div class="content4-text">' +
                    '<p class="title">'+'['+data[i].areaName+']'+data[i].title+'</p>' +
                    '<p class="info">' +  
                    gpj +
                    '</p>' +
                    '</div>' +
                    '</a>' +
                    '</li>';
    			}
    			html = html + data_html + '</ul>';
    			$("#common_rightbutton").html(html);    			
    		}, error: function (XMLHttpRequest, textStatus, errorThrown) {
                //异步错误，Http错误状态码               
            }
        });
    }else{
    	$("#common_rightbutton").html("<h3>浏览记录</h3>");
    }    
};

function clearForm_(id){
	$("#"+id+"name").val("");
	$("#"+id+"telephone").val("");
	$("#"+id+"title").val("");
	$("#"+id+"content").val("");
	$("#"+id+"valcode").val("");
}
</script>