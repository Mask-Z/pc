package com.ccjt.ejy.web.service;

import com.ccjt.ejy.web.vo.FastCaiGou;

/**
 * 项目中用到的一些SQL<br>
 * 部分sql语句包含排序,数量等,一些通过语句只有select,不包含排序等语句
 * @author xxf
 *
 */
public class SQL {
	/**
	 * 最新成交公告
	 */
	public static final String index_cjgg_info_sql_20_rows = 
			"select cjgg.*, hc.CityName areaName from (select top 20 Categoryname, SHENG as sheng, SHI as shi, chengjiaodate, ChengJiaoPrice, " +
			"jygg_guid, cjgg_guid, ProjectNum, guapaiprice, " +
			"(case when (SHI = '110100' or SHI = '110200' or SHI = '120100' or SHI = '120200' or SHI = '500100' " +
			"or SHI = '500200' or SHI = '500300' or SHI = '310100' or SHI = '310200') then SHENG else SHI end) as areaCode " +
			"from view_infomain_cjgg order by chengjiaodate DESC) cjgg " +
			"left join HuiYuan_City hc on hc.CityCode = cjgg.areaCode";
	
	/**
	 * 已关注项目
	 */
	public static final String index_ygz_info_sql = 
			"select * from (" +
			"select webdb.*,hc.CityName areaName,cg.ProjectGuid,ISNULL(jygg.GongGaoFromDate,webdb.startdate) gonggaofromdate,uf.id," +
			"ISNULL(jygg.GongGaoToDate,webdb.enddate) gonggaotodate,jygg.IsMianY,jjia.jingjiafangshi,jjia.isfrompricexs," +
			"ISNULL(cg.SystemType,cp.SystemType) SystemType,jygg.zzkg_zztype,jygg.zzkg_guapaitype,'' as zzkg_guapaiprice,jygg.GuaPaiPrice zzkg_guapaidj " +
			"from [web2.0].dbo.user_focus uf " +
			"left join CQJY_ProjectRegister cp on uf.project_id = cp.ProjectRegGuid " +				
			"left join CQJY_JiaoYiGongGao jygg on uf.project_id = jygg.RowGuid " +
			"left join CQJY_GongChengInfo cg on jygg.ProjectGuid = cg.ProjectGuid " +
			"left JOIN JQXT_ProjectInfo jjia ON jjia.ProjectGuid = jygg.ProjectGuid " +
			"left JOIN (select oucode as XiaQuCode,price as guapaiprice,infoid,startdate,enddate,CategoryNum as categorynum," +
			"CategoryName as categoryname,title," +
			"(case when (shi = '110100' or shi = '110200' or shi = '120100' or shi = '120200' or shi = '500100' " +
			"or shi = '500200' or shi = '500300' or shi = '310100' or shi = '310200') then sheng else shi end) as areaCode " +
			"from view_infomain) webdb ON uf.project_id = webdb.infoid " +
			"left join HuiYuan_City hc on hc.CityCode = webdb.areaCode " +
			"where uf.user_id = ?) vi " +
			"outer apply (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic " +
			"where pic.guid = vi.infoid and pic.type = 'JY01') pic";
	
	/**
	 * 已报名项目-全部
	 */
	public static final String index_ybm_all_info_sql = "select ProjectGuid,title,projectType,Row_ID from (" +
			"select ProjectGuid,GongGaoTitle as title,'pt' as projectType,Row_ID from View_CQJY_JiaoYiGongGaoAndInfoNew where 1 = 1 " +
			"and exists(select 1 from CQJY_BaoMing where ProjectGuid = View_CQJY_JiaoYiGongGaoAndInfoNew.ProjectGuid " +
			"and DanWeiGuid = ?) and GongGaoStatusCode = '9' and AuditStatus = '3' and isnull(IsSetJJZT,'') != '1' " +
			"and isnull(ProjectControlType,'') != '2' and isnull(IsLiuBiao,'') != '1' " +
			"union all " +
			"select ZhuanTingGuid,ZhuanTingName as title,'zt' as projectType,Row_ID from CQJY_JingJiaZhuanTing where 1 = 1 " +
			"and exists(select 1 from CQJY_BaoMing where ZhuanTingGuid = CQJY_JingJiaZhuanTing.ZhuanTingGuid " +
			"and DanWeiGuid = ?) and AuditStatus = '3' and exists(Select 1 From CQJY_GongChengInfo " +
			"Where ZhuanTingGuid = CQJY_JingJiaZhuanTing.ZhuanTingGuid " +
			"and ISNULL(IsLiuBiao,'') <> '1' and isnull(ProjectControlType,'') <> '2')) temp";
	
	/**
	 * 竞价中项目-全部
	 */
	public static final String index_jjz_all_info_sql = "select ProjectGuid,title,projectType,Row_ID,jingjia_end from (" +
			"select vcj.ProjectGuid,vcj.GongGaoTitle as title,'pt' as projectType,vcj.Row_ID," +
			"CONVERT(nvarchar(20),ijv.jingjia_end,20) as jingjia_end from View_CQJY_JiaoYiGongGaoAndInfoNew vcj " +
			"inner join infomain_jygg_v2 ijv on vcj.ProjectGuid = ijv.ProjectGuid " + 
			"where 1 = 1 And ijv.jingjia_start < GETDATE() And ijv.jingjia_end > GETDATE() " +
			"and exists(select 1 from CQJY_BaoMing where ProjectGuid = vcj.ProjectGuid " +
			"and DanWeiGuid = ?) and vcj.GongGaoStatusCode = '9' and vcj.AuditStatus = '3' and isnull(vcj.IsSetJJZT,'') != '1' " +
			"and isnull(vcj.ProjectControlType,'') != '2' and isnull(vcj.IsLiuBiao,'') != '1' " +
			"union all " +
			"select ZhuanTingGuid,ZhuanTingName as title,'zt' as projectType,Row_ID,'' as jingjia_end from CQJY_JingJiaZhuanTing where 1 = 1 " +
			"and exists(select 1 from CQJY_BaoMing where ZhuanTingGuid = CQJY_JingJiaZhuanTing.ZhuanTingGuid and DanWeiGuid = ?) " +
			"and AuditStatus = '3' " +
			"and exists(Select 1 From CQJY_GongChengInfo Where ZhuanTingGuid = CQJY_JingJiaZhuanTing.ZhuanTingGuid " +
			"and ISNULL(IsLiuBiao,'') <> '1' and isnull(ProjectControlType,'') <> '2')" +
			"and exists(Select 1 From infomain_jygg_v2 " +
            "Where ZhuanTingGuid = CQJY_JingJiaZhuanTing.ZhuanTingGuid " +
            "And jingjia_start < GETDATE() And jingjia_end > GETDATE())) temp";
	
	
	/**
	 * 已报名项目-普通-其他信息
	 */
	public static final String index_ybm_pt_otherinfo_sql = 
			"select * from (" +
			"select webdb.*,hc.CityName areaName,CAST (jjia.BeginDate AS datetime) jingjiastartdate," +
			"CAST (jjia.PlanEndTime AS datetime) jingjiaenddate,cg.ProjectGuid as projectguid,jygg.IsMianY," +
			"jjia.jingjiafangshi,jjia.isfrompricexs,cg.SystemType,jygg.zzkg_zztype,jygg.zzkg_guapaitype,jygg.zzkg_guapaiprice,jygg.zzkg_guapaidj " +
			"from (select jygg.IsMianY,jygg.ProjectGuid,jygg.zzkg_zztype,jygg.zzkg_guapaitype,'' as zzkg_guapaiprice,jygg.GuaPaiPrice zzkg_guapaidj," +
			"(case when cg.IsPLLR = '1' then cg.ProjectRegGuid else jygg.RowGuid end) as RowGuid " +
			"from CQJY_JiaoYiGongGao jygg inner join CQJY_GongChengInfo cg on jygg.ProjectGuid = cg.ProjectGuid) jygg " +
			"left JOIN (select oucode as XiaQuCode,price as guapaiprice,infoid,CategoryNum as categorynum,CategoryName as categoryname,title," +
			"(case when (shi = '110100' or shi = '110200' or shi = '120100' or shi = '120200' or shi = '500100' " +
			"or shi = '500200' or shi = '500300' or shi = '310100' or shi = '310200') then sheng else shi end) as areaCode " +
			"from view_infomain) webdb ON jygg.RowGuid = webdb.infoid " +
			"inner join CQJY_GongChengInfo cg on jygg.ProjectGuid = cg.ProjectGuid " +
			"left JOIN JQXT_ProjectInfo jjia ON jjia.ProjectGuid = jygg.ProjectGuid " +
			"left join HuiYuan_City hc on hc.CityCode = webdb.areaCode where jygg.ProjectGuid = ?) vi " +
			"outer apply (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic " +
			"where pic.guid = vi.infoid and pic.type = 'JY01') pic";
	
	/**
	 * 已报名项目-专厅-其他信息
	 */
	public static final String index_ybm_zt_otherinfo_sql = 
			"select * from (" +
			"select webdb.*,hc.CityName areaName,CAST (jjia.BeginDate AS datetime) jingjiastartdate," +
			"CAST (jjia.PlanEndTime AS datetime) jingjiaenddate,cg.ProjectGuid as projectguid " +
			"from (select jygg.ProjectGuid,(case when cg.IsPLLR = '1' then cg.ProjectRegGuid else jygg.RowGuid end) as RowGuid " +
			"from CQJY_JiaoYiGongGao jygg inner join CQJY_GongChengInfo cg on jygg.ProjectGuid = cg.ProjectGuid) jygg " +
			"inner join CQJY_GongChengInfo cg on jygg.ProjectGuid = cg.ProjectGuid " +
			"left JOIN (select oucode as XiaQuCode,price as guapaiprice,infoid,CategoryNum as categorynum,CategoryName as categoryname,title," +
			"(case when (shi = '110100' or shi = '110200' or shi = '120100' or shi = '120200' or shi = '500100' " +
			"or shi = '500200' or shi = '500300' or shi = '310100' or shi = '310200') then sheng else shi end) as areaCode " +
			"from view_infomain) webdb ON jygg.RowGuid = webdb.infoid " +			
			"left JOIN JQXT_ProjectInfo jjia ON jjia.ProjectGuid = jygg.ProjectGuid " +
			"left join HuiYuan_City hc on hc.CityCode = webdb.areaCode where cg.zhuantingGuid = ?) vi " +
			"outer apply (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic " +
			"where pic.guid = vi.infoid and pic.type = 'JY01') pic";
	
	/**
	 * 已购买项目
	 */
	public static final String index_ygm_otherinfo_sql = 
			"select * from (" +
			"select webdb.*,CONVERT(nvarchar(20),cjgg.SHR_Date,20) chengjiaodate,cjgg.ChengJiaoPrice,hc.CityName areaName " +
			"from CQJY_ChengJiaoGongGao cjgg inner join " +
			"CQJY_JiaoYiGongGao jygg on cjgg.ProjectGuid = jygg.ProjectGuid " +
			"left join CQJY_ChengJiaoGongGaoDetail cc on cjgg.RowGuid = cc.CJGuid " +
			"left join (select oucode as XiaQuCode,infoid,OrderNum,CategoryNum as categorynum,CategoryName as categoryname,title," +
			"(case when (shi = '110100' or shi = '110200' or shi = '120100' or shi = '120200' or shi = '500100' " +
			"or shi = '500200' or shi = '500300' or shi = '310100' or shi = '310200') then sheng else shi end) as areaCode " +
			"from view_infomain) webdb on jygg.RowGuid = webdb.infoid " +
			"left join HuiYuan_City hc on hc.CityCode = webdb.areaCode " +
			"where (cjgg.ShouRangRenGuid = ? or cjgg.ShouRangRen = ? or cc.investorName = ?) and cjgg.AuditStatus = '3') vi " +
			"outer apply (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic " +
			"where pic.guid = vi.infoid and pic.type = 'JY01') pic";

	/**
	 * 首页预披露
	 */
	public static final String index_ypl = "select top 4 * from ( " +
			"select temp_2.*,hc.CityName shiname from ( SELECT oucode as XiaQuCode,IsTop,OrderNum,Title,price as guapaiprice,(case when (SHI = '110100' or SHI = '110200' or SHI = '120100' or SHI = '120200' or SHI = '500100' or SHI = '500200' or SHI = '500300' or SHI = '310100' or SHI = '310200') then SHENG else SHI end) as areaCode,infoid,ProjectNum,StartDate,EndDate,Categorynum,ClickTimes click,infodate,case when CategoryName='产股权' then '股权' else CategoryName end as CategoryName FROM View_InfoMain  where 1=1 AND (InfoStatusCode ='9' or InfoStatusCode ='-2')    and Categorynum ='001003001' order by IsTop DESC,OrderNum desc  offset 0 rows  FETCH NEXT 4 ROWS ONLY  ) as temp_2 left join HuiYuan_City hc on hc.CityCode = temp_2.areaCode union all " +//股权预披露
			"select temp_2.*,hc.CityName shiname from ( SELECT oucode as XiaQuCode,IsTop,OrderNum,Title,price as guapaiprice,(case when (SHI = '110100' or SHI = '110200' or SHI = '120100' or SHI = '120200' or SHI = '500100' or SHI = '500200' or SHI = '500300' or SHI = '310100' or SHI = '310200') then SHENG else SHI end) as areaCode,infoid,ProjectNum,StartDate,EndDate,Categorynum,ClickTimes click,infodate,case when CategoryName='产股权' then '股权' else CategoryName end as CategoryName FROM View_InfoMain  where 1=1 AND (InfoStatusCode ='9' or InfoStatusCode ='-2')    and Categorynum ='001003002' order by IsTop DESC,OrderNum desc  offset 0 rows  FETCH NEXT 4 ROWS ONLY  ) as temp_2 left join HuiYuan_City hc on hc.CityCode = temp_2.areaCode union all " +//债权预披露
			"select temp_2.*,hc.CityName shiname from ( SELECT oucode as XiaQuCode,IsTop,OrderNum,Title,price as guapaiprice,(case when (SHI = '110100' or SHI = '110200' or SHI = '120100' or SHI = '120200' or SHI = '500100' or SHI = '500200' or SHI = '500300' or SHI = '310100' or SHI = '310200') then SHENG else SHI end) as areaCode,infoid,ProjectNum,StartDate,EndDate,Categorynum,ClickTimes click,infodate,case when CategoryName='产股权' then '股权' else CategoryName end as CategoryName FROM View_InfoMain  where 1=1 AND (InfoStatusCode ='9' or InfoStatusCode ='-2')    and Categorynum ='001003003' order by IsTop DESC,OrderNum desc  offset 0 rows  FETCH NEXT 4 ROWS ONLY  ) as temp_2 left join HuiYuan_City hc on hc.CityCode = temp_2.areaCode union all " +//房地产预披露
			"select temp_2.*,hc.CityName shiname from ( SELECT oucode as XiaQuCode,IsTop,OrderNum,Title,price as guapaiprice,(case when (SHI = '110100' or SHI = '110200' or SHI = '120100' or SHI = '120200' or SHI = '500100' or SHI = '500200' or SHI = '500300' or SHI = '310100' or SHI = '310200') then SHENG else SHI end) as areaCode,infoid,ProjectNum,StartDate,EndDate,Categorynum,ClickTimes click,infodate,case when CategoryName='产股权' then '股权' else CategoryName end as CategoryName FROM View_InfoMain  where 1=1 AND (InfoStatusCode ='9' or InfoStatusCode ='-2')    and Categorynum ='001003004' order by IsTop DESC,OrderNum desc  offset 0 rows  FETCH NEXT 4 ROWS ONLY  ) as temp_2 left join HuiYuan_City hc on hc.CityCode = temp_2.areaCode union all " +//房产招租预披露
			"select temp_2.*,hc.CityName shiname from ( SELECT oucode as XiaQuCode,IsTop,OrderNum,Title,price as guapaiprice,(case when (SHI = '110100' or SHI = '110200' or SHI = '120100' or SHI = '120200' or SHI = '500100' or SHI = '500200' or SHI = '500300' or SHI = '310100' or SHI = '310200') then SHENG else SHI end) as areaCode,infoid,ProjectNum,StartDate,EndDate,Categorynum,ClickTimes click,infodate,case when CategoryName='产股权' then '股权' else CategoryName end as CategoryName FROM View_InfoMain  where 1=1 AND (InfoStatusCode ='9' or InfoStatusCode ='-2')    and Categorynum ='001003005' order by IsTop DESC,OrderNum desc  offset 0 rows  FETCH NEXT 4 ROWS ONLY  ) as temp_2 left join HuiYuan_City hc on hc.CityCode = temp_2.areaCode union all " +//二手车预披露
			"select temp_2.*,hc.CityName shiname from ( SELECT oucode as XiaQuCode,IsTop,OrderNum,Title,price as guapaiprice,(case when (SHI = '110100' or SHI = '110200' or SHI = '120100' or SHI = '120200' or SHI = '500100' or SHI = '500200' or SHI = '500300' or SHI = '310100' or SHI = '310200') then SHENG else SHI end) as areaCode,infoid,ProjectNum,StartDate,EndDate,Categorynum,ClickTimes click,infodate,case when CategoryName='产股权' then '股权' else CategoryName end as CategoryName FROM View_InfoMain  where 1=1 AND (InfoStatusCode ='9' or InfoStatusCode ='-2')    and Categorynum ='001003006' order by IsTop DESC,OrderNum desc  offset 0 rows  FETCH NEXT 4 ROWS ONLY  ) as temp_2 left join HuiYuan_City hc on hc.CityCode = temp_2.areaCode " +//废旧物资预披露
			") as temp_2 OUTER APPLY (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid = temp_2.infoid and pic.type = 'JY01') temp_3 order by temp_2.IsTop DESC,temp_2.OrderNum desc";


	/**
	 * 刷新竞价详情
	 */
	public static final String jjdt_cqjyinfo_sql =
	        "select * from (" +
			"    SELECT CONVERT(varchar ,b.GongGaoFromDate ,120) as GongGaoFromDate" +
			"    ,CONVERT(varchar ,b.GongGaoToDate ,120) as GongGaoToDate" +
			"    ,ISNULL(c.ProjectControlType, '') as ProjectControlType" +
			"    ,a.BiaoDiNO ,d.InfoID ,a.BiaoDiName as object" +
			"    ,(SELECT CityName FROM dbo.Sys_XiaQu WHERE CityCode = a.XiaQuCode)as orgName" +
			"    ,(case " +
			"    when a.ProjectStatus ='0' then '2'" +
			"    when a.ProjectStatus ='1' then '0'" +
			"    when a.ProjectStatus ='2' then '0'" +
			"    when a.ProjectStatus ='3' then '3'" +
			"    when a.ProjectStatus ='4' then '1'" +
			"    else '3'" +
			"    end)as status" +
			"    ,(CASE WHEN a.ProjectStatus = '0' THEN '未开始' " +
			"    WHEN a.ProjectStatus = '2' THEN '延时竞价'" +
			"    WHEN a.ProjectStatus = '3' THEN '已结束' " +
			"    WHEN a.ProjectStatus = '4' THEN '竞价暂停' " +
			"    ELSE '报价中' END) as statusCn" +
			"    ,CONVERT(varchar ,cast(a.BeginDate as datetime) ,120) as start" +
			"    ,CONVERT(varchar ,cast(a.PlanEndTime as datetime) ,120) as endTime" +
			"    ,c.ProjectType" +
			"    , (case when a.MaxQuotePrice is null then '0' else '1' end) as hasBid" +
			"    ,(CASE " +
			"    WHEN a.JingJiaFangShi ='3' THEN '******' " +
			"    ELSE CAST(" +
			"        CAST(" +
			"            (CASE " +
			"                WHEN a.CurrencyUnit = '2' THEN ISNULL(a.MaxQuotePrice, a.FromPrice) *10000" +
			"                ELSE ISNULL(a.MaxQuotePrice, a.FromPrice)" +
			"                END) " +
			"                as decimal(18, 2)" +
			"        ) as VARCHAR" +
			"    )" +
			"    END) as maxPrice" +
			//密封是报价，不显示价格
			"    ,(CASE WHEN a.JingJiaFangShi ='3' THEN '******' ELSE CAST(price as VARCHAR) END) as price" +
			"    FROM " +
			"        dbo.JQXT_ProjectInfo AS a INNER JOIN" +
			"        dbo.CQJY_JiaoYiGongGao AS b ON a.ProjectGuid = b.ProjectGuid INNER JOIN" +
			"        dbo.CQJY_GongChengInfo AS c ON a.ProjectGuid = c.ProjectGuid CROSS JOIN" +
			"        dbo.WebDB_Information AS d" +
			"    WHERE (b.GongGaoGuid = d.InfoID) AND (a.ProjectJiaoYiType = '产权交易') AND " +
			"        (b.AuditStatus = '3') OR" +
			"        (a.ProjectJiaoYiType = '产权交易') AND (b.AuditStatus = '3') AND " +
			"        (c.ProjectRegGuid = d.InfoID)" +
			") as a where 1=1 ";

	/**
	 * 首页统计-入驻会员数量
	 */
	public static final String index_rzhy_tj = 
			"Select sum(count) as count from (" + 
			"Select Count(1) as count from VIEW_HuiYuan_AllZfcgDaiLi Where AuditStatus='3' Union All " + 
			"Select Count(1) as count from View_HuiYuan_AllPaiMaiDaiLi Where AuditStatus='3' Union All " + 
			"Select Count(1) as count from VIEW_HuiYuan_AllGongYingShang Where AuditStatus='3' Union All " + 
			"Select Count(1) as count from VIEW_HuiYuan_AllJingJiaDW Where AuditStatus='3') t";
	
	/**
	 * 首页统计-产权交易数量
	 */
	public static final String index_cqjy_tj = 
			"Select sum(count) as count from (" +
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='FC' Union All " + 
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='GQ' Union All " + 
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='CL' Union All " +
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='WZ' Union All " +
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='LS' Union All " +
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='ZC' Union All " +
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='CP' Union All " +
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='5' Union All " +
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='QT' Union All " +
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='FCZZ' Union All " +
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='TD' Union All " +
			"Select Count(1) as count from CQJY_GongChengInfo Where ChengJiaoIsSelected='1' and AuditStatus='3' and isnull(IsLiuBiao,'')<>'1' and ProjectGuid in (Select ProjectGuid from CQJY_ChengJiaoGongGao where AuditStatus='3') and ProjectType='ZZKG') t";

	/**
	 * 竞价大厅_产权交易
	 */
	public static final String jjdt_cqjy_sql = "select * from ( " + 
		" SELECT b.GongGaoFromDate " +
		" ,b.GongGaoToDate ,d.sheng,d.shi,a.JingJiaFangShi " +
		" , a.BiaoDiNO, b.GongGaoGuid AS infoguid, a.BiaoDiName AS object , g.Citycode AS orgName " +
//		ProjectStatus：0尚未开始、1正在竞价、2延时竞价、3竞价结束、4竞价暂停
//		2017-05-25 为排序需要将竞价中的排在前面,将竞价中的状态改成 0,未开始改为 2,3 为已结束
		" ,(case when a.ProjectStatus = '0' THEN '2' WHEN (a.ProjectStatus = '1' or a.ProjectStatus = '2') THEN '0' WHEN (a.ProjectStatus = '4') THEN '1'  ELSE '3' END)AS status  " +
		" ,(case when a.ProjectStatus = '0' THEN '未开始' WHEN a.ProjectStatus=1 THEN '竞价中' WHEN a.ProjectStatus=2 THEN '延时竞价' WHEN a.ProjectStatus=4 THEN '竞价暂停' WHEN a.ProjectStatus=3 THEN '已结束' END)AS statusCN  " +
		" ,cast(a.BeginDate as datetime) as start " +
		" ,cast(a.PlanEndTime as datetime) endTime, c.ProjectType " +
		" ,ISNULL(c.ProjectControlType, '') as ProjectControlType " +
		" ,(case when a.MaxQuotePrice is null then '0' else '1' end) as hasBid " +
//		密封报价，不显示价格 " 
		" ,CAST(CAST((CASE WHEN a.CurrencyUnit = '2' THEN ISNULL(a.MaxQuotePrice, a.FromPrice) *10000 ELSE ISNULL(a.MaxQuotePrice, a.FromPrice) END) as decimal(18, 2)) as VARCHAR ) as maxPrice " +
		" ,(CASE WHEN (a.JingJiaFangShi ='3' and a.IsFromPriceXs!='1' ) THEN '******' ELSE CAST(CAST((CASE WHEN a.CurrencyUnit = '2' THEN a.FromPrice * 10000 ELSE a.FromPrice END) as decimal(18, 2)) as varchar) END) as price " +
		" ,(case when e.IsPLLR ='1' then ('infodetail?infoid=' +e.projectRegGuid) else ('infodetail?infoid=' +b.RowGuid) end) as project_url " +
		" ,a.ProjectGuid " +
		" FROM dbo.JQXT_ProjectInfo AS a  " +
		" INNER JOIN dbo.CQJY_JiaoYiGongGao AS b ON a.ProjectGuid = b.ProjectGuid  " +
		" INNER JOIN dbo.CQJY_GongChengInfo AS c ON a.ProjectGuid = c.ProjectGuid  " +
		" INNER JOIN dbo.WebDB_Information AS d ON (b.GongGaoGuid = d.InfoID or c.ProjectRegGuid=d.InfoID) " +
		" INNER JOIN CQJY_ProjectRegister e ON c.ProjectRegGuid =e.ProjectRegGuid AND e.AuditStatus ='3' " +
		" INNER JOIN Sys_XiaQu g ON g.CityCode =c.XiaQuCode " +
		" WHERE (a.ProjectJiaoYiType = '产权交易') AND (b.AuditStatus = '3') and a.BiaoDiName not like '%勿拍' and a.BiaoDiName not like '%勿报名%'  and cast(a.BeginDate as datetime) > (GETDATE()-90) " +
		" ) as temp_111";
	
	
	

	/**
	 * 批量挂牌_交易公告 lastupdate 是否更新sql
	 */
	public static String plgp_chengjiao_gonggao_pic_handle_sql = " select DISTINCT infoid,lastupdate from (	select " +
			" max (a.SHR_Date) lastupdate,c.InfoID 	" +
			" from View_InfoMain AS c " +
			" INNER JOIN CQJY_ProjectRegister g ON g.ProjectRegGuid =c.InfoID " +
			" INNER JOIN dbo.CQJY_GongChengInfo AS b ON g.ProjectRegGuid = b.ProjectRegGuid " +
			" INNER JOIN CQJY_JiaoYiGongGao AS a ON a.ProjectGuid =b.ProjectGuid " +
			" WHERE a.AuditStatus = '3' and b.IsPLLR=1 and (c.InfoStatusCode=9  or c.InfoStatusCode='-2')  group by c.InfoID) as temp_1 " ;
			
//			" where temp_1.lastupdate > (select top 1 optime from web_pic_handle)";
	
	
	/**
	 * 非批量挂牌_交易公告 lastupdate 是否更新sql,包含重点推荐,普通挂牌的公告
	 */
	public static String jiaoyi_gonggao_pic_handle_sql = "select DISTINCT infoid,lastupdate from ( select " +
			"  c.infoid, a.SHR_Date as lastupdate " +
			" from dbo.CQJY_JiaoYiGongGao AS a " + 
			" INNER JOIN View_InfoMain AS c ON SUBSTRING(c.InfoID,0,37) = a.GongGaoGuid " + 
			" WHERE  1=1 and a.AuditStatus = '3' and  ( c.InfoStatusCode=9 or c.InfoStatusCode=-2 )) as temp_1 " ;
			
			
//			" where temp_1.lastupdate > (select top 1 optime from web_pic_handle) ";

	
	/**
	 * 预披露 图片处理
	 */
	public static String ypl_pic_handle_sql = " select  infoid from View_InfoMain " +
			"where CategoryNum like '00100300_' and  ( InfoStatusCode=9 or InfoStatusCode=-2 )  ";

	/**
	 * 首页招标采购--招标公告
	 */
	public static String index_zbcg_zbgg_sql = "select * from ( SELECT a.baomingstart as baomingstart_str,a.baomingend as baomingend_str ,b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where a.baomingstart < GetDate() and a.Categorynum ='002001001' order by a.infodate DESC  offset 0 rows  FETCH NEXT 8 ROWS ONLY  )as temp_2 union all " +//招标采购招标公告_工程
			"select * from ( SELECT a.baomingstart as baomingstart_str,a.baomingend as baomingend_str ,b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where baomingstart < GetDate()   and a.Categorynum ='002001002' order by a.infodate DESC  offset 0 rows  FETCH NEXT 8 ROWS ONLY  )as temp_2 union all " +//招标采购招标公告_货物
			"select * from ( SELECT a.baomingstart as baomingstart_str,a.baomingend as baomingend_str ,b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where baomingstart < GetDate()   and a.Categorynum ='002001003' order by a.infodate DESC  offset 0 rows  FETCH NEXT 8 ROWS ONLY  )as temp_2 union all " +//招标采购招标公告_服务
			"select * from ( SELECT a.baomingstart as baomingstart_str,a.baomingend as baomingend_str ,b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where baomingstart < GetDate()   and a.Categorynum ='002002001' order by a.infodate DESC  offset 0 rows  FETCH NEXT 8 ROWS ONLY  )as temp_2 union all " +//招标采购成交公示_工程
			"select * from ( SELECT a.baomingstart as baomingstart_str,a.baomingend as baomingend_str ,b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where baomingstart < GetDate()   and a.Categorynum ='002002002' order by a.infodate DESC  offset 0 rows  FETCH NEXT 8 ROWS ONLY  )as temp_2 union all " +//招标采购成交公示_货物
			"select * from ( SELECT a.baomingstart as baomingstart_str,a.baomingend as baomingend_str ,b.projectNum,a.* FROM web_v2_zbcg a LEFT JOIN View_InfoMain b on a.infoid=b.InfoID where baomingstart < GetDate()   and a.Categorynum ='002002003' order by a.infodate DESC  offset 0 rows  FETCH NEXT 8 ROWS ONLY  )as temp_2 " ;//招标采购成交公示_服务

	/**
	 * 首页招标采购--成交公告
	 */
	public static String index_zbcg_cjgg_gc_sql =  " select top 8 baomingstart as baomingstart_str,baomingend as baomingend_str ,* from view_web_v2_zbcg_cjgg where categorynum = '002002001' order by baomingstart desc " ;//工程
	public static String index_zbcg_cjgg_hw_sql =  " select top 8 baomingstart as baomingstart_str,baomingend as baomingend_str ,* from view_web_v2_zbcg_cjgg where categorynum = '002002002' order by baomingstart desc " ;//货物
	public static String index_zbcg_cjgg_fw_sql =  " select top 8 baomingstart as baomingstart_str,baomingend as baomingend_str ,* from view_web_v2_zbcg_cjgg where categorynum = '002002003' order by baomingstart desc " ;//服务

}
