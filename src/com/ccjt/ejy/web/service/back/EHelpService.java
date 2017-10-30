package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.EHelp;

public class EHelpService {
	
	private static Logger log = LogManager.getLogger(EHelpService.class);

	public Map<String,Object> ehelpList(EHelp ehelp,Integer page,Integer rows){		
		Map<String,Object> m = new HashMap<String, Object>();
		List<EHelp> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = " select a.*,max(c.name)as ehelp_projectType from [web2.0].dbo.e_help  a "
					+"	 join [web2.0].dbo.e_help_type b on a.id=b.e_id "
					+"	 join ( "
					+"	   select ItemText name ,ItemValue code from VIEW_CodeMain_CodeItems  "
					+"	    where  CodeName='产权类别' "
					+"	 )c on b.type=c.code "
					+"	 where 1=1  ";
			if(ehelp!=null){
			    if(ehelp.getTitle()!=null){
	                sql += " and a.title like ?";
	                params.add("%"+ehelp.getTitle()+"%");
	            }   
	            if(ehelp.getEhelp_projectType()!=null){
	                sql += " and c.name = ?";
	                params.add(ehelp.getEhelp_projectType());
	            }   
			}
			sql+="	 group by a.id,a.title,a.area,a.org,a.pic, "
					+"	 a.price,a.state,a.order_no,a.add_time ";			
			m.put("total", jdbc.getCount(sql,params.toArray())); 			
			sql += " order by a.order_no desc";			
			list = jdbc.beanList(sql,page,rows,EHelp.class,params.toArray());
			m.put("rows", list);			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}		
		return m;		
	}
	
	public EHelp getEhelp(Integer id){
		EHelp ehelp = null;
		try {
			if(id!=null){
				String sql = " select t1.*,t2.content,CONVERT(VARCHAR(19),t1.add_time,120) as addTime from [web2.0].dbo.e_help t1 left join [web2.0].dbo.e_help_text t2 on t1.id = t2.e_id where t1.id = ?";
				ehelp = jdbc.bean(sql,EHelp.class,id);
				sql = " select t2.type from [web2.0].dbo.e_help t1 left join [web2.0].dbo.e_help_type t2 on t1.id = t2.e_id where t1.id = ?";
				List<Map<String, Object>> typeList = jdbc.mapList(sql, id);
				String types = "";
			    for(int i = 0;i < typeList.size();i++) {
			    	Map map = typeList.get(i);
			    	if(i == typeList.size() - 1) {
			    		types = types + map.get("type");
			    	} else {
			    		types = types + map.get("type") + ","; 
			    	}			    	
			    }
			    ehelp.setEhelp_projectType(types);
			    sql = " select t2.area from [web2.0].dbo.e_help t1 left join [web2.0].dbo.e_help_area t2 on t1.id = t2.e_id where t1.id = ?";
				List<Map<String, Object>> cityList = jdbc.mapList(sql, id);
			    String citys = "";
			    for(int i = 0;i < cityList.size();i++) {
			    	Map map = cityList.get(i);
			    	if(i == cityList.size() - 1) {
			    		citys = citys + map.get("area");
			    	} else {
			    		citys = citys + map.get("area") + ","; 
			    	}			    	
			    }
			    ehelp.setEhelp_city(citys);
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}		
		return ehelp;
	}	
	
	public Map<String,Object> saveEhelp(EHelp ehelp){
		String ehelp_projectType = ehelp.getEhelp_projectType();
		String ptArray[] = ehelp_projectType.split(",");		
		String ehelp_city = ehelp.getEhelp_city();
		String ctArray[] = ehelp_city.split(",");
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(ehelp!=null){
				if(ehelp.getId()!=null){
					String sql = "update [web2.0].dbo.e_help set title=?,area=?,org=?,pic=?,price=?,state=?,order_no=? where id=?";
					jdbc.execute(sql,ehelp.getTitle(),ehelp.getArea(),ehelp.getOrg(),ehelp.getPic(),ehelp.getPrice(),ehelp.getState(),ehelp.getOrder_no(),ehelp.getId());
					jdbc.execute("update [web2.0].dbo.e_help_text set content=? where e_id=?",ehelp.getContent(),ehelp.getId());
					
					jdbc.delete("delete from [web2.0].dbo.e_help_type where e_id = ?",ehelp.getId());
					for(int i = 0;i < ptArray.length;i++) {
						String pt = ptArray[i];
						jdbc.insert("insert into [web2.0].dbo.e_help_type(e_id,type) values(?,?)",ehelp.getId(),pt);						
					}
					jdbc.delete("delete from [web2.0].dbo.e_help_area where e_id = ?",ehelp.getId());
					for(int i = 0;i < ctArray.length;i++) {
						String ct = ctArray[i];
						jdbc.insert("insert into [web2.0].dbo.e_help_area(e_id,area) values(?,?)",ehelp.getId(),ct);						
					}
				}else{
					String sql = "insert into [web2.0].dbo.e_help(title,area,org,pic,price,state,order_no,add_time) values(?,?,?,?,?,?,?,getdate())";
					int id = jdbc.insert(sql,ehelp.getTitle(),ehelp.getArea(),ehelp.getOrg(),ehelp.getPic(),ehelp.getPrice(),ehelp.getState(),ehelp.getOrder_no());
					jdbc.insert("insert into [web2.0].dbo.e_help_text(e_id,content) values(?,?)",id,ehelp.getContent());
					
					jdbc.delete("delete from [web2.0].dbo.e_help_type where e_id = ?",id);
					for(int i = 0;i < ptArray.length;i++) {
						String pt = ptArray[i];
						jdbc.insert("insert into [web2.0].dbo.e_help_type(e_id,type) values(?,?)",id,pt);						
					}
					jdbc.delete("delete from [web2.0].dbo.e_help_area where e_id = ?",id);
					for(int i = 0;i < ctArray.length;i++) {
						String ct = ctArray[i];
						jdbc.insert("insert into [web2.0].dbo.e_help_area(e_id,area) values(?,?)",id,ct);						
					}
				}
				ConnectionFactory.commit();
				result.put("code", 0);
				result.put("msg", "保存成功!");
			}
		} catch (Exception e) {
			ConnectionFactory.rollback();
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 批量删除
	 * delEhelp  
	 * @param ids
	 * @return   
	 * Map<String,Object>  
	 * @exception   
	 * @since  1.0.0
	 */
	public Map<String, Object> delEhelp(String[] ids){
	    Map<String,Object> result = new HashMap<String, Object>();
	    int count = 0;
	    try {
	        for (int i = 0; i < ids.length; i++) {
	            jdbc.delete("delete from [web2.0].dbo.e_help where id=?",ids[i]);
	            jdbc.delete("delete from [web2.0].dbo.e_help_text where e_id=?",ids[i]);
	            jdbc.delete("delete from [web2.0].dbo.e_help_type where e_id=?",ids[i]);
	            jdbc.delete("delete from [web2.0].dbo.e_help_area where e_id=?",ids[i]);
	            count++;
	        }
	        ConnectionFactory.commit();
	        result.put("count", count);
            result.put("code", 0);
            result.put("msg", "删除成功!");
        } catch (Exception e) {
            ConnectionFactory.rollback();
            log.error(e);
            e.printStackTrace();
        }
	    return result;
	}
}
