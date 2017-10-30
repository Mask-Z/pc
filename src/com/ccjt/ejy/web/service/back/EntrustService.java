package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.Entrust;

public class EntrustService {
	private static Logger log = LogManager.getLogger(EntrustService.class);
	public Map<String,Object> entrustList(Entrust qu,Integer page,Integer rows){
		Map<String,Object> m = new HashMap<String, Object>();
		List<Entrust> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = " select * from [web2.0].dbo.entrust where 1=1 ";
			
			if(qu.getTitle()!=null){
				sql += " and title like ?";
				params.add("%"+qu.getTitle()+"%");
			}
			
			m.put("total", jdbc.getCount(sql,params.toArray())); 
			
			sql += " order by id desc ";
			
			list = jdbc.beanList(sql,page,rows, Entrust.class,params.toArray());
			m.put("rows", list);
			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return m;
		
	}
	
	public Entrust getEntrust(Integer id){
		Entrust qu = null;
		try {
			if(id!=null){
				String sql = " select * from [web2.0].dbo.entrust  where id= "+id;
				qu = jdbc.bean(sql, Entrust.class);
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return qu;
	}
	
	public Map<String ,Object> updateEntrustState(String id){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(id!=null){
				String sql = " update [web2.0].dbo.entrust set state=1  where id = ?";
				jdbc.execute(sql,id);
				ConnectionFactory.commit();
				result.put("code", 0);
				result.put("msg", "处理成功!");
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}
	public Map<String ,Object> saveEntrust(Entrust qu){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(qu!=null){
				if(qu.getId()!=null){
					String sql = "update [web2.0].dbo.entrust set state=? where id=?";
					jdbc.execute(sql, 1,qu.getId());
				}else{
					String sql = "insert into [web2.0].dbo.entrust(title,name,tel,content,state) values(?,?,?,?,?)";
					jdbc.insert(sql, qu.getTitle(),qu.getName(),qu.getTel(),qu.getContent(),0);
				}
				ConnectionFactory.commit();
				result.put("code", 0);
				result.put("msg", "提交成功!");
			}
		} catch (Exception e) {
			ConnectionFactory.rollback();
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}
	
	public Map<String ,Object> delEntrust(String[] id){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(id!=null){
				String sql = " delete  from [web2.0].dbo.entrust where id in("+collectionToStr(id)+") ";
				jdbc.execute(sql);
				ConnectionFactory.commit();
				result.put("code", 0);
				result.put("msg", "删除成功!");
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}
	private String collectionToStr(String[] ids){
		String result="";
		if(ids!=null){
			for(int i=0;i<ids.length;i++){
				result+=ids[i]+",";
			}
			if(!result.equals("")){
				result=result.substring(0,result.length()-1);
			}
		}
		return result;
	}
}
