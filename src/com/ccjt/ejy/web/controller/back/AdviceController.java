package com.ccjt.ejy.web.controller.back;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ccjt.ejy.web.service.back.AdviceService;
import com.ccjt.ejy.web.vo.Advice;

@Controller
@RequestMapping("/system")
public class AdviceController {
	private AdviceService adviceS = new AdviceService();
	@RequestMapping(value = "/adviceIndex")
	public ModelAndView manage(HttpServletRequest request,
			Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/advicemanage");
		return mv;
	}

	
	@RequestMapping(value = "/adviceList")
	@ResponseBody
	public Map<String, Object> list(Advice qu ,Integer page, Integer rows)
			throws Exception {
		
		Map<String, Object> m = adviceS.adviceList(qu, page, rows);
		return m;
	}
    
	/**
	 */
	@RequestMapping(value = "/adviceForm")
	public ModelAndView adviceadd(Integer id,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (id != null) {
			Advice qu = adviceS.getAdvice(id);
			mv.addObject("advice", qu);
		}
		mv.setViewName("/back/advice_add");
		return mv;
	}
	
	@RequestMapping(value = "/adviceSave/add", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> advicesave(Advice qu,String valcode,HttpServletRequest request) throws Exception {
		String verCode=(String) request.getSession().getAttribute("verCode");
		Map<String,Object> map=new HashMap<String,Object>();
		if(verCode.toLowerCase().equals(valcode.toLowerCase())){
			map= adviceS.saveAdvice(qu);
		}else{
			map.put("code",1);
			map.put("msg", "验证码错误!");
		}
		return map;
	}
	@RequestMapping(value = "/adviceSave", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView advicesave(Advice qu,HttpServletRequest request) throws Exception {
		 adviceS.saveAdvice(qu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "success");
        mv.setViewName("/back/advice_add");
		return mv;
	}
	@RequestMapping(value = "/adviceDel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> advicedel(String[] id,HttpServletRequest request) throws Exception {
		Map<String, Object> map = adviceS.delAdvice(id);
		return map;
	}
}
