package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.WebGonggaoPic;

public class PicManageService {
	
	private static Logger log = LogManager.getLogger(PicManageService.class);
	
	public Map<String,Object> picList(WebGonggaoPic webGonggaoPic,Integer page,Integer rows){		
		Map<String,Object> m = new HashMap<String, Object>();
		List<WebGonggaoPic> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = " select a.*,b.title from [web2.0].dbo.web_gonggao_pic a " +
					"inner join infomain_jygg_v2 b on a.guid = b.infoid where 1 = 1";
			if(webGonggaoPic != null){
			    if(webGonggaoPic.getTitle() != null){
	                sql += " and b.title like ?";
	                params.add("%" + webGonggaoPic.getTitle() + "%");
	            }     
			}
			m.put("total", jdbc.getCount(sql,params.toArray())); 			
			sql += " order by a.id desc";			
			list = jdbc.beanList(sql,page,rows,WebGonggaoPic.class,params.toArray());
			m.put("rows", list);			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}		
		return m;		
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
	public Map<String, Object> delPic(String[] ids){
	    Map<String,Object> result = new HashMap<String, Object>();
	    int count = 0;
	    try {
	        for (int i = 0; i < ids.length; i++) {
	            jdbc.delete("delete from [web2.0].dbo.web_gonggao_pic where id = ?",ids[i]);
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
