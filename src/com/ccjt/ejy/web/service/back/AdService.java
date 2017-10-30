package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.quartz.job.AttachHandle;
import com.ccjt.ejy.web.vo.Ad;
import com.ccjt.ejy.web.vo.DBPics;
import com.ccjt.ejy.web.vo.MajorProject;

public class AdService {

	private static Logger log = LogManager.getLogger(AdService.class);

	public Map<String, Object> adList(Ad ad, Integer page, Integer rows) {

		Map<String, Object> m = new HashMap<String, Object>();
		List<Ad> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = " select * from [web2.0].dbo.ad where 1=1 ";

			if (ad.getTitle() != null) {
				sql += " and title like ?";
				params.add("%" + ad.getTitle() + "%");
			}

			if (ad.getAdtype() != null) {
				sql += " and adtype = ?";
				params.add(ad.getAdtype());
			}

			m.put("total", jdbc.getCount(sql, params.toArray()));

			sql += " order by order_no desc ";

			list = jdbc.beanList(sql, page, rows, Ad.class, params.toArray());
			m.put("rows", list);

		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}

		return m;

	}

	public Map<String, Object> majorProjectList(String city_id,Integer page, Integer rows) {

		Map<String, Object> m = new HashMap<>();
		List<MajorProject> list = null;
		try {
			int count = 0;
			String sheng_code = "";
        	String shi_code = "";
        	String area_sql = " and pmdl.AreaCode like ? ";
        	
			if(StringUtils.isNotBlank(city_id)){
        		shi_code = city_id.substring(0,4)+"__";
        		sheng_code = city_id.substring(0,2)+"____";
        	}
			
			
			String ordersql = " order by hd.ActSort ";
			
//			String ordersql = " ORDER BY hd.actsort asc,hd.ActivityBeginTime asc,hd.Row_ID desc ";
			
			String sql = "SELECT hd.Row_ID,hd.ActivityName,hd.ActivityCreator,hd.XiaQuCode,hd.RowGuid ,hd. ActivityBeginTime,hd.OutLinkAddr,hd.ActivityEndTime,hd.ActivityContent " +
					" FROM CQJY_ThemeActivities hd " +
					//" inner join Sys_XiaQu city on city.CityCode=hd.XiaQuCode " +
					//" inner join View_HuiYuan_AllPaiMaiDaiLi pmdl on pmdl.DanWeiGuid=city.RowGuid " +
					" WHERE 1 = 1";
			
			if(StringUtils.isNotBlank(shi_code)){
			
				sql = "select * from ( " +
						" select * from ( SELECT top 100 PERCENT 0 oid,hd.ActSort, hd.Row_ID,hd.ActivityName,hd.ActivityCreator,hd.XiaQuCode,hd.RowGuid ,hd. ActivityBeginTime,hd.OutLinkAddr,hd.ActivityEndTime,hd.ActivityContent " +
						" FROM CQJY_ThemeActivities hd " +
						" inner join Sys_XiaQu city on city.CityCode=hd.XiaQuCode " +
						" inner join View_HuiYuan_AllPaiMaiDaiLi pmdl on pmdl.DanWeiGuid=city.RowGuid " +
						" WHERE 1 = 1 and pmdl.AreaCode like ? " + ordersql +
						
						" ) as a " +
						" UNION ALL " +
						
						" select * from ( SELECT top 100 PERCENT 1 oid,hd.ActSort,hd.Row_ID,hd.ActivityName,hd.ActivityCreator,hd.XiaQuCode,hd.RowGuid ,hd. ActivityBeginTime,hd.OutLinkAddr,hd.ActivityEndTime,hd.ActivityContent " +
						" FROM CQJY_ThemeActivities hd " +
						" inner join Sys_XiaQu city on city.CityCode=hd.XiaQuCode " +
						" inner join View_HuiYuan_AllPaiMaiDaiLi pmdl on pmdl.DanWeiGuid=city.RowGuid " +
						" WHERE 1 = 1 and pmdl.AreaCode like ? and pmdl.AreaCode not like ? " + ordersql +
						" ) as b " +
						" UNION ALL " +
						
						" select * from ( SELECT top 100 PERCENT 2 oid,hd.ActSort, hd.Row_ID,hd.ActivityName,hd.ActivityCreator,hd.XiaQuCode,hd.RowGuid ,hd. ActivityBeginTime,hd.OutLinkAddr,hd.ActivityEndTime,hd.ActivityContent " +
						" FROM CQJY_ThemeActivities hd " +
						" inner join Sys_XiaQu city on city.CityCode=hd.XiaQuCode " +
						" inner join View_HuiYuan_AllPaiMaiDaiLi pmdl on pmdl.DanWeiGuid=city.RowGuid " +
						" WHERE 1 = 1 and pmdl.AreaCode not like ? " + ordersql + ") as c) as ttt_" ;
				count =  jdbc.getCount(sql,shi_code,sheng_code,shi_code,sheng_code);
				sql += " order by oid ,actsort ";
				list = jdbc.beanList(sql, page, rows, MajorProject.class,shi_code,sheng_code,shi_code,sheng_code);
				m.put("rows", list);
				
			}else{
				
				list = jdbc.beanList(sql + ordersql, page, rows, MajorProject.class);
				m.put("rows", list);
				count =  jdbc.getCount(sql);
				
			}

			m.put("total",count);
			
			List<DBPics> picList = new ArrayList<>();
			
			AttachHandle picService = new AttachHandle();
			
			for (MajorProject majorProject : list) {
				picList = picService.attach_Handle(majorProject.getRowGuid());
				if (null != picList && picList.size() > 0) {
					majorProject.setPicUrl(picList.get(0).getRelativePath());
				}
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return m;

	}

	public Ad getAd(Integer id) {
		Ad ad = null;
		try {
			if (id != null) {
				String sql = " select t1.*,CONVERT(VARCHAR(19),t1.add_time,120) as addTime,t2.content from [web2.0].dbo.ad t1 left join [web2.0].dbo.ad_text t2 on t1.id=t2.ad_id where t1.id=? ";
				ad = jdbc.bean(sql, Ad.class, id);
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}

		return ad;
	}

	public MajorProject getMajorProject(Integer row_id) {
		MajorProject majorProject = null;
		try {
			if (row_id != null) {
				String sql = "SELECT ActivityName,ActivityCreator,XiaQuCode,RowGuid,Row_ID," +
						"CONVERT(nvarchar(20),ActivityBeginTime,20) as ActivityBeginTime,OutLinkAddr," +
						"CONVERT(nvarchar(20),ActivityEndTime,20) as ActivityEndTime,ActivityContent "
						+ "FROM CQJY_ThemeActivities where Row_ID = ?";
				majorProject = jdbc.bean(sql, MajorProject.class, row_id);
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}

		return majorProject;
	}

	public Map<String, Object> saveAd(Ad ad) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			if (ad != null) {
				if (ad.getId() != null) {
					String sql = "update [web2.0].dbo.ad set title=?,url=?,pic=?,begin_time=?,end_time=?,order_no=?,state=?,adtype=? where id=?";
					jdbc.execute(sql, ad.getTitle(), ad.getUrl(), ad.getPic(),
							ad.getBegin_time(), ad.getEnd_time(),
							ad.getOrder_no(), ad.getState(), ad.getAdtype(),
							ad.getId());
					jdbc.execute(
							"update [web2.0].dbo.ad_text set content=? where ad_id=? ",
							ad.getContent(), ad.getId());

				} else {
					String sql = "insert into [web2.0].dbo.ad(title,url,pic,begin_time,end_time,order_no,state,adtype,add_time) values(?,?,?,?,?,?,?,?,getdate())";
					int id = jdbc.insert(sql, ad.getTitle(), ad.getUrl(),
							ad.getPic(), ad.getBegin_time(), ad.getEnd_time(),
							ad.getOrder_no(), ad.getState(), ad.getAdtype());
					jdbc.insert(
							"insert into [web2.0].dbo.ad_text(ad_id,content) values(?,?) ",
							id, ad.getContent());
				}
				ConnectionFactory.commit();
				result.put("code", 0);
				result.put("msg", "保存成功!");
			}
		} catch (Exception e) {
			ConnectionFactory.rollback();
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 批量删除 delAd
	 * 
	 * @param ids
	 * @return Map<String,Object>
	 * @exception
	 * @since 1.0.0
	 */
	public Map<String, Object> delAd(String[] ids) {
		Map<String, Object> result = new HashMap<String, Object>();
		int count = 0;
		try {
			for (int i = 0; i < ids.length; i++) {
				jdbc.delete("delete from [web2.0].dbo.ad where id=?", ids[i]);
				jdbc.delete("delete from [web2.0].dbo.ad_text where ad_id=?",
						ids[i]);
				count++;
			}
			ConnectionFactory.commit();
			result.put("count", count);
			result.put("code", 0);
			result.put("msg", "删除成功!");
		} catch (Exception e) {
			ConnectionFactory.rollback();
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}
}
