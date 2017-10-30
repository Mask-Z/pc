package com.ccjt.ejy.web.quartz.job;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;

public class DataSyncJob extends QuartzJobBean {

	private static Logger log = LogManager.getLogger(DataSyncJob.class);
	
	String update_cqjy_sql = " UPDATE infomain_jygg_v2 " +
 " SET " +
 " ChildZiChanCount = view_infomain_jygg_v2.ChildZiChanCount, " +
 " IsCommonTemplate = view_infomain_jygg_v2.IsCommonTemplate, " +
 " danw  = view_infomain_jygg_v2.danw, " +
 " OldProjectGuid  = view_infomain_jygg_v2.OldProjectGuid, " +
 " HotLabelCode  = view_infomain_jygg_v2.HotLabelCode, " +
 " HotLabelName  = view_infomain_jygg_v2.HotLabelName, " +
 " HasInvestIntent = view_infomain_jygg_v2.HasInvestIntent," +
 " CurrencyUnit = view_infomain_jygg_v2.CurrencyUnit," +
 " hasBuyIntent = view_infomain_jygg_v2.hasBuyIntent," +
 " hasPriority = view_infomain_jygg_v2.hasPriority," +
 " BelongXiaQuCode = view_infomain_jygg_v2.BelongXiaQuCode," +
 " JiGZiChanLxr = view_infomain_jygg_v2.JiGZiChanLxr," +
 " JiGZiChanLxTel = view_infomain_jygg_v2.JiGZiChanLxTel," +
 " JiGZiChanLxAddress = view_infomain_jygg_v2.JiGZiChanLxAddress," +
 " description = view_infomain_jygg_v2.description," +
 " ZhongDContent = view_infomain_jygg_v2.ZhongDContent," +
 " ShouRangZGTJ = view_infomain_jygg_v2.ShouRangZGTJ," +
 " ZhuanRangfTJ = view_infomain_jygg_v2.ZhuanRangfTJ," +
 " shiname = view_infomain_jygg_v2.shiname," +
 " shengname = view_infomain_jygg_v2.shengname," +
 " AllowMoreJqxt = view_infomain_jygg_v2.AllowMoreJqxt," +
 " JiaoNaBZJMoney = view_infomain_jygg_v2.JiaoNaBZJMoney," +
 " BaoLiuPrice = view_infomain_jygg_v2.BaoLiuPrice," +
 " jjia_status = view_infomain_jygg_v2.jjia_status," +
 " ProjectNo = view_infomain_jygg_v2.ProjectNo," +
 " ZhuanTingGuid = view_infomain_jygg_v2.ZhuanTingGuid," +
 " SystemType = view_infomain_jygg_v2.SystemType," +
 " price = view_infomain_jygg_v2.price," +
 " ClickTimes = view_infomain_jygg_v2.ClickTimes," +
 " infoid = view_infomain_jygg_v2.infoid," +
 " projectcontroltype = view_infomain_jygg_v2.projectcontroltype," +
 " ProjectGuid = view_infomain_jygg_v2.ProjectGuid," +
 " IsMianY = view_infomain_jygg_v2.IsMianY," +
 " zt = view_infomain_jygg_v2.zt," +
 " jingjiafangshi = view_infomain_jygg_v2.jingjiafangshi," +
 " isfrompricexs = view_infomain_jygg_v2.isfrompricexs," +
 " guapaiprice = view_infomain_jygg_v2.guapaiprice," +
 " cjgg_guid = view_infomain_jygg_v2.cjgg_guid," +
 " XiaQuName = view_infomain_jygg_v2.XiaQuName," +
 " XiaQuCode = view_infomain_jygg_v2.XiaQuCode," +
 " jingjia_start = view_infomain_jygg_v2.jingjia_start," +
 " jingjia_end = view_infomain_jygg_v2.jingjia_end," +
 " ispllr = view_infomain_jygg_v2.ispllr," +
 " gonggaofromdate = view_infomain_jygg_v2.gonggaofromdate," +
 " gonggaotodate = view_infomain_jygg_v2.gonggaotodate," +
 " title = view_infomain_jygg_v2.title," +
 " sheng = view_infomain_jygg_v2.sheng," +
 " shi = view_infomain_jygg_v2.shi," +
 " jygg_guid = view_infomain_jygg_v2.jygg_guid," +
 " projectNum = view_infomain_jygg_v2.projectNum," +
 " CategoryName = view_infomain_jygg_v2.CategoryName," +
 " click = view_infomain_jygg_v2.click," +
 " CQYWType = view_infomain_jygg_v2.CQYWType," +
 " categorynum = view_infomain_jygg_v2.categorynum," +
 " IsTop = view_infomain_jygg_v2.IsTop," +
 " OrderNum = view_infomain_jygg_v2.OrderNum," +
 " infodate = view_infomain_jygg_v2.infodate," +
 " PubInWebDate = view_infomain_jygg_v2.PubInWebDate," +
 " SysID = view_infomain_jygg_v2.SysID," +
 " chengjiaodate = view_infomain_jygg_v2.chengjiaodate," +
 " zzkg_zztype = view_infomain_jygg_v2.zzkg_zztype," +
 " zzkg_guapaitype = view_infomain_jygg_v2.zzkg_guapaitype," +
 " zzkg_guapaiprice = view_infomain_jygg_v2.zzkg_guapaiprice," +
 " zzkg_guapaidj = view_infomain_jygg_v2.zzkg_guapaidj" +
 " from infomain_jygg_v2,view_infomain_jygg_v2" +
 " WHERE" +
 " infomain_jygg_v2.infoid = view_infomain_jygg_v2.infoid" +
 " and infomain_jygg_v2.infodate > GETDATE()-365";


	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		try {
			update_cqjy();
			update_zbcg();
		} catch (Exception e) {
			log.error("更新infomain_jygg_v2出错:" ,e );
		} finally {
			ConnectionFactory.close();
		}
	}
	
	/**
	 * 将试图view_infomain_jygg_v2转为表infomain_jygg_v2
	 */
	public void update_cqjy(){
		try{
			int size = jdbc.update(update_cqjy_sql);
			
			ConnectionFactory.commit();
		}catch (Exception e) {
			ConnectionFactory.rollback();
			log.error("update infomain_jygg_v2 error :" ,e);
		}
		
		
		try{
			String add_sql = "insert into infomain_jygg_v2 select * from view_infomain_jygg_v2 where infoid not in ( select infoid from infomain_jygg_v2 )";
			int size = jdbc.update(add_sql);
			
			ConnectionFactory.commit();
		}catch (Exception e) {
			ConnectionFactory.rollback();
			log.error("insert infomain_jygg_v2 error :" ,e);
		}
		
		try{
			String add_sql = "delete from infomain_jygg_v2 where infoid  not in ( select infoid from view_infomain_jygg_v2 )";
			int size = jdbc.update(add_sql);
			
			ConnectionFactory.commit();
		}catch (Exception e) {
			ConnectionFactory.rollback();
			log.error("delete infomain_jygg_v2 error :" ,e);
		}
		
	}
	
	String update_zbcg_sql = " UPDATE web_v2_zbcg " +
			 " SET baomingstart = view_web_v2_zbcg.baomingstart, " +
			 " baomingend = view_web_v2_zbcg.baomingend, " +
			 " BiaoDuanName = view_web_v2_zbcg.BiaoDuanName, " +
			 " XiaQuCode = view_web_v2_zbcg.XiaQuCode, " +
			 " xiaquname = view_web_v2_zbcg.xiaquname, " +
			 " infoid = view_web_v2_zbcg.infoid, " +
			 " ClickTimes = view_web_v2_zbcg.ClickTimes, " +
			 " CategoryName = view_web_v2_zbcg.CategoryName, " +
			 " CategoryNum = view_web_v2_zbcg.CategoryNum, " +
			 " InfoDate = view_web_v2_zbcg.InfoDate " +
			 " from web_v2_zbcg,view_web_v2_zbcg" +
			 " WHERE" +
			 " web_v2_zbcg.infoid = view_web_v2_zbcg.infoid" +
			 " and web_v2_zbcg.infodate > GETDATE()-365";


	/**
	 * 将试图view_web_v2_zbcg转为表web_v2_zbcg
	 */
	public void update_zbcg(){
		try{
			int size = jdbc.update(update_zbcg_sql);
			
			ConnectionFactory.commit();
		}catch (Exception e) {
			ConnectionFactory.rollback();
			log.error("update infomain_jygg_v2 error :" ,e);
		}
		
		
		try{
			String add_sql = "insert into web_v2_zbcg select * from view_web_v2_zbcg where infoid not in ( select infoid from web_v2_zbcg )";
			int size = jdbc.update(add_sql);
			
			ConnectionFactory.commit();
		}catch (Exception e) {
			ConnectionFactory.rollback();
			log.error("insert infomain_jygg_v2 error :" ,e);
		}
		
		try{
			String add_sql = "delete from web_v2_zbcg where infoid  not in ( select infoid from view_web_v2_zbcg )";
			int size = jdbc.update(add_sql);
			
			ConnectionFactory.commit();
		}catch (Exception e) {
			ConnectionFactory.rollback();
			log.error("delete infomain_jygg_v2 error :" ,e);
		}
		
	}
	
	public static void main(String dd[]){
		new DataSyncJob().update_zbcg();
	}
	
}
