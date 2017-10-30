package com.ccjt.ejy.web.controller.back;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ccjt.ejy.web.service.back.LinkService;
import com.ccjt.ejy.web.vo.Link;

@Controller
@RequestMapping("/system")
public class LinkController {
	
	private LinkService linkS = new LinkService();

	@RequestMapping(value = "/link_manage")
	public ModelAndView manage(HttpServletRequest request,
			Integer id) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/back/linkmanage");
		return mv;
	}

	
	@RequestMapping(value = "/linkList")
	@ResponseBody
	public Map<String, Object> list(Link link ,Integer page, Integer rows) throws Exception {
		Map<String, Object> m = linkS.linkList(link, page, rows);
		return m;
	}
    
	/**
	 */
	@RequestMapping(value = "/link_add")
	public ModelAndView ad_add(Integer id,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (id != null) {
			Link link = linkS.getLink(id);
			mv.addObject("link", link);
			mv.addObject("type", "edit");
		}else{
			mv.addObject("type", "add");
		}
		mv.setViewName("/back/link_add");
		return mv;
	}
	
	@RequestMapping(value = "/link_save", method = RequestMethod.POST)
	public ModelAndView link_save(Link link,HttpServletRequest request,@RequestParam("file") CommonsMultipartFile[] files) throws Exception {
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
                            + "/link/" + relativePath + "/";
                    File file = new File(path);
                    if(!file.exists()){
                        file.mkdirs();
                    }
                    File os = new File(path + newName);
                    files[i].transferTo(os);
                    link.setImage(picName);
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("上传出错");
                }
            }
        }
	    linkS.saveLink(link);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "success");
        mv.setViewName("/back/link_add");
        return mv;
	}

	@RequestMapping(value = "/link_del", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> link_del(String[] ids,HttpServletRequest request) throws Exception {
		Map<String, Object> map = linkS.delLink(ids);
		return map;
	}


}
