package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.vo.GongGao;

/**
 * 项目服务类
 * @author rocky
 *
 */
public class ProjectService {
	private static Logger log = LogManager.getLogger(ProjectService.class);
	
	/**
	 * 获取项目的标的亮点
	 * @param projectType	标的类型,如：FC、FCZZ
	 * @return
	 */
	public List<String> getHotTagsOfProjectType(String projectType){
		String sql ="SELECT HotLabelName as tagname FROM ZHGL_HotLabel where projectType =?";
		try {
			return jdbc.getStringList(sql, projectType);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 获取标的的公告列表
	 * @param projectguids
	 * @return
	 */
	public List<GongGao> getGongGaos(String[] projectguids){
		List<GongGao> list =new ArrayList<GongGao>();
		if(projectguids !=null &&projectguids.length >0){
			for(String projectguid : projectguids){
				GongGao g =getGongGao(projectguid);
				if(g !=null) list.add(g);
			}
		}
		return list;
	}

	/**
	 * 获取标的的公告详情
	 * @param projectguid
	 * @return
	 */
	public GongGao getGongGao(String projectguid) {
        GongGao gg = null;
        try {
            String sql = "SELECT belongxiaqucode as xiaqucode," +
            		" a.guapaiprice " +
            		" ,a.infoid" +
            		" ,a.title" +
            		" ,a.projectguid " +
            		" ,a.categorynum " +
            		" ,a.Categoryname as projectstyle " +
            		" ,a.jigzichanlxr" +
            		" ,b.titlepic" +
            		" from infomain_jygg_v2 a " +
            		" OUTER APPLY " +
            		" (select top 1 path titlepic from [web2.0].dbo.web_gonggao_pic pic where pic.guid= a.infoid and pic.type='JY01') b " +
            		" WHERE a.ProjectGuid = ?";
            gg = jdbc.bean(sql,GongGao.class,projectguid);
        } catch (Exception e) {
            log.error("获取公告详细出错:",e);
            e.printStackTrace();
        }
        return gg;
    }
}
