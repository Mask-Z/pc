$(function(){
//用户登录
$('#login').click(function(){
	$.ajax({
		type: "POST",
		url: "userLogin",
		data: {loginname:$("#uName").val(), pwd:$("#upwd").val()},
		dataType: "json",
		method:"POST",
		success: function(data){
		    if(data.result==true){
		        window.location.href="first";
		    }else{
		        $("#error").html(data.msg);
		    }
		}
	});
});

});
//判断是否是回车键
function enterKey(e){
	var key=e.keyCode;
	  if(key== 13){
		  $('#login').click();  
	  }
}