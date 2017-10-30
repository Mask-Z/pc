$(document).ready(function(){
	renderQueryCondition();
	function renderQueryCondition(){
        if(selectE!=null&&selectE!=''&& typeof(selectE) != "undefined" ){
            $(".select-result dl").append('<dd id="selectE" class="selected">'
                +  '  <a href="javascript:;">'+selectE+'</a>'
                +  '</dd>');
        }
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
		    if(text==selectB){
		    	$(this).addClass("selected").siblings().removeClass("selected");
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
	$("#select1 dd").click(function() {//标的类型
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
		queryData(1);
	});
	
	$("#select2 dd").click(function () {//标的所在地
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectB").remove();
		} else {
			var copyThisB = $(this).clone();
			if ($("#selectB").length > 0) {
				$("#selectB a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisB.attr("id", "selectB"));
			}
		}
		queryData(1);
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
		queryData(1);
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
		queryData(1);
	});
	
	$("#selectA").on("click", function () {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
		queryData(1);
	});
	
	$("#selectB").on("click", function () {
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
		queryData(1);
	});
	
	$("#selectC").on("click", function () {
		$(this).remove();
		$("#select3 .select-all").addClass("selected").siblings().removeClass("selected");
		queryData(1);
	});
	$("#selectD").on("click", function () {
		$(this).remove();
		$("#select4 .select-all").addClass("selected").siblings().removeClass("selected");
		queryData(1);
	});
	$("#selectE").on("click", function () {
		$(this).remove();
		queryData(1);
	});
	
	$(".select dd").on("click", function () {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});
	
});

function queryData(page){
	var url=basePath+"zbcg_more?time="+new Date().getTime();
	if($("#selectA a").length>0){
		var xiaquname=$("#selectA a").html();//机构名称
		url+="&xiaquname="+encodeURI(encodeURI(xiaquname));
	}
	if($("#selectB a").length>0){
		var type=$("#selectB a").html();//公告类型
		url+="&type="+encodeURI(encodeURI(type));
	}
	if($("#selectC a").length>0){
		var categoryname=$("#selectC a").html();//项目类型
		url+="&categoryname="+encodeURI(encodeURI(categoryname));
	}
	if($("#selectD a").length>0){
		var state=$("#selectD a").html();//项目状态
		url+="&status_name="+encodeURI(encodeURI(state));
	}
    if($("#selectE a").length>0){
        var state=$("#selectE a").html();//项目状态
        url+="&biaoduanname="+encodeURI(encodeURI(state));
    }

	if(page!=null){
		url+='&page='+page;
	}
	window.open(url,"_self");
}