package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.Advice;

public class AdviceService {

	private static Logger log = LogManager.getLogger(AdviceService.class);
	public Map<String,Object> adviceList(Advice qu,Integer page,Integer rows){
		Map<String,Object> m = new HashMap<String, Object>();
		List<Advice> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = " select * from [web2.0].dbo.advice where 1=1 ";
			
			if(qu.getTitle()!=null){
				sql += " and title like ?";
				params.add("%"+qu.getTitle()+"%");
			}
			
			m.put("total", jdbc.getCount(sql,params.toArray())); 
			
			sql += " order by id desc ";
			
			list = jdbc.beanList(sql,page,rows, Advice.class,params.toArray());
			m.put("rows", list);
			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return m;
		
	}
	
	public Advice getAdvice(Integer id){
		Advice qu = null;
		try {
			if(id!=null){
				String sql = " select * from [web2.0].dbo.advice  where id= "+id;
				qu = jdbc.bean(sql, Advice.class);
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return qu;
	}
	
	
	public Map<String ,Object> saveAdvice(Advice qu){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(qu!=null){
				String sql = "insert into [web2.0].dbo.advice(title,name,tel,content) values(?,?,?,?)";
				jdbc.insert(sql, qu.getTitle(),qu.getName(),qu.getTel(),qu.getContent());
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
	
	public Map<String ,Object> delAdvice(String[] id){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(id!=null){
				String sql = " delete  from [web2.0].dbo.advice where id in("+collectionToStr(id)+") ";
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
