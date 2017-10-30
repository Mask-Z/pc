package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.vo.FangChan;

/**
 * 房产信息业务逻辑处理类
 * @author rocky
 *
 */
public class FangChanService {
	private static Logger log = LogManager.getLogger(FangChanService.class);

	/**
	 * 获取房产信息列表
	 * @param projectGuid
	 * @return
	 */
	public List<FangChan> getFanChans(String[] projectguids){
		List<FangChan> list =new ArrayList<FangChan>();
		if(projectguids !=null &&projectguids.length >0){
			for(String projectguid : projectguids){
				FangChan f =getFanChan(projectguid);
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
	public FangChan getFanChan(String projectguid) {
		FangChan gg = null;
        try {
            String sql = "SELECT " +
            		"a.projectguid" +
            		",c.guapaiprice as price" +
            		",a.area" +
            		",a.taoneijianzhuarea" +
            		",a.tudiusearea" +
            		",a.shiyongqixian" +
            		",a.quanlixingzhi" +
            		",a.shiyxz" +
            		",a.jianzujiegou" +
            		",a.huxing" +
            		",a.chaoxiang" +
            		",a.zunqinfo" +
            		",a.zhuangxiuinfo" +
            		",a.diyainfo" +
            		",a.hasdianti" +
            		",a.qianfeiinfo" +
            		",a.remark" +
            		",c.jigzichanlxr as tel" +
            		" FROM CQJY_FangChanInfo a" +
            		" INNER JOIN CQJY_GongChengInfo b ON a.ProjectGuid =b.ProjectGuid" +
            		" INNER JOIN infomain_jygg_v2 c ON a.ProjectGuid =c.ProjectGuid" +
            		" where a.projectGuid =?";
            gg = jdbc.bean(sql,FangChan.class,projectguid);
        } catch (Exception e) {
            log.error("获取房产信息异常:",e);
            e.printStackTrace();
        }
        return gg;
    }
}
