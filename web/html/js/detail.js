
$(document).ready(function(){

$(".note-btn").click(function(){
    $(this).toggleClass("cur");
    $(".important-note .box").toggleClass("auto");
});

$(".pm-bid-flow .close").click(function(){
    $(".pm-bid-flow").hide();
});



});


function showpopvideo() {
    $(".popvideo").animate({ bottom: '0px' }, 300);
};

function closepopvideo() {
    $(".popvideo").animate({ bottom: '-100%' }, 300);
};
function showpopmiuse() {
    $(".popmiuse").animate({ bottom: '0px' }, 300);
};

function closepopmiuse() {
    $(".popmiuse").animate({ bottom: '-100%' }, 300);
};

//function showpopmap() {
//	initialize();
//    $(".popmap").animate({ bottom: '0px' }, 300);
//};

function showpopmap(){
	$("#map_form").submit();
};

function closepopmap() {
    $(".popmap").animate({ bottom: '-100%' }, 300);
};


function enlargepopmap() {
    $(".note-btn").click(function(){
        $(".important-note .box").toggleClass("enlarge");
    });
};

function narrowpopmap() {
    $(".popmap").animate({ bottom: '-100%' }, 300);
};



/*详情内容标题浮动*/
        function ScrollTab() {
            var tabNav = $("#itemdetail_area");
            var tabNavHeight = tabNav.height();

            $(window).scroll(function () {
                if (tabNav.offset().top + tabNavHeight - $(window).scrollTop() < 0) {
                    tabNav.addClass("tab_nav_scroll");
                }
                if ($(window).scrollTop() <= $(".detail-con-left").offset().top) {
                    tabNav.removeClass("tab_nav_scroll");
                }
            });
        };


   


  $(function(){
	  
	  var tp = $('#tab1_content').offset().top - 50;
	  
	    //tab切换
	    $(".deatil-tabs  li.survey").click(function(){
	    	if($(this).text()==="竞买记录"){
	    		$(this).addClass("curr").siblings().removeClass("curr");
	    		
	    		$('html,body').animate({ //$('html,body')兼容问题body属于chrome
	                scrollTop: tp
	            })
	    	}
            if($(this).text()==="交易结果公示"){
                $('html,body').animate({ //$('html,body')兼容问题body属于chrome
                    scrollTop: tp
                })
            }
	    	if(!$(this).hasClass("base_moban")){
	    		$(this).siblings().removeClass("curr");
				if(!$(this).hasClass("curr")){
					$(this).addClass("curr");
				}
	    	}
	    	
	    	
	    	
	    })
	  
	    
	  $(window).scroll(function() {
		  
		  if("竞买记录" === $(".base_moban").eq(0).text()){
			//  return;
		  }
		  
		  if($("#jmlllllll").hasClass("curr")){
			  return;
		  }

          if($("#jyjggs").hasClass("curr")){
              return;
          }

		  if(!$("#d-tbgz").offset()){
			  return;
		  }
		  
		  if ($(window).scrollTop() > $("#d-bdgk").offset().top && $(window).scrollTop() < $("#d-tbgz").offset().top) {
				$(".deatil-tabs  li.survey").siblings().removeClass("curr");
				if(!$(".deatil-tabs  li.survey").eq(0).hasClass("curr")){
					$(".deatil-tabs  li.survey").eq(0).addClass("curr");
				}
				
			}else{
				$(".deatil-tabs  li.survey").siblings().removeClass("curr");
				$(".deatil-tabs  li.survey").eq(0).addClass("curr");
			}
			if ($(window).scrollTop() > ($("#d-tbgz").offset().top - 100) && $(window).scrollTop() < $("#d-jytj").offset().top) {
				$(".deatil-tabs  li.survey").siblings().removeClass("curr");
				if(!$(".deatil-tabs  li.survey").eq(1).hasClass("curr")){
					$(".deatil-tabs  li.survey").eq(1).addClass("curr");
				}
			}
			if ($(window).scrollTop() > ($("#d-jytj").offset().top - 100) && $(window).scrollTop() < $("#d-jyzn").offset().top) {
				$(".deatil-tabs  li.survey").siblings().removeClass("curr");
				if(!$(".deatil-tabs  li.survey").eq(2).hasClass("curr")){
					$(".deatil-tabs  li.survey").eq(2).addClass("curr");
				}
			}
			if ($(window).scrollTop() > ($("#d-jyzn").offset().top -100 )){
				$(".deatil-tabs  li.survey").siblings().removeClass("curr");
				if(!$(".deatil-tabs  li.survey").eq(3).hasClass("curr")){
					$(".deatil-tabs  li.survey").eq(3).addClass("curr");
				}
			}
		  
	  });
	  
	  
        //获取导航距离页面顶部的距离  
	/*  if(!$("#itemdetail_area").offset()){
		  return;
	  }*/
        var onexFix = $("#itemdetail_area").offset().top; 
        //监听页面滚动  
        $(window).scroll(function() {  
            //onex 
            if($(document).scrollTop() > onexFix ){   
                $(".deatil-tabs").addClass("fixed");
                $(".deatil-tabs-height").show();  
            }else{
                $(".deatil-tabs").removeClass("fixed"); 
                $(".deatil-tabs-height").hide();  
            };
        });         
}); 
 //   function autodivheight() { //函数：获取尺寸
 //            //获取浏览器窗口高度
 //            var winHeight = 0;
 //            if (window.innerHeight)
 //                winHeight = window.innerHeight;
 //            else if ((document.body) && (document.body.clientHeight))
 //                winHeight = document.body.clientHeight;
 //            //通过深入Document内部对body进行检测，获取浏览器窗口高度
 //            if (document.documentElement && document.documentElement.clientHeight)
 //                winHeight = document.documentElement.clientHeight;
 //            //DIV高度为浏览器窗口的高度
 //            document.getElementById("main_list").style.height = winHeight - $("#MainColumn").height() - 222 + "px";
 //        }
 // window.onexFix = autodivheight; //浏览器窗口发生变化时同时变化DIV高度




$(function() {
    floorScroll();
});

//右边导航是否显示


function floorScroll() {
    var $scrollTop = $(window).scrollTop(),
        $menuItem = $('.deatil-tabs li.survey'),
        $module = $('.module-block'),
        top = $('.banner').height();

    var offsets = [],
        len = $module.length;

    for(var i = 0; i < len; i++) {
        offsets[i] = $module.eq(i).offset().top ;
    };

    // $(window).on('scroll', function() {
    //     $scrollTop = $(this).scrollTop();
    //     showNav($scrollTop, top);
    // });

    $menuItem.on('click', function(e) {
        e.preventDefault();
        if($(this).index() > $module.length){
        	return;
        }
        if(!$module.eq($(this).index()).offset()){
        	return;
        }
        var $blockTop = $module.eq($(this).index()).offset().top - 50;

        
        $("#jmlllllll").removeClass("curr");
        $("#jyjggs").removeClass("curr");
        //$(this).addClass("curr");
        
        $('html,body').animate({ //$('html,body')兼容问题body属于chrome
            scrollTop: $blockTop
        })
    });

}

// $(".switch").click(function(){
//         $(this).addClass("curr").siblings().removeClass("curr");
//         $(".detail-tabcon").hide().eq($(this).index()).show()
// });

var myclick = function(v,tab) {
                var llis = document.getElementsByTagName(".switch");  
                for(var i = 0; i < llis.length; i++) {
                    var lli = llis[i];
                    if(lli == document.getElementById("tab" + v)) {
                        lli.style.backgroundColor = "orange";
                    } else {
                        lli.style.backgroundColor = "gray";
                    }
                }
  
                var divs = $(".detail-tabcon");
                for(var i = 0; i < divs.length; i++) {  
  
                    var divv = divs[i];  
  
                    if(divv == document.getElementById("tab" + v + "_content")) {  
                        divv.style.display = "block";  
                    } else {  
                        divv.style.display = "none";  
                    }  
                }  
  
            }  




$(document).ready(function(){                          
    var index=0;
    var length=$("#img .item").length;
    var i=1;
    
    //关键函数：通过控制i ，来显示图片
    function showImg(i){
        $("#img .item")
            .eq(i).stop(true,true).fadeIn(800)
            .siblings(".item").hide();
         $("#cbtn li")
            .eq(i).addClass("hov")
            .siblings().removeClass("hov");
    }
    
    function slideNext(){
        if(index >= 0 && index < length-1) {
             ++index;
             showImg(index);
        }else{
            // if(confirm("已经是最后一张,点击确定重新浏览！")){
            //     showImg(0);
            //     index=0;
            //     aniPx=(length-5)*70+'px'; //所有图片数 - 可见图片数 * 每张的距离 = 最后一张滚动到第一张的距离
            //     $("#cSlideUl ul").animate({ "left": "+="+aniPx },200);
            //     i=1;
            // }
            return false;
        }
        if(i<0 || i>length-5) {return false;}                         
               $("#cSlideUl ul").animate({ "left": "-=74px" },200)
               i++;
    }
    function slideFront(){
       if(index >= 1 ) {
             --index;
             showImg(index);
        }
        if(i<2 || i>length+5) {return false;}
               $("#cSlideUl ul").animate({ "left": "+=74px" },200)
               i--;
    }   
        $("#img .item").eq(0).show();
        $("#cbtn li").eq(0).addClass("hov");
        $("#cbtn tt").each(function(e){
            var str=(e+1)+""+length;
            $(this).html(str)
        })
    
        $(".picSildeRight,#next").click(function(){
               slideNext();
           })
        $(".picSildeLeft,#front").click(function(){
               slideFront();
           })
        $("#cbtn li").click(function(){
            index  =  $("#cbtn li").index(this);
            showImg(index);
        }); 
        $("#next,#front").hover(function(){
            $(this).children("a").fadeIn();
        },function(){
            $(this).children("a").fadeOut();
        })
    })


//图片放大镜
function Zoom(imgbox,hoverbox,l,t,x,y,h_w,h_h,showbox){
    var moveX =x-l-(h_w/2);
    //鼠标区域距离
    var moveY =y-t-(h_h/2);
    //鼠标区域距离
    if(moveX<0){moveX=0}
    if(moveY<0){moveY=0}
    if(moveX>imgbox.width()-h_w){moveX=imgbox.width()-h_w}
    if(moveY>imgbox.height()-h_h){moveY=imgbox.height()-h_h}
    //判断鼠标使其不跑出图片框
    var zoomX =showbox.width()/imgbox.width()
    //求图片比例
    var zoomY =showbox.height()/imgbox.height()
    
    showbox.css({left:-(moveX*zoomX),top:-(moveY*zoomY)})
    hoverbox.css({left:moveX,top:moveY})
    //确定位置
  
  }
function Zoomhover(imgbox,hoverbox,showbox){
	if(!imgbox.offset()){
		return;
	}
    var l = imgbox.offset().left;
    var t = imgbox.offset().top;
    var w =hoverbox.width();
    var h = hoverbox.height();
    var time;
    $(".probox img,.hoverbox").mouseover(function(e){
      var x=e.pageX;
      var y=e.pageY;
      $(".hoverbox,.showbox").show();
      hoverbox.css("opacity","0.3")
      time =setTimeout(function(){Zoom(imgbox,hoverbox,l,t,x,y,w,h,showbox)},1)     
    }).mousemove(function(e){
      var x=e.pageX;
      var y=e.pageY;  
      time =setTimeout(function(){Zoom(imgbox,hoverbox,l,t,x,y,w,h,showbox)},1)
    }).mouseout(function(){
      showbox.parent().hide()
      hoverbox.hide();
    })
  } 
$(function(){
          Zoomhover($(".probox img"),$(".hoverbox"),$(".showbox img"));
       })