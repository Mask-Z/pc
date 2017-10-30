$(document).ready(function(){
	renderQueryCondition();
	function renderQueryCondition(){
		if(selectA!=null&&selectA!=''){
			$(".select-result dl").append('<dd id="selectA" class="selected">'
										+  '  <a href="javascript:;">'+selectA+'</a>'
										+  '</dd>');
		}	
		if(selectB!=null&&selectB!=''&&selectB!='%'){
			$(".select-result dl").append('<dd id="selectB" class="selected">'
										+  '  <a href="javascript:;" class="'+selectB__+'" value="'+selectB_+'">'+selectB+'</a>'
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
		set_type_cookie($(this).text());
        if($("#selectB a").length>0){
            queryData("",1,"no");
		}else{
            queryData("",1,"yes");
        }
	});
	
	$("#select2 dd").click(function () {//标的所在地
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectB").remove();
            if($("#selectB a").length>0){
                queryData("",1,"no");
            }else{
                queryData("",1,"yes");
            }
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


    $(document).on( "click", "#selectA", function() {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
        if($("#selectB a").length>0){
            queryData("",1,"no");
        }else{
            queryData("",1,"yes");
        }
	});

    $(document).on( "click", "#selectB", function() {
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
        if($("#selectB a").length>0){
            queryData("",1,"no");
        }else{
            queryData("",1,"yes");
        }
	});

	$(document).on( "click", ".select dd", function() {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});
	
});

function queryData(otype,page,selectBIsAll){
	var url=basePath+"ypl_more?time="+new Date().getTime();
	if($("#selectA a").length>0){
		var categoryname=$("#selectA a").html();//标的类型
		url+="&categoryname="+encodeURI(encodeURI(categoryname));
	}
    if (selectBIsAll != "ignoreDQ") {
        if ($("#selectB a").length > 0) {
            var s2 = $("#selectB a").html();//市 标的所在地
            var s1 = $("#selectB a").attr("value");
            var s0 = $("#selectB a").attr("class");
            url += "&s2=" + encodeURI(encodeURI(s2)) + "&s1=" + encodeURI(encodeURI(s1)) + "&s0=" + encodeURI((encodeURI(s0)));
        } else if (selectBIsAll == 'yes') {
            url += "&s2=" + encodeURI(encodeURI('%')) + "&s1=" + encodeURI(encodeURI('%')) + "&s0=" + encodeURI((encodeURI('%')));
        }
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

function set_type_cookie(type){//标的类型
	var max_type = $.cookie("max_type_count");
	if(!max_type){
		max_type = 0;
	}else{
		max_type = parseInt(max_type);
	}
	var cr = $.cookie(type);
	if(cr){
		var count = parseInt(cr) + 1;
		$.cookie(type,count , { expires: 2 });
		if(count > max_type){
			$.cookie("type",type);
			$.cookie("max_type_count",count);
		}
	}else{
		if(!$.cookie("type")){
			$.cookie("type",type);
		}
		$.cookie(type, 1, { expires: 2 });
	}
}

function set_area_cookie(city){//标的类型
	debugger;
	var max_type = $.cookie("max_area_count");
	if(!max_type){
		max_type = 0;
	}else{
		max_type = parseInt(max_type);
	}
	var cr = $.cookie(city);
	if(cr){
		var count = parseInt(cr) + 1;
		$.cookie(city,count , { expires: 2 });
		if(count > max_type){
			$.cookie("area",city);
			$.cookie("max_area_count",count);
		}
	}else{
		if(!$.cookie("area")){
			$.cookie("area",city);
		}
		$.cookie(city, 1, { expires: 2 });
	}
}
function updateTypeCookieAndOpenPage(value,id){
	set_type_cookie(value);
	window.open(basePath+"infodetail?infoid="+id);
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
        if (selectB==citys[i].name){
            $("#subcityul").append('<li class="selected " op="'+citys[i].code+'_op"><a  id="'+citys[i].code+'_a" onclick="choiceCity(\''+citys[i].code+'\',\''+province+'\');">'+citys[i].name+'</a></li>');
		}else {
            $("#subcityul").append('<li class="county " op="' + citys[i].code + '_op"><a  id="' + citys[i].code + '_a" onclick="choiceCity(\'' + citys[i].code + '\',\'' + province + '\');">' + citys[i].name + '</a></li>');
        }
	}
}
function choiceCity(code,province){
	var text=$("#"+code+"_a").text();
	if ($("#selectB").length > 0) {
		$("#selectB a").html(text);
		$("#selectB a").attr("value",province);
		$("#selectB a").attr("class",code);
	} else {
		$(".select-result dl").append('<dd class="selected" id="selectB"><a href="javascript:;" class="'+code+'" value="'+province+'">'+text+'</a></dd>');
	}
	set_area_cookie(text);
    if($("#selectB a").length>0){
        queryData("",1,"no");
    }else{
        queryData("",1,"yes");
    }
}