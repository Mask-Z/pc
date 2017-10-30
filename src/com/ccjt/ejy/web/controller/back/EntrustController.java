package com.ccjt.ejy.web.controller.back;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ccjt.ejy.web.service.back.EntrustService;
import com.ccjt.ejy.web.vo.Entrust;

@Controller
@RequestMapping("/system")
public class EntrustController {
	private EntrustService entrustS = new EntrustService();
	@RequestMapping(value = "/entrustIndex")
	public ModelAndView manage(HttpServletRequest request,
			Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/entrustmanage");
		return mv;
	}

	
	@RequestMapping(value = "/entrustList")
	@ResponseBody
	public Map<String, Object> list(Entrust qu ,Integer page, Integer rows)
			throws Exception {
		
		Map<String, Object> m = entrustS.entrustList(qu, page, rows);
		return m;
	}
    
	/**
	 */
	@RequestMapping(value = "/entrustForm")
	public ModelAndView entrustadd(Integer id,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (id != null) {
			Entrust qu = entrustS.getEntrust(id);
			mv.addObject("entrust", qu);
		}
		mv.setViewName("/back/entrust_add");
		return mv;
	}
	
	@RequestMapping(value = "/entrustSave/add", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> entrustsave(Entrust qu,String valcode,HttpServletRequest request) throws Exception {
		String verCode=(String) request.getSession().getAttribute("verCode");
		Map<String,Object> map=new HashMap<String,Object>();
		if(verCode.toLowerCase().equals(valcode.toLowerCase())){
			map= entrustS.saveEntrust(qu);
		}else{
			map.put("code",1);
			map.put("msg", "验证码错误!");
		}
		return map;
	}
	@RequestMapping(value = "/entrustSave", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView entrustsave(Entrust qu,HttpServletRequest request) throws Exception {
		 entrustS.saveEntrust(qu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "success");
        mv.setViewName("/back/entrust_add");
		return mv;
	}
	@RequestMapping(value = "/entrustUpdateState", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> entrustUpdateState(String id,HttpServletRequest request) throws Exception {
		Map<String, Object> map =  entrustS.updateEntrustState(id);
		return map;
	}
	
	@RequestMapping(value = "/entrustDel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> entrustdel(String[] id,HttpServletRequest request) throws Exception {
		Map<String, Object> map = entrustS.delEntrust(id);
		return map;
	}


}
