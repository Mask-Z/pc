/**  
 * 包名：com.ccjt.ejy.web.controller  
 * 文件名：IndexController.java  
 * 版本信息：V1.0  
 * 日期：2017年8月1日-上午9:46:14  
 * Copyright(c)2017
 *   
 */
package com.ccjt.ejy.web.controller;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ccjt.ejy.web.service.*;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.enums.InfoType;
import com.ccjt.ejy.web.enums.ProjectType;
import com.ccjt.ejy.web.service.back.AdService;
import com.ccjt.ejy.web.service.back.LinkService;
import com.ccjt.ejy.web.vo.Ad;
import com.ccjt.ejy.web.vo.FastCaiGou;
import com.ccjt.ejy.web.vo.GongGao;
import com.ccjt.ejy.web.vo.Link;
import com.ccjt.ejy.web.vo.LoginAccount;
import com.ccjt.ejy.web.vo.MajorProject;

/**  
 *   
 * 类名称：IndexController  
 * 类描述：网站首页
 * 创建人：qiaojoy99  
 * 修改人：qiaojoy99 
 * 修改时间：2017年8月1日 上午9:46:14  
 * 修改备注：  
 * @version 1.0.0  
 *   
 */
@Controller
public class IndexController extends BaseController{
    
    private AdService as = new AdService();
    private IndexService indexService = new IndexService();
//    private JjdtZbcgService jjdtZbcgService = new JjdtZbcgService();
    private LinkService linkService = new LinkService();
    private ProjectService projectService =new ProjectService(); 
    private FangChanService fanChanService =new FangChanService(); 
    private ZulinService zulinService =new ZulinService();
    private CheLianService cheLianService=new CheLianService();

    /**
     * 获取比一比列表数据
     * @param projectType	被比较的项目类型：FC房地产；FCZZ房产招租；
     * @return
     */
    @RequestMapping("/compare_list")
    public ModelAndView compare_list(HttpServletRequest request ,String projectType){
    	Cookie[] cookies = request.getCookies();//这样便可以获取一个cookie数组
    	String[] projectGuids =null;
    	if(cookies !=null){
            for(Cookie cookie : cookies){
                if("cqjy_compare".equals(cookie.getName())){
                	org.json.JSONObject json;
					try {
						json = new org.json.JSONObject(URLDecoder.decode(cookie.getValue(),"UTF-8"));
						projectGuids =JSON.parseObject(json.getJSONArray("projectGuids").toString(), String[].class);
					} catch (JSONException e) {
						e.printStackTrace();
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
                	break;
                }
            }
        }
//    	System.out.println(projectGuids);
    	//房产
    	/*projectGuids =new String[]{
    			"29c5b4ea-7c6c-4caa-99ee-93967550a452"
    			,"28899b12-e73a-4a98-b37e-0afc306f8301"
    			,"7e776a33-d6cf-4fb6-9f5c-2390da52185b"
    	};*/
    	//房产招租
    	/*projectGuids =new String[]{
	    	"231bf0ff-b645-425a-a470-346f0b4b0cf4"
	    	,"231bf0ff-b645-425a-a470-346f0b4b0cf4"
	    	,"7bb0829d-11c1-4034-a302-5f5dde39cad5"
    	};*/
    	//二手车
    	/*projectGuids =new String[]{
	    	"231bf0ff-b645-425a-a470-346f0b4b0cf4"
	    	,"231bf0ff-b645-425a-a470-346f0b4b0cf4"
	    	,"7bb0829d-11c1-4034-a302-5f5dde39cad5"
		};*/

    	ModelAndView modelAndView = new ModelAndView("portal/compare/" +projectType.toLowerCase());
    	List<GongGao> gglist =projectService.getGongGaos(projectGuids);
    	new NewsService().getHotLabelName(gglist);
    	modelAndView.addObject("gglist", gglist);
    	switch (ProjectType.get(projectType.toUpperCase())) {
		case FC://房产转让
			modelAndView.addObject("list", fanChanService.getFanChans(projectGuids));
			break;
		case FCZZ://房产招租
			modelAndView.addObject("list", zulinService.getZulins(projectGuids));
			break;
		case CL://二手车
			modelAndView.addObject("list", cheLianService.getCheLians(projectGuids));
			break;
		default:
			System.err.println("不支持的项目类型");
			break;
		}
    	//公共参数
    	JSONObject json=getCitys();
        modelAndView.addObject("citys",json);
    	return modelAndView;
    }
    
    private NewsService newsService = new NewsService();
    
    @RequestMapping(value="/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response){
    	System.out.println(111 + " : " + new DateTime().toString("yyyy-MM-dd HH:mm:ss.SSS"));
//        initPosition(request);//人员归属地
        ModelAndView modelAndView = new ModelAndView("portal/index");

        Map<String,String> areaCookies=indexService.areaCookies(request,response);
//        String qhCookie=areaCookies.get("qhCookie");
//        String cityCookie=areaCookies.get("cityCookie");
//        String provinceCookie=areaCookies.get("provinceCookie");

		String region_id =areaCookies.get("provinceCodeCookie");
		String city_id =areaCookies.get("cityCodeCookie");

//		if (StringUtils.isNotBlank(qhCookie)&&(qhCookie.equals("1")||qhCookie.equals("0"))){//如果是自动定位获取的城市,需要手动设置城市code到cookie中
//			String  cityCode = indexService.getCityCodeByCityName(cityCookie);
//			String  provinceCode = indexService.getCityCodeByCityName(provinceCookie);
//			Cookie cookie1=new Cookie("cityCodeCookie",cityCode);
//			cookie1.setMaxAge(60*60*48);
//			Cookie cookie2=new Cookie("provinceCodeCookie",provinceCode);
//			cookie2.setMaxAge(60*60*48);
//			response.addCookie(cookie1);
//			response.addCookie(cookie2);
//
//			region_id=provinceCode;
//			city_id=cityCode;
//		}




//        Object region = request.getSession().getAttribute("region_id");
//        Object city = request.getSession().getAttribute("city_id");
//        if(region!=null){
//        	region_id = region.toString();
//        }
//
//        if(city!=null){
//        	city_id = city.toString();
//        }
        
        //首页大图广告
        Ad ad = new Ad();
        ad.setAdtype("1");
        Map<String, Object> ads = as.adList(ad, 1, 10);
        
        modelAndView.addObject("bigads",ads.get("rows"));
        //首页小图广告
        ad.setAdtype("2");
        Map<String, Object> lads = as.adList(ad, 1, 4);
        modelAndView.addObject("smallads",lads);
        //首页重点项目
        ad.setAdtype("3");
        
        Map<String, Object> zds = as.majorProjectList(city_id, 1, 4);
        modelAndView.addObject("zdads",zds);
        
//        //诚聘英才
//        ad.setAdtype("4");
//        Map<String, Object> cpyc = as.adList(ad, 1, 4);
//        modelAndView.addObject("cpyc",cpyc);
        //首页平台公告
        List<GongGao> ptggs = indexService.index_info_list(InfoType.PTGG, 8, 16);
        modelAndView.addObject("ptggs",ptggs);
        //行业资讯公告
        List<GongGao> hyzxs = indexService.index_info_list(InfoType.YJZX, 8, 16);
        modelAndView.addObject("hyzxs",hyzxs);
        //产权交易
        
        //首页交易公告 begin
        System.out.println(222 + " : " + new DateTime().toString("yyyy-MM-dd HH:mm:ss.SSS"));
        List<GongGao> cqjys = indexService.index_cqjys(region_id,city_id);
        System.out.println(333 + " : " + new DateTime().toString("yyyy-MM-dd HH:mm:ss.SSS"));
        cqjys = gonggaoStateTranslate(cqjys);
        System.out.println(444 + " : " + new DateTime().toString("yyyy-MM-dd HH:mm:ss.SSS"));
        modelAndView.addObject("cqjys",cqjys);
        //首页交易公告 end
        
        //招标采购--招标公告
//        List<FastCaiGou> zbcgs = indexService.index_zbcgs(8);
//        zbcgs = fastcaigouStateTranslate(zbcgs);
        List<FastCaiGou> zbcgs=fastcaigouStateTranslate(JSON.parseArray(DBCacheManage.get(RedisKeys.KEY_DB_CACHE_ZBCG_ZBGG), FastCaiGou.class));
        modelAndView.addObject("zbcgs", zbcgs);
        //招标采购--成交公告
//        List<FastCaiGou> zbcg_cjgg_B=indexService.index_zbcg_cjgg("002002001",  8);//工程
//        zbcg_cjgg_B = fastcaigouStateTranslate(zbcg_cjgg_B);
//        List<FastCaiGou> zbcg_cjgg_A=indexService.index_zbcg_cjgg("002002002",  8);//货物
//        zbcg_cjgg_A = fastcaigouStateTranslate(zbcg_cjgg_A);
//        List<FastCaiGou> zbcg_cjgg_C=indexService.index_zbcg_cjgg("002002003",  8);//服务
//        zbcg_cjgg_C = fastcaigouStateTranslate(zbcg_cjgg_C);

		List<FastCaiGou> zbcg_cjgg_B=fastcaigouStateTranslate(JSON.parseArray(DBCacheManage.get(RedisKeys.KEY_DB_CACHE_ZBCG_CJGG_GC), FastCaiGou.class));//工程
		List<FastCaiGou> zbcg_cjgg_A=fastcaigouStateTranslate(JSON.parseArray(DBCacheManage.get(RedisKeys.KEY_DB_CACHE_ZBCG_CJGG_HW), FastCaiGou.class));//货物
		List<FastCaiGou> zbcg_cjgg_C=fastcaigouStateTranslate(JSON.parseArray(DBCacheManage.get(RedisKeys.KEY_DB_CACHE_ZBCG_CJGG_FW), FastCaiGou.class));//服务
        modelAndView.addObject("zbcg_cjgg_GC", zbcg_cjgg_B);
        modelAndView.addObject("zbcg_cjgg_HW", zbcg_cjgg_A);
        modelAndView.addObject("zbcg_cjgg_FW", zbcg_cjgg_C);
        
        //快捷采购--成交公告
        List<FastCaiGou> kjcg_cjgg = JSON.parseArray(DBCacheManage.get(RedisKeys.index_kjcg_cjgg), FastCaiGou.class);
        		//indexService.index_kjcg_cjgg(8);
        kjcg_cjgg=fastcaigouStateTranslate(kjcg_cjgg);
        modelAndView.addObject("kjcg_cjgg", kjcg_cjgg);
        //快捷采购--招标公告
        List<FastCaiGou> kjcgs = JSON.parseArray(DBCacheManage.get(RedisKeys.index_kjcgs), FastCaiGou.class);
        		//indexService.index_kjcgs(8);
        kjcgs = fastcaigouStateTranslate(kjcgs);
        modelAndView.addObject("kjcgs", kjcgs);
        System.out.println(666 + " : " + new DateTime().toString("yyyy-MM-dd HH:mm:ss.SSS"));
        //--------竞价大厅
        //modelAndView.addObject("jjdt_cqjy", jjdtCqjyService.jjdt_cqjy());
        
        List<GongGao> zbcg_jjdt_list = JSON.parseArray(DBCacheManage.get(RedisKeys.JJDT_ZBCG_KEY), GongGao.class);
        modelAndView.addObject("jjdt_zbcg", zbcg_jjdt_list);
        //页面头部
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json);        
        //最新成交
        List<GongGao> zxcjs = JSON.parseArray(DBCacheManage.get(RedisKeys.KEY_DB_CACHE_INDEX_CJGG_20_ROWS), GongGao.class);
        modelAndView.addObject("zxcjs", zxcjs);
        
        modelAndView.addObject("statistics",indexService.statistics());
        System.out.println(777 + " : " + new DateTime().toString("yyyy-MM-dd HH:mm:ss.SSS"));
        Object obj = request.getSession().getAttribute("loginAccount");
        if(!(obj instanceof LoginAccount)) {
        	modelAndView.addObject("loginAccount", null);
        } else {
        	LoginAccount loginAccount = (LoginAccount)obj;        	
        	Map<String, Object> loginInfo = indexService.getLoginInfo(loginAccount);
        	modelAndView.addObject("loginAccount", loginAccount);
        	modelAndView.addObject("loginInfo", loginInfo);        	
        }        
        //友情链接
        Map<String,Object> map= linkService.linkList(new Link(), 1, 10);
        modelAndView.addObject("linkList",(List<Link>)map.get("rows"));
        System.out.println(888 + " : " + new DateTime().toString("yyyy-MM-dd HH:mm:ss.SSS"));
        
        /**
		 * 首页_预披露
		 */
		List<GongGao> ypl_index = indexService.index_ypl_info();
		modelAndView.addObject("ypl_index",ypl_index);        
        return modelAndView;
    }
    
    @RequestMapping(value = "/index/updateSession")
	@ResponseBody
	public void updateSession(String province,String city,HttpServletRequest request){
    	//110000-北京
    	String[] provinceInfo=province.split("-");
    	String[] cityInfo=city.split("-");
    	request.getSession().setAttribute("region_id",provinceInfo[0]);
    	request.getSession().setAttribute("region",provinceInfo[1]);
        request.getSession().setAttribute("city_id",cityInfo[0]);
        request.getSession().setAttribute("city",cityInfo[1]);
	}

	@RequestMapping(value = "/index/otherUpdateSession",method = RequestMethod.POST)
	@ResponseBody
	public void otherUpdateSession(String province,String city,String qieHuanFlag,HttpServletRequest request){
		if (qieHuanFlag.equals("-1") || qieHuanFlag.equals("1")) {
			String  cityCode = indexService.getCityCodeByCityName(city);
			String  provinceCode = indexService.getCityCodeByCityName(province);
			request.getSession().setAttribute("city_id",cityCode);
			request.getSession().setAttribute("region_id", provinceCode);

			request.getSession().setAttribute("region", province);
			request.getSession().setAttribute("city", city);
			request.getSession().setAttribute("qieHuanFlag", qieHuanFlag);
		}else{
			request.getSession().setAttribute("qieHuanFlag", qieHuanFlag);
		}
	}

    @RequestMapping(value="/ygz_more")
    public ModelAndView ygz(HttpServletRequest request, String danWeiGuid, Integer page, Integer rows) {
        ModelAndView modelAndView = new ModelAndView("portal/ygz-list");
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json);   
        
        page = (page == null || page < 0) ? 1 : page;
		rows = rows == null ? 8 : rows;
		Map<String,Object> map = indexService.getYgzInfo(danWeiGuid, page, rows);		
        int total = Integer.parseInt(map.get("total").toString());
        List<GongGao> list = (List<GongGao>)map.get("rows");
	    modelAndView.addObject("list", list);
	    modelAndView.addObject("total", total);
	    modelAndView.addObject("danWeiGuid", danWeiGuid);
	    int totalPage = total%rows==0 ? total/rows : (total/rows)+1;
	    modelAndView.addObject("totalPage", totalPage);
	    modelAndView.addObject("page", page);
        return modelAndView;
    }
    
    @RequestMapping(value="/ybm_more")
    public ModelAndView ybm(HttpServletRequest request, String danWeiGuid, Integer page, Integer rows) {
        ModelAndView modelAndView = new ModelAndView("portal/ybm-list");
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json);   
        
        page = (page == null || page < 0) ? 1 : page;
		rows = rows == null ? 8 : rows;
		Map<String,Object> map = indexService.getYbmInfo(danWeiGuid, page, rows);		
        int total = Integer.parseInt(map.get("total").toString());
        List<Map<String, Object>> list = (List<Map<String, Object>>)map.get("rows");
	    modelAndView.addObject("list", list);
	    modelAndView.addObject("total", total);
	    modelAndView.addObject("danWeiGuid", danWeiGuid);
	    int totalPage = total%rows==0 ? total/rows : (total/rows)+1;
	    modelAndView.addObject("totalPage", totalPage);
	    modelAndView.addObject("page", page);
        return modelAndView;
    }
    
    @RequestMapping(value="/jjz_more")
    public ModelAndView jjz(HttpServletRequest request, String danWeiGuid, Integer page, Integer rows) {
        ModelAndView modelAndView = new ModelAndView("portal/jjz-list");
        
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json);   
        
        page = (page == null || page < 0) ? 1 : page;
		rows = rows == null ? 8 : rows;
		Map<String,Object> map = indexService.getJjzInfo(danWeiGuid, page, rows);		
        int total = Integer.parseInt(map.get("total").toString());
        List<Map<String, Object>> list = (List<Map<String, Object>>)map.get("rows");
	    modelAndView.addObject("list", list);
	    modelAndView.addObject("total", total);
	    modelAndView.addObject("danWeiGuid", danWeiGuid);
	    int totalPage = total%rows==0 ? total/rows : (total/rows)+1;
	    modelAndView.addObject("totalPage", totalPage);
	    modelAndView.addObject("page", page);
        return modelAndView;
    }
    
    @RequestMapping(value="/ygm_more")
    public ModelAndView ygm(HttpServletRequest request, String danWeiGuid, Integer page, Integer rows) {
        ModelAndView modelAndView = new ModelAndView("portal/ygm-list");
        
        JSONObject json=getCitys();
        modelAndView.addObject("citys",json);   
        
        page = (page == null || page < 0) ? 1 : page;
		rows = rows == null ? 8 : rows;
		Map<String,Object> map = indexService.getYgmInfo(danWeiGuid, page, rows);		
        int total = Integer.parseInt(map.get("total").toString());
        List<GongGao> list = (List<GongGao>)map.get("rows");
	    modelAndView.addObject("list", list);
	    modelAndView.addObject("total", total);
	    modelAndView.addObject("danWeiGuid", danWeiGuid);
	    int totalPage = total%rows==0 ? total/rows : (total/rows)+1;
	    modelAndView.addObject("totalPage", totalPage);
	    modelAndView.addObject("page", page);
        return modelAndView;
    }
    
    @RequestMapping(value="/zdxminfo")
	public ModelAndView zdxm(Integer id){
		ModelAndView modelAndView = null;
        if(id != null) {
			MajorProject ad = as.getMajorProject(id);
		 	modelAndView = new ModelAndView("portal/zdxm-detail");
		 	modelAndView.addObject("zdxmDetail", ad);
		}
		//页面头部
	    JSONObject json = getCitys();
	    modelAndView.addObject("citys", json); 
		return modelAndView;
	}	
    
    @RequestMapping(value="/cpycinfo")
	public ModelAndView cpyc(Integer id){
		ModelAndView modelAndView = null;
        if(id != null) {
		    Ad ad = as.getAd(id);
		 	modelAndView = new ModelAndView("portal/cpyc-detail");
		 	modelAndView.addObject("cpycDetail", ad);
		}
		//页面头部
	    JSONObject json = getCitys();
	    modelAndView.addObject("citys", json); 
		return modelAndView;
	}

    @RequestMapping("/get_lljl")
    @ResponseBody
    public Object getLljl(String get_lljls) {
    	Map<String, Object> lljls = new HashMap<String, Object>(); 
    	List<GongGao> list = new ArrayList<GongGao>();
    	if(StringUtils.isNotEmpty(get_lljls)) {
    		String[] infoIds = get_lljls.split(";");
    		for(int i = infoIds.length-1;i >= 0;i--) {
    			String infoId = infoIds[i];
    			GongGao gg = new GongGao();
				try {
					gg = jdbc.bean("select * from (" + 
							"select webdb.*,hc.CityName as areaName,cg.SystemType,cj.zzkg_zztype,cj.zzkg_guapaitype,'' as zzkg_guapaiprice,cj.GuaPaiPrice zzkg_guapaidj " +
							"from (select webdb.oucode as XiaQuCode,webdb.title,webdb.price as guapaiprice,webdb.infoid,webdb.CategoryNum as categorynum," +
							"webdb.CategoryName as categoryname," +
				            "(case when (shi = '110100' or shi = '110200' or shi = '120100' or shi = '120200' or shi = '500100' " +
			                "or shi = '500200' or shi = '500300' or shi = '310100' or shi = '310200') then sheng else shi end) as areaCode " +
							"from view_infomain webdb where webdb.infoid = '" + infoId + "') webdb " + 
							"left JOIN CQJY_JiaoYiGongGao cj ON cj.RowGuid = webdb.infoid " + 
    	            		"left JOIN CQJY_GongChengInfo cg ON cg.ProjectGuid = cj.ProjectGuid " + 
			                "left join HuiYuan_City hc on hc.CityCode = webdb.areaCode) webdb " + 
							"outer apply (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid = webdb.infoid and pic.type = 'JY01') pic", GongGao.class);
					if(gg != null && StringUtils.isNotEmpty(gg.getInfoid())) {
						list.add(gg);	
					}					
				} catch (Exception e) {						
					e.printStackTrace();
				}    	
    		}
    	}	
    	lljls.put("all_lljls", list);
        return lljls;
	}
    
    @RequestMapping("/get_wdgz")
    @ResponseBody
    public Object getWdgz(HttpServletRequest request,Integer page,Integer rows) {
    	Map<String, Object> wdgzs = new HashMap<String, Object>(); 
    	List<GongGao> listGg = new ArrayList<GongGao>();
		page = page == null || page < 0 ? 1 : page;
		rows = rows == null ? 10 : rows;
    	try {
    	    LoginAccount loginAccount = (LoginAccount)request.getSession().getAttribute("loginAccount");
    	    if(loginAccount != null) {
				String danweiGuid = loginAccount.getDanWeiGuid();
				String sql="select project_id as project_id from [web2.0].dbo.user_focus where user_id ='"+danweiGuid+"'";
				int total = jdbc.getCount(sql);
				int totalPage = total % rows == 0 ? total / rows : (total / rows) + 1;
				wdgzs.put("total", total);
				wdgzs.put("page", page);
				wdgzs.put("totalPage", totalPage);
				List<Map<String, Object>> ygzList = jdbc.mapList(sql+" order by id desc",page,rows);
    	        //我的关注
    	        for(int i = 0;i < ygzList.size();i++) {
    	            GongGao gg = jdbc.bean("select * from (" +
    	            		"select webdb.*,hc.CityName areaName,cg.SystemType,cj.zzkg_zztype,cj.zzkg_guapaitype,'' as zzkg_guapaiprice,cj.GuaPaiPrice zzkg_guapaidj " +
    	            		"from (select webdb.oucode as XiaQuCode,webdb.title,webdb.price as guapaiprice,webdb.infoid,webdb.CategoryNum as categorynum," +
    	            		"webdb.CategoryName as categoryname," +
    	            		"(case when (shi = '110100' or shi = '110200' or shi = '120100' or shi = '120200' or shi = '500100' " +
			                "or shi = '500200' or shi = '500300' or shi = '310100' or shi = '310200') then sheng else shi end) as areaCode " +
    	            		"from view_infomain webdb where webdb.infoid = '" + ygzList.get(i).get("project_id") + "') webdb " +
    	            		"left JOIN CQJY_JiaoYiGongGao cj ON cj.RowGuid = webdb.infoid " + 
    	            		"left JOIN CQJY_GongChengInfo cg ON cg.ProjectGuid = cj.ProjectGuid " + 
    	            		"left join HuiYuan_City hc on hc.CityCode = webdb.areaCode) webdb " + 
    	            		"outer apply (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid = webdb.infoid and pic.type = 'JY01') pic", GongGao.class);
    	            listGg.add(gg);				
    	        }
    	    }
    	} catch (Exception e) {
			e.printStackTrace();
		}	
    	wdgzs.put("all_wdgzs", listGg);
        return wdgzs;
	}
    
    @RequestMapping("/get_jjz")
    @ResponseBody
    public Object getJjz(HttpServletRequest request) {
    	Map<String, Object> jjzs = new HashMap<String, Object>(); 
    	List<Map<String, Object>> listGg = new ArrayList<Map<String, Object>>();
    	try {
    	    LoginAccount loginAccount = (LoginAccount)request.getSession().getAttribute("loginAccount");
    	    if(loginAccount != null) {
    	        String danweiGuid = loginAccount.getDanWeiGuid();
    	        Map<String,Object> resultMap = indexService.getJjzInfo(danweiGuid, 1, 10);		
    	        listGg = (List<Map<String, Object>>)resultMap.get("rows");
    	    }
    	} catch (Exception e) {
			e.printStackTrace();
		}	
    	jjzs.put("all_jjzs", listGg);
        return jjzs;
	}
}
