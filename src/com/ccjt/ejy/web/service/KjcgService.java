package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ccjt.ejy.web.vo.GongGao;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.vo.FastCaiGou;

public class KjcgService {
    private static Logger log = LogManager.getLogger(KjcgService.class);
    /**
     * 快捷采购-招标公告
     * zbcgs  
     * @param
     * @return   
     * List<FastCaiGou>  
     * @exception   
     * @since  1.0.0
     */
    public Map<String, Object> zbggs(Integer page,Integer size,FastCaiGou caiGou){
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
			querySql = " SELECT * FROM view_web_v2_kuaijiecaigou  where 1=1 "+querySql;
            int totalcount = jdbc.getCount(querySql,params.toArray());//总数
            List<FastCaiGou> list = jdbc.beanList(querySql +" order by baomingstart DESC ",page,size,FastCaiGou.class,params.toArray());//分页数据

			for(int i=0;i<list.size();i++){
				list.get(i).setClickTimes(list.get(i).getClickTimes()+getPVCount(list.get(i).getInfoID()));
				list.get(i).setGgtype("招标公告");
			}
            map.put("rows", list);
            map.put("count", totalcount);
            return map;
        } catch (Exception e) {
            log.error("获取快捷采购招标公告数据出错:" ,e);
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 快捷采购-成交公告
     * zbcgs  
     * @param
     * @return   
     * List<FastCaiGou>  
     * @exception   
     * @since  1.0.0
     */
	public Map<String, Object> cjggs(Integer page,Integer rows,FastCaiGou caiGou){
		Map<String, Object> map = new HashMap<String, Object>();
	    List<FastCaiGou> list = new ArrayList<FastCaiGou>();
	    try {
	    	List<Object> params = new ArrayList<>();
	        String sql ="SELECT a.BiaoDuanGuid AS infoID,im.title AS biaoduanname,a.XiaQuCode AS xiaQuCode,c.CityName AS xiaquname,a.BaoMingFromDate AS baomingstart,a.BaoMingEndDate AS baomingend,a.XiangMuLBCode AS categorynum,im.CategoryName AS categoryname,isnull(im.ClickTimes, 0) AS clickTimes " +
					"FROM Zfcg_BiaoDuan a " +
					"INNER JOIN Zfcg_Project b ON a.ProjectGuid = b.ProjectGuid " +
					"INNER JOIN Sys_XiaQu c ON a.XiaQuCode = c.CityCode " +
					" left join View_InfoMain im on im.infoid=a.BiaoDuanGuid " +
					"WHERE ISNULL(a.IsConFirmZhongBiaoDW, '0') = '1' AND b.AuditStatus = '3' " +
					"AND ( ISNULL(IsLiuBiao, '0') = '0'OR IsliuBiao = '') " +
					"AND a.CaiGouFS IN ('1', '2', '3')  " +
					"AND EXISTS ( SELECT 1 FROM View_ZFCG_ZhaoBiaoGG WHERE AuditStatus = '3' AND BiaoDuanGuid = a.BiaoDuanGuid) ";
	        if(caiGou!=null){
                if(StringUtils.isNotBlank(caiGou.getXiaquname())){//根据机构名称查询
                    sql += " and c.CityName like ?";
                    params.add("%" + caiGou.getXiaquname() + "%");
                }
                if(StringUtils.isNotBlank(caiGou.getCategoryname())){//项目类型
                	sql += " and im.CategoryName = ?";
                	params.add(caiGou.getCategoryname());
                }
                if(StringUtils.isNotBlank(caiGou.getBiaoduanname())){//项目名称
                	String[] titles = caiGou.getBiaoduanname().split(" ");
    				for(String title : titles) {
    					if(StringUtils.isNotBlank(title)) {
    						title = title.replace("%", "[%]");
    						sql += " and a.BiaoDuanName like ?";
    						params.add("%" + title + "%");
    					}
    				}
                }
                if(caiGou.getStatus_name()!=null&&!caiGou.getStatus_name().equals("")){//项目状态
    				if(caiGou.getStatus_name().equals("未开始")){
    					sql+=" and getdate()<a.BaoMingFromDate ";
    				}else if(caiGou.getStatus_name().equals("报名中")){
    					sql+=" and getdate()>=a.BaoMingFromDate and getdate()< a.BaoMingEndDate";
    				}else if(caiGou.getStatus_name().equals("已结束")){
    					sql+=" and getdate()>=a.BaoMingEndDate";
    				}
    			}
            }
	        int totalcount = jdbc.getCount(sql,params.toArray());//总数
	        list = jdbc.beanList(sql+"  order by a.BaoMingFromDate DESC ",page,rows,FastCaiGou.class,params.toArray());
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
