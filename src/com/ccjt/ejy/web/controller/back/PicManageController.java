package com.ccjt.ejy.web.controller.back;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ccjt.ejy.web.service.back.PicManageService;
import com.ccjt.ejy.web.vo.WebGonggaoPic;

/**
 * 
 */
@Controller
@RequestMapping("/system")
public class PicManageController {
	
	private PicManageService picManageService = new PicManageService();

	@RequestMapping(value = "/pic_manage")
	public ModelAndView manage(HttpServletRequest request,Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/picmanage");
		return mv;
	}
	
	@RequestMapping(value = "/picList")
	@ResponseBody
	public Map<String, Object> list(WebGonggaoPic webGonggaoPic, Integer page, Integer rows)
			throws Exception {		
		Map<String, Object> m = picManageService.picList(webGonggaoPic, page, rows);
		return m;
	}
	
	@RequestMapping(value = "/pic_del", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> pic_del(String[] ids,HttpServletRequest request) throws Exception {
		Map<String, Object> map = picManageService.delPic(ids);
		return map;
	}
}
