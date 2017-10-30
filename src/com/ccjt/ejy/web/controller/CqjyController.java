package com.ccjt.ejy.web.controller;


import static com.ccjt.ejy.web.commons.Global.categories;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ccjt.ejy.web.commons.NetworkUtil;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.enums.CQYWType;
import com.ccjt.ejy.web.service.CqjyService;
import com.ccjt.ejy.web.service.GongGaoService;
import com.ccjt.ejy.web.service.IndexService;
import com.ccjt.ejy.web.service.NewsService;
import com.ccjt.ejy.web.service.PicService;
import com.ccjt.ejy.web.service.back.EHelpService;
import com.ccjt.ejy.web.service.back.QuestionService;
import com.ccjt.ejy.web.vo.BaoJia;
import com.ccjt.ejy.web.vo.EHelp;
import com.ccjt.ejy.web.vo.GongGao;
import com.ccjt.ejy.web.vo.LoginAccount;
import com.ccjt.ejy.web.vo.MediaInfo;
import com.ccjt.ejy.web.vo.Question;

@Controller
public class CqjyController extends BaseController{
	 CqjyService cqjyS=new CqjyService();
	 PicService ps = new PicService();
	 QuestionService qs = new QuestionService();
	 EHelpService ehelpS=new EHelpService();
	 NewsService ns = new NewsService();
	 GongGaoService ggs = new GongGaoService();
	IndexService indexService = new IndexService();

//	@RequestMapping("getPLGPStatus")
//	@ResponseBody
//	public Map<String, Object> getPLGPStatus(String projectguid) {
//		Map<String,Object> map=new HashMap<>();
//		List<GongGao> xmztList = ns.projectcontrol_Info(projectguid);//获取中止终结状态
//		GongGao gongGao = ns.getGongGaoByProjectguid(projectguid);//获取竞价状态
//		String  AuditStatus = ns.getAuditStatusByProjectguid(projectguid);//获取成交状态
//		if (null != xmztList && xmztList.size() > 0) {
//			GongGao gg = xmztList.get(0);//只获取最新的状态
//			gg.setControltype(ns.getLatestControltype(projectguid));
//			Integer type = gg.getControltype();
//			if (null != type && (type==2 || type ==1) ) {// 2中止   1终结  3重新挂牌
//				map.put("code",type);
//				map.put("infoid",gg.getInfoid());
//				return map;
//			}
//		}
//
//		if (StringUtils.isNotBlank(AuditStatus) && AuditStatus.equals("3")){//AuditStatus为3,说明项目已成交
//			map.put("code",5);
//			return map;
//		}
//
//		if (null != gongGao) {
//			Date now = new Date();
//			if (gongGao.getJingjia_end() != null) {//有竞价数据
//				if (now.after(gongGao.getJingjia_start()) && now.before(gongGao.getJingjia_end())) {// 7.竞价中  8.竞价未开始 9.竞价已截止
//					map.put("code",7);
//					return map;
//				} else if (now.before(gongGao.getJingjia_start())) {//如果竞价未开始,就设置为与主项目状态一致
//					map.put("code",8);
//					return map;
//				} else if (now.after(gongGao.getJingjia_end())) {//竞价已截止
//					map.put("code",9);
//					return map;
//				}
//			}
//		}
//		map.put("code",8);
//		return map;//与主项目状态一致
//
//	}

	 @RequestMapping(value="/jygg_more")
	 public ModelAndView index(GongGao gg,String startPrice,String endPrice,String orderType,HttpServletRequest request,Integer page,Integer rows,String pagename, HttpServletResponse response){
		 String cqywtypename="";

		 Map<String,String> areaCookies=indexService.areaCookies(request,response);
		 try {
			 if(gg.getCategoryname()!=null&&!gg.getCategoryname().equals("")){
				 gg.setCategoryname(URLDecoder.decode(gg.getCategoryname(), "UTF-8"));
			 }
			 if(StringUtils.isBlank(gg.getS1())){
				 gg.setS1(areaCookies.get("provinceCookie"));//没有选择地区就取cookie中的值
			 }

			 if(StringUtils.isBlank(gg.getS2())){
				 gg.setS2(areaCookies.get("cityCookie"));//没有选择地区就取cookie中的值
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
		 String citycode = "";
		 if("%".equals(gg.getS2())||"".equals(gg.getS2())){
			 citycode = "";
		 }else if (null == gg.getS0()){
		 	citycode= indexService.getCityCodeByCityName(gg.getS2());
		 	gg.setS0(citycode);
		 }else{
			 citycode = gg.getS0();
		 }
		 
		 
		 
		page = page == null || page < 0 ? 1 : page;
		rows = rows == null ? 16 : rows;
	    ModelAndView modelAndView = new ModelAndView("portal/cqjy-list");
		Map<String, Object> map = cqjyS.cqjyList(gg, startPrice, endPrice,orderType, citycode, page, rows,pagename);
		int total = Integer.parseInt(map.get("total").toString());
		List<GongGao> list = (List<GongGao>) map.get("rows");
		list = gonggaoStateTranslate(list);
		modelAndView.addObject("list", ns.getHotLabelName(list));
		modelAndView.addObject("total", total);
		int totalPage = total % rows == 0 ? total / rows : (total / rows) + 1;
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("page", page);
		modelAndView.addObject("selectA", gg.getCategoryname());
		modelAndView.addObject("selectB", gg.getS2());
		modelAndView.addObject("selectB_", gg.getS1());
		modelAndView.addObject("selectB__", gg.getS0());
		modelAndView.addObject("selectC", cqywtypename);
		modelAndView.addObject("selectD", gg.getStatus_name());
		modelAndView.addObject("selectE", gg.getTitle());
		modelAndView.addObject("selectF", gg.getOrgname());
		modelAndView.addObject("selectG", gg.getHotlable());
		modelAndView.addObject("startPrice", startPrice);
		modelAndView.addObject("endPrice", endPrice);
		modelAndView.addObject("orderType", orderType);
		modelAndView.addObject("pagename", pagename);

	    //页面头部
		 modelAndView.addObject("searchKey", gg.getTitle());
		 JSONObject json=getCitys();
        modelAndView.addObject("citys",json);
        //查询条件省份
        String citys= DBCacheManage.get(RedisKeys.WEB_DATA_CACHE_CITY);
        JSONArray province=(JSONArray) JSONArray.parse(citys);
        modelAndView.addObject("allprovince",province);        
        modelAndView.addObject("allorg",cqjyS.orgList().get("rows"));
        List hotlables = (List)cqjyS.hotLableList(gg.getCategoryname()).get("rows");
        if(hotlables != null && hotlables.size() >0) {
        	modelAndView.addObject("hasHotLable", "1");
        } else {
        	modelAndView.addObject("hasHotLable", "0");
        }
        modelAndView.addObject("hotlables", hotlables);
        //猜你喜欢 cookie 处理
		 GuessLikeCookie guessLikeCookie = new GuessLikeCookie(request).invoke();
		 String  cookie_area = guessLikeCookie.getCookie_area();
		 String  cookie_type = guessLikeCookie.getCookie_type();

		 List<GongGao> list_like = cqjyS.likeCqjyList(cookie_area, cookie_type,4);
		int len = list_like.size();
		if(len < 4){
			list_like.addAll(cqjyS.likeCqjyList("","",4-len));
		}
		modelAndView.addObject("list_like", list_like);
		//标的类型
		modelAndView.addObject("categories", categories);
		return modelAndView;
	 }
	 
	 @RequestMapping(value="/jygg_more_data")
	 public ModelAndView index_data(GongGao gg,String orderType,HttpServletRequest request,Integer page,Integer rows,String pagename, HttpServletResponse response){
		 Map<String,String> areaCookies=indexService.areaCookies(request,response);
		 try {
			 if(StringUtils.isNotBlank(gg.getCategoryname())){
				 gg.setCategoryname(URLDecoder.decode(gg.getCategoryname(), "UTF-8"));
			 }
			 if (StringUtils.isNotBlank(gg.getTitle())){
				gg.setTitle(URLDecoder.decode(gg.getTitle(), "UTF-8"));
			 }
		 }catch (UnsupportedEncodingException e) {
				e.printStackTrace();
		 }
		 if(StringUtils.isBlank(gg.getS1())){
			 gg.setS1(areaCookies.get("provinceCookie"));//没有选择地区就取cookie中的值
		 }

		 if(StringUtils.isBlank(gg.getS2())){
			 gg.setS2(areaCookies.get("cityCookie"));//没有选择地区就取cookie中的值
		 }


		 String citycode = "";
		 if("%".equals(gg.getS2())||"".equals(gg.getS2())){
			 citycode = "";
		 }else{
			 citycode = indexService.getCityCodeByCityName(gg.getS2());
		 }
		 
		page = page == null || page < 0 ? 1 : page;
		rows = rows == null ? 16 : rows;
	    ModelAndView modelAndView = new ModelAndView("portal/cqjy-list-data");
		Map<String, Object> map = cqjyS.cqjyList(gg, orderType, citycode, page, rows, pagename);
		int total = Integer.parseInt(map.get("total").toString());
		List<GongGao> list = (List<GongGao>) map.get("rows");
		list = gonggaoStateTranslate(list);
		modelAndView.addObject("list", ns.getHotLabelName(list));
		modelAndView.addObject("total", total);
		int totalPage = total % rows == 0 ? total / rows : (total / rows) + 1;
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("page", page);
		modelAndView.addObject("selectA", gg.getCategoryname());
		modelAndView.addObject("selectE", gg.getTitle()==null?null:gg.getTitle().replace("'", "&apos;").replace("\\", "\\\\"));
		modelAndView.addObject("selectG", gg.getHotlable());
		modelAndView.addObject("orderType", orderType);
		modelAndView.addObject("pagename", pagename);

	    //页面头部
		modelAndView.addObject("searchKey", gg.getTitle());
		JSONObject json=getCitys();
	    modelAndView.addObject("citys",json);
        List hotlables = (List)cqjyS.hotLableList(gg.getCategoryname()).get("rows");
        if(hotlables != null && hotlables.size() >0) {
        	modelAndView.addObject("hasHotLable", "1");
        } else {
        	modelAndView.addObject("hasHotLable", "0");
        }
        modelAndView.addObject("hotlables", hotlables);
		//标的类型
		modelAndView.addObject("categories", categories);
		return modelAndView;
	 }

	/**
	  * 详情页面
	  * infodetail
	  * @return
	  * ModelAndView
	  * @exception
	  * @since  1.0.0
	  */
	 @RequestMapping(value="/infodetail")
	 public ModelAndView infodetail(GongGao gongGao,String pageName,HttpServletRequest request,HttpServletResponse response){
	     ModelAndView modelAndView = new ModelAndView();
	     if(pageName!=null){
	         modelAndView.setViewName("portal/"+pageName);
	     }else{
	         modelAndView.setViewName("portal/cqjy_detail");
	     }

	     String ip = NetworkUtil.getIpAddress(request);
	     modelAndView.addObject("ip", ip);

	     cqjyS.updateReadTime(gongGao);//更新浏览次数
	     GongGao gg = cqjyS.detail(gongGao.getInfoid());


	     if (gg != null) {
				boolean ispl = "1".equals(gg.getIspllr());
				if (ispl) {//批量挂牌
					DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
					List<Map> plist = ns.getProjectList(gg.getInfoid());
					//批量挂牌多个标的的挂牌截止时间可能不一致,将最大
					for(Map map : plist){

						Object str = map.get("GongGaoFromDate");
						Object str2 = map.get("GongGaoToDate");

						Date ggstart = new DateTime().parse(str.toString(), format).toDate();
						Date ggend = new DateTime().parse(str2.toString(), format).toDate();

						if (gg.getGonggaotodate() == null) {
							gg.setGonggaotodate(ggend);
						}
						if (gg.getGonggaofromdate() == null) {
							gg.setGonggaofromdate(ggstart);
						}

						if (gg.getGonggaotodate().before(ggend)) {
							gg.setGonggaotodate(ggend);
						}
						if (gg.getGonggaofromdate().after(ggstart)) {
							gg.setGonggaofromdate(ggstart);
						}
					}

				} else {

					if("1".equals(gg.getAllowmorejqxt())){//二次报价
						GongGao g = ns.baojiafangshi(gg.getProjectguid());//二次报价的报价方式,竞价开始,结束时间
						if(g!=null){
							gg.setJingjia_start(g.getJingjia_start());
							gg.setJingjia_end(g.getJingjia_end());
						}

					}
				}

			}

	     if(gg!=null){
	         /**
	          *     修改字符串格式
	          */
	         gg.setZgtj(getNewStr(gg.getZgtj()));
	         gg.setZhuanrangftj(getNewStr(gg.getZhuanrangftj()));
	         gg.setZhongdcontent(getNewStr(gg.getZhongdcontent()));
	         gg.setDescription(getNewStr(gg.getDescription()));
			 List<GongGao> xmztList = ns.projectcontrol_Info(gg.getProjectguid());
			 if (null != xmztList && xmztList.size() > 0) {
				 List<GongGao> zzList = new ArrayList<>();
				 List<GongGao> zjList = new ArrayList<>();
				 for (GongGao gongg : xmztList) {// 2中止   1终结
					 if (gongg.getControltype() == 2) {
						 gongg.setGonggaofromdate(ns.getNews(gongg.getInfoid()).getGonggaofromdate());
						 zzList.add(gongg);
					 }
					 if (gongg.getControltype() == 1) {
						 gongg.setGonggaofromdate(ns.getNews(gongg.getInfoid()).getGonggaofromdate());
						 zjList.add(gongg);
					 }
					 modelAndView.addObject("zzList", zzList);
					 modelAndView.addObject("zjList", zjList);
				 }
			 }
	         modelAndView.addObject("info", gonggaoStateTranslate(gg));
	         if("CCJT".equals(gg.getSystemtype()) || "GQ".equals(gg.getSystemtype()) || "NMG".equals(gg.getSystemtype())){//判断是否显示比一比和是否显示30秒展示区
	        	 modelAndView.addObject("is_showCompare", ggs.is_showCompare(gongGao.getInfoid()));//是否显示比一比
//	        	 modelAndView.addObject("is_showOptesthesia", ggs.is_showOptesthesia(gongGao.getInfoid()));//是否显示30秒展示区
	        	 modelAndView.addObject("is_showOptesthesia", ggs.is_showOptesthesia(gongGao,gg.getSystemtype()));//是否显示30秒展示区
	         }else{
	        	 modelAndView.addObject("is_showCompare", false);
	        	 modelAndView.addObject("is_showOptesthesia", false);
	         }
	         

			 if (null != gg.getSystemtype()) {
				 switch (gg.getSystemtype()) {
					 case "ZZKG":
						 //获取增资扩股标的企业信息
						 List<Map> zzkgList = ns.getZZKGList(gg.getProjectguid());
						 modelAndView.addObject("qyxxlist", zzkgList == null ? "" : ns.getRealName(zzkgList.get(0)));
						 modelAndView.setViewName("portal/cqjy_gq_zzkg_detail");
						 break;
					 case "GQ":
						 //获取产权标的企业信息
						 Map map = ns.getGQList(gg.getProjectguid());
						 if(map!=null){
							 Map<String, Object> nn = ns.gf(gg.getProjectguid());
							 if(nn.containsKey("b")){
								 map.put("gf", nn.get("b"));
							 }
							 modelAndView.addObject("qyxxlist", ns.getRealName(map));
						 }
						 modelAndView.setViewName("portal/cqjy_gq_zzkg_detail");
						 break;
				 }
			 }
			 if(gg.getIspllr()==null||!gg.getIspllr().equals("1")){//非批量挂牌
			     MediaInfo mediaInfo = ps.default_mediaHandle(gg.getInfoid());//图片，360，视频

	             modelAndView.addObject("mediainfo", mediaInfo);
			 }else{
			     MediaInfo mediaInfo = ps.pllr_mediaHandle(gg.getInfoid());//图片，360，视频

                 modelAndView.addObject("mediainfo", mediaInfo);
				 List<Map> plist = ns.getProjectList(gg.getInfoid());
				 modelAndView.addObject("projectList", plist);
			 }
	         //常见问题
	         List<Question> questions = qs.questions(gg.getProjectstyle());
	         modelAndView.addObject("questions", questions);
	         //获取关注数
	         int focusnum = cqjyS.getFocusCount(gongGao.getInfoid());
	         modelAndView.addObject("focusnum", focusnum);
	         //当前登陆用户是否已关注
	         LoginAccount user=(LoginAccount)request.getSession().getAttribute("loginAccount");
	         if(user!=null){
	             Map<String, Object> map = cqjyS.getFocus(user.getDanWeiGuid()+"", gongGao.getInfoid());
	             if(map!=null&&Integer.parseInt(map.get("code").toString())==1){//已关注过
	                 modelAndView.addObject("focused",1);
	             }
	             modelAndView.addObject("isLogin",1);
	         }else{
	        	 modelAndView.addObject("isLogin",0);
	         }
	         //竞买记录
//	         boolean ispl ="1".equals(gg.getIspllr());//批量挂牌
//             DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
//             if(ispl){//批量挂牌
//                 List<Map> plist = ns.getProjectList(gg.getInfoid());
//                 //批量挂牌多个标的的挂牌截止时间可能不一致,将最大
//                 for(Map map : plist){
//                     Object str = map.get("GongGaoToDate");
//                     Date ggend = DateTime.parse(str.toString(), format).toDate();
//                     if(gg.getGonggaotodate()!=null&&gg.getGonggaotodate().before(ggend)){
//                         gg.setGonggaotodate(ggend);
//                     }
//                 }
//                 modelAndView.addObject("projectList", plist);
//                 modelAndView.addObject("allcount", ns.hlgp_bj_count(gg.getInfoid()));
//             }
             //推荐服务（E帮无忧）
             EHelp eHelp = new EHelp();
             eHelp.setEhelp_projectType(gg.getProjectstyle());
             Map<String,Object> tjfws=ehelpS.ehelpList(eHelp, 1, 2);
             modelAndView.addObject("tjfws", tjfws);
			 //猜你喜欢 cookie 处理
			 GuessLikeCookie guessLikeCookie = new GuessLikeCookie(request).invoke();
			 String  cookie_area = guessLikeCookie.getCookie_area();
			 String  cookie_type = guessLikeCookie.getCookie_type();

             List<GongGao> list_like = cqjyS.likeCqjyListException(cookie_area, cookie_type ,gg.getInfoid());
             if(list_like.size() < 2){
            	 list_like.addAll(cqjyS.likeCqjyListException("", "",gg.getInfoid()));
             }
             modelAndView.addObject("list_like", list_like);
	     }
	     List<String> hotLabelNameList=ns.getHotLabelName(gongGao.getInfoid());
		 modelAndView.addObject("hotLabelNameList",hotLabelNameList);

		 //30秒视觉区
		 modelAndView.addObject("optesthesiaContent",cqjyS.optesthesiaContent(gg));
		 //页面头部
	     JSONObject json = getCitys();
         modelAndView.addObject("citys",json);
	     return modelAndView;
	 }

	/**
	 * iframe中的公告内容
	 * @param infoid
	 * @return
	 */
	@RequestMapping("content")
	public ModelAndView content(String infoid) {
		ModelAndView mv = new ModelAndView();
		NewsService ns = new NewsService();
		if (infoid != null && infoid.length() >= 36) {
			String gg = ns.getContent(infoid);
			mv.addObject("con", gg);
		}
		mv.setViewName("portal/content");
		return mv;
	}

	@RequestMapping(value = "/addFocus")
	@ResponseBody
	public Map<String, Object> addFocus(String infoid,HttpServletRequest request) {
		LoginAccount user=(LoginAccount)request.getSession().getAttribute("loginAccount");
		Map<String,Object>  m=new HashMap<String,Object>();
		if(user!=null){
			m= cqjyS.addFocus(user.getDanWeiGuid()+"",infoid);
			int focusnum = cqjyS.getFocusCount(infoid);
            m.put("focusnum", focusnum);
		}else{
			m.put("code", "1");
			m.put("msg", "您尚未登录或会话超时，请重新登录！");
		}
		return m;
	}
	/**
	 * 取消关注
	 * cancelFocus
	 * @param infoid
	 * @param request
	 * @return
	 * Map<String,Object>
	 * @exception
	 * @since  1.0.0
	 */
	@RequestMapping(value = "/cancelFocus")
    @ResponseBody
    public Map<String, Object> cancelFocus(String infoid,HttpServletRequest request) {
        LoginAccount user=(LoginAccount)request.getSession().getAttribute("loginAccount");
        Map<String,Object>  m=new HashMap<String,Object>();
        if(user!=null){
            m= cqjyS.cancelFocus(user.getDanWeiGuid()+"",infoid);
            int focusnum = cqjyS.getFocusCount(infoid);
            m.put("focusnum", focusnum);
        }else{
            m.put("code", "1");
            m.put("msg", "您尚未登录或会话超时，请重新登录！");
        }
        return m;
    }
	/**
	 * 竞买记录
	 * jmjl
	 * @param
	 * @return
	 * ModelAndView
	 * @exception
	 * @since  1.0.0
	 */
	@RequestMapping(value = "/jmjl")
	public ModelAndView jmjl(String infoid,String projectGuid){
	    ModelAndView modelAndView = new ModelAndView("portal/cqjy_detail_jmjl");

		GongGao gg = cqjyS.detail(infoid);
        if(gg!=null){
        	modelAndView.addObject("fromFlag", "0");
        	if (gg.getIspllr()!=null && gg.getIspllr().equals("1")) {
				List<Map> plist = ns.getProjectList(gg.getInfoid());
				modelAndView.addObject("projectList", plist);
			}
        	if(gg.getIspllr()!=null && gg.getIspllr().equals("1") && StringUtils.isNotBlank(projectGuid)) {
        		modelAndView.addObject("fromFlag", "1");
        	}
            if(StringUtils.isBlank(projectGuid)){
                projectGuid = gg.getProjectguid();
            }
            
            List<BaoJia> his = ns.baojiaHIS(projectGuid);
            List baojiaHis = ns.getBaoJiaHis(projectGuid);
            if(2 == (gg.getCurrencyunit())){
            	for(BaoJia bj : his){
                	if (StringUtils.isNotBlank(bj.getPrice())) {
        				double p = Double.valueOf(bj.getPrice());
        				bj.setPrice(String.format("%.4f", p));
        			}
                }
            }


            modelAndView.addObject("baojiaHis", baojiaHis);
            modelAndView.addObject("his", his);
            modelAndView.addObject("jinjia_1",ns.baojia_status(projectGuid, null));
            if("1".equals(gg.getAllowmorejqxt())){//二次报价
                List<BaoJia> his_erci = ns.ERCI_baojiaHIS(projectGuid,gg.getSystemtype());

                if(2 == (gg.getCurrencyunit())){//万元
                	for(BaoJia bj : his_erci){
                    	if (StringUtils.isNotBlank(bj.getPrice())) {
            				double p = Double.valueOf(bj.getPrice());
            				bj.setPrice(String.format("%.4f", p));
            			}
                    }
                }

                List baojiaHis_erci =ns.ERCI_BaoJiaHis(projectGuid,gg.getSystemtype());
                modelAndView.addObject("his_erci", his_erci);
                modelAndView.addObject("baojiaHis_erci", baojiaHis_erci);
                modelAndView.addObject("jinjia_2",ns.baojia_status(projectGuid, "1"));
                GongGao g = ns.baojiafangshi(gg.getProjectguid());//二次报价的报价方式,竞价开始,结束时间
				if(g!=null){
					gg.setJingjiafangshi_1(g.getJingjiafangshi_1());
					gg.setJingjia_start(g.getJingjia_start());
					gg.setJingjia_end(g.getJingjia_end());
				}
            }
            modelAndView.addObject("gg",gg);
        }
        return modelAndView;
	}

	@RequestMapping(value = "/querySubCitys")
	@ResponseBody
	public String querySubCitys(String name) {
		String citys= DBCacheManage.get(RedisKeys.WEB_DATA_CACHE_CITY);
        JSONArray province=(JSONArray) JSONArray.parse(citys);
        JSONArray subCitys=new JSONArray();
        for(int i=0;i<province.size();i++){
        	if(name.equals(province.getJSONObject(i).getString("name"))){
        		subCitys=province.getJSONObject(i).getJSONArray("subCity");
        		break;
        	}
        }
        return subCitys.toJSONString();
	}
	private String getNewStr(String str) {
		if(StringUtils.isNotBlank(str)){
			return str.replaceAll("\r\n","<br/>");
		}else{
			return str;
		}
	}


	 @RequestMapping(value="/ypl_more")
	 public ModelAndView ypl_more(GongGao gg,String orderType,HttpServletRequest request,Integer page,Integer rows, HttpServletResponse response){
	     String cqywtypename="";
//		 HttpSession session=request.getSession();
		 Map<String,String> areaCookies=indexService.areaCookies(request,response);
		 try {
			 if(gg.getCategoryname()!=null&&!gg.getCategoryname().equals("")){
				 gg.setCategoryname(URLDecoder.decode(gg.getCategoryname(), "UTF-8"));
			 }
			 if(gg.getS1()!=null&&!gg.getS1().equals("")){//省
				 gg.setS1(URLDecoder.decode(gg.getS1(), "UTF-8"));
			 }else{
//			 	 gg.setS1((String) session.getAttribute("region"));//没有选择地区就取session中的值
				 gg.setS1(areaCookies.get("provinceCookie"));//没有选择地区就取cookie中的值
			 }
			 if(gg.getS2()!=null&&!gg.getS2().equals("")){//市
				 gg.setS2(URLDecoder.decode(gg.getS2(), "UTF-8"));
			 }else{
//				 gg.setS2((String) session.getAttribute("city"));//没有选择地区就取session中的值
				 gg.setS2(areaCookies.get("cityCookie"));//没有选择地区就取session中的值
			 }

		 }catch (UnsupportedEncodingException e) {
				e.printStackTrace();
		 }

//		 IndexService indexService=new IndexService();
		 String citycode = "";
		 if("%".equals(gg.getS2())||"".equals(gg.getS2())){
			 citycode = "";
		 }else{
			 citycode = gg.getS0();
		 }
		 page = page == null || page < 0 ? 1 : page;
		 rows = rows == null ? 16 : rows;
	     ModelAndView modelAndView = new ModelAndView("portal/ypl-list");
		 Map<String, Object> map = cqjyS.yplList(gg, orderType,citycode, page, rows);
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
		 modelAndView.addObject("selectB__", gg.getS0());
		 modelAndView.addObject("selectC", cqywtypename);
		 modelAndView.addObject("selectD", gg.getStatus_name());
		 modelAndView.addObject("orderType", orderType);

	     //页面头部
		 modelAndView.addObject("searchKey", gg.getTitle());
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

	private class GuessLikeCookie {
		private HttpServletRequest request;
		private String cookie_area;
		private String cookie_type;

		public GuessLikeCookie(HttpServletRequest request) {
			this.request = request;
		}

		public String getCookie_area() {
			return cookie_area;
		}

		public String getCookie_type() {
			return cookie_type;
		}

		public GuessLikeCookie invoke() {
			try {
				Cookie[] ks = request.getCookies();
				if(ks!=null){
					for (Cookie k : ks) {
						 if ("type".equals(k.getName())) {
							cookie_type = k.getValue();
							cookie_type = URLDecoder.decode(cookie_type, "utf-8");

						} else if ("area".equals(k.getName())) {
							cookie_area = k.getValue();
							cookie_area = URLDecoder.decode(cookie_area, "utf-8");
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return this;
		}
	}
	
	@RequestMapping("/jygg_more_map")
	public ModelAndView baidu_map(String mappoint,String pic,String orgLXR,String orgPhone,String orgAddress,
			String projectname) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("mappoint", mappoint);
		mv.addObject("pic", pic);
		mv.addObject("orgLXR", orgLXR);
		mv.addObject("orgPhone", orgPhone);
		mv.addObject("orgAddress", orgAddress);
		mv.addObject("projectname", projectname);
		mv.setViewName("portal/baidu_map");
		return mv;
	}
}
