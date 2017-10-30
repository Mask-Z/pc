/**  
 * 包名：com.ccjt.ejy.web.controller  
 * 文件名：ZzcgController.java  
 * 版本信息：V1.0  
 * 日期：2017年9月19日-上午10:56:34  
 * Copyright(c)2017
 *   
 */
package com.ccjt.ejy.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ccjt.ejy.web.service.ZzcgService;
import com.ccjt.ejy.web.vo.PurchaseNotice;

/**
 * 
 * 类名称：ZzcgController 类描述： 创建人：qiaojoy99 修改人：qiaojoy99 修改时间：2017年9月19日
 * 上午10:56:34 修改备注：
 * 
 * @version 1.0.0
 * 
 */
@Controller
public class ZzcgController extends BaseController {

	private ZzcgService zzcgService = new ZzcgService();

	@RequestMapping("/zzcg_more")
	public ModelAndView zzcg_more(PurchaseNotice notice, String type,HttpServletRequest request, Integer page, Integer rows, String title, String notice_cateid, String notice_status) {
		try {
			if (type != null && !type.equals("")) {// 项目状态
				type = URLDecoder.decode(type, "UTF-8");
			}

			if (StringUtils.isNotBlank(title)) {
				notice.setTitle(title);
				title = URLDecoder.decode(title, "UTF-8");
			}
			if (notice_cateid != null && !notice_cateid.equals("")){
				notice_cateid = URLDecoder.decode(notice_cateid, "UTF-8");
				
				if(notice_cateid.equals("工程")){
					notice.setCateId("GC");
				}else if(notice_cateid.equals("货物")){
					notice.setCateId("HW");
				}else if(notice_cateid.equals("服务")){
					notice.setCateId("FW");
				}
			}
			
			if(notice_status != null && !notice_status.equals("")){
				notice_status = URLDecoder.decode(notice_status, "UTF-8");
				if(notice_status.equals("未开始")){
					notice.setStatus(1);
				}else if(notice_status.equals("报名中")){
					notice.setStatus(2);
				}else if(notice_status.equals("已结束")){
					notice.setStatus(3);
				}
			}else{
				notice.setStatus(0);
			}
			

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int pageSize = 15;// 每页展示数量
		if (page == null || page < 1) { 
			page = 1;
		}
		ModelAndView modelAndView = new ModelAndView("portal/zzcg-list");
		Map<String, Object> result = new HashMap<String, Object>();

		if(type != null && type.equals("成交公告")){
			result = zzcgService.zz_cjgg(page, rows, notice);
		}else{
			result = zzcgService.zz_cggg(page, rows, notice);
			modelAndView.addObject("type","cggg");
		}
		
		if (result.get("rows") != null) {
			List<Map<String,Object>> zzcgs = (List<Map<String,Object>>) result.get("rows");
			modelAndView.addObject("rows", zzcgs);
		}
		
		int count = Integer.parseInt(result.get("count").toString());
		modelAndView.addObject("count", count);
		modelAndView.addObject("page", page);
		int totalPage = count % pageSize == 0 ? count / pageSize : (count
				/ pageSize + 1);// 计算总页数
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("selectB",type);
		modelAndView.addObject("selectC",notice_cateid);
		modelAndView.addObject("selectD",notice_status);

		// 页面头部
		modelAndView.addObject("searchKey", title);

		return modelAndView;
	}
	
	@RequestMapping("/zzcg_detail")
	public ModelAndView zzcg_more(String tag,String id) {
		ModelAndView modelAndView = new ModelAndView("portal/zzcg-detail");
		Map<String,Object> map = zzcgService.zzcg_detail(tag,id);
		modelAndView.addObject("newsDetail",map);
		return modelAndView;
	}

}
