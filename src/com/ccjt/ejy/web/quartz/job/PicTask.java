package com.ccjt.ejy.web.quartz.job;


import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.Global;
import com.ccjt.ejy.web.commons.ImgCompress;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.GongGao;

public class PicTask {
	private static Logger log = LogManager.getLogger(PicTask.class);

	private GongGao gonggao;


	public PicTask(GongGao gonggao) {
		this.gonggao = gonggao;
	}
	
	private static final String s1 = "src=\"/ejyzx/uploadfile";
	private static final String web_s1 = "src=\"HTTP://www.e-jy.com.cn/ejyzx/eWebEditor/uploadfi";
	
	private static final String s2 = "/ejyzx/uploadfile/";
	private static final String web_s2 = "/ejyzx/ewebeditor/uploadfile/";
	
	public void run() {
		try {
			if(gonggao!=null){

				
				String infoid = gonggao.getInfoid();
				log.error("处理公告" + infoid );	
				String content = jdbc.getString("select InfoContent from View_InfoMain where infoid=?",infoid);
			
				if(StringUtils.isNotBlank(content)){
					List<String> pics = getPIC(content);
					smallPIC(pics,infoid);
					log.error("公告" + infoid + " 的图片有: " + pics);
					
					for(String str : pics){
						
						String name = str.substring(str.lastIndexOf("/")+1);
						
						String dirpath = AttachHandle.pic_web_root + File.separator + "JY01" + File.separator + infoid + File.separator;
						
						String path = "/" + dirpath + name;
						
						String s_path = "/" + dirpath + "s_" + name;
						
						jdbc.insert("insert into [web2.0].dbo.web_gonggao_pic(guid,path,bpath,type) values (?,?,?,'JY01')", infoid,s_path,path,str);
					}
					
					ConnectionFactory.commit();
					
				}
			}
				
		} catch (Exception e) {
			log.error("图片处理 err,gonggao = " + gonggao, e);
			ConnectionFactory.rollback();
		} finally{
			ConnectionFactory.close();
		}
	}
	
	private List<String> getPIC(String content){
		List<String> picList = new ArrayList<String>();
		try{
			String sq = content;
			int index = content.indexOf(s1);
			while(index >= 0){
				content = content.substring(index);
				content = content.substring(content.indexOf("\"") + 1);
				int l = content.indexOf("\"");
				String pic = content.substring(0,l);
				content = content.substring(l);
				index = content.indexOf(s1);
				picList.add(pic);
			}
			
			
			index = sq.indexOf(web_s1);
			while(index >= 0){
				sq = sq.substring(index);
				sq = sq.substring(sq.indexOf("www.e-jy.com.cn") + "www.e-jy.com.cn".length());
				int l = sq.indexOf("\"");
				String pic = sq.substring(0,l);
				sq = sq.substring(l);
				index = sq.indexOf(web_s1);
				picList.add(pic.toLowerCase().trim());
			}
			
			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return picList;
	}
	
	private void smallPIC(List<String> pics,String infoid) {
		if (pics != null) {
			ImgCompress mc = new ImgCompress();
			for (String purl : pics) {
				try {
					String name = purl.substring(purl.lastIndexOf("/")+1);
					String dirpath = Global.gonggao_file_dir + File.separator + "JY01" + File.separator + infoid;
					File dir = new File(dirpath);
					if(!dir.exists()){
						dir.mkdirs();
					}
					
					File src = new File(dirpath + File.separator + name);
					
					File des = new File(dirpath + File.separator + "s_" + name);
					
					if (!des.exists() || !src.exists()) {//只要有1个不存在
						getIS(Global.pic_url + purl,src);
						mc.resizeFix(AttachHandle.width,AttachHandle.height, src, des);
					}

				} catch (Exception e) {
					log.error("small pic error :", e);
				}
			}
		}
	}
	
	/**
	 * 获取图片inputstream
	 * @param picurl
	 * @return
	 */
	public void getIS(String picurl,File src) {
		InputStream input = null;
		FileOutputStream out = null;
		try {
			if(!src.exists()){
				URL url = new URL(picurl);
				URLConnection urlConn = url.openConnection();

				int length = urlConn.getContentLength();

				if (length > 0) {
					input = urlConn.getInputStream();
				}
				out = new FileOutputStream(src);
				IOUtils.copy(input, out);
			}
			
		} catch (Exception e) {
			log.error("图片处理 err:", e);
		} finally{
			try{
				input.close();
				out.close();
			}catch (Exception e) {
			}
			
		}
	}
	
	
	public static void main(String dd[]){
		GongGao g = new GongGao();
		g.setInfoid("f0073878-e87d-4594-b285-b963453e4e02");
		new PicTask(g ).run();
	}
	
}