package com.ccjt.ejy.web.quartz.job;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.alibaba.fastjson.JSON;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.service.SQL;
import com.ccjt.ejy.web.vo.GongGao;

public class IndexInfoJob extends QuartzJobBean {

	private static Logger log = LogManager.getLogger(IndexInfoJob.class);

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		update_cjgg();
		statistics();
	}
	
	public void update_cjgg() {
		try {
			log.info("update cjgg cache....");
			List<GongGao> list = jdbc.beanList(SQL.index_cjgg_info_sql_20_rows,GongGao.class);
			long now = System.currentTimeMillis();
			for(GongGao gongGao : list) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                Date cjdate = sdf.parse(gongGao.getChengjiaodate());
                if(now - cjdate.getTime() >= 1000 * 60 * 60 * 24) {
                	gongGao.setBeforeTimeUnit("天前");
                	gongGao.setBeforeTime(((now - cjdate.getTime()) / (1000 * 60 * 60 * 24)) + "");
                } else if(now - cjdate.getTime() >= 1000 * 60 * 60) {
                	gongGao.setBeforeTimeUnit("小时前");
                	gongGao.setBeforeTime(((now - cjdate.getTime()) / (1000 * 60 * 60)) + "");
                } else if(now - cjdate.getTime() >= 1000 * 60) {
                	gongGao.setBeforeTimeUnit("分钟前");
                	gongGao.setBeforeTime(((now - cjdate.getTime()) / (1000 * 60)) + "");
                }
			}
			String cache = JSON.toJSONString(list);
			DBCacheManage.set(RedisKeys.KEY_DB_CACHE_INDEX_CJGG_20_ROWS,cache);
		} catch (Exception e) {
			log.error("更新最新成交公告cache出错:", e);
		} finally {
			ConnectionFactory.close();
		}
	}
		
	/**
	 * 首页数量统计
	 * @return
	 */
	public Map<String,Object> statistics(){
		Map<String,Object> map = new HashMap<String, Object>();
		log.info("update 统计信息 cache....");
		try {
			//入驻：招标机构数量
			int zbjg = jdbc.getInteger("Select Count(1) from VIEW_HuiYuan_AllZfcgDaiLi Where AuditStatus='3'");
			map.put("zbjg", zbjg);
			//入驻：产权交易机构数量
			int cqjg = jdbc.getInteger("Select Count(1) from View_HuiYuan_AllPaiMaiDaiLi Where AuditStatus='3'");
			map.put("cqjg", cqjg);
			//供应商
			int gys = jdbc.getInteger("Select Count(1) from VIEW_HuiYuan_AllGongYingShang Where AuditStatus='3'");
			
			gys += 1800;
			map.put("gys", gys);
			//竞买人
			int jmr = jdbc.getInteger("Select Count(1) from VIEW_HuiYuan_AllJingJiaDW Where AuditStatus='3'");
			
			jmr += 364;
			map.put("jmr", jmr);
            //入驻会员总数
			map.put("rzhy_tj", zbjg + cqjg + gys + jmr);
			
			//已完成招标采购：项目数量
			int csfw = 5;
            int cshw = 369;
			int zbcg_tj = jdbc.getInteger("Select Count(1) from Zfcg_BiaoDuan Where IsNull(IsLiuBiao,'0')<>'1' And zhongbiaoprice<>0 And zhongbiaodwmc<>'' and BiaoDuanGuid in (Select b.BiaoDuanGuid From Zfcg_CaiGouJH a inner join ZFCG_CaiGouItem b on a.ShouLiGuid=b.ShouLiGuid)");
			zbcg_tj = zbcg_tj + csfw + cshw;
			map.put("zbcg_tj", zbcg_tj);
			
			//已完成招标采购：工程
            int gc = jdbc.getInteger("Select Count(1) from Zfcg_BiaoDuan Where IsNull(IsLiuBiao,'0')<>'1' And zhongbiaoprice<>0 And zhongbiaodwmc<>'' and BiaoDuanGuid in (Select b.BiaoDuanGuid From Zfcg_CaiGouJH a inner join ZFCG_CaiGouItem b on a.ShouLiGuid=b.ShouLiGuid where a.XiangMuLBCode like 'B%')");
            map.put("gc",gc);
            
            //已完成招标采购：货物
            int hw = jdbc.getInteger("Select Count(1) from Zfcg_BiaoDuan Where IsNull(IsLiuBiao,'0')<>'1' And zhongbiaoprice<>0 And zhongbiaodwmc<>'' and BiaoDuanGuid in (Select b.BiaoDuanGuid From Zfcg_CaiGouJH a inner join ZFCG_CaiGouItem b on a.ShouLiGuid=b.ShouLiGuid where a.XiangMuLBCode like 'A%')");
            hw += cshw;
            map.put("hw",hw );
            
            //已完成招标采购：服务
            int fw = jdbc.getInteger("Select Count(1) from Zfcg_BiaoDuan Where IsNull(IsLiuBiao,'0')<>'1' And zhongbiaoprice<>0 And zhongbiaodwmc<>'' and BiaoDuanGuid in (Select b.BiaoDuanGuid From Zfcg_CaiGouJH a inner join ZFCG_CaiGouItem b on a.ShouLiGuid=b.ShouLiGuid where a.XiangMuLBCode like 'C%')");
            fw += csfw;
            map.put("fw",fw);

            //已完成产权交易：标的数量  
            //房地产
            int fccs = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='FC'");
            fccs += 282;
            map.put("fccs",fccs);
            
            //股权
            int gq = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='GQ'");
            gq += 166;
            map.put("gq",gq);
            
            //二手车
            int escl = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='CL'");
            escl += 169;
            map.put("escl",escl);
            
            //废旧物资
            int wz = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='WZ'");
            wz += 364;
            map.put("wz",wz);
            
            //储备粮食
            int ls = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='LS'");
            ls += 34;
            map.put("ls",ls);
            
            //资产出售
            int zc = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='ZC'");
            zc = zc + 58;
            
            //工美藏品
            int gmcp = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='CP'");
            gmcp += 25;
            map.put("gmcp",gmcp);
            
            //花木交易
            int hmjy = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='5'");
            hmjy += 49;
            map.put("hmjy",hmjy);
            
            //其他资产
            int qt = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='QT'");
            qt += 21;
            map.put("qt",qt);
            
            //房产招租
            int fczz = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='FCZZ'");
            map.put("fczz",fczz);
            
            //土地
            int td = jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='TD'");
            map.put("td",td);
            
            //增资扩股
            int zzkg = 2 + jdbc.getInteger("Select Count(1) from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='ZZKG'");;
            
            map.put("zzkg", zzkg);
            
            //产权交易_统计
            Integer cqjy_tj = fccs + gq + escl + ls + gmcp + hmjy + qt + wz + fczz + zzkg;
            map.put("cqjy_tj", cqjy_tj);
            
            //已完成产权交易交易：金额合计
            BigDecimal jehj = jdbc.getBigDecimal("select cast(SUM(ChengJiaoPrice)/10000 as decimal(18,2)) from CQJY_ChengJiaoGongGao where AuditStatus='3' and XiaQuCode <> '101021' and ProjectGuid in (Select ProjectGuid From CQJY_GongChengInfo where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1')");
            
            jehj = jehj.add(new BigDecimal(1046600));// + 40000 + 1006600;
            
            java.text.DecimalFormat format = new java.text.DecimalFormat("###,###,###,###,###.##");
            
            map.put("jehj", format.format(jehj));
            
            //已完成招标采购：金额合计
            BigDecimal zbcg_jehj = jdbc.getBigDecimal("Select cast(Sum(ZhongBiaoPrice)/10000 as decimal(18,2)) from Zfcg_BiaoDuan Where IsNull(IsLiuBiao,'0')<>'1' And zhongbiaoprice<>0 And zhongbiaodwmc<>''");
            zbcg_jehj = zbcg_jehj.add(new BigDecimal(38000));            
            map.put("zbcg_jehj", format.format(zbcg_jehj));            
            DBCacheManage.set(RedisKeys.KEY_DB_CACHE_INDEX_TJXX,JSON.toJSONString(map));			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.close();
		}		
		return map;
	}
}
