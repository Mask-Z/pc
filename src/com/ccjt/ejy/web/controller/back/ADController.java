package com.ccjt.ejy.web.controller.back;

import com.ccjt.ejy.web.service.back.AdService;
import com.ccjt.ejy.web.vo.Ad;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

/**
 * 
 */
@Controller
@RequestMapping("/system")
public class ADController {
	
	private AdService as = new AdService();

	@RequestMapping(value = "/ad_manage")
	public ModelAndView manage(HttpServletRequest request,
			Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/admanage");
		return mv;
	}

	
	@RequestMapping(value = "/adList")
	@ResponseBody
	public Map<String, Object> list(Ad ad ,Integer page, Integer rows) throws Exception {
		Map<String, Object> m = as.adList(ad, page, rows);
		return m;
	}
    
	/**
	 */
	@RequestMapping(value = "/ad_add")
	public ModelAndView ad_add(Integer id,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (id != null) {
			Ad ad = as.getAd(id);
			mv.addObject("ad", ad);
			mv.addObject("type", "edit");
		}else{
			mv.addObject("type", "add");
		}
		mv.setViewName("/back/ad_add");
		return mv;
	}
	
	@RequestMapping(value = "/ad_save", method = RequestMethod.POST)
	public ModelAndView ad_save(Ad ad,HttpServletRequest request,@RequestParam("file") CommonsMultipartFile[] files) throws Exception {
		String isShow=ad.getIsShow();
		isShow=isShow==null?"off":isShow;
		if(isShow.equals("on")){
			ad.setState(1);
		}else{
			ad.setState(0);
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
                            + "/ad/" + relativePath + "/";
                    File file = new File(path);
                    if(!file.exists()){
                        file.mkdirs();
                    }
                    File os = new File(path + newName);
                    files[i].transferTo(os);
                    ad.setPic(picName);
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("上传出错");
                }
            }
        }
	    Map<String, Object> map = as.saveAd(ad);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "success");
        mv.setViewName("/back/ad_add");
        return mv;
	}

	@RequestMapping(value = "/ad_del", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ad_del(String[] ids,HttpServletRequest request) throws Exception {
		Map<String, Object> map = as.delAd(ids);
		return map;
	}

}
