jQuery.divselect = function(divselectid,inputselectid) {
    var inputselect = $(inputselectid);
    $(divselectid+" cite").click(function(){
        var ul = $(divselectid+" ul");
        if(ul.css("display")=="none"){
            ul.slideDown("fast");
        }else{
            ul.slideUp("fast");
        }
    });
    $(divselectid+" ul li a").click(function(){
        var txt = $(this).text();
        $(divselectid+" cite").html(txt);
        var value = $(this).attr("selectid");
        inputselect.val(value);
        $(divselectid+" ul").hide();

    });
};

$(function(){
    $.divselect("#SearchCategory","#inputselect");
    $("#index_search_btn").click(function(){
        var href = window.location.href;
        var v = $("#index_search_text").val();
        $("#index_search_title").val(v);
        var type = $("#index_search_type").text();
        if("产权交易"==type){
            $("#index_search_form").attr("action","jygg_more");
        } else if("招标采购"==type){
            $("#index_search_form").attr("action","zbcg_more");
        }
        
        $("#index_search_form").submit();
    })
})

