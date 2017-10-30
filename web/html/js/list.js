$(document).ready(function(){
	$("#select1 dd").click(function () {
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
	});
	
  $(function(){  
        //获取导航距离页面顶部的距离  
	  if(!$(".mainContent").offset()){
		  return;
	  }
        var onexFix = $(".mainContent").offset().top; 
        //监听页面滚动  
        $(window).scroll(function() {  
            //onex 
            if($(document).scrollTop() > onexFix ){   
                $(".compareHouseTitle").addClass("fixed");
            }else{
                $(".compareHouseTitle").removeClass("fixed"); 
            };
        });         
}); 


$(".ypl-detail-title .item").click(function(){
        $(this).addClass("curr").siblings().removeClass("curr");
        $(".ypl-detail-box").hide().eq($(this).index()).show()
    });

	$("#select2 dd").click(function () {
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
	});


    $("#select22 li").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectBB").remove();
        } else {
            var copyThisB = $(this).clone();
            if ($("#selectBB").length > 0) {
                $("#selectBB a").html($(this).text());
            } else {
                $(".select-result dl").append(copyThisB.removeClass("condition_subCity ").attr("id", "selectBB"));
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
	});
	
	$("#selectA").on("click", function () {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$("#selectB").on("click", function () {
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$("#selectC").on("click", function () {
		$(this).remove();
		$("#select3 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	$("#selectD").on("click", function () {
		$(this).remove();
		$("#select4 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$(".select dd").on("click", function () {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});
	
	// //检索条件下拉
	// function setlef() {
	// 	var nlef = $(".nl-valueList").offset().left;
		
	// 	if($(".nl-areaCity li").hasClass("nl-on")){
	// 		var llef = $(".nl-areaCity .nl-on").offset().left;
	// 		var nlm = nlef - llef + 98;
	// 		$(".nl-areaCity li .sub-condition").css("left", nlm);
	// 	}
		
	// 	var onelef = $(".N-selectone .nl-on").offset().left;
	// 	var nolef = nlef - onelef + 101;
	// 	$(".N-selectone li .sub-condition").css("left", nolef);
	// }
	// setlef();
	
	
	
	$(".note-btn").click(function(){
	    $(this).toggleClass("cur");
	    $(".jgmc-name").toggleClass("auto");
	});
});