package com.ccjt.ejy.web.controller.back;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.service.back.QuestionService;
import com.ccjt.ejy.web.vo.ProjectType;
import com.ccjt.ejy.web.vo.Question;

@Controller
@RequestMapping("/system")
public class QuestionController {
	private QuestionService questionS = new QuestionService();
	@RequestMapping(value = "/questionIndex")
	public ModelAndView manage(HttpServletRequest request,
			Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/questionmanage");
		return mv;
	}

	
	@RequestMapping(value = "/questionList")
	@ResponseBody
	public Map<String, Object> list(Question qu ,Integer page, Integer rows)
			throws Exception {
		
		Map<String, Object> m = questionS.questionList(qu, page, rows);
		return m;
	}
    
	/**
	 */
	@RequestMapping(value = "/questionForm")
	public ModelAndView questionadd(Integer id,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (id != null) {
			Question qu = questionS.getQuestion(id);
			mv.addObject("question", qu);
			mv.addObject("type", "edit");
		}else{
			mv.addObject("type", "add");
		}
		mv.setViewName("/back/question_add");
		return mv;
	}
	
	@RequestMapping(value = "/questionSave", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView questionsave(Question qu,HttpServletRequest request) throws Exception {
		String isShow=qu.getIsShow();
		isShow=isShow==null?"off":isShow;
		if(isShow.equals("on")){
			qu.setState(1);
		}else{
			qu.setState(0);
		}
		questionS.saveQuestion(qu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "success");
        mv.setViewName("/back/question_add");
		return mv;
	}
	
	@RequestMapping(value = "/questionDel", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> questiondel(String[] id,HttpServletRequest request) throws Exception {
		Map<String, Object> map = questionS.delQuestion(id);
		return map;
	}
	
	@RequestMapping(value = "/question/cqType", method = RequestMethod.POST)
	@ResponseBody
	public String cqType(String[] id,HttpServletRequest request) throws Exception {
		List<ProjectType> projectTypes = JSON.parseArray(DBCacheManage.get(RedisKeys.WEB_DATA_CACHE_PROJECTTYPE), ProjectType.class);
		for(int i = projectTypes.size()-1;i >= 0;i--) {
			ProjectType projectType = projectTypes.get(i);
			if("ZC".equals(projectType.getItemValue()) || "1".equals(projectType.getItemValue()) || "0".equals(projectType.getItemValue())
					|| "4".equals(projectType.getItemValue())) {
				projectTypes.remove(i);
			}
		}
		return JSON.toJSONString(projectTypes);
	}

}
