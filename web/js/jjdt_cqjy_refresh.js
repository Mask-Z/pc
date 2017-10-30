//竞价服务器的时间毫秒数
var serverMs =new Date().getTime();

//刷新
function refresh() {
	var biaoDiNOs = "";
	$("input[name=biaoDiNOs]").each(function(i, k) {
		var ProjectControlType = $(this).next().val();
		if (ProjectControlType != 1 && ProjectControlType != 2) {
			if (biaoDiNOs === "") {
				biaoDiNOs += $(this).val();
			} else {
				biaoDiNOs += "," + $(this).val();
			}
		}
	});
	
	if(biaoDiNOs===""){
		return;
	}
	
	$.ajax({
		type : "POST",
		url : "refresh",
		dataType : "json", // json数据方式
		data : {
			"biaoDiNOs" : biaoDiNOs
		}, // json参数
		//async :false,
		success : function(json) {
			if (json != null) {
				serverMs = json[0];
				for ( var i = 1; i < json.length; i++) {
					var obj = json[i];
					/*
					 * //-----------------------刷新隐藏值，主要用来刷新客户端倒计时
					 * $tr.attr("endTimeMs" ,endTimeMs); $tr.attr("startMs"
					 * ,startMs);
					 */
					// 刷新：挂牌截止
					//refreshGonggaoToDate(obj);
					// 刷新：每行颜色
					//refreshColor(obj);
					// 刷新：延时报价开始时间
					//refreshDelayStartTime(obj);
					// 刷新：最高价
					refreshMaxPrice(obj);
					// 刷新：开始时间(已开始直接显示开始时间；未开始显示多久开始)
					//refreshStartTime(obj);
					// 刷新：操作按钮
					refreshActionButton(obj);
					// 刷新：剩余时间
					refreshLeaveTime(obj);
				}
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			// 异步错误，Http错误状态码
			// console.log("ajax error：" + XMLHttpRequest.status + "," +
			// XMLHttpRequest.readyState);
		}
	});

	setTimeout('refresh()', 1000);
}

/**
 * 刷新挂牌截止时间
 * 
 * @param obj
 *            标的json
 */
function refreshGonggaoToDate(obj) {
	var $gonggaoToDate = $("#gonggaoToDate_" + obj.BiaoDiNO);
	$gonggaoToDate.attr("title", obj.GongGaoToDate);
	$gonggaoToDate.html(obj.GongGaoToDate);
}

/**
 * 刷新行颜色
 * 
 * @param obj
 *            标的json
 */
function refreshColor(obj) {
	var $tr = $("#tr_" + obj.BiaoDiNO);
	var $object = $("#object_" + obj.BiaoDiNO);
	var hasBid = obj.hasBid == "1";
	$tr.css("color", hasBid ? "red" : "");
	$object.css("color", hasBid ? "red" : "#00ff00");
}

/**
 * 刷新当前价(最高价)
 * 
 * @param obj
 *            标的json
 */
function refreshMaxPrice(obj) {
	var maxPrice = obj.maxPrice;// 最高价：没有报过价，显示标的低价
	var $obj_maxPrice = $("#maxPrice_" + obj.BiaoDiNO);
	$obj_maxPrice.html(maxPrice + " 元");
	$obj_maxPrice.attr("title", maxPrice + " 元");
}

/**
 * 刷新延时报价开始时间
 * 
 * @param obj
 *            标的json
 */
function refreshDelayStartTime(obj) {
	var $delayStart = $("#delayStart_" + obj.BiaoDiNO);
	$delayStart.html(obj.endTime);
	$delayStart.attr("title", obj.endTime);
}

/**
 * 刷新开始时间
 * 
 * @param obj
 *            标的json
 */
function refreshStartTime(obj) {
	var $obj_start = $("#start_" + obj.BiaoDiNO);
	var nowMs = serverMs;// 当前时间
	var startMs = DateOp.strToDate(obj.start).getTime();// 竞价开始时间
	if (nowMs > startMs) {
		$obj_start.html(obj.start);
		$obj_start.attr("title", obj.start);
	} else {
		$obj_start.html(DateOp.formatMsToStr(startMs - nowMs));
		$obj_start.attr("title", DateOp.formatMsToStr(startMs - nowMs));
	}
}

/**
 * 刷新操作按钮
 * 
 * @param obj
 *            标的json
 */
function refreshActionButton(obj) {
	var BiaoDiNO = obj.BiaoDiNO;// 标的编号
	var statusCn = obj.statusCn;// 竞价状态中文
	var ProjectControlType = obj.ProjectControlType;// 项目控制状态
	var $obj_bmbtn = $("#bmbtn_" + obj.BiaoDiNO);
	var isReadOnly = false;// 是否只读
	switch (ProjectControlType) {
	case "2":
		isReadOnly = true;
		$obj_bmbtn = "中止";
		break;
	case "1":
		isReadOnly = true;
		$obj_bmbtn = "终结";
		break;
	default:
		$obj_bmbtn = statusCn;
		if ($obj_bmbtn == "已结束") {
			isReadOnly = true;
		}
		break;
	}

	if (isReadOnly) {
		// 只读：无跳转链接；
		$("#bmbtn_readonly_" + BiaoDiNO).html($obj_bmbtn);
		$("#bmbtn_readonly_" + BiaoDiNO).show();
		$("#bmbtn_skip_" + BiaoDiNO).hide();
		$("#bmbtn_span3_" + BiaoDiNO).hide();
	} else {// 跳转快捷报名
		$("#bmbtn_skip_" + BiaoDiNO).find("a").html($obj_bmbtn);
		$("#bmbtn_skip_" + BiaoDiNO).show();
		$("#bmbtn_readonly_" + BiaoDiNO).hide();
		$("#bmbtn_span3_" + BiaoDiNO).show();
	}
}

/**
 * 刷新剩余时间
 * 
 * @param obj
 *            标的json
 */
function refreshLeaveTime(obj) {
	var $obj_endTime = $("#endTime_" + obj.BiaoDiNO);// 标的的结束时间jq对象
	if(obj.endTime ==null){
		return;
	}
	var endTimeMs = DateOp.strToDate(obj.endTime).getTime();// 竞价结束时间(结束时间毫秒数)
	var ProjectControlType = obj.ProjectControlType;// 项目控制状态
	var statusCn = obj.statusCn;// 竞价状态中文
	switch (ProjectControlType) {
	case "2":// 中止
		$obj_endTime.html("项目中止");
		$obj_endTime.attr("title", "项目中止");
		break;
	case "1":// 终结
		$obj_endTime.html("项目终结");
		$obj_endTime.attr("title", "项目终结");
		break;
	default:
		if (statusCn == "竞价暂停") {
			$obj_endTime.html("竞价暂停");
			$obj_endTime.attr("title", "竞价暂停");
		} else {
			var nowMs = serverMs;// 当前时间
			if (endTimeMs < nowMs) {
				$obj_endTime.html("0秒");
				$obj_endTime.attr("title", "0秒");
			} else {
				$obj_endTime.html(DateOp.formatMsToStr(endTimeMs - nowMs));
				$obj_endTime.attr("title", DateOp.formatMsToStr(endTimeMs
						- nowMs));
			}
		}
		break;
	}
}