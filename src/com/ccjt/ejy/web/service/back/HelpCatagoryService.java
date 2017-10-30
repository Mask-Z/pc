package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class HelpCatagoryService {
	private static Logger log = LogManager.getLogger(HelpCatagoryService.class);
	public List<Map<String,Object>> getCatagory(String type){
		String sql="";
		if(type.equals("新闻中心")){//新闻中心--》平台公告\曝光台\业界资讯
			 sql = "select CategoryNum,CategoryName from  WebDB_Category where CategoryNum in( '026005002','028','006')";
		}else if(type.equals("加盟机构")){//加盟机构-->加盟优势\加盟条件加盟流程
			sql = "select CategoryNum,CategoryName from WebDB_Category where CategoryNum like '014%' and CategoryNum!='014'";
		}else if(type.equals("政策法规")){//政策法规-->招标采购\产权交易
			sql = "select CategoryNum,CategoryName from WebDB_Category where CategoryNum like '032%' and CategoryNum!='032'";
		}
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		try {
			list = jdbc.mapList(sql);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return list;
	}
}
