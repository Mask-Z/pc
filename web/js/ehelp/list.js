$(document).ready(function(){
	renderQueryCondition();
	function renderQueryCondition(){
		if(selectA!=null&&selectA!=''){
			$(".select-result dl").append('<dd id="selectA" class="selected">'
										+  '  <a href="javascript:;">'+selectA+'</a>'
										+  '</dd>');
		}	
		$("#select1 dd").each(function(){
			var text=$(this).text();
		    if(text==selectA){
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
		queryData(1);
	});
	
	$("#selectA").live("click", function () {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
		queryData(1);
	});
	
	$(".select dd").live("click", function () {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});
	
});

function queryData(page){
	var url=basePath+"ehelp_more?time="+new Date().getTime();
	if($("#selectA a").length>0){
		var categoryname=$("#selectA a").html();//标的类型
		url+="&ehelp_projectType="+encodeURI(encodeURI(categoryname));
	}
	var title=$("#title").val();
	if(title!=''){
		url+='&title='+encodeURI(encodeURI(title));
	}
	if(page!=null){
		url+='&page='+page;
	}
	window.open(url,"_self");
}