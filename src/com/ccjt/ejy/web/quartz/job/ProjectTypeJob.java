package com.ccjt.ejy.web.quartz.job;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.alibaba.fastjson.JSON;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;

public class ProjectTypeJob extends QuartzJobBean {

	private static Logger log = LogManager.getLogger(ProjectTypeJob.class);

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		try {
			log.info("update projectType cache....");
			String sql = "SELECT ItemText as itemText,ItemValue as itemValue From Code_Items where CodeId = '758'";
			List<Map<String, Object>> list = jdbc.mapList(sql);
//			
//			Map map = new HashMap<String, Object>();
//			map.put("itemText","废旧物资(其他)");
//			map.put("itemValue","ZC");			
//			list.add(map);
//			
//			map = new HashMap<String, Object>();
//			map.put("itemText","花木交易(其他)");
//			map.put("itemValue","1");			
//			list.add(map);
//			
//			map = new HashMap<String, Object>();
//			map.put("itemText","花木交易(其他)");
//			map.put("itemValue","4");			
//			list.add(map);
//			
//			map = new HashMap<String, Object>();
//			map.put("itemText","花木交易(其他)");	
//			map.put("itemValue","0");			
//			list.add(map);
//			
			String projectTypeList = JSON.toJSONString(list);
			DBCacheManage.set(RedisKeys.WEB_DATA_CACHE_PROJECTTYPE, projectTypeList);
		} catch (Exception e) {
			log.error("更新产权交易类别cache出错:",e);
		} finally {
			ConnectionFactory.close();
		}		
	}
}
