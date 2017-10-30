package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.GongGao;

public class JLService {
	private static Logger log = LogManager.getLogger(JLService.class);
	
	public Map<String,Object> cqjyList(GongGao gg,String startPrice,String endPrice,String orderType,String sessionCity,Integer page,Integer rows){
		Map<String,Object> m = new HashMap<String, Object>();
		List<GongGao> list = null;
		try {
			String sql1="select  IsTop,orderNum,InfoDate,PubInWebDate,SysID,zt,ispllr,jygg_guid infoid,ProjectNum,Title,SystemType,"
					+" Categoryname ProjectStyle,jingjiafangshi,isfrompricexs,cjgg_guid,"
					+" gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,"
					+" Categorynum, click,guapaiprice,IsMianY,shiname as s2,shengname as s1 "
					+" from infomain_jygg_v2 where "
					+" projectcontroltype = 3 ";
			if(StringUtils.isNotBlank(sessionCity)){
				sql1+=" and shi='"+sessionCity+"'";
			}
			
			if(startPrice!=null&&!startPrice.equals("")){
				sql1+=" and guapaiprice>="+startPrice;
			}
			if(endPrice!=null&&!endPrice.equals("")){
				sql1+=" and guapaiprice<="+endPrice;
			}
			if(gg.getCategoryname()!=null&&!gg.getCategoryname().equals("")){
				sql1 += " and categoryname ='"+gg.getCategoryname()+"'";
			}
			if(gg.getS2()!=null&&!gg.getS2().equals("")){//市
				sql1 += " and shiname like'"+gg.getS2()+"%'";
			}
			if(gg.getCqywtype()!=null&&!gg.getCqywtype().equals("")){//业务类型
				sql1 += " and cqywtype ='"+gg.getCqywtype()+"'";
			}
			if(gg.getStatus_name()!=null&&!gg.getStatus_name().equals("")){//项目状态
				if(gg.getStatus_name().equals("未开始")){
					sql1+=" and getdate() < gonggaofromdate ";
				}else if(gg.getStatus_name().equals("正在报名")){
					sql1+=" and getdate()>=gonggaofromdate and getdate()<= gonggaotodate";
				}else if(gg.getStatus_name().equals("报名已截止")){
					sql1+=" and getdate()<jingjia_start and getdate()>gonggaotodate";
				}else if(gg.getStatus_name().equals("竞价中")){
					sql1+=" and getdate()>=jingjia_start and getdate()<=jingjia_end";
				}else if(gg.getStatus_name().equals("竞价已截止")){
					sql1+=" and getdate()>jingjia_end";
				}else if(gg.getStatus_name().equals("已成交")){
					sql1+=" and cjgg_guid is not null and cjgg_guid!=''";
				}
			}
			m.put("total", jdbc.getCount(sql1)); 
			
			if (orderType != null && !orderType.equals("")) {
				if (orderType.equals("orderType1")) {
					sql1 += " order by IsTop desc,  orderNum desc,InfoDate desc,PubInWebDate desc,SysID desc";
				} else if (orderType.equals("orderType2_up")) {
					sql1 += " order by guapaiprice";
				} else if (orderType.equals("orderType2_down")) {
					sql1 += " order by guapaiprice desc";
				} else if (orderType.equals("orderType3_up")) {
					sql1 += " order by infodate ";
				} else if (orderType.equals("orderType3_down")) {
					sql1 += " order by infodate  desc";
				}
			} else {
				sql1 += " order by IsTop desc,  orderNum desc,InfoDate desc,PubInWebDate desc,SysID desc";
			}
			String page_sql = jdbc.pageSql(sql1,page,rows);
			
			page_sql = " select * from (" + page_sql + " ) as temp_2 OUTER APPLY (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid=temp_2.infoid and pic.type='JY01') temp_3 ";
			
			list = jdbc.beanList(page_sql, GongGao.class);
			
			for(int i=0;i<list.size();i++){
				list.get(i).setClick(list.get(i).getClick()+getPVCount(list.get(i).getInfoid()));
			}
			m.put("rows", list);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return m;
	}
	
	public int getPVCount(String id) {
		int count=0;
		try {
			String sql = " SELECT isnull(count,0) as count from [web2.0].dbo.pv where  guid =?   ";
			Map<String,Object> map = jdbc.map(sql,id);
			if(map!=null){
				count=Integer.parseInt(map.get("count").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public Map<String,Object> updateReadTime(String id){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(id!=null&&!id.equals("")){
				String sql="select * from [web2.0].dbo.pv where guid=?";
				int count=jdbc.getCount(sql,id);
				if(count>0){
					sql = "update [web2.0].dbo.pv set count=count+1 where guid=?";
					jdbc.execute(sql,id);
					ConnectionFactory.commit();
				}else{
					sql = "insert into [web2.0].dbo.pv (guid,count) values(?,?)";
					jdbc.execute(sql,id,1);
					ConnectionFactory.commit();
				}
				result.put("code", 0);
				result.put("msg", "更新成功!");
			}
		} catch (Exception e) {
			ConnectionFactory.rollback();
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 产权详细
	 * detail  
	 * @param id
	 * @return   
	 * GongGao  
	 * @exception   
	 * @since  1.0.0
	 */
	public GongGao detail(String infoid) {
        GongGao gg = null;
        try {
            String sql = "select t1.allowMoreJqxt,t1.shengname,t1.shiname,t1.zt,t1.ispllr,t1.jygg_guid infoid,t1.ProjectNum,t1.Title,"
                    + "t1.Categoryname ProjectStyle,t1.jingjiafangshi,t1.isfrompricexs,t1.cjgg_guid,t1.gonggaotodate,t1.gonggaofromdate,t1.SystemType,"
                    + "t1.jingjia_start,t1.jingjia_end,t1.Categorynum, t1.click,t1.guapaiprice,t1.IsMianY,t1.JiaoNaBZJMoney BaoZhengJPrice,"
                    + "t2.infocontent as content from infomain_jygg_v2 t1 left join View_InfoMain t2 "
                    + "on t1.infoid=t2.infoid where t1.infoid=?" ;
            gg = jdbc.bean(sql,GongGao.class,infoid);
            if(gg.getCjgg_guid()!=null&&!gg.getCjgg_guid().equals("")){
                sql = "select infocontent from view_infomain where infoid = ?";
                Map<String, Object> ret = jdbc.map(sql,gg.getCjgg_guid());
                if(ret!=null){
                    gg.setChengjiaogg(ret.get("infocontent").toString());
                }
            }
        } catch (Exception e) {
            log.error("获取产权详细出错:",e);
            e.printStackTrace();
        }
        return gg;
    }
}
