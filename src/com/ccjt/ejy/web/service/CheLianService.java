package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.vo.CheLian;

/**
 * 车辆信息业务逻辑类
 * @author rocky
 *
 */
public class CheLianService {
	private static Logger log = LogManager.getLogger(CheLianService.class);

	/**
	 * 获取房产信息列表
	 * @param projectguids
	 * @return
	 */
	public List<CheLian> getCheLians(String[] projectguids){
		List<CheLian> list =new ArrayList<CheLian>();
		if(projectguids !=null &&projectguids.length >0){
			for(String projectguid : projectguids){
				CheLian f =getCheLian(projectguid);
				if(f !=null) list.add(f);
			}
		}
		return list;
	}
	
	/**
	 * 获取标的的公告详情
	 * @param projectguid
	 * @return
	 */
	public CheLian getCheLian(String projectguid) {
		CheLian gg = null;
        try {
            String sql = "SELECT " +
            		"a.projectguid" +
            		",a.chelno" +
            		",a.dengjidate" +
            		",a.nianjtodate" +
            		",a.chelname" +
            		",a.fadongjino" +
            		",a.chejiano" +
            		",a.pailiang" +
            		",a.ranyoutype" +
            		",a.biansuxiang" +
            		",a.gongli" +
            		",a.cheltype" +
            		",a.color" +
            		",a.shangyexian" +
            		",a.jiaoqiangxian" +
            		",c.guapaiprice as price" +
            		",'' as pingguprice" +
            		",'' as pinggudate" +
            		",'' as pingguorg" +
            		",'' as hezhunorg" +
            		",'' as zhaunrfinfo" +
            		",'' as descs" +
            		" FROM CQJY_CheLianInfo a" +
            		" INNER JOIN CQJY_GongChengInfo b ON a.ProjectGuid =b.ProjectGuid" +
            		" INNER JOIN infomain_jygg_v2 c ON a.ProjectGuid =c.ProjectGuid" +
            		" where a.projectGuid =?;";
            gg = jdbc.bean(sql,CheLian.class,projectguid);
        } catch (Exception e) {
            log.error("获取房产信息异常:",e);
            e.printStackTrace();
        }
        return gg;
    }
}
