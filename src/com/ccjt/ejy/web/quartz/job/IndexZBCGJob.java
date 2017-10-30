package com.ccjt.ejy.web.quartz.job;

import com.alibaba.fastjson.JSON;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.service.SQL;
import com.ccjt.ejy.web.vo.FastCaiGou;
import com.ccjt.ejy.web.vo.GongGao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

public class IndexZBCGJob extends QuartzJobBean {

	private static Logger log = LogManager.getLogger(IndexZBCGJob.class);

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		
		update_zbcg_zbgg();
		update_zbcg_cjgg();
		index_kjcg_cjgg(8);
		index_kjcgs(8);
	}
	
	private void update_zbcg_zbgg() {
		try {
			log.info("招标采购缓存开始.....");
			List<FastCaiGou> list = jdbc.beanList(SQL.index_zbcg_zbgg_sql,FastCaiGou.class);
			String cache = JSON.toJSONString(list);
			DBCacheManage.set(RedisKeys.KEY_DB_CACHE_ZBCG_ZBGG,cache);
			log.info("招标采购缓存结束.....");
		} catch (Exception e) {
			log.error("更新最新招标采购cache出错:", e);
		} finally {
			ConnectionFactory.close();
		}
	}

	private void update_zbcg_cjgg(){
		try {
			log.info("招标采购成交公告缓存开始.....");
			List<FastCaiGou> list = jdbc.beanList(SQL.index_zbcg_cjgg_gc_sql,FastCaiGou.class);
			String cache = JSON.toJSONString(list);
			DBCacheManage.set(RedisKeys.KEY_DB_CACHE_ZBCG_CJGG_GC,cache);//工程

			list=jdbc.beanList(SQL.index_zbcg_cjgg_hw_sql,FastCaiGou.class);
			cache = JSON.toJSONString(list);
			DBCacheManage.set(RedisKeys.KEY_DB_CACHE_ZBCG_CJGG_HW,cache);//货物

			list=jdbc.beanList(SQL.index_zbcg_cjgg_fw_sql,FastCaiGou.class);
			cache = JSON.toJSONString(list);
			DBCacheManage.set(RedisKeys.KEY_DB_CACHE_ZBCG_CJGG_FW,cache);//服务

			log.info("招标采购成交公告缓存结束.....");
		} catch (Exception e) {
			log.error("更新最新招标采购成交公告cache出错:", e);
		} finally {
			ConnectionFactory.close();
		}
	}
	
	public void index_kjcgs(Integer count){
	    List<FastCaiGou> caiGous = new ArrayList<FastCaiGou>();
	    try {
	        String sql = "SELECT a.baomingstart as baomingstart_str,a.baomingend as baomingend_str ,b.projectNum,* FROM view_web_v2_kuaijiecaigou a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID  where 1=1 order by baomingstart desc  offset 0 rows  FETCH NEXT "+count+" ROWS ONLY  " ;//招标采购成交公示_服务
	        caiGous = jdbc.beanList(sql,FastCaiGou.class);
	        
	        DBCacheManage.set(RedisKeys.index_kjcgs,JSON.toJSONString(caiGous));
	        System.out.println(JSON.toJSONString(caiGous));
	        
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			ConnectionFactory.close();
		}
	}
	
	public void index_kjcg_cjgg(Integer rows){
	    List<FastCaiGou> gg = new ArrayList<FastCaiGou>();
	    try {
	        String sql = "SELECT top "+rows
					+" a.BiaoDuanGuid as infoid ,a.biaoDuanBH AS  projectNum"
					+" ,vm.title BiaoDuanName "
					+" ,a.XiaQuCode "
					+" ,c.CityName as xiaquname "
					+" ,a.BaoMingFromDate as baomingstart,a.BaoMingFromDate as baomingstart_str "
					+" ,a.BaoMingEndDate as baomingend ,a.BaoMingEndDate as baomingend_str"
					+" ,a.XiangMuLBCode  as categorynum "
					+" ,a.XiangMuLBName as categoryname,vm.ClickTimes "
					+" FROM Zfcg_BiaoDuan a "
					+" INNER JOIN Zfcg_Project b ON a.ProjectGuid = b.ProjectGuid "
					+" INNER JOIN Sys_XiaQu c ON a.XiaQuCode =c.CityCode "
					+" INNER JOIN  View_InfoMain vm on vm.InfoID = a.BiaoDuanGuid "
					+" WHERE ISNULL(a.IsConFirmZhongBiaoDW , '0')='1' "
					+" AND b.AuditStatus ='3' "
					+" and a.BaoMingFromDate is not null and  a.BaoMingEndDate  is not null "
					+" order by a.BaoMingFromDate desc "  ;
	        gg = jdbc.beanList(sql, FastCaiGou.class);
	        
	        System.out.println(JSON.toJSONString(gg));
	        
	        DBCacheManage.set(RedisKeys.index_kjcg_cjgg,JSON.toJSONString(gg));
	        
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			ConnectionFactory.close();
		}
	}

}
