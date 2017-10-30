package com.ccjt.ejy.web.quartz.job;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.alibaba.fastjson.JSON;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.City;

public class CityJob extends QuartzJobBean {

	private static Logger log = LogManager.getLogger(CityJob.class);
	
    public static String cityList = "";
	
	public static String cityListWithEmpty = "";

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		try {
			log.info("uodate city cache .......");
			String sql = " select distinct sheng code,hc1.CityName name from view_infomain_jygg jygg inner join HuiYuan_City hc1 on hc1.CityCode = jygg.sheng order by sheng";
			List<City> list = jdbc.beanList(sql, City.class);
			for(City c : list) {
			    c.setSubCity(jdbc.beanList("select distinct shi code,hc1.CityName name from view_infomain_jygg jygg inner join HuiYuan_City hc1 on hc1.CityCode = jygg.shi where jygg.sheng = ? order by shi", City.class,c.getCode(),c.getCode()));
		    }
			String city = JSON.toJSONString(list);
			DBCacheManage.set(RedisKeys.WEB_DATA_CACHE_CITY, city);
		} catch (Exception e) {
			log.error("更新city cache出错:" ,e );
		} finally {
			ConnectionFactory.close();
		}
	}
}
