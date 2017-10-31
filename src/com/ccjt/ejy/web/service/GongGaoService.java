package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.Map;

import com.ccjt.ejy.web.vo.GongGao;
import com.ccjt.ejy.web.vo.LoginAccount;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.enums.ProjectType;

import javax.servlet.http.HttpServletRequest;

/**
 * 公告业务逻辑类
 * @author rocky
 *
 */
public class GongGaoService {
	private static Logger log = LogManager.getLogger(GongGaoService.class);
	
	/**
	 * 是否可以显示 比一比
	 * @param infoid	公告infoid
	 * @return
	 */
	public boolean is_showCompare(String infoid){
		boolean f =false;
		try {
			if(jdbc.getInteger("SELECT count(*) as cot FROM CQJY_ProjectRegister WHERE ProjectRegGuid ='"+infoid+"'") >0){
				return false;//批量挂牌的标的
			}
			//普通标的
			String sql ="SELECT a.ProjectGuid,b.ProjectType FROM CQJY_JiaoYiGongGao a" +
					" INNER JOIN CQJY_GongChengInfo b ON a.ProjectGuid =b.ProjectGuid" +
					" WHERE a.GongGaoGuid ='"+infoid+"';";
			Map<String ,Object> projectInfo =jdbc.map(sql);
			String projectGuid =(String)projectInfo.get("ProjectGuid");
			ProjectType projectType =ProjectType.get((String)projectInfo.get("ProjectType"));
			switch (projectType) {
			case FC://房产
				f =jdbc.getInteger("select count(*) as cot from CQJY_FangChanInfo where projectGuid ='"+projectGuid+"'") ==1;
				break;
			case FCZZ://房产招租
				f =jdbc.getInteger("select count(*) as cot from ZulInfo where projectGuid ='"+projectGuid+"'") ==1;
				break;
			case CL://二手车
				f =jdbc.getInteger("select count(*) as cot from CQJY_CheLianInfo where projectGuid ='"+projectGuid+"'") ==1;
				break;
			default:
				f =false;
				break;
			}
		} catch (Exception e) {
			log.error("判断是否显示比一比异常:",e);
			e.printStackTrace();
			f =false;
		}
		return f;
	}

	/**
	 * 是否可以显示 30秒展示区
	 * @param gongGao	公告infoid
	 * @return
	 */
//	public boolean is_showOptesthesia(String infoid){
	public boolean is_showOptesthesia(GongGao gongGao,String systemType){
		boolean f =false;
		try {
//			if(jdbc.getInteger("SELECT count(*) as cot FROM CQJY_ProjectRegister WHERE ProjectRegGuid ='"+infoid+"'") >0){
//				return false;//批量挂牌的标的
//			}
			if (gongGao.getIspllr() != null && gongGao.getIspllr().equals("1")){
				return false;//批量挂牌的标的
			}
			String infoid=gongGao.getInfoid();
			//普通标的
			String sql ="SELECT a.ProjectGuid,b.ProjectType FROM CQJY_JiaoYiGongGao a" +
					" INNER JOIN CQJY_GongChengInfo b ON a.ProjectGuid =b.ProjectGuid" +
					" WHERE a.GongGaoGuid ='"+infoid+"';";
			Map<String ,Object> projectInfo =jdbc.map(sql);
			if(projectInfo!=null) {
				String projectGuid = (String) projectInfo.get("ProjectGuid");
				ProjectType projectType = ProjectType.get(StringUtils.upperCase((String) projectInfo.get("ProjectType")));
				switch (projectType.getCode()) {
					case "FC"://房产
						f = jdbc.getInteger("select count(*) as cot from CQJY_FangChanInfo where projectGuid ='" + projectGuid + "'") == 1;
						break;
					case "FCZZ"://房产招租
						f = jdbc.getInteger("select count(*) as cot from ZulInfo where projectGuid ='" + projectGuid + "'") == 1;
						break;
					case "CL"://二手车
						f = jdbc.getInteger("select count(*) as cot from CQJY_CheLianInfo where projectGuid ='" + projectGuid + "'") == 1;
						break;
					case "WZ"://废旧物资
						f = jdbc.getInteger("select count(*) as cot from CQJY_SheBeiInfo where projectguid ='" + projectGuid + "'") >= 1;
						break;
					case "GQ"://股权
						if (StringUtils.isNotBlank(systemType) && systemType.equals("NMG")) {
							f = true;
						} else {
							f = jdbc.getInteger("select count(*)as cot from  BiaoDiCompany  where ProjectGuid='" + projectGuid + "'") >= 1;
						}
						break;
					case "ZQ"://债权
						f = jdbc.getInteger("select count(*)as cot from  CQJY_ZhaiQuan  where ProjectGuid='" + projectGuid + "'") >= 1;
						break;
					default:
						f = false;
						break;
				}
			}
		} catch (Exception e) {
			log.error("判断是否显示30秒展示区异常:",e);
			e.printStackTrace();
			f =false;
		}
		return f;
	}

    public boolean is_lendMoney(GongGao gongGao, HttpServletRequest request, boolean is_shenqing) {
		boolean f=false;
		if (!is_shenqing) {//该项目未被改用户申请过贷款
			if (StringUtils.isNotBlank(gongGao.getProjectstyle()) && gongGao.getProjectstyle().equals("房地产")) {//房产项目
				if (StringUtils.isNotBlank(gongGao.getGuapaiprice()) && Float.parseFloat(gongGao.getGuapaiprice()) > 1000000 && Float.parseFloat(gongGao.getGuapaiprice()) < 10000000) {//项目挂牌金额100W~1000W
					if (gongGao.getStatus() != null && (gongGao.getStatus() != 0 || gongGao.getStatus() != 1 || gongGao.getStatus() != 4)) {//只有项目状态为未开始、报名中、竞价中才可以申请
						f = true;
					}
				}
			}
		}
		return f;
    }

	/**
	 * 用户是否已经申请过该项目的贷款
	 * @param user
	 * @param gongGao
	 * @return
	 */
	public boolean is_shenQing(LoginAccount user, GongGao gongGao) {
		boolean f;
		try {
			f = jdbc.getInteger("select count(*) as cot from online_loan_apply where user_id ='" + user.getDanWeiGuid() + "' and infoid='"+gongGao.getInfoid()+"'") >= 1;
		} catch (Exception e) {
			log.error("判断用户是否申请过该项目异常:",e);
			e.printStackTrace();
			f =false;
		}
		return f;
	}
}
