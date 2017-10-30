package com.ccjt.ejy.web.controller.back;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.service.back.EHelpService;
import com.ccjt.ejy.web.service.back.JjdtDocService;
import com.ccjt.ejy.web.vo.EHelp;
import com.ccjt.ejy.web.vo.JjdtDoc;
import com.ccjt.ejy.web.vo.ProjectType;

/**
 * 
 */
@Controller
@RequestMapping("/system")
public class JjdtDocController {
	
	private JjdtDocService jjdtDocService = new JjdtDocService();

	@RequestMapping(value = "/jjdt_doc")
	public ModelAndView manage(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/jjdt_doc");
		return mv;
	}
	
	@RequestMapping(value = "/jjdt_doc_list")
	@ResponseBody
	public Map<String, Object> list(JjdtDoc jjdtDoc, Integer page, Integer rows)
			throws Exception {		
		Map<String, Object> m = jjdtDocService.jjdtDocList(jjdtDoc, page, rows);
		return m;
	}
    
	/**
	 */
	@RequestMapping(value = "/jjdt_doc_add")
	public ModelAndView jjdt_doc_add(Integer id,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (id != null) {
			JjdtDoc jjdtDoc = jjdtDocService.getJjdtDoc(id);
			mv.addObject("jjdtDoc", jjdtDoc);
			mv.addObject("type", "edit");
		} else {
			mv.addObject("type", "add");
		}
		mv.setViewName("/back/jjdt_doc_add");
		return mv;
	}
	
	@RequestMapping(value = "/jjdt_doc_save", method = RequestMethod.POST)
	public ModelAndView jjdt_doc_save(JjdtDoc jjdtDoc,HttpServletRequest request) throws Exception {
		String isShow = jjdtDoc.getIsShow();
		isShow = isShow == null ? "off" : isShow;
		if(isShow.equals("on")) {
			jjdtDoc.setState(1);
		} else {
			jjdtDoc.setState(0);
		}
		Map<String,Object> result = jjdtDocService.saveJjdtDoc(jjdtDoc);
		ModelAndView mv = new ModelAndView();
		if(result != null) {
			mv.addObject("msg", "-1".equals(result.get("code") + "") ? result.get("msg") : "success");
		}		
        mv.setViewName("/back/jjdt_doc_add");
        return mv;
	}

	@RequestMapping(value = "/jjdt_doc_del", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> jjdtdoc_del(String[] ids,HttpServletRequest request) throws Exception {
		Map<String, Object> map = jjdtDocService.delJjdtdoc(ids);
		return map;
	}
	
	@RequestMapping(value = "/jjdt_doc_pub", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> jjdtdoc_pub(String id,HttpServletRequest request) throws Exception {
		Map<String, Object> map = jjdtDocService.pubJjdtdoc(id);
		return map;
	}
	
	@RequestMapping(value = "/jjdt_doc_recall", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> jjdtdoc_recall(String id,HttpServletRequest request) throws Exception {
		Map<String, Object> map = jjdtDocService.recallJjdtdoc(id);
		return map;
	}
}
