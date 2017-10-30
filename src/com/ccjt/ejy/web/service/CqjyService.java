package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.CQJY_Gonggao;
import com.ccjt.ejy.web.vo.GongGao;

public class CqjyService {
	
	private static Logger log = LogManager.getLogger(CqjyService.class);
	private NewsService ns = new NewsService();
	
	public Map<String,Object> cqjyList(GongGao ggao,String startPrice,String endPrice,String orderType,String sessionCity,Integer page,Integer rows,String pagename){
		Map<String,Object> m = new HashMap<String, Object>();
		List<GongGao> list = null;
		try {
//			String sql1="select ijv2.OldProjectGuid,ijv2.BelongXiaQuCode as XiaQuCode,ijv2.projectguid," +
//					"ijv2.allowmorejqxt,jjia.ProjectStatus jjia_status,ijv2.projectcontroltype,ijv2.IsTop,ijv2.orderNum,ijv2.InfoDate," +
//					"ijv2.PubInWebDate,ijv2.SysID,ijv2.zt,ijv2.ispllr,ijv2.jygg_guid infoid,ijv2.ProjectNum,ijv2.Title,"
//					+" ijv2.Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,ijv2.cjgg_guid,"
//					+" ijv2.gonggaotodate,ijv2.gonggaofromdate,jjia.BeginDate jingjia_start,CAST (jjia.PlanEndTime AS datetime) jingjia_end,"
//					+" ijv2.Categorynum, ijv2.click,ijv2.guapaiprice,ijv2.IsMianY,ijv2.shiname as s2,ijv2.shengname as s1"
//					+" from infomain_jygg_v2 ijv2"
//					+" left join JQXT_ProjectInfo jjia on jjia.ProjectGuid = ijv2.ProjectGuid"
//					+" where 1=1 ";
            String sql1="SELECT * FROM  ( SELECT    (    CASE    WHEN (     getdate() >= ijv2.gonggaofromdate     AND getdate() <= ijv2.gonggaotodate     AND (      ijv2.cjgg_guid IS NULL      OR ijv2.cjgg_guid = ''     )     AND (      ijv2.projectcontroltype NOT IN ('1', '2')      OR ijv2.projectcontroltype IS NULL     )AND (ijv2.jjia_status IS NULL OR  (ijv2.jjia_status != 3 and  ijv2.jjia_status != 4))    ) THEN     1    WHEN (     getdate() >= jjia.BeginDate     AND getdate() <= CAST (jjia.PlanEndTime AS datetime)     AND (      ijv2.cjgg_guid IS NULL      OR ijv2.cjgg_guid = ''     )     AND (      ijv2.projectcontroltype NOT IN ('1', '2')      OR ijv2.projectcontroltype IS NULL     ) AND (ijv2.jjia_status IS NULL OR  (ijv2.jjia_status != 3 and  ijv2.jjia_status != 4))   ) THEN     2    WHEN (     getdate() < ijv2.gonggaofromdate    ) THEN     3    ELSE     4    END   ) AS ordertype,   " +
                    " ijv2.cqywtype,ijv2.shi,ijv2.HotLabelName as query_HotLabelName,ijv2.XiaQuName,ijv2.OldProjectGuid,ijv2.BelongXiaQuCode,ijv2.BelongXiaQuCode AS XiaQuCode,    ijv2.projectguid, ijv2.allowmorejqxt, jjia.ProjectStatus,jjia.ProjectStatus jjia_status,ijv2.projectcontroltype,ijv2.IsTop,ijv2.orderNum,ijv2.InfoDate,ijv2.PubInWebDate,ijv2.SysID,ijv2.zt,ijv2.ispllr,  ijv2.jygg_guid,ijv2.jygg_guid infoid,ijv2.ProjectNum,    ijv2.Title, ijv2.Categoryname ,   ijv2.Categoryname ProjectStyle,    ijv2.jingjiafangshi,    ijv2.isfrompricexs,    ijv2.cjgg_guid,    ijv2.gonggaotodate,    ijv2.gonggaofromdate,jjia.BeginDate, jjia.BeginDate jingjia_start,    CAST (jjia.PlanEndTime AS datetime) jingjia_end,    ijv2.Categorynum,    ijv2.click,    ijv2.guapaiprice,    ijv2.IsMianY, ijv2.shiname ,   ijv2.shiname AS s2,  ijv2.shengname,  ijv2.shengname AS s1,ijv2.SystemType,ijv2.zzkg_zztype,ijv2.zzkg_guapaitype,ijv2.zzkg_guapaiprice,ijv2.zzkg_guapaidj  FROM   infomain_jygg_v2 ijv2  LEFT JOIN JQXT_ProjectInfo jjia ON jjia.ProjectGuid = ijv2.ProjectGuid )as ijv2  where 1=1 ";

			
			String shi_code = "";
			
			if(StringUtils.isNotBlank(sessionCity)){
        		if(sessionCity.endsWith("0000")){
        			shi_code = sessionCity.substring(0,2)+"____";
        		}else if(sessionCity.endsWith("00")){
        			shi_code = sessionCity.substring(0,4)+"__";
        		}
        	}
			
			if (StringUtils.isNotBlank(pagename) && pagename.equals("jl_more")){
				sql1 += " and ijv2.OldProjectGuid is not null ";
			}
			
			if(startPrice!=null&&!startPrice.equals("")){
				sql1+=" and ijv2.guapaiprice>="+startPrice;
			}
			if(endPrice!=null&&!endPrice.equals("")){
				sql1+=" and ijv2.guapaiprice<="+endPrice;
			}
			if(ggao.getCategoryname()!=null&&!ggao.getCategoryname().equals("")){
				if (ggao.getCategoryname().equals("其他")){
					sql1 += " and ijv2.categoryname ='其他资产'";
				}else if(ggao.getCategoryname().equals("资产招租")){
					sql1 += " and ijv2.categoryname ='房产招租'";
				}else {
					sql1 += " and ijv2.categoryname ='" + ggao.getCategoryname() + "'";
				}
			}else{
				ggao.setHotlable("");
			}
			if(StringUtils.isNotEmpty(ggao.getOrgname())) {
				sql1 += " and ijv2.XiaQuName = '" + ggao.getOrgname() + "'";				
			}
			if(StringUtils.isNotEmpty(ggao.getHotlable())) {
				String[] hotlables = ggao.getHotlable().split(",");
				for(String hotlable : hotlables) {
					sql1 += " and ijv2.query_HotLabelName like '%" + hotlable + "%'";
				}
			}
			if(StringUtils.isNotBlank(shi_code)){//市
				sql1 += " and ijv2.shi like '"+shi_code+"'";
			}
			if(ggao.getCqywtype()!=null&&!ggao.getCqywtype().equals("")){//业务类型
				sql1 += " and ijv2.cqywtype ='"+ggao.getCqywtype()+"'";
			}
			if(ggao.getStatus_name()!=null&&!ggao.getStatus_name().equals("")){//项目状态
				if(ggao.getStatus_name().equals("未开始")){
					sql1 += " and getdate() < ijv2.gonggaofromdate ";
				}else if(ggao.getStatus_name().equals("正在报名")){
					sql1 += " and getdate()>=ijv2.gonggaofromdate and getdate()<= ijv2.gonggaotodate and (ijv2.cjgg_guid is  null or ijv2.cjgg_guid='') and ( ijv2.projectcontroltype NOT IN ('1', '2') or ijv2.projectcontroltype is null ) AND (ijv2.jjia_status IS NULL OR  (ijv2.jjia_status != 3 and  ijv2.jjia_status != 4))";
				}else if(ggao.getStatus_name().equals("报名已截止")){
					sql1 += " and ( ijv2.jingjia_start is null or getdate() < ijv2.jingjia_start) and getdate()>ijv2.gonggaotodate and (ijv2.cjgg_guid is  null or ijv2.cjgg_guid='') and ( ijv2.projectcontroltype NOT IN ('1', '2') or ijv2.projectcontroltype is null ) AND (ijv2.jjia_status IS NULL OR  (ijv2.jjia_status != 3 and  ijv2.jjia_status != 4))";
				}else if(ggao.getStatus_name().equals("竞价中")){
					sql1 += " and getdate()>=ijv2.jingjia_start and getdate()<=CAST (ijv2.jingjia_end AS datetime) and (ijv2.cjgg_guid is  null or ijv2.cjgg_guid='') and ( ijv2.projectcontroltype NOT IN ('1', '2') or ijv2.projectcontroltype is null ) AND (ijv2.jjia_status IS NULL OR  (ijv2.jjia_status != 3 and  ijv2.jjia_status != 4))";
				}else if(ggao.getStatus_name().equals("竞价已截止")){
					sql1 += " and getdate()>CAST (ijv2.jingjia_end AS datetime) and (ijv2.cjgg_guid is  null or ijv2.cjgg_guid='') and ( ijv2.projectcontroltype NOT IN ('1', '2') or ijv2.projectcontroltype is null ) AND getdate() > ijv2.gonggaofromdate " ;
				}else if(ggao.getStatus_name().equals("已成交")){
					sql1 += " and ijv2.cjgg_guid is not null and ijv2.cjgg_guid!=''";
				}
			}
			if (ggao.getTitle() != null && !ggao.getTitle().equals("")) {
				sql1 += " and ijv2.title like '%" +ggao.getTitle() + "%'";
			}


			m.put("total", jdbc.getCount(sql1)); 
			
			if (orderType != null && !orderType.equals("")) {
				if (orderType.equals("orderType1")) {
					sql1 += " order by ijv2.IsTop desc,ijv2.ordertype ASC,  ijv2.orderNum desc,ijv2.InfoDate desc,ijv2.PubInWebDate desc,ijv2.SysID desc";
				} else if (orderType.equals("orderType2_up")) {
					sql1 += " order by ijv2.guapaiprice";
				} else if (orderType.equals("orderType2_down")) {
					sql1 += " order by ijv2.guapaiprice desc";
				} else if (orderType.equals("orderType3_up")) {
					sql1 += " order by ijv2.infodate ";
				} else if (orderType.equals("orderType3_down")) {
					sql1 += " order by ijv2.infodate  desc";
				}
			} else {
				sql1 += " order by ijv2.IsTop desc,ijv2.ordertype ASC,  ijv2.orderNum desc,ijv2.InfoDate desc,ijv2.PubInWebDate desc,ijv2.SysID desc";
			}
			String page_sql = jdbc.pageSql(sql1,page,rows);
			
			page_sql = " select * from (" + page_sql + " ) as temp_2 OUTER APPLY (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where  pic.guid=temp_2.infoid and pic.type='JY01') temp_3 ";
			
			list = jdbc.beanList(page_sql, GongGao.class);
			

			
			for(GongGao gg : list){
				
				if (StringUtils.isNotBlank(gg.getIspllr()) && gg.getIspllr().equals("1")) {//批量挂牌
					DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
					List<Map> plist = ns.getProjectList(gg.getCjgg_guid());
					//批量挂牌多个标的的挂牌截止时间可能不一致,分别取最大和最小时间
					for (Map map : plist) {

						Object str = map.get("GongGaoFromDate");
						Object str2 = map.get("GongGaoToDate");

						Date ggstart = new DateTime().parse(str.toString(), format).toDate();
						Date ggend = new DateTime().parse(str2.toString(), format).toDate();

						if (gg.getGonggaotodate().before(ggend)) {
							gg.setGonggaotodate(ggend);
						}
						if (gg.getGonggaofromdate().after(ggstart)) {
							gg.setGonggaofromdate(ggstart);
						}
					}
				}

				if("1".equals(gg.getAllowmorejqxt())){
					
					String erci_sql = " select top 1 JingJiaFangShi JingJiaFangShi_1,cast(PlanEndTime as datetime) jingjia_end ,cast(begindate as datetime) jingjia_start  from JQXT_ProjectInfo where OrgBiaoDiGuid=? order by Row_ID desc ";
					CQJY_Gonggao g = jdbc.bean(erci_sql, CQJY_Gonggao.class,gg.getProjectguid());
					if(g!=null){
						gg.setJingjia_start(g.getJingjia_start());
						gg.setJingjia_end(g.getJingjia_end());
					}
				}
				
				gg.setClick(gg.getClick()+getPVCount(gg.getInfoid()));
			}
			m.put("rows", list);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return m;
	}
	
	public List<GongGao> likeCqjyList(String cookie_area,String cookie_type,int count){
		List<GongGao> list = null;
		try {
			String sql1="  select BelongXiaQuCode as XiaQuCode,IsTop,orderNum,InfoDate,PubInWebDate,SysID,zt,ispllr,jygg_guid infoid,ProjectNum,Title,"
					+" Categoryname ProjectStyle,jingjiafangshi,isfrompricexs,cjgg_guid,"
					+" gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,"
					+" Categorynum, click,guapaiprice,IsMianY,shiname as s2,shengname as s1,SystemType,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj "
					+" from infomain_jygg_v2 where  "
					+" gonggaofromdate < GETDATE() and gonggaotodate > GETDATE() ";
			if(cookie_area!=null&&!cookie_area.equals("")){
				sql1 += " and shiname like'"+cookie_area+"%'";
			}
			if(cookie_type!=null&&!cookie_type.equals("")){
				if (cookie_type.equals("其他")){
					sql1 += " and categoryname ='其他资产'";
				}else if(cookie_type.equals("资产招租")){
					sql1 += " and categoryname ='房产招租'";
				}else {
					sql1 += " and categoryname ='"+cookie_type+"'";
				}
			}
			
			sql1 += " order by IsTop desc,  orderNum desc,InfoDate desc,PubInWebDate desc,SysID desc";
			
			String page_sql = jdbc.pageSql(sql1, 1, count);
			
			page_sql = " select * from (" + page_sql + " ) as temp_2 OUTER APPLY (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid=temp_2.infoid and pic.type='JY01') temp_3 ";
			
			list = jdbc.beanList(page_sql,GongGao.class);
//			NewsService ns = new NewsService();
			for(GongGao gg : list){
				
				if (StringUtils.isNotBlank(gg.getIspllr()) && gg.getIspllr().equals("1")) {//批量挂牌
					DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
					List<Map> plist = ns.getProjectList(gg.getCjgg_guid());
					//批量挂牌多个标的的挂牌截止时间可能不一致,分别取最大和最小时间
					for (Map map : plist) {

						Object str = map.get("GongGaoFromDate");
						Object str2 = map.get("GongGaoToDate");

						Date ggstart = new DateTime().parse(str.toString(), format).toDate();
						Date ggend = new DateTime().parse(str2.toString(), format).toDate();

						if (gg.getGonggaotodate().before(ggend)) {
							gg.setGonggaotodate(ggend);
						}
						if (gg.getGonggaofromdate().after(ggstart)) {
							gg.setGonggaofromdate(ggstart);
						}
					}
				}

				
				if("1".equals(gg.getAllowmorejqxt())){
					
					String erci_sql = " select top 1 JingJiaFangShi JingJiaFangShi_1,cast(PlanEndTime as datetime) jingjia_end ,cast(begindate as datetime) jingjia_start  from JQXT_ProjectInfo where OrgBiaoDiGuid=? order by Row_ID desc ";
					CQJY_Gonggao g = jdbc.bean(erci_sql, CQJY_Gonggao.class,gg.getProjectguid());
					if(g!=null){
						gg.setJingjia_start(g.getJingjia_start());
						gg.setJingjia_end(g.getJingjia_end());
					}
				}
				
				gg.setClick(gg.getClick()+getPVCount(gg.getInfoid()));
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 产权交易详细页面——猜你喜欢
	 * likeCqjyListException  
	 * @param cookie_area
	 * @param cookie_type
	 * @return   
	 * List<GongGao>  
	 * @exception   
	 * @since  1.0.0
	 */
	public List<GongGao> likeCqjyListException(String cookie_area,String cookie_type,String exceptionInfoid){
        List<GongGao> list = null;
        try {
            String sql1="  select BelongXiaQuCode as XiaQuCode,IsTop,orderNum,InfoDate,PubInWebDate,SysID,zt,ispllr,jygg_guid infoid,ProjectNum,Title,"
                    +" Categoryname ProjectStyle,jingjiafangshi,isfrompricexs,cjgg_guid,SystemType,"
                    +" gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,"
                    +" Categorynum, click,guapaiprice,IsMianY,shiname as s2,shengname as s1,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj "
                    +" from infomain_jygg_v2 where  "
                    +" gonggaofromdate < GETDATE() and gonggaotodate > GETDATE() "
                    +" and infoid != '"+exceptionInfoid+"'";
            if(cookie_area!=null&&!cookie_area.equals("")){
                sql1 += " and shengname like'"+cookie_area+"%'";
            }
            if(cookie_type!=null&&!cookie_type.equals("")){
            	if (cookie_type.equals("其他")){
					sql1 += " and categoryname ='其他资产'";
				}else if(cookie_type.equals("资产招租")){
					sql1 += " and categoryname ='房产招租'";
				}else {
					sql1 += " and categoryname ='"+cookie_type+"'";
				}
            }
            
            sql1 += " order by IsTop desc,  orderNum desc,InfoDate desc,PubInWebDate desc,SysID desc";
            
            String page_sql = jdbc.pageSql(sql1, 2, 2);
            
            page_sql = " select * from (" + page_sql + " ) as temp_2 OUTER APPLY (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid=temp_2.infoid and pic.type='JY01') temp_3 ";
            
            list = jdbc.beanList(page_sql,GongGao.class);
            
            for(int i=0;i<list.size();i++){
                list.get(i).setClick(list.get(i).getClick()+getPVCount(list.get(i).getInfoid()));
            }
        } catch (Exception e) {
            log.error(e);
            e.printStackTrace();
        }
        return list;
    }
	
	public int getPVCount(String id) {
		int count=0;
		try {
			String sql = "select (isnull(count,0)+isnull(sourcejjdt,0)) as count from [web2.0].dbo.pv where guid = ?";
			Map<String,Object> map = jdbc.map(sql,id);
			if(map!=null){
				count=Integer.parseInt(map.get("count").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public Map<String,Object> updateReadTime(GongGao gongGao){
		String id = gongGao.getInfoid();
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(id!=null&&!id.equals("")){
				String sql="select * from [web2.0].dbo.pv where guid = ?";
				int count=jdbc.getCount(sql,id);
				if(count>0){
					if(StringUtils.isNotEmpty(gongGao.getSource())){
						sql = "update [web2.0].dbo.pv set sourcejjdt=(isnull(sourcejjdt,0)+1) where guid = ?";
					}else{
						sql = "update [web2.0].dbo.pv set count=(isnull(count,0)+1) where guid = ?";
					}					
					jdbc.execute(sql,id);
					ConnectionFactory.commit();
				}else{
					if(StringUtils.isNotEmpty(gongGao.getSource())){
						sql = "insert into [web2.0].dbo.pv (guid,sourcejjdt) values(?,?)";
					}else{
						sql = "insert into [web2.0].dbo.pv (guid,count) values(?,?)";
					}						
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
	 * @param
	 * @return   
	 * GongGao  
	 * @exception   
	 * @since  1.0.0
	 */
	public GongGao detail(String infoid) {
        GongGao gg = null;
        try {
            String sql = "select t1.isCommonTemplate,t1.IsMianY,t1.danw,t1.currencyUnit,jjia.ProjectStatus jjia_status,t1.hasPriority,t1.hasBuyIntent,t1.HasInvestIntent,t1.projectno as project_no, t1.description,t1.SystemType,t1.ZhongDContent,t1.ShouRangZGTJ zgtj,t1.ZhuanRangfTJ,"
                    + "t1.projectcontroltype,t1.allowMoreJqxt,t1.ProjectGuid,t1.shengname,t1.shiname,t1.zt,t1.ispllr," 
            		+ "t1.jygg_guid infoid,t1.ProjectNum,t1.Title,t1.Categoryname ProjectStyle,t1.jingjiafangshi," 
                    + "t1.isfrompricexs,t1.cjgg_guid,t1.gonggaotodate,t1.gonggaofromdate,jjia.BeginDate jingjia_start,CAST (jjia.PlanEndTime AS datetime) jingjia_end," 
            		+ "t1.Categorynum, t1.click,t1.guapaiprice,t1.JiaoNaBZJMoney BaoZhengJPrice,cj.ZZKG_ZZType zzkg_zztype,cj.ZZKG_GuaPaiType zzkg_guapaitype,'' as zzkg_guapaiprice,cj.GuaPaiPrice zzkg_guapaidj,"
            		+ "t4.pic orgPic,t4.danweiname,t1.BelongXiaQuCode as XiaQuCode,t1.JiGZiChanLxr orgLXR,t1.JiGZiChanLxTel orgPhone," 
            		+ "t4.danweiAddress orgAddress,isnull(cg.ProjectName,cp.ProjectName) as projectname "
                    + " from infomain_jygg_v2 t1 "
                    + "left join JQXT_ProjectInfo jjia on jjia.ProjectGuid = t1.ProjectGuid "
                    + "left join CQJY_ProjectRegister cp on t1.infoid = cp.ProjectRegGuid " 				
        			+ "left join CQJY_GongChengInfo cg on t1.ProjectGuid = cg.ProjectGuid " 
        			+ "left join CQJY_JiaoYiGongGao cj on t1.ProjectGuid = cj.ProjectGuid " 
                    + "left join [web2.0].dbo.logo t4 on t4.jgmc=t1.BelongXiaQuCode "
                    + "where t1.infoid = ?";
            gg = jdbc.bean(sql,GongGao.class,infoid);
			if (StringUtils.isNotBlank(gg.getIsCommonTemplate()) && gg.getIsCommonTemplate().equals("1")){//使用新模板时竞买公告不用iframe
            	gg.setContent(ns.getContent(gg.getInfoid()));
			}
        } catch (Exception e) {
            log.error("获取产权详细出错:",e);
            e.printStackTrace();
        }

		gg.setClick(gg.getClick()+getPVCount(gg.getInfoid()));
        return gg;
    }
	
	//添加关注
	public Map<String,Object> addFocus(String userid,String infoid){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			String sql = "select * from [web2.0].dbo.user_focus where user_id = ? and project_id = ?";
			int count = jdbc.getCount(sql,userid,infoid);
			if(count > 0) {
				result.put("code", -1);
				result.put("msg", "已经添加过关注，不能重复添加！");
			} else {
				sql=" insert into [web2.0].dbo.user_focus (user_id,project_id) values(?,?)";
				jdbc.execute(sql,userid,infoid);
				ConnectionFactory.commit();
				updateFocusCount(infoid);
				result.put("code", 0);
				result.put("msg", "添加关注成功！");
			}			
		} catch (Exception e) {
			ConnectionFactory.rollback();
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 取消关注并更新该则公告的关注数
	 * cancelFocus  
	 * @param userid
	 * @param infoid
	 * @return   
	 * Map<String,Object>  
	 * @exception   
	 * @since  1.0.0
	 */
    public Map<String,Object> cancelFocus(String userid,String infoid){
        Map<String,Object> result = new HashMap<String, Object>();
        try {
            //删除关注
            String sql="delete from [web2.0].dbo.user_focus where user_id=? and project_id=?";
            jdbc.execute(sql,userid,infoid);
            //更新总关注数
            sql = "update [web2.0].dbo.user_focus_all set all_count=all_count-1 where infoid=?";
            jdbc.execute(sql,infoid);
            ConnectionFactory.commit();
            result.put("code", 0);
            result.put("msg", "取消关注成功！");
        } catch (Exception e) {
            ConnectionFactory.rollback();
            log.error(e);
            e.printStackTrace();
        }
        return result;
    }
	
	//判断用户是否已关注过指定公告
	public Map<String,Object> getFocus(String userid,String infoid){
        Map<String,Object> result = new HashMap<String, Object>();
        try {
            String sql="select * from [web2.0].dbo.user_focus where user_id=? and project_id=?";
            int count = jdbc.getCount(sql,userid,infoid);
            if(count!=0){
                result.put("code", 1);
                result.put("msg", "已关注过");
            }else{
                result.put("code", 0);
                result.put("msg", "尚未关注");
            }
        } catch (Exception e) {
            ConnectionFactory.rollback();
            log.error(e);
            e.printStackTrace();
        }
        return result;
    }
	
	//更新关注数
	public Map<String,Object> updateFocusCount(String id){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(id!=null&&!id.equals("")){
				String sql="select * from [web2.0].dbo.user_focus_all where infoid=?";
				int count=jdbc.getCount(sql,id);
				if(count>0){
					sql = "update [web2.0].dbo.user_focus_all set all_count=all_count+1 where infoid=?";
					jdbc.execute(sql,id);
					ConnectionFactory.commit();
				}else{
					sql = "insert into [web2.0].dbo.user_focus_all (infoid,all_count) values(?,?)";
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
	//获取关注数
	public int getFocusCount(String infoid){
		int count=0;
		try {
			String sql=" select * from [web2.0].dbo.user_focus_all where infoid=?";
			Map<String,Object> map=jdbc.map(sql,infoid);
			if(map!=null){
				count=Integer.parseInt(map.get("all_count").toString());
			}
		} catch (Exception e) {
			ConnectionFactory.rollback();
			log.error(e);
			e.printStackTrace();
		}
		return count;
	}
	public Map<String,Object> yplList(GongGao gg,String orderType,String sessionCity,Integer page,Integer rows){
		Map<String,Object> m = new HashMap<String, Object>();
		List<GongGao> list = null;
		try {
			String sql1=" select oucode as XiaQuCode, CityName s2, ClickTimes as click ,infoid,CategoryNum,price guapaiprice,ProjectNum,Title,StartDate,EndDate,case when CategoryName='产股权' then '股权' else CategoryName end as ProjectStyle from View_InfoMain  " +
					"LEFT JOIN HuiYuan_City on CityCode=SHI where CategoryNum like '00100300_' and (InfoStatusCode ='9' or InfoStatusCode ='-2')  ";

			String shi_code = "";
			if(StringUtils.isNotBlank(sessionCity)){
				if(sessionCity.endsWith("0000")){
					shi_code = sessionCity.substring(0,2)+"____";
				}else if(sessionCity.endsWith("00")){
					shi_code = sessionCity.substring(0,4)+"__";
				}
			}


			if(StringUtils.isNotBlank(sessionCity)){
				sql1+=" and shi like '"+shi_code+"'";
			}
			
			if(gg.getCategoryname()!=null&&!gg.getCategoryname().equals("")){
				sql1 += " and categoryname like'%"+gg.getCategoryname()+"%'";
			}

			if (gg.getTitle() != null && !gg.getTitle().equals("")) {
				sql1 += " and title like '%" +gg.getTitle() + "%'";
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
			
			page_sql = " select * from (" + page_sql + " ) as temp_2 OUTER APPLY (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where  pic.guid=temp_2.infoid and pic.type='JY01') temp_3 ";
			
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
	
	public Map<String,Object> orgList(){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<Map<String,Object>> list = null;
		try {
			String sql = "Select a.DanWeiName as orgName,b.CityCode as orgId " +
					"from View_HuiYuan_AllPaiMaiDaiLi a inner join Sys_XiaQu b on a.DanWeiGuid = b.RowGuid order by a.Row_ID asc";
			list = jdbc.mapList(sql);
			resultMap.put("rows", list);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return resultMap;
	}
	
	public Map<String,Object> hotLableList(String categoryname){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<Map<String,Object>> list = null;
		try {
			if("资产招租".equals(categoryname)) {
				categoryname = "房产招租";
			}
			String sql = "select zh.HotLabelName " +
					"from Code_Items ci inner join ZHGL_HotLabel zh on ci.ItemValue = zh.ProjectType " +
					"where ci.CodeID = '758' and ci.ItemText = ?";
			list = jdbc.mapList(sql,categoryname);
			resultMap.put("projectType", categoryname);
			resultMap.put("rows", list);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return resultMap;
	}


	/**
	 * 获取视觉30秒内容
	 * @param gongGao
	 * @return
	 */
	public Map<String,Object> optesthesiaContent(GongGao gongGao){
		Map<String,Object> map=new HashMap<>();
		String sql="";
		switch (gongGao.getProjectstyle()){
			case "房地产":
				sql="select top 1 area from  CQJY_FangChanInfo WHERE ProjectGuid=?";
				try {
					map=jdbc.map(sql,gongGao.getProjectguid());
				} catch (Exception e) {
					log.error(e);
					e.printStackTrace();
				}
				break;
			case "房产招租":
				sql="select top 1 Zlqx,Area,ZfType,CzPrice from ZulInfo WHERE ProjectGuid=? ";
				try {
					map=jdbc.map(sql,gongGao.getProjectguid());
				} catch (Exception e) {
					log.error(e);
					e.printStackTrace();
				}
				break;
			case "二手车":
				sql="select top 1 GongLi,DengJiDate,BianSuXiang from CQJY_CheLianInfo where ProjectGuid=? ";
				try {
					map=jdbc.map(sql,gongGao.getProjectguid());
				} catch (Exception e) {
					log.error(e);
					e.printStackTrace();
				}
				break;
			case "废旧物资":
				sql="select top 1 CunFangAddress from  CQJY_SheBeiInfo  where ProjectGuid=? ";
				try {
					map=jdbc.map(sql,gongGao.getProjectguid());
				} catch (Exception e) {
					log.error(e);
					e.printStackTrace();
				}
				break;
			case "粮食":
				break;
			case "股权":
				if (gongGao.getSystemtype()!=null && gongGao.getSystemtype().equals("NMG")){
					sql="select '人民币' as MoneyType,a.SuoZaiAreaName,a.BelongIndustry as industryCode_name,a.RegisterZiBen as ZhuCeZiBen from ShouRangfInfo a " +
							"INNER JOIN CQJY_GongChengInfo b on b.ProjectRegGuid =a.RowGuid WHERE b.ProjectGuid =? ";
				}else {
					sql = "SELECT TOP 1 ZhuCeZiBen,(case " +
							"when(MoneyType ='1') then '人民币' " +
							"when(MoneyType is null) then '人民币' " +
							"when(MoneyType ='2') then '美元' " +
							"when(MoneyType ='3') then '欧元' " +
							"when(MoneyType ='4') then '日元' " +
							"when(MoneyType ='5') then '英镑' " +
							"when(MoneyType ='6') then '港元' " +
							"when(MoneyType ='7') then '新加坡币' " +
							"when(MoneyType ='8') then '瑞士法郎' " +
							"when(MoneyType ='9') then '韩元' " +
							"else '其他' end)as MoneyType,LTRIM(RTRIM(REPLACE(BiaoDiCompany.HangYeCode, ',', ''))) as industryCode,SuoZaiAreaName FROM BiaoDiCompany  where ProjectGuid=? ";
				}
				try {
					//把industryCode转换成具体的行业名称
					map=ns.getRealName(jdbc.map(sql,gongGao.getProjectguid()));
				} catch (Exception e) {
					log.error(e);
					e.printStackTrace();
				}
				break;
			case "增资扩股":
				break;
			case "债权":
				sql="select top 1 PrincipalBalance,Interest from  CQJY_ZhaiQuan  where ProjectGuid=? ";
				try {
					map=jdbc.map(sql,gongGao.getProjectguid());
				} catch (Exception e) {
					log.error(e);
					e.printStackTrace();
				}
				break;
			case "工美藏品":
				break;
			case "林权":
				break;
			case "土地经营权":
				break;
			default:
				break;
		}
		return map;
	}

	public Map<String,Object> cqjyList(GongGao ggao,String orderType,String cityCode,Integer page,Integer rows,String pagename){
		Map<String,Object> m = new HashMap<String, Object>();
		List<GongGao> list = null;
		try {
			List<Object> params = new ArrayList<>();
			List<Object> params1 = new ArrayList<>();
			List<Object> params2 = new ArrayList<>();
			List<Object> params3 = new ArrayList<>();
//			String sql1 = "select ijv.oldprojectguid,1 as orderbyno,ijv.BelongXiaQuCode as XiaQuCode,ijv.projectguid,ijv.allowmorejqxt,jjia.ProjectStatus jjia_status,ijv.projectcontroltype,"
//		            + "ijv.IsTop,ijv.orderNum,ijv.InfoDate,ijv.PubInWebDate,ijv.SysID,ijv.SystemType,"
//		            + "ijv.zt,ijv.ispllr,ijv.jygg_guid infoid,ijv.ProjectNum,ijv.Title,"
//					+ "ijv.Categoryname ProjectStyle,ijv.jingjiafangshi,ijv.isfrompricexs,ijv.cjgg_guid,"
//					+ "ijv.gonggaotodate,ijv.gonggaofromdate,jjia.BeginDate jingjia_start,CAST (jjia.PlanEndTime AS datetime) jingjia_end,"
//					+ "ijv.Categorynum,ijv.IsMianY as ismiany,ijv.click,ijv.guapaiprice,"
//					+ "ijv.shiname as s2,ijv.shengname as s1,isnull(ufa.all_count,0) as allcount "
//					+ "from infomain_jygg_v2 ijv "
//					+ "left join [web2.0].dbo.user_focus_all ufa on ijv.jygg_guid = ufa.infoid "
//					+ "left join JQXT_ProjectInfo jjia on jjia.ProjectGuid = ijv.ProjectGuid "
//					+ "where 1 = 1";

			String sql1="select * from ( SELECT (  CASE WHEN ( getdate() >= ijv.gonggaofromdate AND getdate() <= ijv.gonggaotodate  AND (ijv.cjgg_guid IS NULL OR ijv.cjgg_guid = '') AND ( ijv.projectcontroltype NOT IN ('1', '2') OR ijv.projectcontroltype IS NULL  )  AND (   ijv.jjia_status IS NULL   OR (    ijv.jjia_status != 3    AND ijv.jjia_status != 4   )  ) ) THEN  1" +
					" WHEN (  getdate() >= jjia.BeginDate  AND getdate() <= CAST (jjia.PlanEndTime AS datetime)  AND (   ijv.cjgg_guid IS NULL   OR ijv.cjgg_guid = ''  )  AND (   ijv.projectcontroltype NOT IN ('1', '2')   OR ijv.projectcontroltype IS NULL  )  AND (   ijv.jjia_status IS NULL   OR (    ijv.jjia_status != 3 AND ijv.jjia_status != 4 ) ) ) THEN  2   " +
					"WHEN ( getdate() < ijv.gonggaofromdate  ) THEN 3 ELSE  4   END  ) AS ordertype, ijv.oldprojectguid,  1 AS orderbyno,  ijv.BelongXiaQuCode AS XiaQuCode,  ijv.projectguid,  ijv.allowmorejqxt,  jjia.ProjectStatus jjia_status,  ijv.projectcontroltype,  ijv.IsTop,  ijv.orderNum,  ijv.InfoDate,  ijv.PubInWebDate,  ijv.SysID,  ijv.SystemType,  ijv.zt,  ijv.ispllr, " +
					" ijv.jygg_guid infoid,  ijv.ProjectNum,  ijv.Title, ijv.HotLabelName as query_HotLabelName, ijv.shi,ijv.Categoryname,ijv.Categoryname ProjectStyle,  ijv.jingjiafangshi,  ijv.isfrompricexs,  ijv.cjgg_guid,  ijv.gonggaotodate,  ijv.gonggaofromdate,  jjia.BeginDate jingjia_start,  CAST (jjia.PlanEndTime AS datetime) jingjia_end,  ijv.Categorynum,  ijv.IsMianY AS ismiany,  ijv.click,  ijv.guapaiprice,  ijv.shiname AS s2,  ijv.shengname AS s1,  isnull(ufa.all_count, 0) AS allcount,ijv.zzkg_zztype,ijv.zzkg_guapaitype,ijv.zzkg_guapaiprice,ijv.zzkg_guapaidj FROM  infomain_jygg_v2 ijv LEFT JOIN [web2.0].dbo.user_focus_all ufa ON ijv.jygg_guid = ufa.infoid LEFT JOIN JQXT_ProjectInfo jjia ON jjia.ProjectGuid = ijv.ProjectGuid ) as ijv WHERE  1 = 1";
			String sheng_code = "";
        	String shi_code = "";
			if(StringUtils.isNotBlank(cityCode)){
				sheng_code = cityCode.substring(0,2) + "____";
				shi_code = cityCode.substring(0,4) + "__";
        	}			
			if(ggao.getCategoryname()!=null&&!ggao.getCategoryname().equals("")){
				if (ggao.getCategoryname().equals("其他")){
					sql1 += " and ijv.categoryname = '其他资产'";
				}else if (ggao.getCategoryname().equals("资产招租")){
					sql1 += " and ijv.categoryname = '房产招租'";
				}else {
					sql1 += " and ijv.categoryname = ?";
					params1.add(ggao.getCategoryname());
				}
			}else{
				ggao.setHotlable("");
			}
			if(StringUtils.isNotEmpty(ggao.getHotlable())) {
				String[] hotlables = ggao.getHotlable().split(",");
				for(String hotlable : hotlables) {
					sql1 += " and ijv.query_HotLabelName like ?";
					params1.add("%" + hotlable + "%");
				}
			}
			if (StringUtils.isNotBlank(ggao.getTitle())) {
				String[] titles = ggao.getTitle().split(" ");
				for(String title : titles) {
					if(StringUtils.isNotBlank(title)) {
						title = title.replace("%", "[%]");
						sql1 += " and ijv.title like ?";
						params1.add("%" + title + "%");
					}
				}				
			}
			String sql2 = sql1.replace("1 as orderbyno", "2 as orderbyno");
			params2.addAll(params1);
			String sql3 = sql1.replace("1 as orderbyno", "3 as orderbyno");
			params3.addAll(params1);
			if(StringUtils.isNotBlank(shi_code)){//市
				sql1 += " and ijv.shi like ?";		
				params1.add("%" + shi_code + "%");
			}
			params.addAll(params1);
			if(StringUtils.isNotBlank(sheng_code) && !sheng_code.equals(shi_code)){//省
				sql2 += " and ijv.shi like ? and ijv.shi not like ?";
				params2.add("%" + sheng_code + "%");
				params2.add("%" + shi_code + "%");
				sql1 += " union " + sql2;
				params.addAll(params2);
			}
			if(StringUtils.isNotBlank(sheng_code)){//全国
				sql3 += " and shi not like ?";	
				params3.add("%" + sheng_code + "%");
				sql1 += " union " + sql3;
				params.addAll(params3);
        	}			
			sql1 = "select * from (" + sql1 + ") temp";				
			m.put("total", jdbc.getCount(sql1,params.toArray())); 
			if (orderType != null && !orderType.equals("")) {
				if (orderType.equals("orderType1")) {
					sql1 += " order by orderbyno,allcount desc,IsTop desc,orderNum desc,InfoDate desc,PubInWebDate desc,SysID desc";
				} else if (orderType.equals("orderType2_up")) {
					sql1 += " order by guapaiprice";
				} else if (orderType.equals("orderType2_down")) {
					sql1 += " order by guapaiprice desc";
				} else if (orderType.equals("orderType3_up")) {
					sql1 += " order by infodate";
				} else if (orderType.equals("orderType3_down")) {
					sql1 += " order by infodate desc";
				}
			} else {
				sql1 += " order by ordertype asc,orderbyno,allcount desc,IsTop desc,orderNum desc,InfoDate desc,PubInWebDate desc,SysID desc";
			}
			String page_sql = jdbc.pageSql(sql1,page,rows);			
			page_sql = "select * from (" + page_sql + " ) as temp_2 OUTER APPLY (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid = temp_2.infoid and pic.type = 'JY01') temp_3 ";			
			list = jdbc.beanList(page_sql,GongGao.class,params.toArray());
			
//			NewsService ns = new NewsService();
			for(GongGao gg : list){				
				if (StringUtils.isNotBlank(gg.getIspllr()) && gg.getIspllr().equals("1")) {//批量挂牌
					DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
					List<Map> plist = ns.getProjectList(gg.getCjgg_guid());
					//批量挂牌多个标的的挂牌截止时间可能不一致,分别取最大和最小时间
					for (Map map : plist) {
						Object str = map.get("GongGaoFromDate");
						Object str2 = map.get("GongGaoToDate");

						Date ggstart = new DateTime().parse(str.toString(), format).toDate();
						Date ggend = new DateTime().parse(str2.toString(), format).toDate();

						if (gg.getGonggaotodate().before(ggend)) {
							gg.setGonggaotodate(ggend);
						}
						if (gg.getGonggaofromdate().after(ggstart)) {
							gg.setGonggaofromdate(ggstart);
						}
					}
				}

				if("1".equals(gg.getAllowmorejqxt())){					
					String erci_sql = " select top 1 JingJiaFangShi JingJiaFangShi_1,cast(PlanEndTime as datetime) jingjia_end ,cast(begindate as datetime) jingjia_start  from JQXT_ProjectInfo where OrgBiaoDiGuid=? order by Row_ID desc ";
					CQJY_Gonggao g = jdbc.bean(erci_sql, CQJY_Gonggao.class,gg.getProjectguid());
					if(g!=null){
						gg.setJingjia_start(g.getJingjia_start());
						gg.setJingjia_end(g.getJingjia_end());
					}
				}				
				gg.setClick(gg.getClick()+getPVCount(gg.getInfoid()));
			}			
			m.put("rows", list);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return m;
	}
}
