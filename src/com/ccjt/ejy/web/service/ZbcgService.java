/**  
 * 包名：com.ccjt.ejy.web.service  
 * 文件名：ZbcgService.java  
 * 版本信息：V1.0  
 * 日期：2017年8月2日-下午2:53:22  
 * Copyright(c)2017
 *   
 */
package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ccjt.ejy.web.vo.ZBCG_City;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.vo.City;
import com.ccjt.ejy.web.vo.FastCaiGou;

/**  
 *   
 * 类名称：ZbcgService  
 * 类描述：
 * 创建人：qiaojoy99  
 * 修改人：qiaojoy99 
 * 修改时间：2017年8月2日 下午2:53:22  
 * 修改备注：  
 * @version 1.0.0  
 *   
 */
public class ZbcgService {
    private static Logger log = LogManager.getLogger(ZbcgService.class);
    
    /**
     * 招标采购列表页
     * zbcgs  
     * @param
     * @return   
     * List<FastCaiGou>  
     * @exception   
     * @since  1.0.0
     */
    public Map<String, Object> zbcgs(Integer page,Integer size,FastCaiGou caiGou){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String querySql = "";
            List<Object> params = new ArrayList<>();
            if(caiGou!=null){
                if(StringUtils.isNotBlank(caiGou.getXiaquname())){//根据机构名称查询
                    querySql += " and xiaquname like ?";
                    params.add("%" + caiGou.getXiaquname() + "%");
                }
                if(StringUtils.isNotBlank(caiGou.getCategoryname())){//项目类型
                    querySql += " and categoryname like ?";
                    params.add("%" + caiGou.getCategoryname() + "%");
                }
                if(StringUtils.isNotBlank(caiGou.getBiaoduanname())){//项目名称
                	String[] titles = caiGou.getBiaoduanname().split(" ");
    				for(String title : titles) {
    					if(StringUtils.isNotBlank(title)) {
    						title = title.replace("%", "[%]");
    						querySql += " and biaoduanname like ?";
    						params.add("%" + title + "%");
    					}
    				}	
                }
                if(caiGou.getStatus_name()!=null&&!caiGou.getStatus_name().equals("")){//项目状态
    				if(caiGou.getStatus_name().equals("未开始")){
    					querySql+=" and getdate()<baomingstart ";
    				}else if(caiGou.getStatus_name().equals("报名中")){
    					querySql+=" and getdate()>=baomingstart and getdate()<= baomingend";
    				}else if(caiGou.getStatus_name().equals("已结束")){
    					querySql+=" and getdate()>baomingend";
    				}
    			}
            }
            querySql = " SELECT * FROM web_v2_zbcg  where 1=1 "+querySql;
            int totalcount = jdbc.getCount(querySql,params.toArray());//总数
            List<FastCaiGou> list = jdbc.beanList(querySql + " order by infodate DESC ",page,size,FastCaiGou.class,params.toArray());//分页数据
            for(int i=0;i<list.size();i++){
				list.get(i).setClickTimes(list.get(i).getClickTimes()+getPVCount(list.get(i).getInfoID()));
				list.get(i).setGgtype("招标公告");
			}
            map.put("rows", list);
            map.put("count", totalcount);
            return map;
        } catch (Exception e) {
            log.error("获取招标采购列表页数据出错:" ,e);
            e.printStackTrace();
        }
        return null;
    }
    
	public List<ZBCG_City> zbcg_city(){
		List<ZBCG_City> citylist = new ArrayList<ZBCG_City>();
		try{
			String sql = " select distinct xiaqucode code,xq.CityName name from Zfcg_ZhaoBiaoGG zbcg"
					+ " inner join Sys_XiaQu xq on zbcg.XiaQuCode=xq.CityCode where 1=1 and auditstatus=3 ";
			citylist = jdbc.beanList(sql, ZBCG_City.class);
		}catch (Exception e) {
			log.error("获取招标采购项目所在城市出错:",e);
			e.printStackTrace();
		}
		return citylist;
	}
	
	public Map<String, Object> zbcg_cjgg(Integer page,Integer rows,FastCaiGou caiGou){
		Map<String, Object> map = new HashMap<String, Object>();
	    List<FastCaiGou> list = new ArrayList<FastCaiGou>();
	    try {
	    	List<Object> params = new ArrayList<>();
	        String sql = " select * "
						+" From view_web_v2_zbcg_cjgg c where 1=1 ";
	        if(caiGou!=null){
                if(StringUtils.isNotBlank(caiGou.getXiaquname())){//根据机构名称查询
                    sql += " and c.xiaquname like ?";
                    params.add("%" + caiGou.getXiaquname() + "%");
                }
                if(StringUtils.isNotBlank(caiGou.getCategoryname())){//项目类型
                	sql += " and c.categoryname = ?";
                	params.add(caiGou.getCategoryname());
                }
                if(StringUtils.isNotBlank(caiGou.getBiaoduanname())){//项目名称
                	String[] titles = caiGou.getBiaoduanname().split(" ");
    				for(String title : titles) {
    					if(StringUtils.isNotBlank(title)) {
    						title = title.replace("%", "[%]");
    						sql += " and c.biaoduanname like ?";
    						params.add("%" + title + "%");
    					}
    				}	
                }
                if(caiGou.getStatus_name()!=null&&!caiGou.getStatus_name().equals("")){//项目状态
    				if(caiGou.getStatus_name().equals("未开始")){
    					sql+=" and getdate()<c.baomingstart ";
    				}else if(caiGou.getStatus_name().equals("报名中")){
    					sql+=" and getdate()>=c.baomingstart and getdate()< c.baomingend";
    				}else if(caiGou.getStatus_name().equals("已结束")){
    					sql+=" and getdate()>=c.baomingend";
    				}
    			}
            }
	        int totalcount = jdbc.getCount(sql,params.toArray());//总数
	        list = jdbc.beanList(sql+" order by c.infodate DESC ",page,rows,FastCaiGou.class,params.toArray());
	        for(int i=0;i<list.size();i++){
	        	list.get(i).setClickTimes(list.get(i).getClickTimes()+getPVCount(list.get(i).getInfoID()));
	        	list.get(i).setGgtype("成交公告");
			}
	        map.put("rows", list);
            map.put("count", totalcount);
        } catch (Exception e) {
            e.printStackTrace();
        }
	    return map;
	}
	public int getPVCount(String id) {
		int count=0;
		try {
			String sql = " SELECT isnull(count,0) as count from [web2.0].dbo.pv where  guid =?   ";
			Map<String,Object> map = jdbc.map(sql,id);
			if(map!=null){
				count=Integer.parseInt(map.get("count").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
