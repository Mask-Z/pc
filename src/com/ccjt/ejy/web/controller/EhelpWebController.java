package com.ccjt.ejy.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.ccjt.ejy.web.service.back.EHelpService;
import com.ccjt.ejy.web.vo.EHelp;

@Controller
public class EhelpWebController  extends BaseController{
	EHelpService ehelpS=new EHelpService();
	@RequestMapping(value="/ehelp_more")
	 public ModelAndView index(EHelp e,HttpServletRequest request,Integer page,Integer rows){
		 try {
			 if(e.getEhelp_projectType()!=null&&!e.getEhelp_projectType().equals("")){
				 e.setEhelp_projectType(URLDecoder.decode(e.getEhelp_projectType(), "UTF-8"));
			 }
			 if(e.getTitle()!=null&&!e.getTitle().equals("")){//省
				 e.setTitle(URLDecoder.decode(e.getTitle(), "UTF-8"));
			 }
		 }catch (UnsupportedEncodingException ex) {
				ex.printStackTrace();
		 } 
		page=page==null||page<0?1:page;
		rows=rows==null?16:rows;
	    ModelAndView modelAndView = new ModelAndView("portal/ehelp");
	    Map<String,Object> map=ehelpS.ehelpList(e, page, rows);
	    int total=Integer.parseInt(map.get("total").toString());
	    List<EHelp> list=(List<EHelp>) map.get("rows");
	    modelAndView.addObject("list",list);
	    modelAndView.addObject("total",total);
	    int totalPage=total%rows==0?total/rows:(total/rows)+1;
	    modelAndView.addObject("totalPage",totalPage);
	    modelAndView.addObject("page",page);
	    modelAndView.addObject("selectA",e.getEhelp_projectType());
	    modelAndView.addObject("title",e.getTitle());
	    //页面头部
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json); 
	    return modelAndView;
	 }
	
	 @RequestMapping(value="/ehelpinfo")
	 public ModelAndView detail(Integer id ){
		 ModelAndView modelAndView =null;
         if(id!=null){
		     EHelp e=ehelpS.getEhelp(id);
		 	 modelAndView = new ModelAndView("portal/ehelp-detail");
		 	 modelAndView.addObject("ehelpDetail",e);
		 }
		 //页面头部
	     JSONObject json=getCitys();
	     modelAndView.addObject("citys",json); 
		 return modelAndView;
	 }	   
}
