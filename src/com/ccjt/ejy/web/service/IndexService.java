package com.ccjt.ejy.web.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.enums.InfoType;
import com.ccjt.ejy.web.vo.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

public class IndexService {
	
	/**
	 * 缓存有效期/秒
	 */
	int cache = 60;
	private static Logger log = LogManager.getLogger(IndexService.class);
	private static CqjyService cqjyService=new CqjyService();

	
	/**
	 * @param type
	 * @return
	 */
	public List<GongGao> index_info_list(InfoType type,Integer count,Integer legth) {
		List<GongGao> zbcgList = null;
		try {
			String sql = "SELECT infoid,ProjectNum,Title,ProjectStyle,EndDate,Categorynum FROM " +
					"View_InfoMain  where 1=1 AND InfoStatusCode ='9' AND StartDate < GetDate()   " +
					"and Categorynum =? order by IsTop DESC,OrderNum desc";
			
			zbcgList = jdbc.beanList(sql,0,count, GongGao.class,type.getCode());
			
			for(GongGao gg : zbcgList){
				if(gg.getTitle().length() > legth){
					gg.setTitle(gg.getTitle().substring(0,legth) + "...");
				}
			}
		} catch (Exception e) {
			log.error("获取首页数据出错:" ,e);
			e.printStackTrace();
		}
		return zbcgList;
	}
	/**
	 * 首页产权交易数据<br>
	 * 代码中总共有3条sql,3个sql是完全一样的,修改时请同步修改<br>
	 * 方法每次都会查询市、省、全国的数据,每次运行时都会执行3次查询,每次查询的数据量都是 top 2-x,但是 top 0 的效率是可以忽略的
	 * @param region_id
	 * @param city_id
	 * 
	 * 
	 * 
	 */
	public List<GongGao> index_cqjys(String region_id,String city_id){
	    List<GongGao> cqjyList = new ArrayList<>();
        try {
        	String commonSql = " and shi like ? ";
        	String sheng_code = "";
        	String shi_code = "";
        	if(StringUtils.isNotBlank(city_id)){
        		shi_code = city_id.substring(0,4)+"__";
        		sheng_code = city_id.substring(0,2)+"____";
        	}
            int fc = 0,zxzz = 0,esc = 0,fjwz = 0,gq = 0,zq = 0,essb = 0,td = 0,gmcp = 0,qt = 0;//用于累计市级查询到的各类产权数据的数量
            
            String sql = " select * from ( "+
                    "           select * from (select top " + (2-fc) + " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001001'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//房地产
                    " UNION all select * from (select top " + (2-zxzz) + " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001009'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//房产招租
                    " UNION all select * from (select top " + (2-esc) + " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode,projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001003'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//二手车
                    " UNION all select * from (select top " + (2-fjwz) + "( CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001004'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//废旧物质
                    " UNION all select * from (select top " + (2-gq) + " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001002'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//股权
                    " UNION all select * from (select top " + (2-zq) + " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001012'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//债权
                    " UNION all select * from (select top " + (2-essb) + "( CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid  where 1=1 "+commonSql+" and Categorynum ='001001018'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//二手设备
                    " UNION all select * from (select top " + (2-td) + " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001011'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//土地
                    " UNION all select * from (select top " + (2-gmcp) + "( CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001007'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//工美藏品
                    " UNION all select * from (select top " + (2-qt) + " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001006'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1  " +//其他
                    " ) as temp_111 OUTER APPLY (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid=temp_111.infoid and pic.type='JY01') temp_3 ";
            
            
            if(StringUtils.isNotBlank(shi_code)){//处理市级数据
                
                cqjyList.addAll(jdbc.beanList(sql,GongGao.class,shi_code,shi_code,shi_code,shi_code,shi_code,shi_code,shi_code,shi_code,shi_code,shi_code));
                
                fc = 0;zxzz = 0;esc = 0;fjwz = 0;gq = 0;zq = 0;essb = 0;td = 0;gmcp = 0;qt = 0;
                for (int i = 0; i < cqjyList.size(); i++) {
                    switch (cqjyList.get(i).getCategorynum()) {
                    case "001001001":
                        fc++;
                        break;
                    case "001001009":
                        zxzz++;
                        break;
                    case "001001003":
                        esc++;
                        break;
                    case "001001004":
                        fjwz++;
                        break;
                    case "001001002":
                        gq++;
                        break;
                    case "001001012":
                        zq++;
                        break;
                    case "001001018":
                    	essb++;
                        break;
                    case "001001011":
                        td++;
                        break;
                    case "001001007":
                        gmcp++;
                        break;
                    case "001001006":
                        qt++;
                        break;
                    default:
                        break;
                    }
                }
            }

            if(StringUtils.isNotBlank(sheng_code) && !sheng_code.equals(shi_code)){	//累加省级数据,标的中有所在地只选择到省的,这个时候,shi=sheng的值
            	
            	commonSql = " and shi like ? and shi not like ?";
            	
            	sql = " select * from ( "+
                        "           select * from (select top " + (2-fc) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001001'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//房地产
                        " UNION all select * from (select top " + (2-zxzz) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001009'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//房产招租
                        " UNION all select * from (select top " + (2-esc) +  "( CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001003'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//二手车
                        " UNION all select * from (select top " + (2-fjwz) +  "( CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001004'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//废旧物质
                        " UNION all select * from (select top " + (2-gq) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001002'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//股权
                        " UNION all select * from (select top " + (2-zq) +  "( CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001012'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//债权
                        " UNION all select * from (select top " + (2-essb) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001018'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//二手设备
                        " UNION all select * from (select top " + (2-td) +  "( CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001011'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//土地
                        " UNION all select * from (select top " + (2-gmcp) +  "( CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001007'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//工美藏品
                        " UNION all select * from (select top " + (2-qt) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001006'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1  " +//其他
                        " ) as temp_111 OUTER APPLY (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid=temp_111.infoid and type='JY01') temp_3 ";
                

                
            	cqjyList.addAll(jdbc.beanList(sql,GongGao.class,sheng_code,shi_code,sheng_code,shi_code,sheng_code,shi_code,sheng_code,shi_code,sheng_code,shi_code,sheng_code,shi_code,sheng_code,shi_code,sheng_code,shi_code,sheng_code,shi_code,sheng_code,shi_code));
			    
			    fc = 0;zxzz = 0;esc = 0;fjwz = 0;gq = 0;zq = 0;essb = 0;td = 0;gmcp = 0;qt = 0;
			    for (int i = 0; i < cqjyList.size(); i++) {
                    switch (cqjyList.get(i).getCategorynum()) {
                    case "001001001":
                        fc++;
                        break;
                    case "001001009":
                        zxzz++;
                        break;
                    case "001001003":
                        esc++;
                        break;
                    case "001001004":
                        fjwz++;
                        break;
                    case "001001002":
                        gq++;
                        break;
                    case "001001012":
                        zq++;
                        break;
                    case "001001018":
                        essb++;
                        break;
                    case "001001011":
                        td++;
                        break;
                    case "001001007":
                        gmcp++;
                        break;
                    case "001001006":
                        qt++;
                        break;
                    default:
                        break;
                    }
                }
			    
            }
            //累加全国数据
            {
            	if(StringUtils.isNotBlank(sheng_code)){
            		commonSql = " and shi not like ?";
            	}else{
            		commonSql = "";
            	}
            	
            	
                
                sql = " select * from ( "+
                        "           select * from (select top " + (2-fc) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype, HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid  where 1=1 "+commonSql+" and Categorynum ='001001001'   order by IsTop DESC,ordertype ASC,OrderNum desc ) as temp_1 " +//房地产
                        " UNION all select * from (select top " + (2-zxzz) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid  where 1=1 "+commonSql+" and Categorynum ='001001009'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//房产招租
                        " UNION all select * from (select top " + (2-esc) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid  where 1=1 "+commonSql+" and Categorynum ='001001003'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//二手车
                        " UNION all select * from (select top " + (2-fjwz) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid  where 1=1 "+commonSql+" and Categorynum ='001001004'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//废旧物质
                        " UNION all select * from (select top " + (2-gq) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid  where 1=1 "+commonSql+" and Categorynum ='001001002'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//股权
                        " UNION all select * from (select top " + (2-zq) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2  ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid  where 1=1 "+commonSql+" and Categorynum ='001001012'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//债权
                        " UNION all select * from (select top " + (2-essb) +  " (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid  where 1=1 "+commonSql+" and Categorynum ='001001018'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//二手设备
                        " UNION all select * from (select top " + (2-td) +  "  (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid  where 1=1 "+commonSql+" and Categorynum ='001001011'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//土地
                        " UNION all select * from (select top " + (2-gmcp) +  "  (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001007'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1 " +//工美藏品
                        " UNION all select * from (select top " + (2-qt) +  "  (CASE WHEN ( getdate() >=gonggaofromdate AND getdate()<=gonggaotodate AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL)AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 1 WHEN (getdate()>= jjia.BeginDate AND getdate() <= CAST (jjia.PlanEndTime AS datetime) AND (cjgg_guid IS NULL OR cjgg_guid = '') AND ( projectcontroltype NOT IN ('1', '2') OR projectcontroltype IS NULL) AND (jjia_status IS NULL OR  jjia_status != 3)) THEN 2 WHEN (getdate() < gonggaofromdate) THEN 3 ELSE 4 END) AS ordertype,HotLabelName hotLabelName_s,oldprojectguid,ijv2.BelongXiaQuCode as XiaQuCode, projectcontroltype  ,ijv2.projectguid,ijv2.AllowMoreJqxt,jjia_status,shengname,shiname,zt,ispllr,jygg_guid infoid,ProjectNum,Title,Categoryname ProjectStyle,ijv2.jingjiafangshi,ijv2.isfrompricexs,cjgg_guid,gonggaotodate,gonggaofromdate,jingjia_start,jingjia_end,Categorynum, click,guapaiprice,IsMianY,zzkg_zztype,zzkg_guapaitype,zzkg_guapaiprice,zzkg_guapaidj from infomain_jygg_v2 ijv2 LEFT JOIN JQXT_ProjectInfo jjia ON ijv2.ProjectGuid = jjia.ProjectGuid where 1=1 "+commonSql+" and Categorynum ='001001006'   order by IsTop DESC,ordertype ASC, OrderNum desc ) as temp_1  " +//其他
                        " ) as temp_111 OUTER APPLY (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid=temp_111.infoid and type='JY01') temp_3 ";
                
                if(StringUtils.isNotBlank(sheng_code)){
                	cqjyList.addAll(jdbc.beanList(sql,GongGao.class,sheng_code,sheng_code,sheng_code,sheng_code,sheng_code,sheng_code,sheng_code,sheng_code,sheng_code,sheng_code));
            	}else{
            		cqjyList.addAll(jdbc.beanList(sql,GongGao.class));
            	}
                
            }   
        } catch (Exception e) {
            log.error("获取首页产权交易数据出错:" ,e);
            e.printStackTrace();
        }
		if(cqjyList!=null){
			for(GongGao gg : cqjyList){
				gg.setClick(gg.getClick()+cqjyService.getPVCount(gg.getInfoid()));
			}
		}
        return cqjyList;
	}
	
	
	/**
	 * 招标采购
	 * index_zbcgs  
	 * @param count
	 * @param
	 * @param
	 * @param
	 * @return   
	 * List<GongGao>  
	 * @exception   
	 * @since  1.0.0
	 */
	public List<FastCaiGou> index_zbcgs(Integer count){
	    List<FastCaiGou> list = new ArrayList<FastCaiGou>();
	    try {
            String sql = "select * from ( SELECT b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where a.baomingstart < GetDate() and a.Categorynum ='002001001' order by a.infodate DESC  offset 0 rows  FETCH NEXT "+count+" ROWS ONLY  )as temp_2 union all " +//招标采购招标公告_工程
                    "select * from ( SELECT b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where baomingstart < GetDate()   and a.Categorynum ='002001002' order by a.infodate DESC  offset 0 rows  FETCH NEXT "+count+" ROWS ONLY  )as temp_2 union all " +//招标采购招标公告_货物
                    "select * from ( SELECT b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where baomingstart < GetDate()   and a.Categorynum ='002001003' order by a.infodate DESC  offset 0 rows  FETCH NEXT "+count+" ROWS ONLY  )as temp_2 union all " +//招标采购招标公告_服务
                    "select * from ( SELECT b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where baomingstart < GetDate()   and a.Categorynum ='002002001' order by a.infodate DESC  offset 0 rows  FETCH NEXT "+count+" ROWS ONLY  )as temp_2 union all " +//招标采购成交公示_工程
                    "select * from ( SELECT b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where baomingstart < GetDate()   and a.Categorynum ='002002002' order by a.infodate DESC  offset 0 rows  FETCH NEXT "+count+" ROWS ONLY  )as temp_2 union all " +//招标采购成交公示_货物
                    "select * from ( SELECT b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where baomingstart < GetDate()   and a.Categorynum ='002002003' order by a.infodate DESC  offset 0 rows  FETCH NEXT "+count+" ROWS ONLY  )as temp_2 " ;//招标采购成交公示_服务
            list = jdbc.beanList(sql,FastCaiGou.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
	    return list;
	}
	
	/**
	 *  招标采购(成交公告)
	 * index_kjcgs
	 * @return   
	 * List<FastCaiGou>  
	 * @exception   
	 * @since  1.0.0
	 */
	public List<FastCaiGou> index_zbcg_cjgg(String code,Integer rows){
	    List<FastCaiGou> gg = new ArrayList<FastCaiGou>();
	    try {
	        String sql = " select top "+rows
						+"* from view_web_v2_zbcg_cjgg where categorynum = ? order by baomingstart desc " ;
	        gg = jdbc.beanList(sql,FastCaiGou.class,code);
        } catch (Exception e) {
            e.printStackTrace();
        }
	    return gg;
	}
	
	/**
	 *  快捷采购(成交公告)
	 * index_kjcgs
	 * @return   
	 * List<FastCaiGou>  
	 * @exception   
	 * @since  1.0.0
	 */
//	public List<FastCaiGou> index_kjcg_cjgg(Integer rows){
//	    List<FastCaiGou> gg = new ArrayList<FastCaiGou>();
//	    try {
//	        String sql = "SELECT top "+rows
//					+" a.BiaoDuanGuid as infoid ,a.biaoDuanBH AS  projectNum"
//					+" ,vm.title BiaoDuanName "
//					+" ,a.XiaQuCode "
//					+" ,c.CityName as xiaquname "
//					+" ,a.BaoMingFromDate as baomingstart "
//					+" ,a.BaoMingEndDate as baomingend "
//					+" ,a.XiangMuLBCode  as categorynum "
//					+" ,a.XiangMuLBName as categoryname,vm.ClickTimes "
//					+" FROM Zfcg_BiaoDuan a "
//					+" INNER JOIN Zfcg_Project b ON a.ProjectGuid = b.ProjectGuid "
//					+" INNER JOIN Sys_XiaQu c ON a.XiaQuCode =c.CityCode "
//					+" INNER JOIN  View_InfoMain vm on vm.InfoID = a.BiaoDuanGuid "
//					+" WHERE ISNULL(a.IsConFirmZhongBiaoDW , '0')='1' "
//					+" AND b.AuditStatus ='3' "
//					+" and a.BaoMingFromDate is not null and  a.BaoMingEndDate  is not null "
//					+" order by a.BaoMingFromDate desc "  ;
//	        gg = jdbc.beanList(sql, FastCaiGou.class);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//	    return gg;
//	}
	/**
	 * 快捷采购(招标公告)
	 * index_kjcgs
	 * @return   
	 * List<FastCaiGou>  
	 * @exception   
	 * @since  1.0.0
	 */
//	public List<FastCaiGou> index_kjcgs(Integer count){
//	    List<FastCaiGou> caiGous = new ArrayList<FastCaiGou>();
//	    try {
//	        String sql = "SELECT b.projectNum,* FROM view_web_v2_kuaijiecaigou a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID  where 1=1 order by baomingstart desc  offset 0 rows  FETCH NEXT "+count+" ROWS ONLY  " ;//招标采购成交公示_服务
//	        caiGous = jdbc.beanList(sql,FastCaiGou.class);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//	    return caiGous;
//	}
	
	/**
	 * 首页_预披露
	 * @return
	 */
	public List<GongGao> index_ypl_info() {
		List<GongGao> newslist = null;
		try {			
			newslist = jdbc.beanList(SQL.index_ypl, GongGao.class);
			if(newslist!=null){
				for(GongGao gg : newslist){
					gg.setTitle(gg.getTitle().replace("常州金融资产交易中心", "金融资产交易平台").replace("金融资产交易中心", "金融资产交易平台"));
					gg.setClick(gg.getClick()+cqjyService.getPVCount(gg.getInfoid()));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newslist;
	}
		
	/**
	 * 首页数量统计
	 * @return
	 */
	public Map<String,Object> statistics(){
		Map<String,Object> map = new HashMap<String, Object>();		
		try {
			String value = DBCacheManage.get(RedisKeys.KEY_DB_CACHE_INDEX_TJXX);
			map = JSON.parseObject(value,Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return map;
	}
	
	/**
	 * 查询定位
	 * iparea  
	 * @param ip
	 * @param ip_hash
	 * @return   
	 * Map<String,Object>  
	 * @exception   
	 * @since  1.0.0
	 */
	public Map<String, Object> iparea(String ip,int ip_hash){
	    Map<String, Object> map = null;
	    try {
            String sql = "select * from [web2.0].dbo.ip_area where ip=? and ip_hash=?";
            map = jdbc.map(sql, ip ,ip_hash);
        } catch (Exception e) {
            log.error("ip_area获取定位出错:" ,e);
            e.printStackTrace();
        }
	    return map;
	}
	
	/**
	 * 保存定位
	 * iparea  
	 * @param ip
	 * @param ip_hash
	 * @return    
	 * @exception   
	 * @since  1.0.0
	 */
	public void saveiparea(JSONObject reJson,String ip,int ip_hash) {
	    try {
	    	String sql = "insert into [web2.0].dbo.ip_area(ip,ip_hash,region,region_id,city,city_id) values(?,?,?,?,?,?)";
            jdbc.insert(sql, ip, ip_hash, reJson.getJSONObject("data").get("region").toString(), 
            		reJson.getJSONObject("data").get("region_id").toString(),reJson.getJSONObject("data").get("city").toString(), 
            		reJson.getJSONObject("data").get("city_id").toString());
            ConnectionFactory.commit();
        } catch (Exception e) {
        	ConnectionFactory.rollback();
            e.printStackTrace();
        }
	}
	
	/**
	 * 城市获取
	 * @param
	 */
	public List<City> city_info() {
		List<City> citylist = null;
		try {
			
			String cache = DBCacheManage.get(RedisKeys.WEB_DATA_CACHE_CITY);
			citylist = JSON.parseArray(cache, City.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return citylist;
	}
	
	/**
	 * 获取登录会员相关信息
	 * @param
	 */
	public Map<String, Object> getLoginInfo(LoginAccount loginAccount) {
		Map<String, Object> loginInfo = new HashMap<String, Object>();
		try {
			String danweiGuid = loginAccount.getDanWeiGuid();
//			long now = System.currentTimeMillis();
			//已关注
			List<Map<String, Object>> ygzList = jdbc.mapList("select distinct project_id as project_id from [web2.0].dbo.user_focus " +
					"where user_id = '" + danweiGuid + "'");	
			int ygz = ygzList.size();
			loginInfo.put("ygz", ygz);
//			System.out.println("耗时：" + (System.currentTimeMillis() - now));
//			now = System.currentTimeMillis();
			//已报名，包括普通和专厅
			List<Map<String, Object>> ybmList = jdbc.mapList(SQL.index_ybm_all_info_sql,danweiGuid,danweiGuid);	
			int ybm = ybmList.size();
			loginInfo.put("ybm", ybm);
//			System.out.println("耗时：" + (System.currentTimeMillis() - now));
//			now = System.currentTimeMillis();
			//竞价中，包括普通和专厅
			List<Map<String, Object>> jjzList = jdbc.mapList(SQL.index_jjz_all_info_sql,danweiGuid,danweiGuid);	
			int jjz = jjzList.size();
			loginInfo.put("jjz", jjz);
//			System.out.println("耗时：" + (System.currentTimeMillis() - now));
//			now = System.currentTimeMillis();
			String danweiName = getDanWeiName(danweiGuid);
			int ygm = jdbc.getCount("select distinct cjgg.RowGuid from CQJY_ChengJiaoGongGao cjgg " +
					"left join CQJY_ChengJiaoGongGaoDetail cc on cjgg.RowGuid = cc.CJGuid where cjgg.AuditStatus = '3' " +
					"and (cjgg.ShouRangRenGuid = ? or cjgg.ShouRangRen = ? or cc.investorName = ?)",danweiGuid,danweiName,danweiName);	
			loginInfo.put("ygm", ygm);				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return loginInfo;
	}	
	
	/**
	 * 获取登录会员已关注项目信息
	 * @param
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map<String, Object> getYgzInfo(String danWeiGuid, Integer page, Integer rows) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List list = new ArrayList<GongGao>();
		try {
			resultMap.put("total", jdbc.getCount(SQL.index_ygz_info_sql, danWeiGuid)); 	
			list = jdbc.beanList(SQL.index_ygz_info_sql + " order by vi.id desc",page,rows,GongGao.class,danWeiGuid);	
			resultMap.put("rows", list);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 获取登录会员已报名项目信息
	 * @param
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map<String, Object> getYbmInfo(String danWeiGuid, Integer page, Integer rows) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List list = new ArrayList<Map<String, Object>>();
		try {
			long now = System.currentTimeMillis();
			//已报名，包括普通和专厅
			resultMap.put("total", jdbc.getCount(SQL.index_ybm_all_info_sql, danWeiGuid, danWeiGuid)); 			
			list = jdbc.mapList2(SQL.index_ybm_all_info_sql + " order by Row_ID desc", page, rows, danWeiGuid, danWeiGuid);
			System.out.println("耗时：" + (System.currentTimeMillis() - now));
			now = System.currentTimeMillis();
			for(int i = 0;i < list.size();i++) {
				Map map = (Map)list.get(i);
				if("pt".equals(map.get("projectType"))) {
					String sql = "select cb.RowGuid,cbnmg.AuditStatus,cbnmg.NotShouLi,cb.isZiShenPass,cb.AcctNo,cb.BZJIsjiaoNa " +
							"from CQJY_BaoMing cb " +
							"left join CQJY_BaoMingNMG cbnmg on cbnmg.BiaoDiGuid = cb.ProjectGuid and cbnmg.DanWeiGuid = cb.DanWeiGuid " +
							"where cb.ProjectGuid = '" + map.get("ProjectGuid") + "' and cb.DanWeiGuid = '" + danWeiGuid + "'";
					Map cbnmg_map = jdbc.map(sql);
					if(cbnmg_map == null) {
						map.put("isZiShenPassCn", "尚未审核");
					} else if("1".equals(cbnmg_map.get("isZiShenPass"))) {
						map.put("isZiShenPassCn", "审核通过");
					} else if("0".equals(cbnmg_map.get("isZiShenPass"))) {
						map.put("isZiShenPassCn", "审核未通过");
					} else if("4".equals(cbnmg_map.get("AuditStatus"))) {
						map.put("isZiShenPassCn", "审核未通过");
					} else if("1".equals(cbnmg_map.get("NotShouLi"))) {
						map.put("isZiShenPassCn", "不予受理");
					} else {
						map.put("isZiShenPassCn", "尚未审核");
					}
					if(cbnmg_map != null && cbnmg_map.get("AcctNo") != null && cbnmg_map.get("AcctNo") != "") {
						if("2".equals(cbnmg_map.get("BZJIsjiaoNa"))) {
							map.put("bZJIsjiaoNa", "已交保证金");
						} else {
							map.put("bZJIsjiaoNa", "保证金无效");
						}
					} else {
						map.put("bZJIsjiaoNa", "无子账号");
					}
					GongGao gongGao = jdbc.bean(SQL.index_ybm_pt_otherinfo_sql, GongGao.class, map.get("ProjectGuid"));
					map.put("areaName", gongGao.getAreaName());
					map.put("title", gongGao.getTitle());
					map.put("guapaiprice", gongGao.getGuapaiprice());
					map.put("jingjiastartdate", gongGao.getJingjiastartdate_str());
					map.put("jingjiaenddate", gongGao.getJingjiaenddate_str());
					map.put("projectType", "pt");
					map.put("categorynum", gongGao.getCategorynum());
					map.put("titlepic", gongGao.getTitlepic());
					map.put("infoid", gongGao.getInfoid());
					map.put("systemtype", gongGao.getSystemtype());
					map.put("zzkg_guapaiprice", gongGao.getZzkg_guapaiprice());
				} else if("zt".equals(map.get("projectType"))) {
					String sql = "select cbnmg.RowGuid,cbnmg.AuditStatus,cbnmg.NotShouLi,cb.AcctNo,cb.BZJIsjiaoNa " +
							"from CQJY_BaoMingNMG cbnmg " +
							"left join CQJY_BaoMing cb on cbnmg.ZhuanTingGuid = cb.ZhuanTingGuid and cbnmg.DanWeiGuid = cb.DanWeiGuid " +
							"where cbnmg.ZhuanTingGuid = '" + map.get("ProjectGuid") + "' and cbnmg.DanWeiGuid = '" + danWeiGuid + "'";
					Map cbnmg_map = jdbc.map(sql);
					if(cbnmg_map == null) {
						map.put("isZiShenPassCn", "尚未审核");
					} else if("4".equals(cbnmg_map.get("AuditStatus")) || "1".equals(cbnmg_map.get("NotShouLi"))) {
						map.put("isZiShenPassCn", "审核未通过");
					} else if("3".equals(cbnmg_map.get("AuditStatus"))) {
						map.put("isZiShenPassCn", "审核通过");
		            } else if("2".equals(cbnmg_map.get("AuditStatus"))) {
						map.put("isZiShenPassCn", "审核中");
					} else {
						map.put("isZiShenPassCn", "尚未审核");
					}
					if(cbnmg_map != null && cbnmg_map.get("AcctNo") != null && cbnmg_map.get("AcctNo") != "") {
						if("2".equals(cbnmg_map.get("BZJIsjiaoNa"))) {
							map.put("bZJIsjiaoNa", "已交保证金");
						} else {
							map.put("bZJIsjiaoNa", "保证金无效");
						}
					} else {
						map.put("bZJIsjiaoNa", "无子账号");
					}
					map.put("title", map.get("title"));
					map.put("projectType", "zt");
					List<GongGao> listGg = jdbc.beanList(SQL.index_ybm_zt_otherinfo_sql, GongGao.class, map.get("ProjectGuid"));
					map.put("listGg", listGg);
				}
			}
			System.out.println("耗时：" + (System.currentTimeMillis() - now));
			now = System.currentTimeMillis();
			resultMap.put("rows", list);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 获取登录会员竞价中项目信息
	 * @param
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map<String, Object> getJjzInfo(String danWeiGuid, Integer page, Integer rows) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List list = new ArrayList<Map<String, Object>>();
		try {
			//已报名，包括普通和专厅
			resultMap.put("total", jdbc.getCount(SQL.index_jjz_all_info_sql, danWeiGuid, danWeiGuid)); 			
			list = jdbc.mapList2(SQL.index_jjz_all_info_sql + " order by Row_ID desc", page, rows, danWeiGuid, danWeiGuid);
			for(int i = 0;i < list.size();i++) {
		        Map map = (Map)list.get(i);
		        //普通项目
		        if("pt".equals(map.get("projectType"))) {
		        	GongGao gongGao = jdbc.bean(SQL.index_ybm_pt_otherinfo_sql, GongGao.class, map.get("ProjectGuid"));		
				    if(gongGao != null) {
				    	map.put("areaName", gongGao.getAreaName());
						map.put("title", gongGao.getTitle());
						map.put("guapaiprice", gongGao.getGuapaiprice());
						map.put("categorynum", gongGao.getCategorynum());
						map.put("titlepic", gongGao.getTitlepic());
						map.put("infoid", gongGao.getInfoid());
						map.put("systemtype", gongGao.getSystemtype());
						map.put("zzkg_guapaiprice", gongGao.getZzkg_guapaiprice());
				    }
			    } else if("zt".equals(map.get("projectType"))) {//专厅项目
			    	map.put("title", map.get("title"));
					map.put("projectType", "zt");
					List<GongGao> listGg = jdbc.beanList(SQL.index_ybm_zt_otherinfo_sql, GongGao.class, map.get("ProjectGuid"));
					map.put("listGg", listGg);
			    }
		    }
			resultMap.put("rows", list);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
	
	/**
	 * 获取登录会员已购买项目信息
	 * @param
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map<String, Object> getYgmInfo(String danWeiGuid, Integer page, Integer rows) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List list = new ArrayList<GongGao>();		
		try {
			String danWeiName = getDanWeiName(danWeiGuid);
			resultMap.put("total", jdbc.getCount(SQL.index_ygm_otherinfo_sql, danWeiGuid, danWeiName, danWeiName)); 	
			list = jdbc.beanList(SQL.index_ygm_otherinfo_sql + " order by vi.OrderNum desc",page,rows,GongGao.class,danWeiGuid,danWeiName,danWeiName);	
			resultMap.put("rows", list);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
		
	public static void main(String dd[]){
		IndexService d = new IndexService();
		List<GongGao> list = d.index_cqjys("320000", "320400");
		System.out.println(list);
		System.out.println(list.size());
	}
	
	public List<GongGao> ypl_more(Page page,String type,String area){
		List<GongGao> jygg_list = null;
		List<Object> params = new ArrayList<Object>();
		try{

			String sql = " select infoid,price guapaiprice,ProjectNum,Title,StartDate,EndDate,case when CategoryName='产股权' then '股权' else CategoryName end as ProjectStyle from View_InfoMain  " + 
					" where CategoryNum like '00100300_' and (InfoStatusCode ='9' or InfoStatusCode ='-2')  ";			
			if(StringUtils.isNotBlank(area)){
				sql += " and sheng=?";
				params.add(area);
			}			
			if(StringUtils.isNotBlank(type)){
				if("股权".equals(type)){
					type = "产股权";
				}
				sql += " and CategoryName=?";
				params.add(type);
			}			
			page.setTotal(jdbc.getCount(sql,params.toArray()));			
			sql += " order by IsTop desc,  orderNum desc,InfoDate desc,PubInWebDate desc,SysID desc ";			
			sql = jdbc.pageSql(sql, page.getCurrentPage(), page.getRows());						
			sql = " select * from ( " + sql + " ) as temp_2 OUTER APPLY (select top 1 path titlepic from web_gonggao_pic pic where pic.guid=temp_2.infoid) temp_3";			
			jygg_list = jdbc.beanList(sql, GongGao.class,params.toArray());			
			for(GongGao gg : jygg_list){				
				if(gg!=null){
					gg.setTitle(gg.getTitle().replace("常州金融资产交易中心", "金融资产交易平台").replace("金融资产交易中心", "金融资产交易平台"));	
				}				
				if(gg!=null && StringUtils.isNotBlank(gg.getTitle()) && gg.getTitle().length() >  35){
					gg.setTitle(gg.getTitle().substring(0,35) + "...");
				}				
			}			
		}catch (Exception e) {
			log.error("获取招标采购出错:",e);
			e.printStackTrace();
		}
		return jygg_list;
	}

	/**
	 * 城市名称和代号对应表
	 * @return
	 */
	public String getCityCodeByCityName(String cityName) {
		String CityCode="";

		String sql = "SELECT  CityCode from HuiYuan_City where cityname like ?";
		try {
			if (StringUtils.isNotBlank(cityName)) {
				if (cityName.equals("海南")){
					cityName="海南省";
				}else if (cityName.equals("河北")){
					cityName="河北省";
				}
				CityCode = jdbc.getString(sql, "%" + cityName + "%");
			}
		} catch (Exception e) {
			log.error("获取城市代号数据出错:", e);
			e.printStackTrace();
		}
		return CityCode;
	}

	public Map<String,String> areaCookies(HttpServletRequest request, HttpServletResponse response){
		Map<String,String> result=new HashMap<>();
		try {
			Cookie[] ks = request.getCookies();
			if(ks!=null){
				for (Cookie k : ks) {
					if ("cityCookie".equals(k.getName())) {
						result.put("cityCookie",URLDecoder.decode( k.getValue(), "utf-8"));
//						result.put("cityCookie",k.getValue());
					} else if ("provinceCookie".equals(k.getName())) {
						result.put("provinceCookie",URLDecoder.decode( k.getValue(), "utf-8"));
//						result.put("provinceCookie",k.getValue());
					}else if ("qhCookie".equals(k.getName())) {
						result.put("qhCookie",URLDecoder.decode( k.getValue(), "utf-8"));
//						result.put("qhCookie",k.getValue());
					}
					else if ("cityCodeCookie".equals(k.getName())) {
						result.put("cityCodeCookie",URLDecoder.decode( k.getValue(), "utf-8"));
//						result.put("cityCodeCookie", k.getValue());
					}
					else if ("provinceCodeCookie".equals(k.getName())) {
						result.put("provinceCodeCookie",URLDecoder.decode( k.getValue(), "utf-8"));
//						result.put("provinceCodeCookie",k.getValue());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String qhCookie=result.get("qhCookie");
		if (StringUtils.isNotBlank(qhCookie)&&(qhCookie.equals("1")||qhCookie.equals("0"))){//如果是自动定位获取的城市,需要手动设置城市code到cookie中
			String cityCookie=result.get("cityCookie");
			String provinceCookie=result.get("provinceCookie");
			String  cityCode = getCityCodeByCityName(cityCookie);
			String  provinceCode = getCityCodeByCityName(provinceCookie);
			Cookie cookie1=new Cookie("cityCodeCookie",cityCode);
			cookie1.setMaxAge(60*60*48);
			Cookie cookie2=new Cookie("provinceCodeCookie",provinceCode);
			cookie2.setMaxAge(60*60*48);

			Cookie cookie3=new Cookie("qhCookie","-2");//修改该值,使下次不进入该逻辑
			cookie3.setMaxAge(60*60*48);

			response.addCookie(cookie1);
			response.addCookie(cookie2);
			response.addCookie(cookie3);
		}
		return result;
	}
	
	private String getDanWeiName(String danWeiGuid) {
		String danWeiName = "";
		try {
			Map map = jdbc.map("select DanWeiName from HuiYuan_UnitComInfo where DanWeiGuid = ?", danWeiGuid);
			if(map != null) {
				danWeiName = map.get("DanWeiName") + "";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return danWeiName;
	}

}