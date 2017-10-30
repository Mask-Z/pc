/**  
 * 包名：com.ccjt.ejy.web.service  
 * 文件名：ZzcgService.java  
 * 版本信息：V1.0  
 * 日期：2017年9月19日-上午10:57:36  
 * Copyright(c)2017
 *   
 */
package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.db.connection.DruidConnectionProvide_99;
import com.ccjt.ejy.web.vo.PurchaseNotice;

/**  
 *   
 * 类名称：ZzcgService  
 * 类描述：
 * 创建人：qiaojoy99  
 * 修改人：qiaojoy99 
 * 修改时间：2017年9月19日 上午10:57:36  
 * 修改备注：  
 * @version 1.0.0  
 *   
 */
public class ZzcgService {
    
    private static Logger log = LogManager.getLogger(ZzcgService.class);
    
    /**
     * 自主采购
     * zzcgs  
     * @param page
     * @param size
     * @param caiGou
     * @return   
     * Map<String,Object>  
     * @exception   
     * @since  1.0.0
     */
    public Map<String, Object> zz_cggg(Integer page,Integer size,PurchaseNotice notice){
        Map<String, Object> map = new HashMap<String, Object>();
        int start = (page-1)*15;
        String querySql = "";
        String order_sql = "";
        List<Object> params = new ArrayList<Object>();
        try {
        	querySql = " select a.id,a.title,a.content,a.dwguid,b.dwname,a.sign_end_date,a.cate_id,a.hitcount,a.status, "
        					+ " case when a.status = 1 and unix_timestamp(sysdate()) < unix_timestamp(a.sign_begin_date) then 1 else "
        					+ " case when a.status = 1 and unix_timestamp(sysdate()) > unix_timestamp(a.sign_begin_date) and unix_timestamp(sysdate()) < unix_timestamp(a.sign_end_date) then 2 else "
							+ " 3 end end as status_name "
        					+ "	from purchase_notice a "
        					+ " left join (select dwguid,max(dwname) dwname from sys_acc group by dwguid) b on a.dwguid = b.dwguid "
        					+ " left join purchase_section c on c.section_no = a.section_no "
        					+ " left join purchase_project d on d.project_no = c.project_no "
        					+ " where a.isdelete = 0 and a.level is null ";
        	
            if(notice!=null){
                if(StringUtils.isNotBlank(notice.getTitle())){
                    querySql = querySql + " and title like ? ";
                    params.add("%" + notice.getTitle() + "%");
                }
                
                if(StringUtils.isNotBlank(notice.getCateId())){
                	querySql = querySql + " and d.cate_id = '"+notice.getCateId()+"' ";
                }
                if(notice.getStatus()==0){
                	querySql = querySql + "";
                }else if(notice.getStatus()==1){	//未开始
                	querySql = querySql + " and a.status = 1 and unix_timestamp(sysdate()) < unix_timestamp(a.sign_begin_date) ";
                }else if(notice.getStatus()==2){	//报名中
                	querySql = querySql + " and a.status = 1 and unix_timestamp(sysdate()) >= unix_timestamp(a.sign_begin_date) and unix_timestamp(sysdate()) <= unix_timestamp(a.sign_end_date) ";
                }else if(notice.getStatus()==3){	//已结束
                	querySql = querySql + " and (a.status != 1 or unix_timestamp(sysdate()) > unix_timestamp(a.sign_end_date) ) ";
                }
            }
            
            order_sql = " order by a.sign_end_date desc limit "+start+",15";
            DruidConnectionProvide_99 dc = new DruidConnectionProvide_99();
            Connection conn = dc.getConnection();
            List<Map<String, Object>> rows = jdbc.mapList(conn, querySql + order_sql, params.toArray());
            map.put("rows", rows);
            String countSql = " select count(1) as num from ("+querySql+")t ";
            List<Map<String, Object>> count = jdbc.mapList(conn, countSql, params.toArray());
            if(count.size()>0 && count.get(0).get("num")!=null){
            	map.put("count", count.get(0).get("num"));
            }else{
            	map.put("count", 0);
            }
            conn.commit();
            return map;
        } catch (Exception e) {
            log.error("获取自主采购招标公告数据出错:" ,e);
            e.printStackTrace();
        }
        return null;
    }
    
    public Map<String, Object> zz_cjgg(Integer page,Integer size,PurchaseNotice notice){
    	Map<String, Object> map = new HashMap<String, Object>();
        int start = (page-1)*15;
        String querySql = "";
        try {
        	querySql = " select b.id,b.title,a.content,b.dwguid,c.dwname,b.cate_id,b.sign_end_date "
							+ " from purchase_bid_notice a "
							+ " left join purchase_notice b on b.id = a.noticeid "
							+ " left join (select dwguid,max(dwname) dwname from sys_acc group by dwguid) c on b.dwguid = c.dwguid "
							+ " left join purchase_section d on d.section_no = b.section_no "
							+ " left join purchase_project e on e.project_no = d.project_no "
							+ " where a.isdelete = 0 ";
        	
            List<Object> params = new ArrayList<Object>();
            if(notice!=null){
                if(StringUtils.isNotBlank(notice.getTitle())){
                    querySql = querySql + " and b.title like ? ";
                    params.add("%" + notice.getTitle() + "%");
                }
                
                if(StringUtils.isNotBlank(notice.getCateId())){
                	querySql = querySql + " and e.cate_id = '"+notice.getCateId()+"' ";
                }
                
            }
            
            String order_sql = " order by b.sign_end_date desc limit "+start+",15";
            DruidConnectionProvide_99 dc = new DruidConnectionProvide_99();
            Connection conn = dc.getConnection();
            List<Map<String, Object>> rows = jdbc.mapList(conn, querySql + order_sql, params.toArray());
            map.put("rows", rows);
            
            String countSql = " select count(1) as num from ("+querySql+")t ";
            List<Map<String, Object>> count = jdbc.mapList(conn, countSql, params.toArray());
            if(count.size()>0 && count.get(0).get("num")!=null){
            	map.put("count", count.get(0).get("num"));
            }else{
            	map.put("count", 0);
            }
            conn.commit();
            return map;
        } catch (Exception e) {
            log.error("获取快捷采购招标公告数据出错:" ,e);
            e.printStackTrace();
        }
        return null;
    }
    
    public Map<String,Object> zzcg_detail(String tag,String id){
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<Object> params = new ArrayList<Object>();
    	String querySql = "";
    	String updateSql = "";
    	if(tag==null){
    		querySql = " select id,title,content,hitcount,date_format(create_time, '%Y-%m-%d') infodate from purchase_notice where id = ? ";
    		updateSql = " update purchase_notice set hitcount = (hitcount+1) where id = ? ";
    	}else if(tag.equals("cggg")){
    		querySql = " select id,title,content,hitcount,date_format(create_time, '%Y-%m-%d') infodate from purchase_notice where id = ? ";
    		updateSql = " update purchase_notice set hitcount = (hitcount+1) where id = ? ";
    	}else{
    		querySql = " select a.id,b.title,a.content,b.hitcount,date_format(b.create_time, '%Y-%m-%d') infodate from purchase_bid_notice a "
					 + " left join purchase_notice b on a.noticeid = b.id "
					 + " where b.id = ? ";
    		updateSql = " update purchase_notice set hitcount = (hitcount+1) where id = (select max(noticeid) from purchase_bid_notice where id = ?) ";
    	}
    	params.add(id);
    	DruidConnectionProvide_99 dc = new DruidConnectionProvide_99();
        Connection conn = dc.getConnection();
        try {
        	List<Map<String, Object>> rows = jdbc.mapList(conn, querySql, params.toArray());
        	jdbc.update(conn, updateSql, params.toArray());
			conn.commit();
			map = rows.get(0);
	        return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    }

}
