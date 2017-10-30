package com.ccjt.ejy.web.service.back;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.service.PicService;
import com.ccjt.ejy.web.vo.Ad;
import com.ccjt.ejy.web.vo.DBPics;
import com.ccjt.ejy.web.vo.Logo;
import com.ccjt.ejy.web.vo.MajorProject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

public class LogoService {
	
	private static Logger log = LogManager.getLogger(LogoService.class);

	public Map<String,Object> logoList(Logo logo, Integer page, Integer rows){
		
		Map<String,Object> m = new HashMap<String, Object>();
		List<Logo> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = " select * from [web2.0].dbo.logo where 1=1 ";
			
			if(logo.getDanweiName()!=null){
				sql += " and danweiname like ?";
				params.add("%"+logo.getDanweiName()+"%");
			}
			

			
			m.put("total", jdbc.getCount(sql,params.toArray())); 
			
			sql += " order by order_no desc ";
			
			list = jdbc.beanList(sql,page,rows, Logo.class,params.toArray());
//			List<Map> orglist=getOrgList();
//			for (Logo logo1 :list){
//				for (Map map:orglist){
//					if (logo1.getJgmc().equals(map.get("orgId"))){
//						logo1.setJgmc((String) map.get("orgName"));
//					}
//				}
//			}
			m.put("rows", list);
			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return m;
		
	}


	public Logo getLogo(Integer id){
		Logo ad = null;
		try {
			if(id!=null){
				String sql = " select t1.*,CONVERT(VARCHAR(19),t1.add_time,120) as addTime from [web2.0].dbo.logo t1  where t1.id=? ";
				ad = jdbc.bean(sql, Logo.class ,id);
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return ad;
	}


	public Map<String ,Object> saveLogo(Logo ad){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(ad!=null){
				if(ad.getId()!=null){
					String sql = "update [web2.0].dbo.Logo set jgmc=?,pic=?,order_no=?,danweiname=?,danweiAddress=?,bigpic=? where id=?";
					jdbc.execute(sql, ad.getJgmc(),ad.getPic(),ad.getOrder_no(),ad.getDanweiName(),ad.getDanweiAddress(),ad.getBigpic(),ad.getId());
//					jdbc.execute("update [web2.0].dbo.ad_text set content=? where ad_id=? ", ad.getContent(),ad.getId());
					
				}else{
					String sql = "insert into [web2.0].dbo.Logo(jgmc,pic,order_no,danweiname,danweiAddress,bigpic,add_time) values(?,?,?,?,?,?,getdate())";
					int id = jdbc.insert(sql, ad.getJgmc(),ad.getPic(),ad.getOrder_no(),ad.getDanweiName(),ad.getDanweiAddress(),ad.getBigpic());
//					jdbc.insert("insert into [web2.0].dbo.ad_text(ad_id,content) values(?,?) ", id,ad.getContent());
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
	 * 批量删除
	 * delAd  
	 * @param ids
	 * @return   
	 * Map<String,Object>  
	 * @exception   
	 * @since  1.0.0
	 */
	public Map<String, Object> delLogo(String[] ids){
	    Map<String,Object> result = new HashMap<String, Object>();
	    int count = 0;
	    try {
	        for (int i = 0; i < ids.length; i++) {
	            jdbc.delete("delete from [web2.0].dbo.Logo where id=?",ids[i]);
//	            jdbc.delete("delete from [web2.0].dbo.ad_text where ad_id=?",ids[i]);
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

	public List<Map> getOrgList() {
		List list = null;

		String sql = "Select a.DanWeiName as orgName,b.CityCode as orgId " +
				" from View_HuiYuan_AllPaiMaiDaiLi a " +
				" inner join Sys_XiaQu b on a.DanWeiGuid = b.RowGuid order by a.Row_ID asc";
		try {
			list = jdbc.mapList(sql);
		} catch (Exception e) {
			log.error("获取竞价曲线数据出错:", e);
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 根据code获取机构名称
	 * @param cityCode
	 * @return
	 */
	public String getOrgNameByCode(String cityCode) {
		String orgName="";

		String sql = "Select a.DanWeiName as orgName from View_HuiYuan_AllPaiMaiDaiLi a  inner join Sys_XiaQu b on a.DanWeiGuid = b.RowGuid WHERE b.CityCode =?";
		try {
			orgName = jdbc.getString(sql,cityCode);
		} catch (Exception e) {
			log.error("获取竞价曲线数据出错:", e);
			e.printStackTrace();
		}
		return orgName;
	}
}
