package com.ccjt.ejy.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
/**
 * 照片上传功能
 * @author zy
 */
@Controller
@RequestMapping(value = "/file")
public class UploadFileController{
	
	
	@RequestMapping("/file")
	public ModelAndView impinfo(HttpServletRequest req,HttpServletResponse res){
			HashMap model = new HashMap();
			model.put("suffix", req.getParameter("suffix"));
    		return new ModelAndView("uploadfile",model);
	}
	@RequestMapping("/test")
	public ModelAndView test(HttpServletRequest req,HttpServletResponse res){
			HashMap model = new HashMap();
    		return new ModelAndView("test",model);
	}
	@RequestMapping("/uploadfile")
	public void uploadfile(MultipartHttpServletRequest request,HttpServletRequest req,HttpServletResponse response){
		String filepath=request.getServletContext().getRealPath("/") + "upload" ;
		String glodPath="";
		Map<String, String> map = new HashMap<String, String>();
		String path = null;//路径
		String error = null;//信息 1 为成功！
		boolean issuffix = false;
		String upfilename = request.getParameter("filename");
		String suffix = request.getParameter("suffix");
		MultipartFile file = request.getFile(upfilename);
		//文件大小不能大于2M
		if(file.getSize() > 8097152L){
			render(response, "<script>window.parent._upload_callbacks('"+path+"','上传的附件不能大于8M！');</script>", "text/html;charset=utf-8");
			return ;
		}
		String suffixs[] = suffix != null?suffix.split(","):null;
		for (int i=0;i< (suffixs == null?0:suffixs.length);i++) {
			
			if(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".",file.getOriginalFilename().length())).toLowerCase().endsWith(suffixs[i])){
				issuffix = true;
				break;
			}
		}
	//	if(!issuffix){
		//	render(response,  "<script>window.parent._upload_callbacks('"+path+"','上传文件格式不正确！格式【"+suffix+"】');</script>", "text/html;charset=utf-8");
		//	return;
		//}
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHMMSS");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMM");
			
			File fp = new File(filepath+"/"+sdf2.format(new Date()));
			//文件夹不存储在就创建
			if (!fp.exists()) {
				fp.mkdirs();
			}
			path="/"+sdf2.format(new Date())+"/"+sdf.format(new Date())+file.getSize()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".",file.getOriginalFilename().length()));;
			byte[] data = file.getBytes();
			//System.out.println("上传文件path: "+path);
			FileOutputStream out = new FileOutputStream(filepath+path);
			request.getSession().setAttribute("filepath", filepath+path);
			out.write(data);
			out.close();
			error = "1";//上传成功!
		} catch (IOException e) {
			error = "0";//上传图片失败！
			e.printStackTrace();
		}finally{
			render(response, "<script>window.parent._upload_callbacks('upload"+path+"','"+error+"');</script>", "text/html;charset=utf-8");
		}
	} 
	
	@RequestMapping("/image")
	public void createImage(HttpServletResponse response,HttpServletRequest request){
		String filepath=request.getServletContext().getRealPath("/") + "upload" ;
		String pagefilepath = request.getParameter("filepath");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Content-disposition","filename=image"); 
		response.setDateHeader("Expires", 0);
		OutputStream out = null;
		FileInputStream finp = null;
		byte[] bys = new byte[2];
		try {
			out = response.getOutputStream();
			File file = new File(filepath+"\\"+pagefilepath);
			if(!file.exists() || pagefilepath ==null || pagefilepath.equals("")){
				response.setContentType("image/jpeg");
				String path = request.getSession().getServletContext().getRealPath("images/touxiang.jpg");
				FileInputStream inp = new FileInputStream(path);
				byte[] b = new byte[2];
				while (inp.read(b) != -1) {
					out.write(b);
				}
			}else{
				response.setContentType("image/jpg");
				finp = new FileInputStream(file);
				while (finp.read(bys)!= -1) {
					out.write(bys);
				}
			}
		} catch (Exception e) {
		}finally{
			try {
				out.flush();
				out.close();
				if (finp != null) {
					finp.close();
				}
			} catch (IOException e) {
			}
		}
	}
	/**
	 * 展现图片
	 * @param response
	 * @param request
	 */
	@RequestMapping("/filepath.do")
	public void filepath(HttpServletResponse response,HttpServletRequest request){
		String filepath=request.getServletContext().getRealPath("/") + "upload" ;
		String pagefilepath = request.getParameter("filepath");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Content-disposition","filename=image"); 
		response.setDateHeader("Expires", 0);
		OutputStream out = null;
		FileInputStream finp = null;
		byte[] bys = new byte[2];
		try {
			out = response.getOutputStream();
			File file = new File(filepath+"\\"+pagefilepath);
			if(!file.exists() || pagefilepath ==null || pagefilepath.equals("")){
				response.setContentType("text/html;charset=UTF-8");
				String path = request.getSession().getServletContext().getRealPath("images/touxiang.jpg");
				FileInputStream inp = new FileInputStream(path);
				byte[] b = new byte[2];
				while (inp.read(b) != -1) {
					out.write(b);
				}
			}else{
				response.setContentType("text/html;charset=UTF-8");
				finp = new FileInputStream(file);
				while (finp.read(bys)!= -1) {
					out.write(bys);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				out.flush();
				out.close();
				if (finp != null) {
					finp.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 渲染数据。主要功能如下：
	 * 1. 非缓存数据
	 * 2. 写入内容
	 * 3. 强制刷新输出缓存
	 * 
	 * @param res
	 * @param s
	 * @param contextType
	 */
	private static void render(HttpServletResponse res, String s, String contextType) {
		try {
			res.setHeader("Pragma", "no-cache");
			res.setHeader("Cache-Control", "no-cache");
			res.setDateHeader("Expires", 0);

			res.setContentType(contextType);

			res.getWriter().write(s);
		}
		catch (IOException eio) {
			//Exception.CheckedException.ignore(eio);
		}
		finally {
			try {
				res.flushBuffer();
			}
			catch (IOException e) {
				//ExceptionHelper.CheckedException.ignore(e);
			}
		}
	}
	
}
