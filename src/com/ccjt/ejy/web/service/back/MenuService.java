package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;
import java.util.List;
import java.util.Map;

public class MenuService {
	public List<Map<String, Object>> getMenus(int pid) {
		List<Map<String, Object>> list = null;
		try {	 
			String sql = " select   id,text,par_id as pid,url from  [web2.0].dbo.menu where par_id="+pid+" order by id  ";
			list = jdbc.mapList(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Map<String, Object>> getMenusByRoles(int roleid,int pid) {
		List<Map<String, Object>> list = null;
		try {	 	
			String sql = " select   id,text,par_id as pid,url from  [web2.0].dbo.menu where id in( select menuid from [web2.0].dbo.role_menu where roleid="+roleid+") and par_id="+pid+" order by id ";
			list = jdbc.mapList(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 递归返回全部节点
	 * 
	 * @param datas
	 * @param pid
	 * @return
	 */
	public List<Map<String, Object>> initTree(List<Map<String, Object>> datas,
			int pid) {
		if (pid==0) {
			datas = getMenus(pid);
		}
		for (int i = 0; i < datas.size(); i++) {
			int id = Integer.parseInt(datas.get(i).get("id").toString());
			if (getMenus(id).size() > 0) {
				datas.get(i).put("children", initTree(getMenus(id), id));
			}
		}
		return datas;
	}

	/**
	 * 递归返回全部节点
	 * 
	 * @param datas
	 * @param pid
	 * @return
	 */
	public List<Map<String, Object>> initTree(List<Map<String, Object>> datas,
			int pid,int roleid ) {
		if (pid==0) {
			datas = getMenusByRoles(roleid,pid);
		}
		for (int i = 0; i < datas.size(); i++) {
			int id = Integer.parseInt(datas.get(i).get("id").toString());
			if (getMenusByRoles(roleid,id).size() > 0) {// 还有子节点
				datas.get(i).put("children", initTree(getMenusByRoles(roleid,id), id,roleid));
			}
		}
		return datas;
	}
}
