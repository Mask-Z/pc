/**
 * jeasyui_1.4 扩展
 * @author bbq 
 * 2014年9月22日
 */
/* validatebox */
(function($, undefined) {
	$.fn.validatebox.extensions = {};
	var Wi = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1]; // 加权因子
	var ValideCode = [1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2]; // 身份证验证位值.10代表X
	var rules = {
		// 只允许输入英文字母或数字
		engNum : {
			validator : function(value) {
				return /^[0-9a-zA-Z]*$/.test(value);
			},
			message : '请输入英文字母或数字'
		},
		// 只允许汉字、英文字母或数字
		chsEngNum : {
			validator : function(value, param) {
				return /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[a-zA-Z0-9])*$/.test(value);
			},
			message : '只允许汉字、英文字母或数字。'
		},
		// 只允许汉字、英文字母、数字及下划线
		code : {
			validator : function(value, param) {
				return /^[\u0391-\uFFE5\w]+$/.test(value);
			},
			message : '只允许汉字、英文字母、数字及下划线.'
		},
		// 电话号码(中国)格式
		tel : {
			validator : function(value) {
				return methods.isTel(value);
			},
			message : "输入的内容必须是电话号码(中国)格式."
		},
		// 移动电话号码(中国)格式
		mobile : {
			validator : function(value) {
				return methods.isMobile(value);
			},
			message : "输入的内容必须是移动电话号码(中国)格式."
		},
		// 电话号码(中国)或移动电话号码(中国)格式
		telOrMobile : {
			validator : function(value) {
				return methods.isMobile(value) || methods.isTel(value);
			},
			message : "输入的内容必须是电话号码(中国)或移动电话号码(中国)格式."
		},
		// 传真号码(中国)格式
		fax : {
			validator : function(value) {
				return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(str);
			},
			message : "输入的内容必须是传真号码(中国)格式."
		},
		// 邮政编码(中国)格式
		zipCode : {
			validator : function(value) {
				return /^[\d]{6}$/.test(str);
			},
			message : "输入的内容必须是邮政编码(中国)格式."
		},
		// 中国身份证
		idCard : {
			validator : function(value) {
				return methods.IdCardValidate(value);
			},
			message : "输入正确的中国身份证格式."
		},
		//短日期格式
		isDate : {
			validator : function(value) {
				return methods.isShortDate(value);
			},
			message : "输入正确的日期格式."
		},
		//密码比较
		confirmPass : {
			validator : function(value, param) {
				var pass = $(param[0]).textbox('getValue');
                return value == pass;
			},
			message: '两次输入密码不一致，请重新输入！'
		}
	};
	var methods = {
		isNullOrEmpty : function (str) { return str === undefined || str === null || str === ""; },
		isTel : function(str) { return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(str); },
		isMobile : function(str) { return /^(13|14|15|17|18)\d{9}$/i.test(str); },
		isShortDate : function(str){
	        str = methods.isNullOrEmpty(str) ? "" : String(str);
	        var r = str.replace(/(^\s*)|(\s*$)/g, "").match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
	        if (r == null) { return false; }
	        var d = new Date(r[1], r[3] - 1, r[4]);
	        return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4]);
		},
		IdCardValidate : function(idCard) {
			idCard = methods.trim(idCard.replace(/ /g, "")); // 去掉字符串头尾空格
			if (idCard.length == 15) {
				return methods.isValidityBrithBy15IdCard(idCard); // 进行15位身份证的验证
			} else if (idCard.length == 18) {
				var a_idCard = idCard.split(""); // 得到身份证数组
				if (methods.isValidityBrithBy18IdCard(idCard) && methods.isTrueValidateCodeBy18IdCard(a_idCard)) { // 进行18位身份证的基本验证和第18位的验证
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
		},
		/**
		 * 判断身份证号码为18位时最后的验证位是否正确
		 * @param a_idCard
		 * 身份证号码数组
		 * @return
		 */
		isTrueValidateCodeBy18IdCard : function(a_idCard) {
			var sum = 0; // 声明加权求和变量
			if (a_idCard[17].toLowerCase() == 'x') {
				a_idCard[17] = 10; // 将最后位为x的验证码替换为10方便后续操作
			}
			for (var i = 0; i < 17; i++) {
				sum += Wi[i] * a_idCard[i]; // 加权求和
			}
			valCodePosition = sum % 11; // 得到验证码所位置
			if (a_idCard[17] == ValideCode[valCodePosition]) {
				return true;
			} else {
				return false;
			}
		},
		/**
		 * 验证18位数身份证号码中的生日是否是有效生日
		 * 
		 * @param idCard
		 * 18位书身份证字符串
		 * @return
		 */
		isValidityBrithBy18IdCard : function(idCard18) {
			var year = idCard18.substring(6, 10);
			var month = idCard18.substring(10, 12);
			var day = idCard18.substring(12, 14);
			var temp_date = new Date(year, parseFloat(month) - 1, parseFloat(day));
			// 这里用getFullYear()获取年份，避免千年虫问题
			if (temp_date.getFullYear() != parseFloat(year) || temp_date.getMonth() != parseFloat(month) - 1 || temp_date.getDate() != parseFloat(day)) {
				return false;
			} else {
				return true;
			}
		},
		/**
		 * 验证15位数身份证号码中的生日是否是有效生日
		 * @param idCard15 15位书身份证字符串
		 * @return
		 */
		isValidityBrithBy15IdCard : function(idCard15) {
			var year = idCard15.substring(6, 8);
			var month = idCard15.substring(8, 10);
			var day = idCard15.substring(10, 12);
			var temp_date = new Date(year, parseFloat(month) - 1, parseFloat(day));
			// 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法
			if (temp_date.getYear() != parseFloat(year) || temp_date.getMonth() != parseFloat(month) - 1 || temp_date.getDate() != parseFloat(day)) {
				return false;
			} else {
				return true;
			}
		},
		// 去掉字符串头尾空格
		trim : function(str) {
			return str.replace(/(^\s*)|(\s*$)/g, "");
		}
	};
	
	$.extend($.fn.validatebox.defaults.rules, rules);
	$.extend($.fn.datebox.defaults, { validType:"isDate" });
	
})(jQuery);
