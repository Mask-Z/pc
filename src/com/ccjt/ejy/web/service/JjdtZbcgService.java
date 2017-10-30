package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.vo.City;
import com.ccjt.ejy.web.vo.GongGao;
import com.ccjt.ejy.web.vo.Page;

/**
 * 【竞价大厅】招标采购业务处理类
 * @author rocky(huangchunjie0513@163.com)
 *
 */
public class JjdtZbcgService extends JjdtService{
    private static Logger log = LogManager.getLogger(JjdtZbcgService.class);

    /**
     * 【招标采购】城市列表
     * @return
     */
    public List<City> zbcg_city() {
        List<City> citylist = new ArrayList<City>();
        try {
            String sql = " select distinct xiaqucode code,xq.CityName name from Zfcg_ZhaoBiaoGG zbcg inner join Sys_XiaQu xq on zbcg.XiaQuCode=xq.CityCode where 1=1 and auditstatus=3 ";
            citylist = jdbc.beanList(sql, City.class);
        } catch (Exception e) {
            log.error("获取招标采购项目所在城市出错:", e);
            e.printStackTrace();
        }
        return citylist;
    }
    
    /**
     * 默认获取前8条数据
     * @return
     */
    public List<GongGao> jjdt_zbcg(Integer count){
        List<GongGao> jygg_list = null;
        try{
            String sql = "select title,projectnum,jingjia_start,jingjia_end,state,zgj,infoid from view_infomain_zbcg_jjdt temp_4 where 1=1 ";
            sql += "  ORDER BY state asc,jingjia_start desc";
            jygg_list = jdbc.beanList(sql,0,count, GongGao.class);
            for(GongGao gg : jygg_list){
                if(gg!=null && StringUtils.isNotBlank(gg.getTitle()) && gg.getTitle().length() >  33){
                    gg.setTitle(gg.getTitle().substring(0,33) + "...");
                }
            }
        }catch (Exception e) {
            log.error("获取招标采购竞价大厅出错:",e);
            e.printStackTrace();
        }
        return jygg_list;
    }
    
    /**
     * 【招标采购】竞价大厅列表
     * @param page
     * @param sheng
     * @param orgid
     * @param biaodiname
     * @param type
     * @param status
     * @return
     */
    public List<GongGao> jjdt_zbcg(Page page,String sheng,String orgid,String biaodiname,String type,String status){
        List<GongGao> jygg_list = null;
        List<Object> params = new ArrayList<Object>();
        try{
            String sql = "select title,projectnum,jingjia_start,jingjia_end,state ,zgj,infoid from view_infomain_zbcg_jjdt temp_4 where 1=1 ";
            if(StringUtils.isNotBlank(biaodiname)){
                sql += " and temp_4.title like ?";
                params.add("%"+biaodiname+"%");
            }
            
            if(StringUtils.isNotBlank(orgid)){
                sql += " and temp_4.orgname=?";
                params.add(orgid);
            }
            
            if(StringUtils.isNotBlank(type)){
                sql += " and temp_4.xiangmulbcode like ?";
                params.add(type+"%");
            }
            
            if(StringUtils.isNotBlank(status)){
                sql += " and temp_4.state=?";
                params.add(status);
            }
            
            Object [] arr = params.toArray();
            page.setTotal(jdbc.getCount(sql,arr));
            
            sql += "  ORDER BY state asc,jingjia_start desc";
            
            sql = jdbc.pageSql(sql, page.getCurrentPage(), page.getRows());
            
            jygg_list = jdbc.beanList(sql, GongGao.class,arr);
            
            for(GongGao gg : jygg_list){
                
                if(gg!=null && StringUtils.isNotBlank(gg.getTitle()) && gg.getTitle().length() >  33){
                    gg.setTitle(gg.getTitle().substring(0,33) + "...");
                }
            }
            
        }catch (Exception e) {
            log.error("获取招标采购竞价大厅出错:",e);
            e.printStackTrace();
        }
        return jygg_list;
    }
}
