package com.ccjt.ejy.web.controller.back;

import com.ccjt.ejy.web.service.back.AdService;
import com.ccjt.ejy.web.service.back.LogoService;
import com.ccjt.ejy.web.vo.Ad;
import com.ccjt.ejy.web.vo.Logo;
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
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 
 */
@Controller
@RequestMapping("/system")
public class LogoController {

//	private AdService as = new AdService();
	private LogoService ls = new LogoService();

	@RequestMapping(value = "/add_logo")
	public ModelAndView addLogo(HttpServletRequest request,
							   Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("back/logomanage");
		return mv;
	}

	@RequestMapping(value = "/logoList")
	@ResponseBody
	public Map<String, Object> list(Logo ad ,Integer page, Integer rows) throws Exception {
		Map<String, Object> m = ls.logoList(ad, page, rows);
		return m;
	}
    
	/**
	 */
	@RequestMapping(value = "/logo_add")
	public ModelAndView ad_add(Integer id,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map> orgList=ls.getOrgList();
		if (id != null) {
			Logo ad = ls.getLogo(id);
			mv.addObject("ad", ad);
			mv.addObject("type", "edit");
		}else{
			mv.addObject("type", "add");
		}
		mv.addObject("orgList", orgList);
		mv.setViewName("/back/logo_add");
		return mv;
	}
	
	@RequestMapping(value = "/logo_save", method = RequestMethod.POST)
	public ModelAndView ad_save(Logo ad,HttpServletRequest request,@RequestParam("file") CommonsMultipartFile[] files,@RequestParam("file2") CommonsMultipartFile[] files2) throws Exception {
//		String isShow=ad.getIsShow();
//		isShow=isShow==null?"off":isShow;
//		if(isShow.equals("on")){
//			ad.setState(1);
//		}else{
//			ad.setState(0);
//		}
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
		//标的默认图片保存
		String bigPicName = "";
		for(int i = 0;i<files2.length;i++){
			if(!files2[i].isEmpty()){
				try {
					String oldnName = files2[i].getOriginalFilename();
					String suffix = oldnName.substring(oldnName.lastIndexOf("."));//后缀带.
					String relativePath = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
					String newName = UUID.randomUUID().toString()+suffix;//存储用的文件名
					bigPicName = relativePath + "/" + newName;
					String path = request.getSession().getServletContext().getRealPath("upload/")
							+ "/ad/" + relativePath + "/";
					File file = new File(path);
					if(!file.exists()){
						file.mkdirs();
					}
					File os = new File(path + newName);
					files2[i].transferTo(os);
					ad.setBigpic("upload/ad/"+bigPicName);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("标的默认图片上传出错");
				}
			}
		}
		ad.setDanweiName(ls.getOrgNameByCode(ad.getJgmc()));
	    Map<String, Object> map = ls.saveLogo(ad);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "success");
        mv.setViewName("/back/logo_add");
        return mv;
	}

	@RequestMapping(value = "/logo_del", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ad_del(String[] ids,HttpServletRequest request) throws Exception {
		Map<String, Object> map = ls.delLogo(ids);
		return map;
	}

}
