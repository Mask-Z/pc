package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.vo.Organize;

public class JjdtService {
    private static Logger log = LogManager.getLogger(JjdtService.class);
    
    /**
     * E交易入驻机构信息
     */
    public List<Organize> jjdt_orglist(){
        List<Organize> list =new ArrayList<Organize>();
        String sql ="Select DanWeiName as name,CityCode as orgid from View_HuiYuan_AllPaiMaiDaiLi inner join Sys_XiaQu on View_HuiYuan_AllPaiMaiDaiLi.DanWeiGuid = Sys_XiaQu.RowGuid where AuditStatus='3' and StatusCode='2'";
        try {
            list = jdbc.beanList(sql, Organize.class);
        } catch (Exception e) {
            log.error("获取机构数据出错:" ,e);
            e.printStackTrace();
        }
        return list;
    }
    
    /**
     * 获取项目分类列表
     * @return
     */
    @SuppressWarnings("rawtypes")
    public List jjdt_typelist(){
        List list =new ArrayList();
        String sql ="select ItemValue as type,ItemText as typeName from View_CodeMain_CodeItems where CodeName='产权类别';";
        try {
            list =jdbc.mapList(sql);
        } catch (Exception e) {
            log.error("获取项目分类列表出错:" ,e);
            e.printStackTrace();
        }
        return list;
    }
    
}
