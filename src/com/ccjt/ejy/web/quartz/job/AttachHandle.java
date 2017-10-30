package com.ccjt.ejy.web.quartz.job;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.Global;
import com.ccjt.ejy.web.commons.ImgCompress;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.service.PicService;
import com.ccjt.ejy.web.vo.DBPics;
import com.ccjt.ejy.web.vo.MediaInfo;
import com.ccjt.ejy.web.vo.Pic;

public class AttachHandle {
	
	private static Logger log = LogManager.getLogger(AttachHandle.class);
	
	static final String pic_web_root = "ejypic";
	
	public static int width = 480;//380
	public static int height = 360;//310
	/**
	 * 统一附件处理
	 * @param infoid
	 * @return
	 */
	public List<DBPics> attach_Handle(String infoid) {
	    
		List<DBPics> picList = null;
	    
		try {
			
	        String sql = "SELECT Attach_ConnectionStringName dbname, attachFileName filename,ClientType type,attachguid fileid FROM ZHGL_AttachInfo_YeWu WHERE ClientGuid = ?";
	        
	        picList = jdbc.beanList(sql, DBPics.class, infoid);
	
	        if(infoid.startsWith("bttp")){
	        	infoid = infoid.substring(4);
            }
	        log.error("handle pic : " + infoid );
	        if (picList != null) {
	            for (DBPics pic : picList) {
	            	log.error(infoid + ", pic size : " + picList.size() );
	            	pic.setInfoid(infoid);
	            	
	                File dir = new File(Global.gonggao_file_dir  + File.separator + pic.getType() + File.separator + pic.getFileid() + File.separator);
	
	                if(!dir.exists()){
	                    dir.mkdirs();
	                }
	                
	                File file = new File(dir.getAbsolutePath() + File.separator + pic.getFilename());
	                
	                log.error(infoid + ", pic name : " + pic.getFilename() );
	                
	                pic.setFile(file);
	                
	                pic.setRelativePath("/" +pic_web_root + File.separator + pic.getType() + File.separator + pic.getFileid() + File.separator + pic.getFilename());
	                
	                if(!file.exists()){//文件不存在
	                	log.error(infoid + ", write to disk : " + pic.getFilename() );
	                    fileNotEX(pic);//从数据库读出文件并写文件
	                }else{
	                	log.error(infoid + ", file exist : " + pic.getFilename() );
	                }
	                
	                
	                String relativePath = pic.getFile().getAbsolutePath().substring(0, pic.getFile().getAbsolutePath().lastIndexOf(File.separator));
	                
	                
	                if("JY01".equals(pic.getType())){
	                	 String sPath = relativePath + File.separator + "s_"+pic.getFilename();
	                     sPath = "/" + pic_web_root + sPath.replace(Global.gonggao_file_dir, "");
	                     
	                     jdbc.insert("insert into [web2.0].dbo.web_gonggao_pic(guid,path,bpath,type) values(?,?,?,?)", pic.getInfoid(),sPath,pic.getRelativePath(),pic.getType());     
	                }else{
	                	 jdbc.insert("insert into [web2.0].dbo.web_gonggao_pic(guid,path,type) values(?,?,?)", pic.getInfoid(), pic.getRelativePath(),pic.getType());
	                }
	               
	                
	                ConnectionFactory.commit();
	                
	                
	            }
	        }
	
	    } catch (Exception e) {
	    	ConnectionFactory.rollback();
	        e.printStackTrace();
	    }
	    
	    return picList;
	}
	
	
	/**
	 * 文件不存在
	 * @param pic
	 */
	private void fileNotEX(DBPics pic){
	    try{
	        
	        String con_url = jdbc                       // 获取链接字符串
	                .getString(
	                        "select Attach_ConnectionString from Frame_AttachConfig where Attach_ConnectionStringName=?",
	                        pic.getDbname());
	
	        if (StringUtils.isNotBlank(con_url)) {
	
	            Connection conn = initConn(con_url);
	
	            getFile(conn, pic);
	
	        }
	        
	    }catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	}
	
	private Connection initConn(String con_url) {
	    Connection conn = null;
	    String con_prams[] = con_url.split(";");
	    if (con_prams != null && con_prams.length == 5) {
	
	        String dbname = con_prams[0].substring(con_prams[0].indexOf("=") + 1);
	        String dburl = con_prams[1].substring(con_prams[1].indexOf("=") + 1);
	        String dbuser = con_prams[2].substring(con_prams[2].indexOf("=") + 1);
	        String dbpwd = con_prams[3].substring(con_prams[3].indexOf("=") + 1);
	        String dbconurl = "jdbc:sqlserver://" + dburl + ":1433;DatabaseName=" + dbname;
	        conn = getcon(dbconurl, dbuser, dbpwd);
	    }
	
	    return conn;
	}
	
	private Connection getcon(String url, String user, String pwd) {
	    Connection conn = null;
	    try {
	        conn = DriverManager.getConnection(url, user, pwd);
	
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return conn;
	}
	
	private void getFile(Connection con, DBPics pic) {
	    InputStream in = null;
	    FileOutputStream out = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        if (con != null && pic != null) {
	            pstmt = con.prepareStatement("select Content from Frame_AttachStorage where AttachGuid=?");
	            pstmt.setString(1, pic.getFileid());
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                in = rs.getBinaryStream(1);
	                out = new FileOutputStream(pic.getFile());
	                log.error("to disk :" + pic.getFile());
	                IOUtils.copy(in, out);
	                //生成缩略图
	                ImgCompress imgCom = new ImgCompress();
//	                System.out.println(pic.getFile());
	                String relativePath = pic.getFile().getAbsolutePath().substring(0, pic.getFile().getAbsolutePath().lastIndexOf(File.separator));
	                
	                
	                if("JY01".equals(pic.getType())){
	                	 String sPath = relativePath + File.separator + "s_"+pic.getFilename();
	                     File sFile = new File(sPath);
	                     imgCom.resizeFix(width,height,pic.getFile(),sFile);
	                     
	                }
	               
	                
	                ConnectionFactory.commit();
	            }
	        }
	    } catch (Exception e) {
	    	ConnectionFactory.rollback();
	        e.printStackTrace();
	    } finally {
	    	ConnectionFactory.close();
	        DbUtils.closeQuietly(con, pstmt, rs);
	        try {
	            if (in != null)
	                in.close();
	            if (out != null)
	                out.close();
	        } catch (Exception e) {
	        }
	    }
	}
	
    public static void main(String dd[]) {

    	AttachHandle ah = new AttachHandle();
//    	List<DBPics> a = ah.attach_Handle("0df16f76-e81a-4bd0-857a-385bdd1f0793");
    	List<DBPics> a = ah.attach_Handle("3c5f9208-c0cf-4f5b-8700-12e2a3d09cbf");
//    	List<DBPics> a = ah.attach_Handle("2b30a0d1-e038-42ed-9792-0c479e88b894");
    	
    	System.out.println(a);
        
//      List<DBPics> dddd = pp.attach_Handle("45aa9379-7b90-4e77-ac1e-e30059e5dfb8");
//      System.out.println(dddd);
//        System.out.println(mi);
    }
}

