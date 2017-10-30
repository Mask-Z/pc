package com.ccjt.ejy.web.quartz.job;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.alibaba.fastjson.JSON;
import com.ccjt.ejy.web.cache.redis.JedisTemplate;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.commons.cache.RedisTemplateFactory;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.service.SQL;
import com.ccjt.ejy.web.vo.GongGao;
import com.ccjt.ejy.web.vo.Jjdt;

public class JJDTInfoJob extends QuartzJobBean {

	private static Logger log = LogManager.getLogger(JJDTInfoJob.class);

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		
		cqjy_jjdt();
		
		zbcg_jjdt();
		
	}
	
	
	public void cqjy_jjdt(){
		
		Map<String,String> redis_date = new HashMap<String, String>();
		JedisTemplate redis = null;

//		System.out.println(new DateTime().toString("yyyy-MM-dd HH:mm:ss.SSS"));
		
		try {
			log.info("update jjdt cache....");
			redis = RedisTemplateFactory.template.getJedisTemplate();
			
			String sql = SQL.jjdt_cqjy_sql;
			sql += "  ORDER BY status asc, CASE WHEN status!='3' then (endtime) end asc, "
				 + " CASE WHEN status='3' then (endtime) end desc,start desc; ";
			List<Jjdt> list = jdbc.beanList(sql, Jjdt.class);
			
			
//			System.out.println("start" + new DateTime().toString("yyyy-MM-dd HH:mm:ss.SSS"));
			
//			redis.del(RedisKeys.KEY_JJDT);
			String uuid = UUID.randomUUID().toString();//随机生成一个key
			String key = RedisKeys.KEY_JJDT + uuid;
			String field_key = RedisKeys.KEY_JJDT_FIELD + uuid;
			List<String> field_list = new ArrayList<String>();
			for(Jjdt dt : list){
				
				if(!dt.getHasbid().equals(1)){//是否有报价
					dt.setMaxprice("-");
				}
				
				StringBuffer sb = new StringBuffer();
				//redis fieldname = 状态+项目类型+
				sb.append(dt.getStatus()).append("ζ").append(dt.getProjecttype()).append("ζ").append(dt.getObject()).append("ζ").append(dt.getOrgname());
				sb.append("ζ").append(dt.getSheng()).append("ζ").append(dt.getShi()).append("ζ").append(dt.getBiaodino());
				
				String fieldName = sb.toString();
				redis_date.put(fieldName, dt.toString());
				field_list.add(fieldName);
				
			}
			
			String[] fs = new String[field_list.size()];
			Collections.reverse(field_list);
			redis.lpush(field_key,field_list.toArray(fs));
			
			redis.hmset(key, redis_date);
			
			redis.set(RedisKeys.KEY_JJDT_key, uuid);//将最新的uuid放入缓存
			
//			log.info("竞价大厅同步,共同步了: " + redis.llen(key));
			
			
			try {
				Set<String> keys = redis.keys(RedisKeys.KEY_JJDT + "*");
				for (String k : keys) {
					if (!key.equals(k)) {
						redis.del(k);
					}
				}

				keys = redis.keys(RedisKeys.KEY_JJDT_FIELD + "*");
				for (String k : keys) {
					if (!field_key.equals(k)) {
						redis.del(k);
					}
				}
				
			}catch (Exception e) {
				log.error("删除key出错:" ,e );
			}
			
		} catch (Exception e) {
			log.error("更新竞价大厅cache出错:" ,e );
		} finally {
			ConnectionFactory.close();
			redis_date.clear();
			
		}
		
	}
	
	public void zbcg_jjdt(){
		

		String sql = "select title,projectnum,jingjia_start as jingjiastartdate,jingjia_end,state,zgj,infoid from view_infomain_zbcg_jjdt temp_4 where 1=1 ";
        sql += "  ORDER BY state asc,jingjia_start desc";		
		
		try {
            
            List<GongGao> jygg_list = jdbc.beanList(sql,0,8, GongGao.class);
            
            DBCacheManage.set(RedisKeys.JJDT_ZBCG_KEY, JSON.toJSONString(jygg_list));
			
		} catch (Exception e) {
			log.error("更新招标采购竞价大厅cache出错:" ,e );
		} finally {
			ConnectionFactory.close();
			
		}
		
	}
	
}
