package com.ccjt.ejy.web.service.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ccjt.ejy.web.vo.Menu;
import static com.ccjt.ejy.web.commons.JDBC.jdbc;
public class LoginService {
	/**
	 * 根据用户获取父菜单
	 * @param loginname 账号
	 * @return 菜单信息
	 * @throws Exception 
	 */
	public static List<Menu> getMenu(){
		List<Menu> list = null;
		try {
				//查询用户对应角色的权限菜单ID集合
				String sql =" select id,text,'open' state from [web2.0].dbo.menu where par_id =0"; 
				list = jdbc.beanList(sql, Menu.class);
				
				for(Menu m : list){
					List<Menu> child = jdbc.beanList(" select id, text,'open' state,url from [web2.0].dbo.menu e where par_id = ? ",Menu.class ,m.getId());
				
					for(Menu cm :child){
						Map<String,String> attributes = new HashMap<String, String>();
						attributes.put("url", cm.getUrl());
						cm.setAttributes(attributes);
					}
					m.setChildren(child);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static void removeCookie(HttpServletRequest request, HttpServletResponse response, String name) {
	    Cookie cookie = getCookie(request, name);
	    if (cookie != null) {
	        cookie.setPath("/");
	        cookie.setValue("");
	        cookie.setMaxAge(0);
	        response.addCookie(cookie);
	    }
	}
	
	public static Cookie getCookie(HttpServletRequest request, String name) {
	    Cookie[] cookies = request.getCookies();
	    if ((cookies == null) || (name == null) || (name.length() == 0)) {
	        return null;
	    }
	    Cookie cookie = null;
	    for (Cookie cookie1 : cookies) {
	        if (cookie1.getName().equals(name)) {
	            cookie = cookie1;
	            if (request.getServerName().equals(cookie.getDomain())) {
	                break;
	            }
	        }
	    }
	    return cookie;
	}
}
