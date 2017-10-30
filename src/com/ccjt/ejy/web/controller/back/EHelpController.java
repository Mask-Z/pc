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
import com.ccjt.ejy.web.vo.EHelp;
import com.ccjt.ejy.web.vo.ProjectType;

/**
 * 
 */
@Controller
@RequestMapping("/system")
public class EHelpController {
	
	private EHelpService ehelpService = new EHelpService();

	@RequestMapping(value = "/ehelp_manage")
	public ModelAndView manage(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/ehelpmanage");
		return mv;
	}
	
	@RequestMapping(value = "/ehelpList")
	@ResponseBody
	public Map<String, Object> list(EHelp ehelp, Integer page, Integer rows)
			throws Exception {		
		Map<String, Object> m = ehelpService.ehelpList(ehelp, page, rows);
		return m;
	}
    
	/**
	 */
	@RequestMapping(value = "/ehelp_add")
	public ModelAndView ehelp_add(Integer id,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (id != null) {
			EHelp ehelp = ehelpService.getEhelp(id);
			mv.addObject("ehelp", ehelp);
			mv.addObject("type", "edit");
		}else{
			mv.addObject("type", "add");
		}
		List<ProjectType> projectTypes = JSON.parseArray(DBCacheManage.get(RedisKeys.WEB_DATA_CACHE_PROJECTTYPE), ProjectType.class);
		for(int i = projectTypes.size()-1;i >= 0;i--) {
			ProjectType projectType = projectTypes.get(i);
			if("ZC".equals(projectType.getItemValue()) || "1".equals(projectType.getItemValue()) || "0".equals(projectType.getItemValue())
					|| "4".equals(projectType.getItemValue())) {
				projectTypes.remove(i);
			}
		}
		mv.addObject("projectTypes", projectTypes);
		mv.setViewName("/back/ehelp_add");
		return mv;
	}
	
	@RequestMapping(value = "/ehelp_save", method = RequestMethod.POST)
	public ModelAndView ehelp_save(EHelp ehelp,HttpServletRequest request,@RequestParam("file") CommonsMultipartFile[] files) throws Exception {
		String isShow = ehelp.getIsShow();
		isShow = isShow == null ? "off" : isShow;
		if(isShow.equals("on")) {
			ehelp.setState(1);
		} else {
			ehelp.setState(0);
		}
		//标题图片保存
	    String picName = "";
	    for(int i = 0;i<files.length;i++){
	    	if(!files[i].isEmpty()){
                try {
                    String oldnName = files[i].getOriginalFilename();
                    String suffix = oldnName.substring(oldnName.lastIndexOf("."));//后缀带.
                    String relativePath = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
                    String newName = UUID.randomUUID().toString()+suffix;//存储用的文件名
                    picName = relativePath + "/" + newName;
                    String path = request.getSession().getServletContext().getRealPath("upload/") 
                            + "/ehelp/" + relativePath + "/";
                    File file = new File(path);
                    if(!file.exists()){
                        file.mkdirs();
                    }
                    File os = new File(path + newName);
                    files[i].transferTo(os);
                    ehelp.setPic(picName);
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("上传出错");
                }
            }
        }
	    ehelpService.saveEhelp(ehelp);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "success");
        mv.setViewName("/back/ehelp_add");
        return mv;
	}

	@RequestMapping(value = "/ehelp_del", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ehelp_del(String[] ids,HttpServletRequest request) throws Exception {
		Map<String, Object> map = ehelpService.delEhelp(ids);
		return map;
	}
	
	@RequestMapping(value = "/getCitys")
	@ResponseBody
	public JSONArray getCitys(String citys) {
		JSONArray jsonArray = JSONArray.parseArray(DBCacheManage.get(RedisKeys.WEB_DATA_CACHE_CITY).replace("code", "id")
				.replace("name", "text").replace("subCity", "children"));  
		if(StringUtils.isNotEmpty(citys)) {
			JSONArray jsArr = new JSONArray();
			List<String> cityList = Arrays.asList(citys.split(","));
			for(int i = 0;i < jsonArray.size();i++) {
				JSONObject jo = (JSONObject)jsonArray.get(i);
				List<Map<String, Object>> list = (List)jo.get("children");
				for(Map map : list) {
					if(cityList.contains(map.get("id"))) {
						map.put("checked", true);
					}
				}
				jsArr.add(jo);
			}
			return jsArr;
		}		
		return jsonArray;
	}
}
