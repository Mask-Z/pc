$(document).ready(function(){
	renderQueryCondition();
	function renderQueryCondition(){       
		if(selectE!=null&&selectE!=''){
            $(".select-result dl").append('<dd id="selectE" class="selected" >'
                +  '  <a href="javascript:;">'+selectE+'</a>'
                +  '</dd>');
        }
        if(selectA!=null&&selectA!=''){
			$(".select-result dl").append('<dd id="selectA" class="selected">'
										+  '  <a href="javascript:;">'+selectA+'</a>'
										+  '</dd>');
		}	
		if(selectG!=null&&selectG!=''){
            $(".select-result dl").append('<dd id="selectG" class="selected" >'
                +  '  <a href="javascript:;">'+selectG+'</a>'
                +  '</dd>');
        }		
		$("#select1 dd").each(function(){
			var text=$(this).text();
		    if(text==selectA){
		    	$(this).addClass("selected").siblings().removeClass("selected");
		    }
		 });
		$("#select6 .hot_lable").each(function(){
			if(selectG!=null&&selectG!=''){
				var hotlables = selectG.split(",");
				var text=$(this).parent().text();
				if($.inArray(text, hotlables) >= 0){
					$(this).attr("checked", true);
				}
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
            queryData("",1);
		}else{
            queryData("",1);
        }
	});
	
	$("#select6 .hot_lable").change(function () {
		var count = 0;
		var text = "";
		$("#select6 .hot_lable").each(function(){
			if($(this).prop('checked')){
				count++;				
				text = text + $(this).next().text() + ",";
			}
		});
		if(count > 3){
			alert("标的亮点最多选择3个，请重新选择！");
			$(this).attr('checked',false);
			return;
		}		
		if ($("#selectG").length > 0) {
			$("#selectG a").html(text.substring(0, text.length-1));
		} else {
			$(".select-result dl").append('<dd id="selectG" class="selected"><a href="javascript:;">'
					+text.substring(0, text.length-1)+'</a></dd>');
		}		
        if($("#selectB a").length>0){
            queryData("",1);
        }else{
            queryData("",1);
        }
	});
    $(document).on( "click", "#selectA", function() {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
        if($("#selectB a").length>0){
            queryData("",1);
        }else{
            queryData("",1);
        }
	});
    
    $(document).on( "click", "#selectG", function() {
    	$(this).remove();
    	$("#select6 .hot_lable").each(function(){
    		$(this).attr("checked", false);
    	});
        if($("#selectB a").length>0){
            queryData("",1);
        }else{
            queryData("",1);
        }
	});
    
    $(document).on( "click", "#selectE", function() {
        $(this).remove();
        queryData("",1);
    });

    $(document).on( "click", ".select dd", function() {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});
	
});

function queryData(otype,page){
	var url=basePath+"jygg_more_data?time="+new Date().getTime();
	if (null != pagename && pagename =='jl_more'){
		url+="&pagename=jl_more";
	}
	if($("#selectA a").length>0){
		var categoryname=$("#selectA a").html();//标的类型
		url+="&categoryname="+(encodeURI(categoryname));
	}
    if($("#selectG a").length>0){
		var hotlable=$("#selectG a").html();//亮点名称
		url+="&hotlable="+(encodeURI(hotlable));
	}
    if($("#selectE a").length>0){
        var state=$("#selectE a").html();//项目标题
        url+="&title="+(encodeURI(state));
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
		}else{
			url+='&orderType='+otype;
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

function updateTypeCookieAndOpenPage(value,id){
	set_type_cookie(value);
	window.open(basePath+"infodetail?infoid="+id);
}