package com.ccjt.ejy.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.enums.CQYWType;
import com.ccjt.ejy.web.service.CqjyService;
import com.ccjt.ejy.web.service.IndexService;
import com.ccjt.ejy.web.service.JLService;
import com.ccjt.ejy.web.service.NewsService;
import com.ccjt.ejy.web.service.PicService;
import com.ccjt.ejy.web.service.back.EHelpService;
import com.ccjt.ejy.web.service.back.QuestionService;
import com.ccjt.ejy.web.vo.BaoJia;
import com.ccjt.ejy.web.vo.EHelp;
import com.ccjt.ejy.web.vo.GongGao;
import com.ccjt.ejy.web.vo.Question;

import static com.ccjt.ejy.web.commons.Global.categories;

@Controller
public class JLController extends BaseController{
	 CqjyService cqjyS=new CqjyService();
	 JLService jlS=new JLService();
	 IndexService is = new IndexService();
	 PicService ps = new PicService();
	 QuestionService qs = new QuestionService();
	 EHelpService ehelpS=new EHelpService();
	 NewsService ns = new NewsService();
	 @RequestMapping(value="/jl_more")
	 public ModelAndView index(GongGao gg,String startPrice,String endPrice,String orderType,HttpServletRequest request,Integer page,Integer rows){
		 String cqywtypename="";
		 try {
			 if(gg.getCategoryname()!=null&&!gg.getCategoryname().equals("")){
				 gg.setCategoryname(URLDecoder.decode(gg.getCategoryname(), "UTF-8"));
			 }
			 if(gg.getS1()!=null&&!gg.getS1().equals("")){//省
				 gg.setS1(URLDecoder.decode(gg.getS1(), "UTF-8"));
			 }
			 if(gg.getS2()!=null&&!gg.getS2().equals("")){//市
				 gg.setS2(URLDecoder.decode(gg.getS2(), "UTF-8"));
			 }
			 if(gg.getCqywtype()!=null&&!gg.getCqywtype().equals("")){//业务类型
				 cqywtypename=URLDecoder.decode(gg.getCqywtype(), "UTF-8");
				 gg.setCqywtype(CQYWType.getCQYWType(cqywtypename).getCode());
			 }
			 if(gg.getStatus_name()!=null&&!gg.getStatus_name().equals("")){//项目状态
				 gg.setStatus_name(URLDecoder.decode(gg.getStatus_name(), "UTF-8"));
			 }
		 }catch (UnsupportedEncodingException e) {
				e.printStackTrace();
		 } 
		page = page == null || page < 0 ? 1 : page;
		rows = rows == null ? 16 : rows;
	    ModelAndView modelAndView = new ModelAndView("portal/jl-list");
	    String city=request.getSession().getAttribute("city_id")==null?"":request.getSession().getAttribute("city_id").toString();
		Map<String, Object> map = jlS.cqjyList(gg, startPrice, endPrice,orderType, city, page, rows);
		int total = Integer.parseInt(map.get("total").toString());
		List<GongGao> list = (List<GongGao>) map.get("rows");
		list = gonggaoStateTranslate(list);
		modelAndView.addObject("list", list);
		modelAndView.addObject("total", total);
		int totalPage = total % rows == 0 ? total / rows : (total / rows) + 1;
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("page", page);
		modelAndView.addObject("selectA", gg.getCategoryname());
		modelAndView.addObject("selectB", gg.getS2());
		modelAndView.addObject("selectB_", gg.getS1());
		modelAndView.addObject("selectC", cqywtypename);
		modelAndView.addObject("selectD", gg.getStatus_name());
		modelAndView.addObject("startPrice", startPrice);
		modelAndView.addObject("endPrice", endPrice);
		modelAndView.addObject("orderType", orderType);
	    //页面头部
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json); 
        //查询条件省份
        String citys= DBCacheManage.get(RedisKeys.WEB_DATA_CACHE_CITY);
        JSONArray province=(JSONArray) JSONArray.parse(citys);
        modelAndView.addObject("allprovince",province);
		 //标的类型
		 modelAndView.addObject("categories", categories);
		return modelAndView;
	 }
	 
	 @RequestMapping(value="/jl_infodetail")
	 public ModelAndView infodetail(GongGao gongGao,String pageName){
	     ModelAndView modelAndView = new ModelAndView();
	     if(pageName!=null){
	         modelAndView.setViewName("portal/"+pageName);
	     }else{
	         modelAndView.setViewName("portal/jl_detail");
	     }
	     cqjyS.updateReadTime(gongGao);//更新浏览次数
	     GongGao gg = jlS.detail(gongGao.getInfoid());
	     if(gg!=null){
	         modelAndView.addObject("info", gonggaoStateTranslate(gg));
	         //MediaInfo mediaInfo = ps.default_mediaHandle(gongGao.getInfoid());//图片，360，视频
	         //modelAndView.addObject("mediainfo", mediaInfo);
	         //常见问题
	         List<Question> questions = qs.questions(gg.getProjectstyle());
	         modelAndView.addObject("questions", questions);
	         //获取关注数
	         int focusnum = cqjyS.getFocusCount(gongGao.getInfoid());
	         modelAndView.addObject("focusnum", focusnum);
	         //竞买记录
	         boolean ispl ="1".equals(gg.getIspllr());//批量挂牌
             DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
             if(ispl){//批量挂牌
                 List<Map> plist = ns.getProjectList(gg.getInfoid());
                 //批量挂牌多个标的的挂牌截止时间可能不一致,将最大
                 for(Map map : plist){
                     Object str = map.get("GongGaoToDate");
                     Date ggend = new DateTime().parse(str.toString(), format).toDate();
                     if(gg.getGonggaotodate()!=null&&gg.getGonggaotodate().before(ggend)){
                         gg.setGonggaotodate(ggend);
                     }
                 }
                 modelAndView.addObject("projectList", plist);
                 modelAndView.addObject("allcount", ns.hlgp_bj_count(gg.getInfoid()));
             }
	     }
	     //推荐服务（E帮无忧）
	     EHelp eHelp = new EHelp();
	     eHelp.setEhelp_projectType(gg.getProjectstyle());
	     Map<String,Object> tjfws=ehelpS.ehelpList(eHelp, 1, 2);
	     modelAndView.addObject("tjfws", tjfws);
	     
	     //页面头部
	     return modelAndView;
	 }
	 /**
		 * 竞买记录
		 * jmjl  
		 * @param gongGao
		 * @return   
		 * ModelAndView  
		 * @exception   
		 * @since  1.0.0
		 */
		@RequestMapping(value = "/jl_jmjl")
		public ModelAndView jmjl(String infoid,String projectGuid){
		    ModelAndView modelAndView = new ModelAndView("portal/jl_detail_jmjl");
		    GongGao gg = jlS.detail(infoid);
		    String gInfoid = projectGuid;
	        if(gInfoid == null){
	            gInfoid = infoid;
	        }
	        if(gg!=null){
	            List<BaoJia> his = ns.baojiaHIS(gInfoid);
	            List baojiaHis = ns.getBaoJiaHis(gInfoid);
	            modelAndView.addObject("baojiaHis", baojiaHis);
	            modelAndView.addObject("his", his);
	            modelAndView.addObject("jinjia_1",ns.baojia_status(gInfoid, null));
	            if("1".equals(gg.getAllowmorejqxt())){//二次报价
	                List<BaoJia> his_erci = ns.ERCI_baojiaHIS(gInfoid,gg.getSystemtype());
	                List baojiaHis_erci =ns.ERCI_BaoJiaHis(gInfoid,gg.getSystemtype());
	                modelAndView.addObject("his_erci", his_erci);
	                modelAndView.addObject("baojiaHis_erci", baojiaHis_erci);
	                modelAndView.addObject("jinjia_2",ns.baojia_status(gInfoid, "1"));
	            }
	            modelAndView.addObject("gg",gg);
	        }
	        return modelAndView;
		}
}
