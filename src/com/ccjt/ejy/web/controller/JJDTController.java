package com.ccjt.ejy.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.ccjt.ejy.web.service.IndexService;
import com.ccjt.ejy.web.service.JjdtCqjyService;
import com.ccjt.ejy.web.service.JjdtZbcgService;
import com.ccjt.ejy.web.vo.City;
import com.ccjt.ejy.web.vo.GongGao;
import com.ccjt.ejy.web.vo.Jjdt;
import com.ccjt.ejy.web.vo.Page;

@SuppressWarnings("rawtypes")
@Controller
public class JJDTController extends BaseController{
	private JjdtCqjyService jjdtService =new JjdtCqjyService();
	private IndexService indexService =new IndexService();
	
	/**
     * 【产权交易】刷新标的的信息
     * @param
     * @param request
     * @param model
     * @return 
     */
	@SuppressWarnings("unchecked")
    @RequestMapping("/refresh")
    @ResponseBody
    public List refresh(@RequestParam String biaoDiNOs ,HttpServletRequest request,Model model){
	    List list =new ArrayList();
        list.addAll(jjdtService.jjdt_cqjy(biaoDiNOs.split(",")));
        return list;
	}
	
	/**
	 * 竞价大厅列表
	 * @param page
	 * @param rows
	 * @param orgid			机构条件
	 * @param biaodiname	标的名称条件
	 * @param type			项目类型条件
	 * @param status		报名状态条件
	 * @return
	 */
	@RequestMapping("jjdt_more_data")
	@ResponseBody
	public Object jjdt_more_data(Integer page, Integer rows
			,String orgid,String biaodiname ,String type,String status,String sheng,String shi,HttpServletRequest request,HttpServletResponse response) {

		Map<String,String> areaCookies=indexService.areaCookies(request,response);


		Map<String ,String> con =new HashMap<String ,String>();

		con.put("orgid", orgid == null ? "" : orgid);
		con.put("biaodiname", biaodiname == null ? "" : biaodiname);
		con.put("type", type == null ? "" : type);
//		con.put("sheng", sheng == null ? "" : sheng);
//		con.put("shi", shi == null ? "" : shi);
		con.put("status", status == null ? "" : status);

		if(StringUtils.isNotBlank(sheng)){
			if (sheng.equals("all")){
				con.put("sheng", "");
			}else {
				con.put("sheng", sheng);
			}
		}else{
			sheng=areaCookies.get("provinceCodeCookie");
			con.put("sheng",sheng);//没有选择省就取cookie中省的值
		}

		if(StringUtils.isNotBlank(shi)){
			if (shi.equals("all")){
				con.put("shi",  "");
			}else {
				con.put("shi",  shi);
			}
		}else{
			shi=areaCookies.get("cityCodeCookie");
			con.put("shi",shi);//没有选择市就取cookie中市的值
		}

		Page pageObj = new Page();
		rows = rows == null ? 8 : rows;
		pageObj.setRows(rows);
		pageObj.setCurrentPage(page);
		List<Jjdt> jjdt_more = jjdtService.jjdt_cqjy(pageObj,con);
		JSONObject json = new JSONObject();
		json.put("pageObj", pageObj);
		json.put("jjdt_more", jjdt_more);
		return json;
	}

	/**
	 * 首页竞价大厅列表获取
	 * @param page
	 * @param rows
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("index_jjdt_more_data")
	@ResponseBody
	public Object index_jjdt_more_data(Integer page, Integer rows,HttpServletRequest request,HttpServletResponse response) {
		Map<String,String> areaCookies=indexService.areaCookies(request,response);
		String citycode=areaCookies.get("cityCodeCookie");
		String provincecode=areaCookies.get("provinceCodeCookie");

		Page pageObj = new Page();
		rows = rows == null ? 8 : rows;
		pageObj.setRows(rows);
		pageObj.setCurrentPage(page);
		List<Jjdt> jjdt_more = jjdtService.index_jjdt_cqjy(pageObj,citycode,provincecode);
		JSONObject json = new JSONObject();
		json.put("pageObj", pageObj);
		json.put("jjdt_more", jjdt_more);
		return json;
	}
	/**
	 * 产权交易
	 * @param page
	 * @param pageSize
	 * @param sheng
	 * @param orgid
	 * @param biaodiname
	 * @param type
	 * @param status
	 * @return
	 */
	@RequestMapping("/jjdt_more")
	public ModelAndView jjdt_more(HttpServletRequest request,Integer page, Integer pageSize
            ,String orgid,String biaodiname,String type,String status,String sheng,String shi, HttpServletResponse response) {
		Map<String,String> areaCookies=indexService.areaCookies(request,response);

	    ModelAndView mv =new ModelAndView();
        Map<String,String> con =new HashMap<String,String>();
        con.put("orgid", orgid == null ? "" : orgid);
        con.put("biaodiname", biaodiname == null ? "" : biaodiname);
        con.put("type", type == null ? "" : type);
//        con.put("sheng", sheng == null ? "" : sheng);
//        con.put("shi", shi == null ? "" : shi);
        con.put("status", status == null ? "" : status);

		if(StringUtils.isNotBlank(sheng)){
			con.put("sheng",  sheng);
		}else{
			sheng=areaCookies.get("provinceCodeCookie");
			con.put("sheng",sheng);//没有选择省就取cookie中省的值
		}

		if(StringUtils.isNotBlank(shi)){
			con.put("shi",  shi);
		}else{
			shi=areaCookies.get("cityCodeCookie");
			con.put("shi",shi);//没有选择市就取cookie中市的值
		}

        mv.addObject("condition",con);
        //分页参数
        Page pageObj = new Page();
        pageSize =pageSize==null ?8 :pageSize;
        pageObj.setRows(pageSize);
        pageObj.setCurrentPage(page);
        mv.addObject("pageObj",pageObj);
        //竞价大厅列表
        jjdtService.jjdt_cqjy(pageObj,con);
        //机构列表
        mv.addObject("orglist" ,jjdtService.jjdt_orglist());
        //标的类型
        mv.addObject("typelist" ,jjdtService.jjdt_typelist());
        //标的地区
        List<City> cityinfo = indexService.city_info();
        mv.addObject("cityinfo" ,cityinfo);

		mv.addObject("province", sheng);
		mv.addObject("city", shi);

        mv.setViewName("portal/jjdt-list");
        //页面头部
        JSONObject json=getCitys();
        mv.addObject("citys",json); 
        return mv;
    }
	
	/**
	 * 【招标采购】竞价大厅列表
	 * @param page
	 * @param pageSize
	 * @param sheng
	 * @param orgid
	 * @param biaodiname
	 * @param type
	 * @param status
	 * @return
	 */
	@RequestMapping("/zbcg_jjdt")
	public ModelAndView zbcg_jjdt(Integer page, Integer pageSize,String sheng,String orgid,String biaodiname,String type,String status) {
		ModelAndView mv = new ModelAndView();
		Page pageObj = new Page();
		pageObj.setCurrentPage(page);
        pageSize =pageSize==null ?8 :pageSize;
        pageObj.setRows(pageSize);
        pageObj.setCurrentPage(page);
		JjdtZbcgService ms = new JjdtZbcgService();
		List<City> cityinfo = ms.zbcg_city();
		List<GongGao> jjdt_zbcg_list = ms.jjdt_zbcg(pageObj, sheng,orgid,biaodiname,type,status);
		mv.addObject("list",jjdt_zbcg_list);
		//
		Map<String ,String> con =new HashMap<String ,String>();
        con.put("orgid", orgid == null ? "" : orgid);
        con.put("biaodiname", biaodiname == null ? "" : biaodiname);
        con.put("type", type == null ? "" : type);
        con.put("status", status == null ? "" : status);
        mv.addObject("condition" ,con);
        //
		mv.addObject("cityinfo", cityinfo);
		//
		mv.addObject("pageObj" ,pageObj);
		
		mv.setViewName("portal/jjdt_zbcg_more");
		 //页面头部
        JSONObject json=getCitys();
        mv.addObject("citys",json); 
		return mv;
	}
}
