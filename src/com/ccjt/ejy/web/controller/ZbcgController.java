/**  
 * 包名：com.ccjt.ejy.web.controller  
 * 文件名：ZbcgController.java  
 * 版本信息：V1.0  
 * 日期：2017年8月2日-下午2:35:11  
 * Copyright(c)2017
 *   
 */
package com.ccjt.ejy.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ccjt.ejy.web.vo.ZBCG_City;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.ccjt.ejy.web.service.ZbcgService;
import com.ccjt.ejy.web.vo.City;
import com.ccjt.ejy.web.vo.FastCaiGou;

/**  
 *   
 * 类名称：ZbcgController  
 * 类描述：
 * 创建人：qiaojoy99  
 * 修改人：qiaojoy99 
 * 修改时间：2017年8月2日 下午2:35:11  
 * 修改备注：  
 * @version 1.0.0  
 *   
 */
@Controller
public class ZbcgController extends BaseController {
    
    private ZbcgService zbcgService = new ZbcgService();
    /**
     * 招标采购列表
     * zbcg_more  
     * @param cg
     * @param request
     * @param page
     * @param rows
     * @return   
     * ModelAndView  
     * @exception   
     * @since  1.0.0
     */
    @RequestMapping("/zbcg_more")
    public ModelAndView zbcg_more(FastCaiGou cg,String type,HttpServletRequest request,Integer page,Integer rows,String title){
    	try {
    		 if(cg.getXiaquname()!=null&&!cg.getXiaquname().equals("")){
				 cg.setXiaquname(URLDecoder.decode(cg.getXiaquname(), "UTF-8"));
			 }
    		 if(type!=null&&!type.equals("")){//项目状态
				 type=URLDecoder.decode(type, "UTF-8");
			 }
    		 if(cg.getCategoryname()!=null&&!cg.getCategoryname().equals("")){
				 cg.setCategoryname(URLDecoder.decode(cg.getCategoryname(), "UTF-8"));
			 }

			 if(cg.getStatus_name()!=null&&!cg.getStatus_name().equals("")){
				 cg.setStatus_name(URLDecoder.decode(cg.getStatus_name(), "UTF-8"));
			 }

			if (StringUtils.isNotBlank(title)){
				cg.setBiaoduanname(title);
				title = URLDecoder.decode(title, "UTF-8");
			}

			 if(cg.getBiaoduanname()!=null&&!cg.getBiaoduanname().equals("")){
				 cg.setBiaoduanname(URLDecoder.decode(cg.getBiaoduanname(), "UTF-8"));
				 title = cg.getBiaoduanname();
			 }
		 }catch (UnsupportedEncodingException e) {
				e.printStackTrace();
		 } 
    	int pageSize =15;//每页展示数量
        if(page==null||page<1){
            page=1;
        }
        ModelAndView modelAndView = new ModelAndView("portal/zbcg-list");
        Map<String, Object> result = new HashMap<String,Object>();
        if(type!=null&&!type.equals("")){
        	if(type.equals("招标公告")){
        		result = zbcgService.zbcgs(page, pageSize, cg);
        		modelAndView.addObject("type","zbgg");
        	}else if(type.equals("成交公告")){
        		result = zbcgService.zbcg_cjgg(page, pageSize, cg);
				modelAndView.addObject("type","cjgg");
        	}
        }else{
        	result = zbcgService.zbcgs(page, pageSize, cg);
			modelAndView.addObject("type","zbgg");
        }
        if(result.get("rows")!=null){
            List<FastCaiGou> zbcgs = (List<FastCaiGou>)result.get("rows");
            modelAndView.addObject("rows", fastcaigouStateTranslate(zbcgs));
        }
        int count = Integer.parseInt(result.get("count").toString());
        modelAndView.addObject("count",count );
        modelAndView.addObject("page", page);
        int totalPage = count%pageSize==0?count/pageSize:(count/pageSize+1);//计算总页数
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("selectA",cg.getXiaquname());
	    modelAndView.addObject("selectB",type);
	    modelAndView.addObject("selectC",cg.getCategoryname());
	    modelAndView.addObject("selectD",cg.getStatus_name());
	    modelAndView.addObject("biaoduanname",cg.getBiaoduanname()==null?null:cg.getBiaoduanname().replace("'", "&apos;").replace("\\", "\\\\"));
        //机构列表
		List<ZBCG_City> orgList= zbcgService.zbcg_city();
		modelAndView.addObject("orgList", orgList);

		//页面头部
		modelAndView.addObject("searchKey",title);
		JSONObject json=getCitys();
        modelAndView.addObject("citys",json); 
        
        return modelAndView;
    }

}
