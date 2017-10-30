package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.Global;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.enums.DataType;
import com.ccjt.ejy.web.vo.BaoJia;
import com.ccjt.ejy.web.vo.GongGao;
import com.ccjt.ejy.web.vo.Question;

public class NewsService {
	private static Logger log = LogManager.getLogger(NewsService.class);

	public Map<String, Object> getPLGPStatus(Map plmap) {
		String projectguid= (String) plmap.get("projectGuid");
		Map<String,Object> map=new HashMap<>();
		List<GongGao> xmztList = projectcontrol_Info(projectguid);//获取中止终结状态
		GongGao gongGao = getGongGaoByProjectguid(projectguid);//获取竞价状态
		String  AuditStatus = getAuditStatusByProjectguid(projectguid);//获取成交状态
		if (null != xmztList && xmztList.size() > 0) {
			GongGao gg = xmztList.get(0);//只获取最新的状态
			gg.setControltype(getLatestControltype(projectguid));
			Integer type = gg.getControltype();
			if (null != type ) {// 2中止   1终结
				if (type==2){
					map.put("code","中止");
					map.put("infoid",gg.getInfoid());
					return map;
				}else if (type==1){
					map.put("code","终结");
					map.put("infoid",gg.getInfoid());
					return map;
				}
			}
		}
		if (StringUtils.isNotBlank(AuditStatus) && AuditStatus.equals("3")){//AuditStatus为3,说明项目已成交
			map.put("code","已成交");
		}else if (null != gongGao) {
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				gongGao.setGonggaofromdate(sdf.parse((String)plmap.get("gongGaoFromDate")));
				gongGao.setGonggaotodate(sdf.parse((String)plmap.get("gongGaoToDate")));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if(gongGao.getJingjia_end()!=null && gongGao.getJingjia_start()!=null && now.after(gongGao.getJingjia_start())){//有竞价数据
				String jjia_status=gongGao.getJjia_status();
				if(StringUtils.isNotBlank(jjia_status)&&jjia_status.equals("4")){//jjia_status为4,代表竞价暂停
					map.put("code","竞价暂停");
				}else if(StringUtils.isNotBlank(jjia_status) &&"3".equals(jjia_status)){//竞价已结束
					map.put("code","竞价截止");
				} else if( gongGao.getGonggaofromdate() !=null && now.after(gongGao.getGonggaofromdate()) && now.before(gongGao.getGonggaotodate())){//报名中和竞价中
					map.put("code","报名中竞价中");
				}else {//竞价中
					map.put("code","竞价中");
				}
			}else if(gongGao.getGonggaofromdate() !=null && now.after(gongGao.getGonggaofromdate()) && now.before(gongGao.getGonggaotodate())){//报名中
				map.put("code","报名中");
			} else if(gongGao.getGonggaotodate() !=null && now.after(gongGao.getGonggaotodate())){//报名已截止
				map.put("code","报名截止");
			}else if(gongGao.getGonggaofromdate() !=null && now.before(gongGao.getGonggaofromdate())){
				map.put("code","未开始");
			}
		}
		return map;

	}
	/**
     * 获取指定项目的所有标的列表
     *
     * @param projectRegGuid
     * @return
     */
    public List<Map> getProjectList(String projectRegGuid) {
        List list = null;
        try {
            String sql = "SELECT a.ProjectGuid,a.ProjectName "
                    + ",convert(varchar ,b.GongGaoFromDate ,120) as GongGaoFromDate  ,"
                    + "convert(varchar ,b.GongGaoToDate ,120) as GongGaoToDate ,"
                    + "(case when d.MaxQuotePrice is null then '0' else '1' end) as hasBid " 
                    + ",(CASE WHEN d.JingJiaFangShi ='3' THEN '******'  ELSE CAST(  CAST(  (CASE  WHEN a.SystemType in('CCJT', 'NMG','ZZKG') THEN ISNULL(d.MaxQuotePrice, a.CRDPrice) ELSE ISNULL(d.MaxQuotePrice, a.CRDPrice) * 10000 END) as decimal(18, 2)) as varchar) END) as maxPrice " 
                    + ",(CASE WHEN d.JingJiaFangShi ='3' THEN '******'  ELSE CAST(  CAST(  (CASE  WHEN a.SystemType in('CCJT', 'NMG','ZZKG') THEN  a.CRDPrice ELSE a.CRDPrice * 10000 END) as decimal(18, 2)) as varchar) END) as guapaiprice "
                    + " ,a.SystemType"
                    + " FROM CQJY_GongChengInfo a"
                    + " INNER JOIN CQJY_JiaoYiGongGao b ON a.ProjectGuid =b.ProjectGuid AND b.AuditStatus= '3'"
                    + " INNER JOIN CQJY_ProjectRegister c ON a.ProjectRegGuid =c.ProjectRegGuid AND c.AuditStatus ='3'"
                    + " LEFT JOIN JQXT_ProjectInfo d ON a.ProjectGuid =d.ProjectGuid"
                    + " WHERE a.ProjectRegGuid ='" + projectRegGuid + "'";
            list = jdbc.mapList(sql);
            
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取交易公告的详情出错: ", e);
        }
        for (Object object:list){
			Map<String, Object> map= (Map<String, Object>) object;
			Map<String, Object> statusMap=getPLGPStatus(map);
			((Map<String, Object>)object).put("infoid",statusMap.get("infoid"));
			((Map<String, Object>)object).put("code",statusMap.get("code"));
		}
        return list;
    }
    
    
    public List<Map> getProjectList_date(String projectRegGuid) {
        List list = null;
        try {
            String sql = "SELECT "
                    + " min( convert(varchar ,b.GongGaoFromDate ,120)  ) as GongGaoFromDate  ,"
                    + "max (convert(varchar ,b.GongGaoToDate ,120) ) as GongGaoToDate "
                    + " FROM CQJY_GongChengInfo a"
                    + " INNER JOIN CQJY_JiaoYiGongGao b ON a.ProjectGuid =b.ProjectGuid AND b.AuditStatus= '3'"
                    + " INNER JOIN CQJY_ProjectRegister c ON a.ProjectRegGuid =c.ProjectRegGuid AND c.AuditStatus ='3'"
                    + " LEFT JOIN JQXT_ProjectInfo d ON a.ProjectGuid =d.ProjectGuid"
                    + " WHERE a.ProjectRegGuid ='" + projectRegGuid + "'";
            list = jdbc.mapList(sql);
            
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取交易公告的详情出错: ", e);
        }
//        for (Object object:list){
//			Map<String, Object> map= (Map<String, Object>) object;
//			Map<String, Object> statusMap=getPLGPStatus(map);
//			((Map<String, Object>)object).put("infoid",statusMap.get("infoid"));
//			((Map<String, Object>)object).put("code",statusMap.get("code"));
//		}
        return list;
    }
	
	
	public List<GongGao> list(String type,Integer page,Integer rows) {
		List<GongGao> zbcgList = null;
		try {
			String sql = "SELECT infoid,ProjectNum,Title,ProjectStyle,InfoDate,Categorynum FROM " +
					"View_InfoMain where 1=1 AND InfoStatusCode = '9' AND StartDate < GetDate() " +
					"and Categorynum = ?";
			if("034002".equals(type)) {
				sql = sql + " and (SysID = '14465' or SysID = '11114') order by IsTop DESC,OrderNum desc";
			} else if("004002".equals(type)) {
				sql = sql + " and (SysID != '20873' and SysID != '20874' and SysID != '20875') order by IsTop DESC,OrderNum desc";
			} else {
				sql = sql + " order by IsTop DESC,OrderNum desc";
			}
			zbcgList = jdbc.beanList(sql,page,rows,GongGao.class,type);
		} catch (Exception e) {
			log.error("获取新闻中心列表出错:" ,e);
			e.printStackTrace();
		}
		return zbcgList;
	}
	public int getListCount(String type){
		int count=0;
		try {
			String sql = "SELECT infoid,ProjectNum,Title,ProjectStyle,InfoDate,Categorynum FROM " +
					"View_InfoMain where 1=1 AND InfoStatusCode = '9' AND StartDate < GetDate() " +
					"and Categorynum = ?";
			if("034002".equals(type)) {
				sql = sql + " and (SysID = '14465' or SysID = '11114')";
			} else if("004002".equals(type)) {
				sql = sql + " and (SysID != '20873' and SysID != '20874' and SysID != '20875')";
			} 
			count = jdbc.getCount(sql,type);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return count;
	}
	public  List<Question> questionList(Integer page,Integer rows){
		List<Question> list = null;
		try {
			String sql = "select * from [web2.0].dbo.question order by order_no";
			list = jdbc.beanList(sql,page,rows, Question.class);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return list;
	}
	public int getQuestionCount(){
		int count=0;
		try {
			String sql = " select * from [web2.0].dbo.question";
			count = jdbc.getCount(sql);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return count;
	}
	public GongGao detail(String id) {
		GongGao gg = null;
		try {
			String sql = " SELECT a.infoid,c.ProjectGuid,a.title,a.infocontent as content,a.infodate, a.categoryname,a.categorynum,"
						+"   isnull(a.clicktimes,0) +isnull(b.count,0) as click  "
						+"   FROM View_InfoMain a  LEFT JOIN view_infomain_jygg c on a.InfoID=c.infoid"
						+" left join [web2.0].dbo.pv b on a.infoid=b.guid   "
						+"  where a.infoid=?    " ;
			gg = jdbc.bean(sql,GongGao.class,id);
			
		} catch (Exception e) {
			log.error("获取新闻中心详细出错:" ,e);
			e.printStackTrace();
		}
		return gg;
	}
	
	public GongGao detailByCategorynum(String num) {
		GongGao gg = null;
		try {
			String sql = "select top 1 InfoContent content from View_InfoMain where CategoryNum=? order by IsTop desc,OrderNum desc";
			gg = jdbc.bean(sql,GongGao.class,num);
		} catch (Exception e) {
			log.error("获取新闻中心详细出错:" ,e);
			e.printStackTrace();
		}
		return gg;
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
     * 获取指定标的，按照时间显示竞价曲线的数据
     *
     * @param projectGuid
     * @return
     */
    public List<Map> getBaoJiaHis(String projectGuid) {
        List list = null;
        
        String sql = "SELECT CONVERT(varchar ,BaoJiaDate ,120) as date"
                + " ,CONVERT(varchar(100), CAST(CONVERT(FLOAT,TouBiaoRenPrice) AS decimal(38,2))) as price"
                + " ,count(*) as cot FROM JQXT_BaoJiaHistroy "
                + " WHERE BiaoDiGuid ='" + projectGuid + "'"
                + " GROUP BY CONVERT(varchar ,BaoJiaDate ,120),TouBiaoRenPrice"
                + " ORDER BY CONVERT(varchar ,BaoJiaDate ,120) asc";
        try {
            list = jdbc.mapList(sql);
        } catch (Exception e) {
            log.error("获取竞价曲线数据出错:", e);
            e.printStackTrace();
        }
        return list;
    }
    
    /**
     * 查询报价历史记录
     *
     * @param projectid
     */
    public List<BaoJia> baojiaHIS(String projectid) {
        List<BaoJia> baojiaList = null;
        try {//ren.LoginID 改成了***
            if (StringUtils.isNotBlank(projectid)) {
                String sql = "select BaoJiaDate bj_time,TouBiaoRenPrice price,ren.LoginID code from JQXT_BaoJiaHistroy his inner join JQXT_TouBiaoRen ren " +
                        " on his.TouBiaoRenGuid=ren.RowGuid " +
                        " where his.BiaoDiGuid = ? order by his.row_id desc;";                
                baojiaList = jdbc.beanList(sql, BaoJia.class, projectid);
            }
        } catch (Exception e) {
            log.error("查询报价历史记录出错:", e);
        }
        return baojiaList;
    }
    
    
    
	/**
	 * 获取竞价会状态
	 * @param projectid
	 * type =1  二次挂牌
	 * @return
	 */
	public String baojia_status(String projectid,String type) {
		String status = null;
		try {//ren.LoginID 改成了***
			if (StringUtils.isNotBlank(projectid)) {
				String sql = "select ProjectStatus from JQXT_ProjectInfo where ProjectGuid=? and (OrgBiaoDiGuid=?  or OrgBiaoDiGuid is null) ";
				if("1".equals(type)){
					sql = "select ProjectStatus from JQXT_ProjectInfo where OrgBiaoDiGuid=? and ProjectGuid!=?";
				}
				status = jdbc.getString(sql, projectid, projectid);
			}
		} catch (Exception e) {
			log.error("获取竞价会状态出错:", e);
		}
		return status;
	}
    
    
    /**
     * 二次报价查询报价历史记录
     *
     * @param projectid
     */
    public List<BaoJia> ERCI_baojiaHIS(String projectid,String systype) {
        List<BaoJia> baojiaList = null;
        try {//ren.LoginID 改成了***
            if (StringUtils.isNotBlank(projectid)) {
                
                String sql = "select BaoJiaDate bj_time,TouBiaoRenPrice price,ren.LoginID code from JQXT_BaoJiaHistroy his inner join JQXT_TouBiaoRen ren " +
                        " on his.TouBiaoRenGuid=ren.RowGuid " +
                        " inner join jqxt_projectinfo info on  info.biaodiguid=his.BiaoDiGuid " +
                        " where info.OrgBiaoDiGuid =? and his.BiaoDiGuid!=? order by his.row_id desc;";
                
//                if("GQ".equals(systype)){
//                    sql = "select BaoJiaDate bj_time,TouBiaoRenPrice*10000 price,ren.LoginID code from JQXT_BaoJiaHistroy his inner join JQXT_TouBiaoRen ren " +
//                            " on his.TouBiaoRenGuid=ren.RowGuid " +
//                            " inner join jqxt_projectinfo info on  info.biaodiguid=his.BiaoDiGuid " +
//                            " where info.OrgBiaoDiGuid =? and his.BiaoDiGuid!=? order by his.row_id desc;";
//                }
                baojiaList = jdbc.beanList(sql, BaoJia.class, projectid,projectid);
            }
        } catch (Exception e) {
            log.error("查询二次报价历史记录出错:", e);
        }
        return baojiaList;
    }
    
    /**
     * 获取指定标的二次报价，按照时间显示竞价曲线的数据
     *
     * @param projectGuid
     * @return
     */
    public List<Map> ERCI_BaoJiaHis(String projectGuid,String systype) {
        List list = null;
        String sql = "SELECT CONVERT(varchar ,BaoJiaDate ,120) as date"
                + " ,CONVERT(varchar(100), CAST(CONVERT(FLOAT,TouBiaoRenPrice) AS decimal(38,2))) as price"
                + " ,count(*) as cot FROM JQXT_BaoJiaHistroy his inner join jqxt_projectinfo info" +
                " on info.biaodiguid=his.BiaoDiGuid "
                + " WHERE info.OrgBiaoDiGuid =?"
                + " and his.BiaoDiGuid!=?"
                + " GROUP BY CONVERT(varchar ,BaoJiaDate ,120),TouBiaoRenPrice"
                + " ORDER BY CONVERT(varchar ,BaoJiaDate ,120) asc";
        
        
//        if("GQ".equals(systype)){
//            sql = "SELECT CONVERT(varchar ,BaoJiaDate ,120) as date"
//                    + " ,CONVERT(varchar(100), CAST(CONVERT(FLOAT,TouBiaoRenPrice*10000) AS decimal(38,2))) as price"
//                    + " ,count(*) as cot FROM JQXT_BaoJiaHistroy his inner join jqxt_projectinfo info" +
//                    " on info.biaodiguid=his.BiaoDiGuid "
//                    + " WHERE info.OrgBiaoDiGuid =?"
//                    + " and his.BiaoDiGuid!=?"
//                    + " GROUP BY CONVERT(varchar ,BaoJiaDate ,120),TouBiaoRenPrice"
//                    + " ORDER BY CONVERT(varchar ,BaoJiaDate ,120) asc";
//        }
        try {
            list = jdbc.mapList(sql,projectGuid,projectGuid);
        } catch (Exception e) {
            log.error("获取竞价曲线数据出错:", e);
            e.printStackTrace();
        }
        return list;
    }
    
    /**
     * 批量
     * @param projectRegGuid
     * @return
     */
    public Integer hlgp_bj_count(String projectRegGuid) {
        Integer count = 0;
        try {
            String sql = "SELECT count(1) FROM CQJY_GongChengInfo a " +
" inner JOIN CQJY_ProjectRegister c ON a.ProjectRegGuid = c.ProjectRegGuid " +
" AND c.AuditStatus = '3' " +
" inner JOIN JQXT_ProjectInfo d ON a.ProjectGuid = d.ProjectGuid " +
" inner join JQXT_BaoJiaHistroy his on his.BiaoDiGuid=d.ProjectGuid " +
" WHERE a.ProjectRegGuid = ?";
            count = jdbc.getInteger(sql,projectRegGuid);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取批量挂牌报价合计错: ", e);
        }
        return count;
    }

	public String getContent(String infoid) {
		String con = null;
		try {
			String sql = "select top 1 InfoContent content from View_InfoMain where infoid=?";
			con = jdbc.getString(sql, infoid);
			if (StringUtils.isNotBlank(con)) {
				con = con.replace(Global.old_pic_2, Global.old_pic_2_new);
			}

		} catch (Exception e) {
			log.error("iframe 获取公告详情出错:", e);
		}
		return con;
	}

	/**
	 * 成交公告
	 * @param infoid
	 * @return
	 */
	public GongGao getCJNews(String infoid) {
		GongGao gg = null;
		try {
			if(StringUtils.isNotBlank(infoid)){
				gg = jdbc.bean("select categoryname,title,click,chengjiaodate  from view_infomain_jygg where cjgg_guid=?",GongGao.class, infoid);
				if (gg != null && gg.getTitle() != null) {
					Random random = new Random();
					jdbc.update("update WebDB_Information set ClickTimes = isnull(ClickTimes,0)+"+random.nextInt(3)+" where infoid=?;",infoid);
					ConnectionFactory.commit();
				}
			}

		} catch (Exception e) {
			log.error("获取信息详情出错: ", e);
			ConnectionFactory.rollback();
		}
		return gg;
	}

	/**
	 * 查询 中止,终结,重新挂牌 等信息
	 * @param projectguid
	 * @return
	 */
	public List<GongGao> projectcontrol_Info(String projectguid) {
		List<GongGao> moreList = null;
		try {
			if (StringUtils.isNotBlank(projectguid)) {
				String sql = "select main.InfoID ,main.CategoryNum,StartDate gonggaofromdate,EndDate gonggaotodate,main.title,ctrl.projectcontroltype as controltype " +
						"from View_InfoMain main  inner join cqjy_projectcontrol ctrl on main.InfoID = ctrl.rowguid where ctrl.projectguid=? order by ctrl.row_id desc";
				moreList=jdbc.beanList(sql,GongGao.class,projectguid);
			}

		} catch (Exception e) {
			log.error("获取projectcontrol_Info 出错:", e);
		}

		return moreList;
	}

	public GongGao getNews(String infoid) {
		GongGao gg = null;
		try {
			if (StringUtils.isNotBlank(infoid)) {
				gg = jdbc.bean("select Categorynum,title,ClickTimes click,InfoDate gonggaofromdate,infoid,InfoDate as fabudate  from view_infomain where infoid=?", GongGao.class, infoid);
				if (gg != null && gg.getTitle() != null) {

					Random random = new Random();
					jdbc.update("update WebDB_Information set ClickTimes = isnull(ClickTimes,0)+" + random.nextInt(3) + " where infoid=?;", infoid);
					ConnectionFactory.commit();
				}
			}

		} catch (Exception e) {
			log.error("获取信息详情出错: ", e);
			ConnectionFactory.rollback();
		}
		return gg;
	}

	/**
	 * 获取增资扩股的标的企业信息
	 * @param projectGuid
	 * @return
	 */
	public List<Map> getZZKGList(String projectGuid) {
		List list = new ArrayList();
		try {
			String sql = "SELECT S.rdoGuoZiType,S.rdoJianGuanType,S.rdoGuoZiType,'*** ' AS objectID, -- 标的ID(objectID)\n" +
					"\t   G.ProjectGuid AS projectID, -- 项目ID(projectID)\n" +
					"\t   'A00003' AS recordType, -- 交易品种(recordType)\n" +
					"\t   CONVERT(NVARCHAR(30),S.OperateDate,21) AS createTime, -- 创建时间(createTime)\n" +
					"\t   CONVERT(NVARCHAR(30),GETDATE(),21) AS lastUpdateTime, -- 最后更新时间(lastUpdateTime)\n" +
					"\t   (CASE WHEN S.rdoGuoZiType='T' AND S.rdoJianGuanType='0' THEN S.rdoYQGuoZiRegulator\n" +
					"\t         WHEN S.rdoGuoZiType='T' AND S.rdoJianGuanType='1' THEN S.rdoFYQRegulator \n" +
					"\t   \tWHEN S.rdoGuoZiType='X' THEN S.rdoXZRegulator END) AS monitorName, -- 监管机构(部门)(monitorName)\n" +
					"\t   (CASE WHEN S.rdoGuoZiType='T' OR S.rdoGuoZiType='X' THEN \n" +
					"\t         (CASE WHEN S.BelongAreaCode='990000' THEN '000000' ELSE S.BelongAreaCode END) \n" +
					"\t               ELSE '' END) as monitorZone,  -- 监管机构（部门）地区代码(monitorZone)\n" +
					"\t   (CASE WHEN s.rdoGuoZiType='T' OR s.rdoGuoZiType='X' \n" +
					"\t         THEN s.ApproveDWName ELSE '' END) AS authorizeUnit, -- 批准单位名称(authorizeUnit)\n" +
//					"\t   (CASE WHEN S.WenJianTypeWenHao=0 THEN 'A07001'\n" +
//					"\t               WHEN S.WenJianTypeWenHao=1 THEN 'A07003'\n" +
//					"\t               WHEN S.WenJianTypeWenHao=2 THEN 'A07002'\n" +
//					"\t               WHEN S.WenJianTypeWenHao=3 THEN 'A07004'\n" +
//					"\t               WHEN S.WenJianTypeWenHao=4 THEN 'A07005'\n" +
//					"\t               WHEN S.WenJianTypeWenHao='' THEN ''\n" +
//					"                   WHEN S.WenJianTypeWenHao IS NULL THEN ''\n" +
//					"\t               ELSE 'A07006' END) AS authorizeFileType, -- 批准文件类型(authorizeFileType)\n" +
					"\t               S.WenJianTypeWenHao AS authorizeFileType, -- 批准文件类型(authorizeFileType)\n" +
					"\t   ISNULL(S.ApproveWJName,'') as authorizeFileName, -- 批准文件名称或决议名称(authorizeFileName)\n" +
					"\t   ltrim(rtrim(S.JiGouCode)) AS HQCode, -- 国家出资企业统一社会信用代码或组织机构代码(HQCode)\n" +
					"\t   ltrim(rtrim(S.BuMenName)) AS HQName, -- 国家出资企业或主管部门名称(HQName)\n" +
					"\t   ltrim(rtrim(S.WeiTuoRenName)) AS objectName, -- 标的企业名称(objectName)\n" +
					"\t   S.ZZJiGouCode AS objectCode, -- 增资企业统一社会信用代码或组织机构代码(objectCode)\n" +
//					"\t   (CASE WHEN S.EconomicSize=0 THEN 'A04001'\n" +
//					"\t               WHEN(S.EconomicSize=1) THEN 'A04002'\n" +
//					"\t               WHEN(S.EconomicSize=2) THEN 'A04003'\n" +
//					"\t               WHEN(S.EconomicSize=3) THEN 'A04004'\n" +
//					"\t               END) AS managerScale, -- 增资企业经营规模(managerScale)\n" +
					"\t               S.EconomicSize AS managerScale, -- 增资企业经营规模(managerScale)\n" +
					"\t   (CASE WHEN S.SuoZaiAreaCode='990000' THEN '000000' \n" +
					"\t         ELSE S.SuoZaiAreaCode END) AS zone, -- 增资企业所在地区(zone)\n" +
					"\t   LTRIM(RTRIM(REPLACE(S.BelongIndustryCode, ',', ''))) AS industryCode, -- 增资企业所属行业码(industryCode)\n" +
					"\t   S.CompanyXingZhi AS economyType, -- 增资企业经济类型(economyType)\n" +
					"\t   S.CompanyLeiXing AS economyNature, -- 增资企业企业类型(economyNature)\n" +
					"\t   S.AllStaffNum AS employeeQuantity, -- 增资企业职工人数(employeeQuantity)\n" +
					"\t   SUBSTRING(S.businessScope, 1, 4000) AS businessScope, -- 主要业务、经营范围(businessScope)\n" +
					"\t   (case \n" +
					"\t\twhen S.CompanyLeiXing ='A19003' then '' \n" +
					"\t\telse S.RegisterZiBen +'万元' +\n" +
					"\t\t\t(case\n" +
					"\t\t\t\twhen(S.MoneyType ='1') then '人民币'\n" +
					"\t\t\t\twhen(S.MoneyType is null) then '人民币'\n" +
					"\t\t\t\twhen(S.MoneyType ='2') then '美元'\n" +
					"\t\t\t\twhen(S.MoneyType ='3') then '欧元'\n" +
					"\t\t\t\twhen(S.MoneyType ='4') then '日元'\n" +
					"\t\t\t\twhen(S.MoneyType ='5') then '英镑'\n" +
					"\t\t\t\twhen(S.MoneyType ='6') then '港元'\n" +
					"\t\t\t\twhen(S.MoneyType ='7') then '新加坡币'\n" +
					"\t\t\t\twhen(S.MoneyType ='8') then '瑞士法郎'\n" +
					"\t\t\t\twhen(S.MoneyType ='9') then '韩元'\n" +
					"\t\t\t\telse '其他'\n" +
					"\t\t\tend)\n" +
					"\t\tend) AS registeredCapital, -- 注册资本（含单位、币种）(registeredCapital)(页面上暂时没有对应的字段hutianyi)\n" +
					"\t   \t(case \n" +
					"\t\t\twhen S.CompanyLeiXing !='A19003' then '' \n" +
					"\t\t\telse S.totalStockCapital +'万元' +\n" +
					"\t\t\t\t(case\n" +
					"\t\t\t\t\twhen(S.MoneyType ='1') then '人民币'\n" +
					"\t\t\t\t\twhen(S.MoneyType is null) then '人民币'\n" +
					"\t\t\t\t\twhen(S.MoneyType ='2') then '美元'\n" +
					"\t\t\t\t\twhen(S.MoneyType ='3') then '欧元'\n" +
					"\t\t\t\t\twhen(S.MoneyType ='4') then '日元'\n" +
					"\t\t\t\t\twhen(S.MoneyType ='5') then '英镑'\n" +
					"\t\t\t\t\twhen(S.MoneyType ='6') then '港元'\n" +
					"\t\t\t\t\twhen(S.MoneyType ='7') then '新加坡币'\n" +
					"\t\t\t\t\twhen(S.MoneyType ='8') then '瑞士法郎'\n" +
					"\t\t\t\t\twhen(S.MoneyType ='9') then '韩元'\n" +
					"\t\t\t\t\telse '其他'\n" +
					"\t\t\t\tend)\n" +
					"\t\tend) AS totalStockCapital, -- 股本总额(totalStockCapital)\n" +
					"\t   C.NianDu AS _NianDu,--年度\n" +
					"\t   C.NianDuDate AS _NianDuDate,\n" +
					"\t   C.QianNianDuDate AS _QianNianDuDate,\n" +
					"\t   C.NianDuShenHeOrg AS _NianDuShenHeOrg,--审计机构\n" +
					"\t   C.ShenHeOrg AS _ShenHeOrg,\n" +
					"\t   C.QianNDShenHeOrg AS _QianNDShenHeOrg,\n" +
					"\t   C.NianDuYingYeInCome AS _NianDuYingYeInCome,--营业收入 \n" +
					"\t   C.YingYeInCome AS _YingYeInCome,\n" +
					"\t   C.QianNDYingYeInCome AS _QianNDYingYeInCome,\n" +
					"\t   C.NianDuYingYeProfit AS _NianDuYingYeProfit,--利润总额\n" +
					"\t   C.YingYeProfit AS _YingYeProfit,\n" +
					"\t   C.QianNDYingYeProfit AS _QianNDYingYeProfit,\n" +
					"\t   C.NianDuJinProfit AS _NianDuJinProfit,--净利润\n" +
					"\t   C.JinProfit AS _JinProfit,\n" +
					"\t   C.QianNDJinProfit AS _QianNDJinProfit,\n" +
					"\t   C.NianDuTotalZC AS _NianDuTotalZC,--总资产\n" +
					"\t   C.TotalZC AS _TotalZC,\n" +
					"\t   C.QianNDTotalZC AS _QianNDTotalZC,\n" +
					"\t   C.NianDuTotalFZ AS _NianDuTotalFZ,--总负债\n" +
					"\t   C.TotalFZ AS _TotalFZ,\n" +
					"\t   C.QianNDTotalFZ AS _QianNDTotalFZ,\n" +
					"\t   C.NianDuOwnerQuanYi AS _NianDuOwnerQuanYi,--所有者权益\n" +
					"\t   C.OwnerQuanYi AS _OwnerQuanYi,\n" +
					"\t   C.QianNDOwnerQuanYi AS _QianNDOwnerQuanYi,\n" +
					"\t   CONVERT(nvarchar(30),C.CaiWuDate,23) AS stmtDate, -- 报表日期(stmtDate)\n" +
					"\t   (CASE WHEN C.CaiWuDate IS NULL THEN ''\n" +
					"\t         WHEN C.StmtType='Y' THEN '月报'\n" +
					"\t         WHEN C.StmtType='J' THEN '季报'\n" +
					"\t   \t     WHEN C.StmtType='N' THEN '年报'\n" +
					"\t   \tEND) AS stmtType, -- 报表类型(stmtType)\n" +
					"\t   (CASE WHEN C.CaiWuDate IS NULL THEN NULL ELSE C.CaiWuTotalZC END) AS stmtAsset, -- 资产总额(stmtAsset)\n" +
					"\t   (CASE WHEN C.CaiWuDate IS NULL THEN NULL ELSE C.CaiWuOwnerQuanYi END) AS stmtEquity, -- 净资产（所有者权益）(stmtEquity)\n" +
					"\t   (CASE WHEN C.CaiWuDate IS NULL THEN NULL ELSE C.CaiWuTotalFZ END) AS stmtDebt, -- 负债总额(stmtDebt)\n" +
					"\t   (CASE WHEN C.CaiWuDate IS NULL THEN NULL ELSE C.CaiWuYingYeInCome END) AS stmtEarning, -- 营业收入(stmtEarning)\n" +
					"\t   (CASE WHEN C.CaiWuDate IS NULL THEN NULL ELSE C.CaiWuYingYeProfit END) AS stmtProfit, -- 利润总额(stmtProfit)\n" +
					"\t   (CASE WHEN C.CaiWuDate IS NULL THEN NULL ELSE C.CaiWuJinProfit END) AS stmtNetProfit, -- 净利润(stmtNetProfit)\n" +
					"\t\tPingGu.PingGuOrg as evaluateUnit, -- 评估机构(evaluateUnit)\n" +
					"\t\tPingGu.PingGuHeZhunOrg as approveUnit, -- 评估核准(备案)单位(approveUnit)\n" +
					"\t\tPingGu.HeZhunDate as approveDate, -- 核准(备案)日期(approveDate)\n" +
					"\t\tPingGu.PingGuDate as evaluateDate, -- 评估基准日(evaluateDate)\n" +
					"\t\tPingGu.ZZCPingGu as evaluateAsset, -- 标的企业总资产评估值(evaluateAsset)\n" +
					"\t\tPingGu.JZCPingGu as evaluateEquity, -- 标的企业净资产评估值(evaluateEquity)\n" +
					"\t\tPingGu.ZFZPingGu as evaluateDebt, -- 标的企业总负债评估值(evaluateDebt)\n" +
					"\t\tPingGu.ZZCZhangMian as bookAsset, -- 标的企业总资产账面值(bookAsset)\n" +
					"\t\tPingGu.JZCZhangMian as bookEquity, -- 标的企业净资产账面值(bookEquity)\n" +
					"\t\tPingGu.ZFZZhangMian as bookDebt -- 标的企业总负债账面值(bookDebt)\n" +
					"\t   FROM CQJY_GongChengInfo AS G\n" +
					"\t   INNER JOIN ShouRangfInfo AS S ON G.ProjectRegGuid = S.RowGuid\n" +
					"\t   INNER JOIN CQJY_JiaoYiGongGao AS J ON G.projectGuid = J.projectGuid\n" +
					"\t   INNER JOIN CaiWuXinXi AS C ON G.projectGuid = C.projectGuid\n" +
					"\t   left join PingGu on G.projectGuid = PingGu.projectGuid \n" +
					"\t   WHERE G.projectGuid = '" + projectGuid + "'";
			list = jdbc.mapList(sql);
		} catch (Exception e) {
			log.error("获取增资扩股标的企业信息出错: ", e);
		}
		return list;
	}

	/**
	 * 获取产股权的标的企业信息
	 * @param projectGuid
	 * @return
	 */

	public Map getGQList(String projectGuid) {
		Map<String,Object> map = null;
		try {
			String sql = "select\n" +
					"CQJY_GongChengInfo.ProjectGuid as projectID, -- 项目ID\n" +
					"convert(nvarchar(30),CQJY_GongChengInfo.OperateDate,21) as createTime, -- 创建时间\n" +
					"(case\n" +
					"when(CQJY_GongChengInfo.ProjectGQType=0) then '预披露项目'\n" +
					"when(CQJY_GongChengInfo.ProjectGQType=1) then '正式披露项目'\n" +
					"when(CQJY_GongChengInfo.ProjectGQType=2) then '非公开转让项目'\n" +
					"else '其他项目'\n" +
					"end) as projectType, -- 项目类别\n" +
					"(case\n" +
					"when(CQJY_GongChengInfo.isTransferOfCtrl=1) then 'true'\n" +
					"when(CQJY_GongChengInfo.isTransferOfCtrl=0) then 'false'\n" +
					"else 'false'\n" +
					"end) as isTransferOfCtrl, -- 是否导致转让标的企业的实际控制权发生转移\n" +
					"(case \n" +
					"when(CQJY_GongChengInfo.isBind=1) then 'true'\n" +
					"when(CQJY_GongChengInfo.isBind=0) then 'false'\n" +
					"else 'false'\n" +
					"end) as isBind, -- 是否捆绑转让\n" +
					"CQJY_ProjectRegister.HuiYJG as proBroker, -- 受托机构\n" +
					"'' as businessStatus, -- 项目状态\n" +
					"'???' as pauseDate, -- 中止时间\n" +
					"'???' as pauseReason, -- 中止原因\n" +
					"'???' as resumeDate, -- 恢复时间\n" +
					"'???' as manPostponeReason, -- 人工延牌原因\n" +
					"'???' as terminateDate, -- 终结时间\n" +
					"'???' as terminateReason, -- 终结时间原因\n" +
					"'???' as terminateApproval, -- 中途撤牌批准机构\n" +
					"CQJY_GongChengInfo.ProjectNo as projectCode,\n" +
					"CQJY_GongChengInfo.ProjectName as object, -- 转让标的\n" +
					"CQJY_JiaoYiGongGao.GuaPaiPrice as objectPrice, -- 转让底价\n" +
					"CQJY_JiaoYiGongGao.ZhaiQuanJinE as creditorRights, -- 债权金额(creditorRights)\n" +
					"CONVERT(nvarchar(20),CQJY_JiaoYiGongGao.GongGaoFromDate,23) as publishDate, -- 披露(挂牌)日期\n" +
					"CONVERT(nvarchar(20),CQJY_JiaoyiGongGao.GongGaoToDate,23) as expireDate, -- 披露(挂牌)期满日期\n" +
					"CQJY_JiaoYiGongGao.GuaPaiGGDate as Duration, -- 挂牌期间\n" +
					"CONVERT(nvarchar(20),CQJY_JiaoyiGongGao.GongGaoToDate,23) as pickDate, -- 项目摘牌时间\n" +
					"(case\n" +
					"when CQJY_JiaoYiGongGao.GuQuanJiaoYiType=1 then '招投标'\n" +
					"when CQJY_JiaoYiGongGao.GuQuanJiaoYiType=2 then '网络竞价'\n" +
					"when CQJY_JiaoYiGongGao.GuQuanJiaoYiType=3 then '拍卖'\n" +
					"when CQJY_JiaoYiGongGao.GuQuanJiaoYiType=5 then '非竞价'\n" +
					"end) as exchangeType, -- 选择的交易方式\n" +
					"CONVERT(nvarchar(20),ISNULL(CQJY_JiaoYiGongGao.SelectDate ,''),23) as selectDate, -- 选择交易方式日期\n" +
					"CONVERT(nvarchar(20),(JQXT_ProjectInfo.YuDingFrom+JQXT_ProjectInfo.StartTime),20) as webBidStartTime, --  网络竞价或动态报价开始时间\n" +
					"CONVERT(nvarchar(20),CAST(JQXT_ProjectInfo.PlanEndTime as datetime),20) as webBidEndTime,  -- 网络竞价或动态报价结束时间\n" +
					"(case\n" +
					"when CQJY_ChengJiaoGongGao.GuQuanJiaoYiType=1 then '招投标' -- 招投标\n" +
					"when CQJY_ChengJiaoGongGao.GuQuanJiaoYiType=2 then '网络竞价' -- 网络竞价\n" +
					"when CQJY_ChengJiaoGongGao.GuQuanJiaoYiType=3 then '拍卖' -- 拍卖\n" +
					"when CQJY_ChengJiaoGongGao.GuQuanJiaoYiType=5 then '非竞价' -- 非竞价\n" +
					"end) as finalExchangeType, -- 最终确定交易方式\n" +
					"CQJY_ChengJiaoGongGao.NewChengJiaoPrice as tradeValue, -- 交易价格\n" +
					"CONVERT(nvarchar(20),CQJY_ChengJiaoGongGao.tradeDate,23) as tradeDate, -- 交易凭证确认日期\n" +
					"CONVERT(nvarchar(20),CQJY_ChengJiaoGongGao.SHR_Date,23) as announcePubDate, -- 交易结果公告发布起始日期\n" +
					"BiaoDiCompany.companyName as objectName, -- 标的企业名称(objectName)\n" +
					"BiaoDiCompany.UnitOrgNum as objectCode, -- 标的企业统一社会信用代码或组织机构代码(objectCode)\n" +
					"(case\n" +
					"when(BiaoDiCompany.JingYinGuiMo=1) then '大型'\n" +
					"when(BiaoDiCompany.JingYinGuiMo=2) then '中型'\n" +
					"when(BiaoDiCompany.JingYinGuiMo=3) then '小型'\n" +
					"when(BiaoDiCompany.JingYinGuiMo=4) then '微型'\n" +
					"end) managerScale, -- 标的企业经营规模(managerScale)\n" +
					"BiaoDiCompany.SuoZaiAreaCode as Zone, -- 标的企业所在地区(Zone)\n" +
					"LTRIM(RTRIM(REPLACE(BiaoDiCompany.HangYeCode, ',', ''))) as industryCode, -- 标的企业所属行业码(industryCode)\n" +
					"BiaoDiCompany.CompanyXingZhi as economyType, -- 标的企业经济类型(economyType)\n" +
					"BiaoDiCompany.CompanyLeiXing as economyNature, -- 标的企业企业类型(economyNature)\n" +
					"BiaoDiCompany.AllStaffNum as employeeQuantity, -- 标的企业职工人数(employeeQuantity)\n" +
					"SUBSTRING(BiaoDiCompany.JingYinFanWei, 1, 4000) as businessScope, -- 主要业务、经营范围(businessScope)\n" +
					"convert(nvarchar(20),BiaoDiCompany.ZhuCeZiBen)+'万元'+\n" +
					"(case\n" +
					"when(BiaoDiCompany.MoneyType ='1') then '人民币'\n" +
					"when(BiaoDiCompany.MoneyType is null) then '人民币'\n" +
					"when(BiaoDiCompany.MoneyType ='2') then '美元'\n" +
					"when(BiaoDiCompany.MoneyType ='3') then '欧元'\n" +
					"when(BiaoDiCompany.MoneyType ='4') then '日元'\n" +
					"when(BiaoDiCompany.MoneyType ='5') then '英镑'\n" +
					"when(BiaoDiCompany.MoneyType ='6') then '港元'\n" +
					"when(BiaoDiCompany.MoneyType ='7') then '新加坡币'\n" +
					"when(BiaoDiCompany.MoneyType ='8') then '瑞士法郎'\n" +
					"when(BiaoDiCompany.MoneyType ='9') then '韩元'\n" +
					"else '其他'\n" +
					"end)registeredCapital, -- 注册资本（含单位、币种）(registeredCapital)\n" +
					"isnull(BiaoDiCompany.sellPercent,0.0000) as sellPercent, -- 本次拟转让产（股）权比例(%)(sellPercent)\n" +
					"(case\n" +
					"when(CQJY_JiaoYiGongGao.NeiBJYFangS='01') then '董事会决议'\n" +
					"when(CQJY_JiaoYiGongGao.NeiBJYFangS='02') then '总经理办公会决议'\n" +
					"when(CQJY_JiaoYiGongGao.NeiBJYFangS='03') then '其他'\n" +
					"when(CQJY_JiaoYiGongGao.NeiBJYFangS='04') then '股东会决议'\n" +
					"when(CQJY_JiaoYiGongGao.NeiBJYFangS='') then ''\n" +
					"when(CQJY_JiaoYiGongGao.NeiBJYFangS IS NULL) then ''\n" +
					"else '其他'\n" +
					"end)decisionFileType, -- 决策文件类型(decisionFileType)\n" +
					"CaiWuXinXi.NianDuDate as auditYear, -- 审计年度(auditYear)\n" +
					"CaiWuXinXi.ShenHeOrg as auditUnit,  -- 审计机构(auditUnit)\n" +
					"CaiWuXinXi.TotalZC as auditAsset, -- 资产总额(auditAsset)\n" +
					"CaiWuXinXi.OwnerQuanYi as auditEquity, -- 净资产（所有者权益）(auditEquity)\n" +
					"CaiWuXinXi.TotalFZ as auditDebt, -- 负债总额(auditDebt)\n" +
					"CaiWuXinXi.YingYeInCome as auditEarning, -- 营业收入(auditEarning)\n" +
					"CaiWuXinXi.YingYeProfit as auditProfit, -- 利润总额(auditProfit)\n" +
					"CaiWuXinXi.JinProfit as auditNetProfit, -- 净利润(auditNetProfit)\n" +
					"CONVERT(nvarchar(20),CaiWuXinXi.CaiWuDate,23) as stmtDate, -- 报表日期(stmtDate)\n" +
					"(case\n" +
					"when(CaiWuXinXi.StmtType='Y') then '月报'\n" +
					"when(CaiWuXinXi.StmtType='J') then '季报'\n" +
					"when(CaiWuXinXi.StmtType='N') then '年报'\n" +
					"else '无'\n" +
					"end)stmtType, -- 报表类型(stmtType)\n" +
					"CaiWuXinXi.CaiWuTotalZC as stmtAsset, -- 资产总额(stmtAsset)\n" +
					"CaiWuXinXi.CaiWuOwnerQuanYi as stmtEquity, -- 净资产（所有者权益）(stmtEquity)\n" +
					"CaiWuXinXi.CaiWuTotalFZ as stmtDebt, -- 负债总额(stmtDebt)\n" +
					"CaiWuXinXi.CaiWuYingYeInCome as stmtEarning, -- 营业收入(stmtEarning)\n" +
					"CaiWuXinXi.CaiWuYingYeProfit as stmtProfit, -- 利润总额(stmtProfit)\n" +
					"CaiWuXinXi.CaiWuJinProfit as stmtNetProfit, -- 净利润(stmtNetProfit)\n" +
					"PingGu.PingGuOrg as evaluateUnit, -- 评估机构(evaluateUnit)\n" +
					"PingGu.PingGuHeZhunOrg as approveUnit, -- 评估核准(备案)单位(approveUnit)\n" +
					"PingGu.HeZhunDate as approveDate, -- 核准(备案)日期(approveDate)\n" +
					"PingGu.PingGuDate as evaluateDate, -- 评估基准日(evaluateDate)\n" +
					"PingGu.ZZCPingGu as evaluateAsset, -- 标的企业总资产评估值(evaluateAsset)\n" +
					"PingGu.JZCPingGu as evaluateEquity, -- 标的企业净资产评估值(evaluateEquity)\n" +
					"PingGu.ZFZPingGu as evaluateDebt, -- 标的企业总负债评估值(evaluateDebt)\n" +
					"PingGu.ZZCZhangMian as bookAsset, -- 标的企业总资产账面值(bookAsset)\n" +
					"PingGu.JZCZhangMian as bookEquity, -- 标的企业净资产账面值(bookEquity)\n" +
					"PingGu.ZFZZhangMian as bookDebt, -- 标的企业总负债账面值(bookDebt)\n" +
					"PingGu.BiaoDiPingGu as objectEvaluateValue, -- 转让标的评估值(objectEvaluateValue)\n" +
					"(case\n" +
					"when(BiaoDiCompany.IsHaveGuoYouTD=0) then 'false'\n" +
					"when(BiaoDiCompany.IsHaveGuoYouTD=1) then 'true'\n" +
					"else 'false'\n" +
					"end)hasContainGround, -- 转让标的是否含有国有划拨土地(hasContainGround)\n" +
					"(case\n" +
					"when(CQJY_JiaoYiGongGao.YuGuQuanJiaoYiType=1) then '招投标'\n" +
					"when(CQJY_JiaoYiGongGao.YuGuQuanJiaoYiType=2) then '网络竞价'\n" +
					"when(CQJY_JiaoYiGongGao.YuGuQuanJiaoYiType=3) then '拍卖'\n" +
					"when(CQJY_JiaoYiGongGao.YuGuQuanJiaoYiType=5) then '非竞价'\n" +
					"end)pubExchangeType, -- 披露的交易方式(pubExchangeType)\n" +
					"(case\n" +
					"when CQJY_ProjectRegister.IsPLLR ='1' then ('/ejy/infodetail/?infoid=' +CQJY_ProjectRegister.projectRegGuid)\n" +
					"else ('/ejy/infodetail/?infoid='+CQJY_JiaoYiGongGao.RowGuid)\n" +
					"end) as projectLinkUrl, -- 项目在交易机构网站的挂牌链接(projectLinkUrl)\n" +
					"(case\n" +
					"when(CQJY_JiaoYiGongGao.hasBuyIntent=1) then 'true'\n" +
					"when(CQJY_JiaoYiGongGao.hasBuyIntent=0) then 'false'\n" +
					"else 'false'\n" +
					"end)hasBuyIntent, -- 企业管理层是否参与受让(hasBuyIntent)\n" +
					"(case\n" +
					"when(BiaoDiCompany.IsAbandonYouXian=1) then 'true'\n" +
					"when(BiaoDiCompany.IsAbandonYouXian=0) then 'false'\n" +
					"else 'false'\n" +
					"end)giveUpPriority, -- 有限责任公司原股东是否放弃优先受让权(giveUpPriority)\n" +
					"SUBSTRING(CQJY_JiaoYiGongGao.ShouRangZGTJ, 1, 4000) as buyerPostulate, -- 受让方资格条件(buyerPostulate)\n" +
					"SUBSTRING(CQJY_JiaoYiGongGao.ZhongDContent, 1, 4000) as importantInfo, -- 其他披露事项(importantInfo)\n" +
					"SUBSTRING(CQJY_JiaoYiGongGao.ZhuanRangfTJ, 1, 4000) as sellConditions, -- 与转让相关的其他条件(sellConditions)\n" +
					"CQJY_BaoMingNMG.RowGuid as buyerID, -- 受让方ID\n" +
					"CQJY_ChengJiaoGongGao.changeReason as changeExTypeReason, -- 更改交易方式的原因\n" +
					"(case when CQJY_ChengJiaoGongGao.GuQuanJiaoYiType = '2' then '' else convert(nvarchar(20),CQJY_ChengJiaoGongGao.CONTRACT_SIGN_DATE,23) end) as transactionTime, -- 组织交易时间\n" +
					"convert(nvarchar(20),CQJY_ChengJiaoGongGao.CONTRACT_SIGN_DATE,23) as contrSignDate, -- 产权交易合同签订日期\n" +
					"(case\n" +
					"\twhen CQJY_ChengJiaoGongGao.paymentType=01 then '一次性付款'\n" +
					"\twhen CQJY_ChengJiaoGongGao.paymentType=02 then '分期付款'\n" +
					"end) as paymentType, -- 付款方式\n" +
					"(case\n" +
					"when CQJY_ChengJiaoGongGao.paymentType=01 then NULL\n" +
					"when CQJY_ChengJiaoGongGao.paymentType=02 then CQJY_ChengJiaoGongGao.firstPayValue\n" +
					"else NULL\n" +
					"end) as firstPayValue, -- 首付金额\n" +
					"(case\n" +
					"when CQJY_ChengJiaoGongGao.paymentType=01 then NULL\n" +
					"when CQJY_ChengJiaoGongGao.paymentType=02 then CQJY_ChengJiaoGongGao.firstPayPercent\n" +
					"else NULL\n" +
					"end) as firstPayPercent, -- 首付比例\n" +
					"(case\n" +
					"when CQJY_ChengJiaoGongGao.paymentType=01 then ''\n" +
					"when CQJY_ChengJiaoGongGao.paymentType=02 then convert(nvarchar(20),CQJY_ChengJiaoGongGao.remainPayDate,23)\n" +
					"else ''\n" +
					"end) as remainPayDate  -- 尾款付款期限\n" +
					"from CQJY_GongChengInfo\n" +
					"inner join CQJY_JiaoYiGongGao on CQJY_JiaoyiGongGao.projectGuid = CQJY_GongChengInfo.projectGuid\n" +
					"inner join CQJY_ProjectRegister on CQJY_ProjectRegister.projectregGuid = CQJY_GongChengInfo.projectRegGuid\n" +
					"inner join BiaoDiCompany on CQJY_GongChengInfo.projectGuid = BiaoDiCompany.projectGuid\n" +
					"left join PingGu on CQJY_GongChengInfo.projectGuid = PingGu.projectGuid\n" +
					"left join CaiWuXinXi on CQJY_GongChengInfo.projectGuid = CaiWuXinXi.projectGuid\n" +
					"left join CQJY_ChengJiaoGongGao on CQJY_ChengJiaoGongGao.projectGuid = CQJY_GongChengInfo.projectGuid\n" +
					"left join CQJY_BaoMingNMG on (CQJY_BaoMingNMG.danweiguid = CQJY_ChengJiaoGongGao.shourangrenguid \n" +
					"and CQJY_BaoMingNMG.biaodiguid = CQJY_ChengJiaoGongGao.ProjectGuid)\n" +
					"left join JQXT_ProjectInfo on JQXT_ProjectInfo.projectGuid = CQJY_GongChengInfo.projectGuid\n" +
					"where CQJY_GongChengInfo.projectGuid = '"+projectGuid+"' and CQJY_GongChengInfo.AuditStatus = '3';\n";

			map = jdbc.map(sql);
		} catch (Exception e) {
			log.error("获取产股权标的企业信息出错: ", e);
		}
		return map;
	}

	public Map<String,Object> gf(String pid){
		Map<String,Object> map = null;
		try {

			String sql = "select isnull(ShouRangfInfo.BiaoDiCompanyPercent,0.0000) as a," +
					" isnull(ShouRangfInfo.BiaoDiCompanyGuFen,0) as b		from ShouRangfInfo " +
					" where ShouRangfInfo.RowGuid = ? " +
					" union " +
					" select isnull(ShouRangfInfoUnion.BiaoDiCompanyPercent,0.0000) as a, " +
					" isnull(ShouRangfInfoUnion.BiaoDiCompanyGuFen,0) as b		from ShouRangfInfo " +
					" inner join ShouRangfInfoUnion on ShouRangfInfoUnion.ShouRangfGuid = ShouRangfInfo.RowGuid  " +
					" where ShouRangfInfo.RowGuid = ?";

			map = jdbc.map(sql,pid,pid);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 代号换成中文
	 * @param data
	 * @return
	 */
	public Map getRealName(Map data) {
		if (data != null) {
			try {

				String sql="select ItemText from VIEW_CodeMain_CodeItems where CodeName = ? and ItemValue = ?";
				String sql2="select IndustryName value from Sys_IndustryCode where IndustryCode = ?";
				String gzjgjg = "monitorName";//国资监管机构
				String hyfl="industryCode";//行业分类
				String jjlx="economyType";//股权转让方经济类型
				String jjxz="economyNature";//转让方经济性质
				String pzwjlx="authorizeFileType";//批准文件类型
				String qyszdq="zone";//增资企业所在地区
				String jygm="managerScale";//增资企业经营规模
				String jgjgdqdm="monitorZone";//监管机构（部门）地区代码

				String rdoGuoZiType = "";
				if(data.containsKey("rdoGuoZiType")){
					rdoGuoZiType = data.get("rdoGuoZiType").toString();

				}

				String rdoJianGuanType = "";
				if(data.containsKey("rdoJianGuanType")){
					rdoJianGuanType = data.get("rdoJianGuanType").toString();

				}

				if(data.containsKey(gzjgjg)) {
					String typecode = data.get(gzjgjg)==null?"":data.get(gzjgjg).toString();
					String typename="";
					if (StringUtils.isNotBlank(rdoGuoZiType) && rdoGuoZiType.equals("X")) {//中央其他部委监管
						typename = jdbc.getString(sql, DataType.ZYQTBWJG.getType(), typecode);
					}else if(StringUtils.isNotBlank(rdoGuoZiType) && rdoGuoZiType.equals("T") ){//监管机构（部门）
						if (StringUtils.isNotBlank(rdoJianGuanType) && rdoJianGuanType.equals("0")){
							typename = jdbc.getString(sql, DataType.GZJGJG.getType(), typecode);
						}else if (StringUtils.isNotBlank(rdoJianGuanType) && rdoJianGuanType.equals("1")){//国资监管机构（非央企）
							typename = jdbc.getString(sql, DataType.GZJGJGFYQ.getType(), typecode);
						}
					}
					data.put(gzjgjg + "_name", typename);
//					System.out.println("typename: "+typename);
				}
//				if(data.containsKey(gzjgjg)){//监管机构（部门）
//					String typecode = data.get(gzjgjg).toString();
//					String typename = jdbc.getString(sql, DataType.GZJGJG.getType(), typecode);
//					data.put(gzjgjg + "_name", typename);
//				}

				if (data.containsKey(hyfl)) {//增资企业所属行业
					String typecode = data.get(hyfl).toString();
//					String typename = jdbc.getString(sql, DataType.GMQYJJHYFL.getType(), typecode);
					String typename = jdbc.getString(sql2, typecode);
					data.put(hyfl + "_name", typename);
				}

				if (data.containsKey(jjlx)) {//增资企业经济类型
					String typecode = data.get(jjlx).toString();
					String typename = jdbc.getString(sql, DataType.GQZRFJJLX.getType(), typecode);
					data.put(jjlx + "_name", typename);
				}

				if (data.containsKey(jjxz)) {//增资企业企业类型
					String typecode = data.get(jjxz).toString();
					String typename = jdbc.getString(sql, DataType.ZRFJJXZ.getType(), typecode);
					data.put(jjxz + "_name", typename);
				}

				if(data.containsKey(pzwjlx)){//批准文件类型
					String typecode = data.get(pzwjlx).toString();
					String typename = jdbc.getString("select ItemText from VIEW_CodeMain_CodeItems  where CodeName=? and itemvalue=?", DataType.PZWJLX.getType(), typecode);
					data.put(pzwjlx + "_name", typename);
				}

				if(data.containsKey(qyszdq)){//增资企业所在地区
					String typecode = data.get(qyszdq).toString();
					String typename = jdbc.getString("select CityName from HuiYuan_City where CityCode= ? ", typecode);
					data.put(qyszdq + "_name", typename);
				}

				if(data.containsKey(jgjgdqdm)){//监管机构（部门）地区代码
					String typecode = data.get(jgjgdqdm).toString();
					String typename = jdbc.getString("select CityName from HuiYuan_City where CityCode= ? ", typecode);
					data.put(jgjgdqdm + "_name", typename);
				}

				if(data.containsKey(jygm)){//增资企业经营规模
					String typecode = data.get(jygm).toString();
					String typename = jdbc.getString(sql,DataType.JYGM.getType(), typecode);
					data.put(jygm + "_name", typename);
				}

			} catch (Exception e) {
				e.printStackTrace();
				log.error("获取实物报名数据出错: ", e);
			}
		}
		return data;
	}
	
	
	public GongGao baojiafangshi(String projectid) {
		GongGao gg = null;
		try {
				String sql = " select top 1 JingJiaFangShi JingJiaFangShi_1,cast(PlanEndTime as datetime) jingjia_end ,cast(begindate as datetime) jingjia_start  from JQXT_ProjectInfo where OrgBiaoDiGuid=? order by Row_ID desc ";
				gg = jdbc.bean(sql, GongGao.class,projectid);
		} catch (Exception e) {
			log.error("获取竞价会状态出错:", e);
		}
		return gg;
	}
	/**
	 * 获取预披露ProjectGuid
	 * @param infoid
	 * @return
	 */
	public String getYPLProjectGuid(String infoid) {
		String code = null;
		try {
			code = jdbc.getString("select ProjectGuid from CQJY_JiaoYiGongGao_Temp WHERE RowGuid=?", infoid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}
	/**
	 * 获取预披露的标的企业信息
	 * @param projectGuid
	 * @return
	 */
	public List<Map> getYPLList(String projectGuid) {
		List list = new ArrayList();
		try {
			String sql = "select\n" +
					"CQJY_GongChengInfo_Temp.ProjectGuid as projectID, -- 项目ID\n" +
					"convert(nvarchar(30),CQJY_GongChengInfo_Temp.OperateDate,21) as createTime, -- 创建时间\n" +
					"(case\n" +
					"when(CQJY_GongChengInfo_Temp.ProjectGQType=0) then '预披露项目'\n" +
					"when(CQJY_GongChengInfo_Temp.ProjectGQType=1) then '正式披露项目'\n" +
					"when(CQJY_GongChengInfo_Temp.ProjectGQType=2) then '非公开转让项目'\n" +
					"else '其他项目'\n" +
					"end) as projectType, -- 项目类别\n" +
					"(case\n" +
					"when(CQJY_GongChengInfo_Temp.isTransferOfCtrl=1) then 'true'\n" +
					"when(CQJY_GongChengInfo_Temp.isTransferOfCtrl=0) then 'false'\n" +
					"else 'false'\n" +
					"end) as isTransferOfCtrl, -- 是否导致转让标的企业的实际控制权发生转移\n" +
					"(case \n" +
					"when(CQJY_GongChengInfo_Temp.isBind=1) then 'true'\n" +
					"when(CQJY_GongChengInfo_Temp.isBind=0) then 'false'\n" +
					"else 'false'\n" +
					"end) as isBind, -- 是否捆绑转让\n" +
					"CQJY_ProjectRegister_Temp.HuiYJG as proBroker, -- 受托机构\n" +
					"'' as businessStatus, -- 项目状态\n" +
					"'???' as pauseDate, -- 中止时间\n" +
					"'???' as pauseReason, -- 中止原因\n" +
					"'???' as resumeDate, -- 恢复时间\n" +
					"'???' as manPostponeReason, -- 人工延牌原因\n" +
					"'???' as terminateDate, -- 终结时间\n" +
					"'???' as terminateReason, -- 终结时间原因\n" +
					"'???' as terminateApproval, -- 中途撤牌批准机构\n" +
					"CQJY_GongChengInfo_Temp.ProjectNo as projectCode,\n" +
					"CQJY_GongChengInfo_Temp.ProjectName as Object, -- 转让标的\n" +
					"CQJY_JiaoYiGongGao_Temp.GuaPaiPrice as objectPrice, -- 转让底价\n" +
					"CQJY_JiaoYiGongGao_Temp.ZhaiQuanJinE as creditorRights, -- 债权金额(creditorRights)\n" +
					"CONVERT(nvarchar(20),CQJY_JiaoYiGongGao_Temp.GongGaoFromDate,23) as publishDate, -- 披露(挂牌)日期\n" +
					"CONVERT(nvarchar(20),CQJY_JiaoYiGongGao_Temp.GongGaoToDate,23) as expireDate, -- 披露(挂牌)期满日期\n" +
					"CQJY_JiaoYiGongGao_Temp.GuaPaiGGDate as Duration, -- 挂牌期间\n" +
					"CONVERT(nvarchar(20),CQJY_JiaoYiGongGao_Temp.GongGaoToDate,23) as pickDate, -- 项目摘牌时间\n" +
					"'' as exchangeType, -- 选择的交易方式\n" +
					"'' as selectDate, -- 选择交易方式日期\n" +
					"'' as webBidStartTime, --  网络竞价或动态报价开始时间\n" +
					"'' as webBidEndTime,  -- 网络竞价或动态报价结束时间\n" +
					"'' as finalExchangeType, -- 最终确定交易方式\n" +
					"'' as tradeValue, -- 交易价格\n" +
					"'' as tradeDate, -- 交易凭证确认日期\n" +
					"'' as announcePubDate, -- 交易结果公告发布起始日期\n" +
					"BiaoDiCompany_Temp.companyName as objectName, -- 标的企业名称(objectName)\n" +
					"BiaoDiCompany_Temp.UnitOrgNum as objectCode, -- 标的企业统一社会信用代码或组织机构代码(objectCode)\n" +
					"(case\n" +
					"when(BiaoDiCompany_Temp.JingYinGuiMo=1) then '大型'\n" +
					"when(BiaoDiCompany_Temp.JingYinGuiMo=2) then '中型'\n" +
					"when(BiaoDiCompany_Temp.JingYinGuiMo=3) then '小型'\n" +
					"when(BiaoDiCompany_Temp.JingYinGuiMo=4) then '微型'\n" +
					"end) managerScale, -- 标的企业经营规模(managerScale)\n" +
					"BiaoDiCompany_Temp.SuoZaiAreaCode as Zone, -- 标的企业所在地区(Zone)\n" +
					"LTRIM(RTRIM(REPLACE(BiaoDiCompany_Temp.HangYeCode, ',', ''))) as industryCode, -- 标的企业所属行业码(industryCode)\n" +
					"BiaoDiCompany_Temp.CompanyXingZhi as economyType, -- 标的企业经济类型(economyType)\n" +
					"BiaoDiCompany_Temp.CompanyLeiXing as economyNature, -- 标的企业企业类型(economyNature)\n" +
					"BiaoDiCompany_Temp.AllStaffNum as employeeQuantity, -- 标的企业职工人数(employeeQuantity)\n" +
					"SUBSTRING(BiaoDiCompany_Temp.JingYinFanWei, 1, 4000) as businessScope, -- 主要业务、经营范围(businessScope)\n" +
					"convert(nvarchar(20),BiaoDiCompany_Temp.ZhuCeZiBen)+'万元'+\n" +
					"(case\n" +
					"when(BiaoDiCompany_Temp.MoneyType ='1') then '人民币'\n" +
					"when(BiaoDiCompany_Temp.MoneyType is null) then '人民币'\n" +
					"when(BiaoDiCompany_Temp.MoneyType ='2') then '美元'\n" +
					"when(BiaoDiCompany_Temp.MoneyType ='3') then '欧元'\n" +
					"when(BiaoDiCompany_Temp.MoneyType ='4') then '日元'\n" +
					"when(BiaoDiCompany_Temp.MoneyType ='5') then '英镑'\n" +
					"when(BiaoDiCompany_Temp.MoneyType ='6') then '港元'\n" +
					"when(BiaoDiCompany_Temp.MoneyType ='7') then '新加坡币'\n" +
					"when(BiaoDiCompany_Temp.MoneyType ='8') then '瑞士法郎'\n" +
					"when(BiaoDiCompany_Temp.MoneyType ='9') then '韩元'\n" +
					"else '其他'\n" +
					"end)registeredCapital, -- 注册资本（含单位、币种）(registeredCapital)\n" +
					"isnull(BiaoDiCompany_Temp.sellPercent,0.0000) as sellPercent, -- 本次拟转让产（股）权比例(%)(sellPercent)\n" +
					"(case\n" +
					"when(CQJY_JiaoYiGongGao_Temp.NeiBJYFangS='01') then '董事会决议'\n" +
					"when(CQJY_JiaoYiGongGao_Temp.NeiBJYFangS='02') then '总经理办公会决议'\n" +
					"when(CQJY_JiaoYiGongGao_Temp.NeiBJYFangS='03') then '其他'\n" +
					"when(CQJY_JiaoYiGongGao_Temp.NeiBJYFangS='04') then '股东会决议'\n" +
					"when(CQJY_JiaoYiGongGao_Temp.NeiBJYFangS='') then ''\n" +
					"when(CQJY_JiaoYiGongGao_Temp.NeiBJYFangS IS NULL) then ''\n" +
					"else '其他'\n" +
					"end)decisionFileType, -- 决策文件类型(decisionFileType)\n" +
					"CaiWuXinXi_Temp.NianDuDate as auditYear, -- 审计年度(auditYear)\n" +
					"CaiWuXinXi_Temp.ShenHeOrg as auditUnit,  -- 审计机构(auditUnit)\n" +
					"CaiWuXinXi_Temp.TotalZC as auditAsset, -- 资产总额(auditAsset)\n" +
					"CaiWuXinXi_Temp.OwnerQuanYi as auditEquity, -- 净资产（所有者权益）(auditEquity)\n" +
					"CaiWuXinXi_Temp.TotalFZ as auditDebt, -- 负债总额(auditDebt)\n" +
					"CaiWuXinXi_Temp.YingYeInCome as auditEarning, -- 营业收入(auditEarning)\n" +
					"CaiWuXinXi_Temp.YingYeProfit as auditProfit, -- 利润总额(auditProfit)\n" +
					"CaiWuXinXi_Temp.JinProfit as auditNetProfit, -- 净利润(auditNetProfit)\n" +
					"CONVERT(nvarchar(20),CaiWuXinXi_Temp.CaiWuDate,23) as stmtDate, -- 报表日期(stmtDate)\n" +
					"(case\n" +
					"when(CaiWuXinXi_Temp.StmtType='Y') then '月报'\n" +
					"when(CaiWuXinXi_Temp.StmtType='J') then '季报'\n" +
					"when(CaiWuXinXi_Temp.StmtType='N') then '年报'\n" +
					"else '无'\n" +
					"end)stmtType, -- 报表类型(stmtType)\n" +
					"CaiWuXinXi_Temp.CaiWuTotalZC as stmtAsset, -- 资产总额(stmtAsset)\n" +
					"CaiWuXinXi_Temp.CaiWuOwnerQuanYi as stmtEquity, -- 净资产（所有者权益）(stmtEquity)\n" +
					"CaiWuXinXi_Temp.CaiWuTotalFZ as stmtDebt, -- 负债总额(stmtDebt)\n" +
					"CaiWuXinXi_Temp.CaiWuYingYeInCome as stmtEarning, -- 营业收入(stmtEarning)\n" +
					"CaiWuXinXi_Temp.CaiWuYingYeProfit as stmtProfit, -- 利润总额(stmtProfit)\n" +
					"CaiWuXinXi_Temp.CaiWuJinProfit as stmtNetProfit, -- 净利润(stmtNetProfit)\n" +
					"PingGu_Temp.PingGuOrg as evaluateUnit, -- 评估机构(evaluateUnit)\n" +
					"PingGu_Temp.PingGuHeZhunOrg as approveUnit, -- 评估核准(备案)单位(approveUnit)\n" +
					"PingGu_Temp.HeZhunDate as approveDate, -- 核准(备案)日期(approveDate)\n" +
					"PingGu_Temp.PingGuDate as evaluateDate, -- 评估基准日(evaluateDate)\n" +
					"PingGu_Temp.ZZCPingGu as evaluateAsset, -- 标的企业总资产评估值(evaluateAsset)\n" +
					"PingGu_Temp.JZCPingGu as evaluateEquity, -- 标的企业净资产评估值(evaluateEquity)\n" +
					"PingGu_Temp.ZFZPingGu as evaluateDebt, -- 标的企业总负债评估值(evaluateDebt)\n" +
					"PingGu_Temp.ZZCZhangMian as bookAsset, -- 标的企业总资产账面值(bookAsset)\n" +
					"PingGu_Temp.JZCZhangMian as bookEquity, -- 标的企业净资产账面值(bookEquity)\n" +
					"PingGu_Temp.ZFZZhangMian as bookDebt, -- 标的企业总负债账面值(bookDebt)\n" +
					"PingGu_Temp.BiaoDiPingGu as objectEvaluateValue, -- 转让标的评估值(objectEvaluateValue)\n" +
					"(case\n" +
					"when(BiaoDiCompany_Temp.IsHaveGuoYouTD=0) then 'false'\n" +
					"when(BiaoDiCompany_Temp.IsHaveGuoYouTD=1) then 'true'\n" +
					"else 'false'\n" +
					"end)hasContainGround, -- 转让标的是否含有国有划拨土地(hasContainGround)\n" +
					"(case\n" +
					"when(CQJY_JiaoYiGongGao_Temp.YuGuQuanJiaoYiType=1) then '招投标'\n" +
					"when(CQJY_JiaoYiGongGao_Temp.YuGuQuanJiaoYiType=2) then '网络竞价'\n" +
					"when(CQJY_JiaoYiGongGao_Temp.YuGuQuanJiaoYiType=3) then '拍卖'\n" +
					"when(CQJY_JiaoYiGongGao_Temp.YuGuQuanJiaoYiType=5) then '非竞价'\n" +
					"end)pubExchangeType, -- 披露的交易方式(pubExchangeType)\n" +
					"(case\n" +
					"when CQJY_ProjectRegister_Temp.IsPLLR ='1' then ('/ejy/infodetail/?infoid='+CQJY_ProjectRegister_Temp.projectRegGuid)\n" +
					"else ('/ejy/infodetail/?infoid='+CQJY_JiaoYiGongGao_Temp.RowGuid)\n" +
					"end) as projectLinkUrl, -- 项目在交易机构网站的挂牌链接(projectLinkUrl)\n" +
					"(case\n" +
					"when(CQJY_JiaoYiGongGao_Temp.hasBuyIntent=1) then 'true'\n" +
					"when(CQJY_JiaoYiGongGao_Temp.hasBuyIntent=0) then 'false'\n" +
					"else 'false'\n" +
					"end)hasBuyIntent, -- 企业管理层是否参与受让(hasBuyIntent)\n" +
					"(case\n" +
					"when(BiaoDiCompany_Temp.IsAbandonYouXian=1) then 'true'\n" +
					"when(BiaoDiCompany_Temp.IsAbandonYouXian=0) then 'false'\n" +
					"else 'false'\n" +
					"end)giveUpPriority, -- 有限责任公司原股东是否放弃优先受让权(giveUpPriority)\n" +
					"SUBSTRING(CQJY_JiaoYiGongGao_Temp.ShouRangZGTJ, 1, 4000) as buyerPostulate, -- 受让方资格条件(buyerPostulate)\n" +
					"SUBSTRING(CQJY_JiaoYiGongGao_Temp.ZhongDContent, 1, 4000) as importantInfo, -- 其他披露事项(importantInfo)\n" +
					"SUBSTRING(CQJY_JiaoYiGongGao_Temp.ZhuanRangfTJ, 1, 4000) as sellConditions, -- 与转让相关的其他条件(sellConditions)\n" +
					"'' as buyerID, -- 受让方ID\n" +
					"'' as changeExTypeReason, -- 更改交易方式的原因\n" +
					"'' as transactionTime, -- 组织交易时间\n" +
					"'' as contrSignDate, -- 产权交易合同签订日期\n" +
					"'' as paymentType, -- 付款方式\n" +
					"'' as firstPayValue, -- 首付金额\n" +
					"'' as firstPayPercent, -- 首付比例\n" +
					"'' as remainPayDate  -- 尾款付款期限\n" +
					"from CQJY_GongChengInfo_Temp\n" +
					"inner join CQJY_JiaoYiGongGao_Temp on CQJY_JiaoyiGongGao_Temp.projectGuid = CQJY_GongChengInfo_Temp.projectGuid\n" +
					"inner join CQJY_ProjectRegister_Temp on CQJY_ProjectRegister_Temp.projectregGuid = CQJY_GongChengInfo_Temp.projectRegGuid\n" +
					"inner join BiaoDiCompany_Temp on CQJY_GongChengInfo_Temp.projectGuid = BiaoDiCompany_Temp.projectGuid\n" +
					"left join PingGu_Temp on CQJY_GongChengInfo_Temp.projectGuid = PingGu_Temp.projectGuid\n" +
					"left join CaiWuXinXi_Temp on CQJY_GongChengInfo_Temp.projectGuid = CaiWuXinXi_Temp.projectGuid\n" +
					"where CQJY_GongChengInfo_Temp.projectGuid = '"+projectGuid+"' and CQJY_GongChengInfo_Temp.AuditStatus = '3';\n";
			list = jdbc.mapList(sql);
		} catch (Exception e) {
			log.error("获取预披露标的企业信息出错: ", e);
		}
		return list;
	}

	/**
	 * 根据projectguid查询GongGao
	 * @param projectguid
	 * @return
	 */
	public GongGao getGongGaoByProjectguid(String projectguid){
		GongGao news = null;
		try {

			news=jdbc.bean("select t2.gonggaofromdate,t2.gonggaotodate,BeginDate as jingjia_start,ProjectStatus as jjia_status,CONVERT(datetime,PlanEndTime) as jingjia_end " +
					"from CQJY_JiaoYiGongGao t2 " +
					"LEFT JOIN JQXT_ProjectInfo t1 on t1.projectguid=t2.projectguid  where t2.ProjectGuid=? ",GongGao.class,projectguid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  news;
	}

	/**
	 * 根据projectguid查询批量挂牌子项目是否已成交
	 * @param projectguid
	 * @return
	 */
	public String  getAuditStatusByProjectguid(String projectguid){
		String  AuditStatus = "";
		try {
			AuditStatus=jdbc.getString("select AuditStatus from  CQJY_ChengJiaoGongGao WHERE ProjectGuid=?",projectguid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  AuditStatus;
	}

	/**
	 * 最新的项目状态
	 * @param projectguid
	 * @return
	 */
	public Integer getLatestControltype(String projectguid){
		Integer code=null;
		try {
			String code1 = jdbc.getString("select top 1 projectcontroltype from CQJY_GongChengInfo  where ProjectGuid=?  ORDER BY Row_ID desc ", projectguid);
			if(StringUtils.isNotBlank(code1)){
				code = Integer.valueOf(code1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}

	/**
	 * 获取热点词
	 * @param infoid
	 * @return
	 */
	public List<String> getHotLabelName(String infoid) {
		List<String> list=new ArrayList<>();
		String hotLabelName="";
		try {
			hotLabelName=jdbc.getString("select top 1 HotLabelName from infomain_jygg_v2 WHERE infoid=?",infoid);
			if (StringUtils.isNotBlank(hotLabelName)){
				list=Arrays.asList(hotLabelName.split(","));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 获取公告热点词
	 * @param gongGaos
	 * @return
	 */
	public List<GongGao> getHotLabelName(List<GongGao> gongGaos) {
		String hotLabelName="";
		try {
			for (GongGao gongGao:gongGaos){
				List<String> list=new ArrayList<>();
				hotLabelName=jdbc.getString("select top 1 HotLabelName from infomain_jygg_v2 WHERE infoid=?",gongGao.getInfoid());
				if (StringUtils.isNotBlank(hotLabelName)){
					list=Arrays.asList(hotLabelName.split(","));
				}
				gongGao.setHotLabelName(list);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return gongGaos;
	}
}
