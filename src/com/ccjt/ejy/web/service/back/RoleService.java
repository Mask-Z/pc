package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.Role;

public class RoleService {
	private static Logger log = LogManager.getLogger(RoleService.class);
	public Map<String, Object> gridList(Role role,Integer page,Integer rows) {
		Map<String,Object> m = new HashMap<String, Object>();
		List<Role> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = " select * from [web2.0].dbo.role ";
			if(role.getName()!=null){
				sql += " and name like ?";
				params.add("%"+role.getName()+"%");
			}
			m.put("total", jdbc.getCount(sql,params.toArray())); 
			sql += " order by id desc ";
			list = jdbc.beanList(sql,page,rows, Role.class,params.toArray());
			m.put("rows", list);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return m;
	}
	public Map<String,Object> add(Role role)  {
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(role!=null){
				if(role.getId()!=null){
					String sql = "update [web2.0].dbo.role set name=?,note=? where id=?";
					jdbc.execute(sql, role.getName(),role.getNote(),role.getId());
				}else{
					String sql = "insert into [web2.0].dbo.role(name,note) values(?,?)";
					jdbc.insert(sql, role.getName(),role.getNote());
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
	public Map<String,Object> delete(String[] ids) {
	    Map<String,Object> result = new HashMap<String, Object>();
	    int count = 0;
	    try {
	        for (int i = 0; i < ids.length; i++) {
	            jdbc.delete("delete from [web2.0].dbo.role where id=?",ids[i]);
	            jdbc.delete("delete from [web2.0].dbo.role_menu where roleid=?",ids[i]);
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
	
	public  Map<String,Object> saveRelate(int roleId,String[] menuIds){
	    Map<String,Object> result = new HashMap<String, Object>();
	    try {
	    	jdbc.delete("delete from [web2.0].dbo.role_menu where roleid=?",roleId);
	    	for(int i=0;i<menuIds.length;i++){
	    		jdbc.delete("insert into  [web2.0].dbo.role_menu(roleid,menuid) values(?,?)",roleId,menuIds[i]);
	    	}
	        ConnectionFactory.commit();
            result.put("code", 0);
            result.put("msg", "添加成功!");
        } catch (Exception e) {
            ConnectionFactory.rollback();
            log.error(e);
            e.printStackTrace();
        }
	    return result;
	}
	public  List<Role> queryMenusByRoleid(int roleId){
		List<Role> list = null;
		try {
			String sql = " select roleid as id,menuid from  [web2.0].dbo.role_menu where roleid=? ";
			list = jdbc.beanList(sql, Role.class,roleId);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Role> comboData() {
		List<Role> list = null;
		try {
			String sql = " select id,name from [web2.0].dbo.role ";
			list = jdbc.beanList(sql, Role.class);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return list;
	}

	
	public Role getInfo(int id) {
		Role role = null;
		try {
			String sql = " select * from  [web2.0].dbo.role where id=? ";
			role = jdbc.bean(sql, Role.class,id);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return role;
	}
	

}
