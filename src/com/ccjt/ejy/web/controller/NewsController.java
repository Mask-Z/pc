package com.ccjt.ejy.web.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ccjt.ejy.web.service.back.AdService;
import com.ccjt.ejy.web.vo.MajorProject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.ccjt.ejy.web.service.NewsService;
import com.ccjt.ejy.web.service.back.LinkService;
import com.ccjt.ejy.web.service.back.QuestionService;
import com.ccjt.ejy.web.vo.GongGao;
import com.ccjt.ejy.web.vo.Link;
import com.ccjt.ejy.web.vo.Question;
@Controller
public class NewsController extends BaseController{
//	private HelpCatagoryService helpS = new HelpCatagoryService();
	private NewsService newS = new NewsService();
	private QuestionService questionS = new QuestionService();
	private LinkService linkS = new LinkService();
   @RequestMapping(value="/news_more")
   public ModelAndView index(String catagoryNum,Integer page, Integer rows){
		catagoryNum=catagoryNum==null?"030":catagoryNum;
		String catagoryName=getCatagoryName(catagoryNum);
		page=page==null?1:page;
		rows=rows==null?20:rows;
	    ModelAndView modelAndView =null;
//	    List<Map<String,Object>> list=helpS.getCatagory("新闻中心");
//	    modelAndView.addObject("newsList",list);
//	    list=helpS.getCatagory("加盟机构");
//	    modelAndView.addObject("orgsList",list);
//	    list=helpS.getCatagory("政策法规");
//	    modelAndView.addObject("lawsList",list);
	    int total=0;
	    
	    modelAndView = new ModelAndView("portal/news-list");
	    List<GongGao> newsList=	newS.list(catagoryNum, page, rows);
	    total=newS.getListCount(catagoryNum);
	    modelAndView.addObject("newsArray",newsList);
	    modelAndView.addObject("url","/news_more?catagoryNum="+catagoryNum);
	    
	    int totalPage=total%rows==0?total/rows:(total/rows)+1;
		modelAndView.addObject("page",page);
    	modelAndView.addObject("total",total);
    	modelAndView.addObject("totalPage",totalPage);
	    modelAndView.addObject("catagoryName",catagoryName);
	    modelAndView.addObject("catagoryNum",catagoryNum);
	    //页面头部
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json); 
	    return modelAndView;
   }
   @RequestMapping(value="/newsinfo")
   public ModelAndView detail(String catagoryNum,String infoid,String flag,String tag ){
	   ModelAndView modelAndView =null;
		if(infoid!=null&&!infoid.equals("")){
	    	GongGao news=newS.detail(infoid);
	 	    newS.updateReadTime(infoid);
	 	     String categorynum=news.getCategorynum();
	 	     String categoryname=news.getCategoryname();
	 	     if (StringUtils.isNotBlank(flag) && flag.equals("gonggao")){
				 modelAndView = new ModelAndView("portal/gonggao_detail");
			 }else if (categorynum.startsWith("00100300")) {//预披露

				if("001003001".equals(categorynum)){
					modelAndView = new ModelAndView("portal/gq_ypl_detail");

					//截掉infoid末尾的ypl
					if (infoid.endsWith("ypl")) {
						infoid = infoid.substring(0, infoid.length() - 3);
					}

					String projectGuid = newS.getYPLProjectGuid(infoid);
					List<Map> yplList = newS.getYPLList(projectGuid);
					if(yplList!=null && yplList.size()==1){
						modelAndView.addObject("qyxxlist", yplList == null ? "" : newS.getRealName(yplList.get(0)));
					}

				}else{
					modelAndView = new ModelAndView("portal/ypl_detail");
				}
			}else if(categorynum.startsWith("002001")||categorynum.startsWith("002002")){
	 	     	news.setInfoid(infoid);
	 	    	modelAndView = new ModelAndView("portal/zbcg_detail");
	 	    	modelAndView.addObject("tag",tag);
	 	    }else{
	 	        modelAndView = new ModelAndView("portal/news-detail");
	 	        modelAndView.addObject("catagoryName",categoryname);
	 	    }
	 	    modelAndView.addObject("newsDetail",news);
		}else{
			String catagoryName=getCatagoryName(catagoryNum);
			modelAndView=new ModelAndView("portal/about");
	    	GongGao news=newS.detailByCategorynum(catagoryNum);
	    	String cont = news.getContent().replaceAll("../Template/Default", "http://www.e-jy.com.cn/ejy/Template/Default");
	    	news.setContent(cont);
	    	modelAndView.addObject("newsDetail",news);
	    	modelAndView.addObject("catagoryName",catagoryName);
		 	modelAndView.addObject("catagoryNum",catagoryNum);
		}
		 //页面头部
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json); 
	    return modelAndView;
   }

	/**
	 * 中止公告页面
	 * @param infoid
	 * @return
	 */
   @RequestMapping(value = "/suspendInfo")
   public ModelAndView suspendInfo(String infoid){
		GongGao news=newS.detail(infoid);
		newS.updateReadTime(infoid);
		ModelAndView modelAndView= new ModelAndView("portal/zzgg_detail");
	    modelAndView.addObject("newsDetail",news);
		//页面头部
		JSONObject json=getCitys();
		modelAndView.addObject("citys",json);
		return modelAndView;
	}

	/**
	 * 成交公告页面
	 * @param infoid
	 * @return
	 */
	@RequestMapping(value = "/completeInfo")
	public ModelAndView completeInfo(String infoid) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("portal/cjgg_detail");
		NewsService ns = new NewsService();
		GongGao news=new GongGao();
		news = ns.getCJNews(infoid);
		mv.addObject("news", news);
		String gg = ns.getContent(infoid);
		mv.addObject("con", gg);
		//页面头部
		JSONObject json=getCitys();
		mv.addObject("citys",json);
		return mv;

	}

   @RequestMapping(value="/questioninfo")
   public ModelAndView questionInfoDetail(Integer infoid ){
	   ModelAndView  modelAndView = new ModelAndView("portal/question-detail");
	   Question q=questionS.getQuestion(infoid);
	   modelAndView.addObject("question",q);
	  	modelAndView.addObject("catagoryName","常见问题");
	   questionS.updateReadTime(infoid);
		 //页面头部
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json); 
	    return modelAndView;
   }


	/**
	 * 问题列表
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value="/questionList")
	public ModelAndView questionList(Question question,Integer page, Integer rows ){
		ModelAndView  modelAndView = new ModelAndView("portal/question-list");
		page=page==null?1:page;
		rows=rows==null?20:rows;
		Map<String,Object> questionList=questionS.questionList(question,page,rows);
		List<Question> questionArray= (List<Question>) questionList.get("rows");
//		Question q=questionS.getQuestion(infoid);
		modelAndView.addObject("questionArray",questionArray);
		modelAndView.addObject("catagoryName","常见问题");
		int total=0;
		total= (int) questionList.get("total");
		int totalPage=total%rows==0?total/rows:(total/rows)+1;
		modelAndView.addObject("page",page);
		modelAndView.addObject("total",total);
		modelAndView.addObject("totalPage",totalPage);
		//页面头部
		JSONObject json=getCitys();
		modelAndView.addObject("citys",json);
		return modelAndView;
	}
   @RequestMapping(value="/friends")
   public ModelAndView friends(Integer page, Integer rows){
	    page=page==null?1:page;
		rows=rows==null?28:rows;
	    ModelAndView modelAndView = new ModelAndView("portal/friend");
	    modelAndView.addObject("catagoryName","加盟机构");
	    Map<String,Object> map=linkS.linkList(new Link(), page, rows);
	    List<Link> list=(List<Link>) map.get("rows");
	    int total=(int) map.get("total");
	    int totalPage=total%rows==0?total/rows:(total/rows)+1;
		modelAndView.addObject("page",page);
    	modelAndView.addObject("total",total);
    	modelAndView.addObject("totalPage",totalPage);
    	modelAndView.addObject("list",list);
	    //页面头部
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json); 
	    return modelAndView;
   }
    
   private String getCatagoryName(String code){
        if(code.equals("028")){
    	    return "曝光台";
        }else if(code.equals("030")){
    		return "平台公告";
    	}else if(code.equals("006")){
    		return "业界资讯";
    	}else if(code.equals("032001")){
    		return "产权交易-政策法规";
    	}else if(code.equals("032001")){
    		return "产权交易-政策法规";
    	}else if(code.equals("032001")){
    		return "产权交易-政策法规";
    	}else if(code.equals("032002")){
    		return "招标采购-政策法规";
    	}else if(code.equals("027001")){
    		return "产权交易-交易规则";
    	}else if(code.equals("027002")){
    		return "招标采购-交易规则";
    	}else if(code.equals("014001")){
    		return "加盟流程";
    	}else if(code.equals("014002")){
    		return "加盟优势";
    	}else if(code.equals("014003")){
    		return "加盟条件";
    	}else if(code.equals("023001")){
    		return "产权交易-操作指南";
    	}else if(code.equals("023002")){
    		return "招标采购-操作指南";
    	}else if(code.equals("004001")){
    		return "制度规则";
    	}else if(code.equals("004002")){
    		return "会员帮助";
    	}else if(code.equals("035001")){
    		return "视频教程";
    	}else if(code.equals("036")){
    		return "软件下载";
    	}
    	return null;
    }
	@RequestMapping(value="/zdxm_more")
	public ModelAndView zdxm_more(HttpServletRequest request,Integer page,Integer rows){
		AdService adService=new AdService();
		
        String city_id = null;
        Object city = request.getSession().getAttribute("city_id");
        
        if(city!=null){
        	city_id = city.toString();
        }
        
		ModelAndView modelAndView = new ModelAndView("portal/zdxm-list");
		page = page == null || page < 0 ? 1 : page;
		rows = rows == null ? 16 : rows;

		Map<String, Object> map = adService.majorProjectList(city_id, page, rows);
		int total = Integer.parseInt(map.get("total").toString());
		List<MajorProject> list= (List<MajorProject>) map.get("rows");

		modelAndView.addObject("list", list);
		modelAndView.addObject("total", total);
		int totalPage = total % rows == 0 ? total / rows : (total / rows) + 1;
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("page", page);
		//页面头部
		JSONObject json = getCitys();
		modelAndView.addObject("citys", json);
		return modelAndView;
	}
}
