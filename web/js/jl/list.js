$(document).ready(function(){
	renderQueryCondition();
	function renderQueryCondition(){
		if(selectA!=null&&selectA!=''){
			$(".select-result dl").append('<dd id="selectA" class="selected">'
										+  '  <a href="javascript:;">'+selectA+'</a>'
										+  '</dd>');
		}	
		if(selectB!=null&&selectB!=''){
			$(".select-result dl").append('<dd id="selectB" class="selected">'
										+  '  <a href="javascript:;">'+selectB+'</a>'
										+  '</dd>');
		}	
		if(selectC!=null&&selectC!=''){
			$(".select-result dl").append('<dd id="selectC" class="selected">'
										+  '  <a href="javascript:;">'+selectC+'</a>'
										+  '</dd>');
		}	
		if(selectD!=null&&selectD!=''){
			$(".select-result dl").append('<dd id="selectD" class="selected">'
										+  '  <a href="javascript:;">'+selectD+'</a>'
										+  '</dd>');
		}	
		$("#select1 dd").each(function(){
			var text=$(this).text();
		    if(text==selectA){
		    	$(this).addClass("selected").siblings().removeClass("selected");
		    }
		 });
		$("#select2 dd").each(function(){
			var text=$(this).text();
		    if(text==selectB_){
		    	$(this).addClass("selected").siblings().removeClass("selected");
		    	var citys=querySubCity($(this).text());
				renderSubCitys($(this).text(),citys);
				$("#subcity").show();
		    }
		 });
		$("#select3 dd").each(function(){
			var text=$(this).text();
		    if(text==selectC){
		    	$(this).addClass("selected").siblings().removeClass("selected");
		    }
		 });
		$("#select4 dd").each(function(){
			var text=$(this).text();
		    if(text==selectD){
		    	$(this).addClass("selected").siblings().removeClass("selected");
		    }
		 });
	}
	$("#select1 dd").click(function () {//标的类型
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectA").remove();
		} else {
			var copyThisA = $(this).clone();
			if ($("#selectA").length > 0) {
				$("#selectA a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisA.attr("id", "selectA"));
			}
		}
		queryData("",1);
	});
	
	$("#select2 dd").click(function () {//标的所在地
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectB").remove();
		} else {
			if($(this).text()!='全部'){
				var citys=querySubCity($(this).text());
				renderSubCitys($(this).text(),citys);
				$("#subcity").show();
			}else{
				$("#subcity").hide();
			}
		}
	});
	
	$("#select3 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectC").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectC").length > 0) {
				$("#selectC a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectC"));
			}
		}
		queryData("",1);
	});

	$("#select4 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectD").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectD").length > 0) {
				$("#selectD a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectD"));
			}
		}
		queryData("",1);
	});
	
	$("#selectA").live("click", function () {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
		queryData("",1);
	});
	
	$("#selectB").live("click", function () {
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
		queryData("",1);
	});
	
	$("#selectC").live("click", function () {
		$(this).remove();
		$("#select3 .select-all").addClass("selected").siblings().removeClass("selected");
		queryData("",1);
	});
	$("#selectD").live("click", function () {
		$(this).remove();
		$("#select4 .select-all").addClass("selected").siblings().removeClass("selected");
		queryData("",1);
	});
	
	$(".select dd").live("click", function () {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});
	
});

function queryData(otype,page){
	var url=basePath+"jl_more?time="+new Date().getTime();
	if($("#selectA a").length>0){
		var categoryname=$("#selectA a").html();//标的类型
		url+="&categoryname="+encodeURI(encodeURI(categoryname));
	}
	if($("#selectB a").length>0){
		var s2=$("#selectB a").html();//市 标的所在地
		var s1=$("#selectB a").attr("value");
		url+="&s2="+encodeURI(encodeURI(s2))+"&s1="+encodeURI(encodeURI(s1));
	}
	if($("#selectC a").length>0){
		var cqywtype=$("#selectC a").html();//业务类型
		url+="&cqywtype="+encodeURI(encodeURI(cqywtype));
	}
	if($("#selectD a").length>0){
		var state=$("#selectD a").html();//项目状态
		url+="&status_name="+encodeURI(encodeURI(state));
	}
	var startPrice=$("#startPrice").val();
	var endPrice=$("#endPrice").val();
	if(startPrice!=''){
		url+='&startPrice='+startPrice;
	}
	if(endPrice!=''){
		url+='&endPrice='+endPrice;
	}
	if(otype!=null&&otype!=''){
		if(otype=='orderType1'){
			url+='&orderType='+otype;
		}else if(otype=='orderType2'||otype=='orderType3'){
			if(orderType==otype+"_up"){
				url+='&orderType='+otype+'_down';
			}else if(orderType==otype+"_down"){
				url+='&orderType='+otype+'_up';
			}else{
				url+='&orderType='+otype+'_up';
			}
		}
	}
	if(page!=null){
		url+='&page='+page;
	}
	window.open(url,"_self");
}
function querySubCity(name){
	var citys;
	$.ajax({
		type : "post",
		url : basePath+"querySubCitys",
		dataType: "json",
		data : {name:name},
		method : "post",
		async:false,
		success : function(data) {
			citys=data;
		}
	});
	return citys;
}
function renderSubCitys(province,citys){
	$("#subcityul").html("");
	for(var i=0;i<citys.length;i++){
		$("#subcityul").append('<li class="county " op="'+citys[i].code+'_op"><a  id="'+citys[i].code+'_a" onclick="choiceCity(\''+citys[i].code+'\',\''+province+'\');">'+citys[i].name+'</a></li>');
	}
}
function choiceCity(code,province){
	var text=$("#"+code+"_a").text();
	if ($("#selectB").length > 0) {
		$("#selectB a").html(text);
	} else {
		$(".select-result dl").append('<dd class="selected" id="selectB"><a href="javascript:;" value="'+province+'">'+text+'</a></dd>');
	}
	queryData("",1);
}