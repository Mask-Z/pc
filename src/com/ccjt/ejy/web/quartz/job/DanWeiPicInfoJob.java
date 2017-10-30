package com.ccjt.ejy.web.quartz.job;


import com.ccjt.ejy.web.cache.redis.JedisTemplate;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.commons.cache.RedisTemplateFactory;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.Logo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

public class DanWeiPicInfoJob extends QuartzJobBean {
	private static Logger log = LogManager.getLogger(DanWeiPicInfoJob.class);

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		log.info("logo任务开始...");
		Map<String, String> redis_logo = new HashMap<String, String>();
		String sql = "select jgmc,pic,bigpic,danweiname,danweiAddress,add_time from [web2.0].dbo.logo ";
		JedisTemplate redis = null;
		try {
			redis = RedisTemplateFactory.template.getJedisTemplate();
			List<Logo> jygg_list = jdbc.beanList(sql, Logo.class);

			for (Logo logo : jygg_list) {
				redis_logo.put(logo.getJgmc(), logo.toString());
			}
			redis.hmset(RedisKeys.COMPANY_LOGO_KEY, redis_logo);
			log.info("logo任务结束...");
		} catch (Exception e) {
			log.error("更新公司Logo cache出错:", e);
		} finally {
			ConnectionFactory.close();
			redis_logo.clear();

		}

	}

}
