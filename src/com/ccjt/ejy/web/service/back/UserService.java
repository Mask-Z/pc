package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.MD5;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.User;

public class UserService {
	private static Logger log = LogManager.getLogger(UserService.class);
	public Map<String,Object> userList(User user,Integer page,Integer rows){
		Map<String,Object> m = new HashMap<String, Object>();
		List<User> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = " select a.id,a.loginname,a.name,a.roleid as role_id,b.name as role_name from [web2.0].dbo.sys_user a "
						+" join  [web2.0].dbo.role b on a.roleid=b.id where 1=1";
			
			if(user.getLoginname()!=null){
				sql += " and a.loginname like ?";
				params.add("%"+user.getLoginname()+"%");
			}
			if(user.getName()!=null){
				sql += " and a.name like ?";
				params.add("%"+user.getName()+"%");
			}
			m.put("total", jdbc.getCount(sql,params.toArray())); 
			
			sql += " order by a.id desc ";
			
			list = jdbc.beanList(sql,page,rows, User.class,params.toArray());
			m.put("rows", list);
			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return m;
		
	}
	
	public User getUser(Integer id){
		User user = null;
		try {
			if(id!=null){
				String sql = " select a.id,a.loginname,a.name,a.pwd,a.roleid as role_id,b.name as role_name from [web2.0].dbo.sys_user a "
						+ "        join  [web2.0].dbo.role b on a.roleid=b.id"
						+ "    where a.id= "+id;
				user = jdbc.bean(sql, User.class);
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return user;
	}
	public User login(String loginname,String pwd){
		User user = null;
		try {
				String sql = " select *,roleid as role_id from [web2.0].dbo.sys_user a "
						+ "    where a.loginname= ? and a.pwd=?";
				user = jdbc.bean(sql, User.class,loginname,pwd);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return user;
	}
	public int checkUserCode(String loginname,String id){
		int count=0;
		try {
			if(loginname!=null){
				String sql = " select * from [web2.0].dbo.sys_user a "
						+ "    where a.loginname= ? and a.id!=?";
				count = jdbc.getCount(sql,loginname,id);
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return count;
	}
	public Map<String ,Object> saveUser(User user){
		user.setPwd(MD5.MD5("123456"));
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(user!=null){
				if(user.getId()!=null){
					String sql = "update [web2.0].dbo.sys_user set loginname=?,roleid=?,name=? where id=?";
					jdbc.execute(sql, user.getLoginname(),user.getRole_id(),user.getName(),user.getId());
				}else{
					String sql = "insert into [web2.0].dbo.sys_user(loginname,pwd,roleid,name) values(?,?,?,?)";
					jdbc.insert(sql, user.getLoginname(),user.getPwd(),user.getRole_id(),user.getName());
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
	public Map<String ,Object> updatePwd(User user){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(user!=null){
				String sql = "update [web2.0].dbo.sys_user set pwd=? where loginname=?";
				jdbc.execute(sql, MD5.MD5(user.getPwd()),user.getLoginname());
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
	public Map<String ,Object> delUser(String[] id){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(id!=null){
				String sql = " delete  from [web2.0].dbo.sys_user where id in("+collectionToStr(id)+") ";
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
