package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.vo.Zulin;


/**
 * 房产信息业务逻辑处理类
 * @author rocky
 *
 */
public class ZulinService {
	private static Logger log = LogManager.getLogger(FangChanService.class);

	/**
	 * 获取房产信息列表
	 * @param projectGuid
	 * @return
	 */
	public List<Zulin> getZulins(String[] projectguids){
		List<Zulin> list =new ArrayList<Zulin>();
		if(projectguids !=null &&projectguids.length >0){
			for(String projectguid : projectguids){
				Zulin f =getZulin(projectguid);
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
	public Zulin getZulin(String projectguid) {
		Zulin gg = null;
        try {
            String sql = "SELECT c.danw,a.ProjectGuid" +
            		",c.guapaiprice as rent" +
            		",c.guapaiprice as price" +
            		",a.area" +
            		",a.zlqx" +
            		",a.suozaicengshu" +
            		",a.biaodistatus" +
            		",a.zlyt" +
            		",a.zhuangxiuqixian" +
            		",a.czprice" +
            		",a.zujindizengtype" +
            		",'' as setyxq" +
            		",a.zftype" +
            		",a.czyq" +
            		",c.jigzichanlxr as tel" +
            		" FROM ZulInfo a" +
            		" INNER JOIN CQJY_GongChengInfo b ON a.ProjectGuid =b.ProjectGuid" +
            		" INNER JOIN infomain_jygg_v2 c ON a.ProjectGuid =c.ProjectGuid" +
            		" where a.projectGuid =?";
            gg = jdbc.bean(sql,Zulin.class,projectguid);
        } catch (Exception e) {
            log.error("获取房产信息异常:",e);
            e.printStackTrace();
        }
        return gg;
    }
}
