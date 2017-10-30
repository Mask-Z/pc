package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.Link;

public class LinkService {
	private static Logger log = LogManager.getLogger(LinkService.class);

	public Map<String,Object> linkList(Link link,Integer page,Integer rows){
		
		Map<String,Object> m = new HashMap<String, Object>();
		List<Link> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = " select * from [web2.0].dbo.link where 1=1 ";
			
			if(link.getName()!=null){
				sql += " and name like ?";
				params.add("%"+link.getName()+"%");
			}
			
			m.put("total", jdbc.getCount(sql,params.toArray())); 
			
			sql += " order by order_no desc ";
			
			list = jdbc.beanList(sql,page,rows, Link.class,params.toArray());
			m.put("rows", list);
			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return m;
		
	}
	
	public Link getLink(Integer id){
		Link link = null;
		try {
			if(id!=null){
				String sql = " select t1.* from "
						+ "[web2.0].dbo.link t1  where t1.id=? ";
				link = jdbc.bean(sql, Link.class ,id);
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return link;
	}
	
	
	public Map<String ,Object> saveLink(Link link){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(link!=null){
				if(link.getId()!=null){
					String sql = "update [web2.0].dbo.link set name=?,url=?,image=?,order_no=? where id=?";
					jdbc.execute(sql, link.getName(),link.getUrl(),link.getImage(),link.getOrder_no(),link.getId());
				}else{
					String sql = "insert into [web2.0].dbo.link(name,url,image,order_no) values(?,?,?,?)";
					jdbc.insert(sql, link.getName(),link.getUrl(),link.getImage(),link.getOrder_no());
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
	 * delAd  
	 * @param ids
	 * @return   
	 * Map<String,Object>  
	 * @exception   
	 * @since  1.0.0
	 */
	public Map<String, Object> delLink(String[] ids){
	    Map<String,Object> result = new HashMap<String, Object>();
	    int count = 0;
	    try {
	        for (int i = 0; i < ids.length; i++) {
	            jdbc.delete("delete from [web2.0].dbo.link where id=?",ids[i]);
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
