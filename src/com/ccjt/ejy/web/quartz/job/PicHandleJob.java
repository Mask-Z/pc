package com.ccjt.ejy.web.quartz.job;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.joda.time.DateTime;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.service.SQL;
import com.ccjt.ejy.web.vo.GongGao;

public class PicHandleJob extends QuartzJobBean {

	private static Logger log = LogManager.getLogger(PicHandleJob.class);
	
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		
		List<GongGao> list = null;
		try {
			AttachHandle ps = new AttachHandle();
			String now = new DateTime().toString("yyyy-MM-dd HH:mm:ss.SSS");
			String optime = jdbc.getString("select convert(nvarchar(23),optime, 121) from [web2.0].dbo.web_pic_handle where id=1");
			try{
				jdbc.update("update [web2.0].dbo.web_pic_handle set optime=? where id=1 ",now);
				ConnectionFactory.commit();
			}catch (Exception e) {
				ConnectionFactory.rollback();
			}
			log.warn("lastupdate=" + optime);
			
			list = jdbc.beanList(SQL.plgp_chengjiao_gonggao_pic_handle_sql + " where temp_1.lastupdate >= ? " ,GongGao.class,optime);
			log.error("批量挂牌................" + list);
			for(GongGao gonggao : list){
				log.error("handle pllr: " + gonggao.getInfoid());
				try{
					jdbc.execute("delete from [web2.0].dbo.web_gonggao_pic where guid=?", gonggao.getInfoid());
					ConnectionFactory.commit();
				}catch (Exception e) {
					ConnectionFactory.rollback();
				}
				
				ps.attach_Handle("bttp" + gonggao.getInfoid());
				
				new PicTask(gonggao).run();
				
			}
			list = jdbc.beanList(SQL.jiaoyi_gonggao_pic_handle_sql + " where temp_1.lastupdate > ?",GongGao.class,optime);

			//log.error("重点推荐,非批量挂牌交易公告图片................" + list);
			for(GongGao gonggao : list){
				log.error("handle: " + gonggao.getInfoid());
				try{
					jdbc.execute("delete from [web2.0].dbo.web_gonggao_pic where guid=?", gonggao.getInfoid());
					ConnectionFactory.commit();
				}catch (Exception e) {
					ConnectionFactory.rollback();
				}

				ps.attach_Handle("bttp" + gonggao.getInfoid());
				
				new PicTask(gonggao).run();
				
			}
//			
			list = jdbc.beanList(SQL.ypl_pic_handle_sql + " AND StartDate > ? ",GongGao.class,optime);
			log.error("预披露图片................" + list);
			for(GongGao gonggao : list){
				log.error("handle ypl: " + gonggao.getInfoid());
				try{
					jdbc.execute("delete from [web2.0].dbo.web_gonggao_pic where guid=?", gonggao.getInfoid());
					ConnectionFactory.commit();
				}catch (Exception e) {
					ConnectionFactory.rollback();
				}
				
				ps.attach_Handle("bttp" + gonggao.getInfoid());
				
				new PicTask(gonggao).run();
				
			}
//			

		} catch (Exception e) {
			log.error("定时任务执行出错 ", e);
			e.printStackTrace();
		} finally{
			ConnectionFactory.close();
		}
	}
	
	public static void main(String dd[]){
		try {
			new PicHandleJob().executeInternal(null);
		} catch (JobExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
