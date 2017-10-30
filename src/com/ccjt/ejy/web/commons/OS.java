package com.ccjt.ejy.web.commons;

import javax.servlet.http.HttpServletRequest;

public class OS {

	private static String android = "android";
	private static String apple = "iphone";

	public static boolean isMobile(HttpServletRequest request) {
		boolean m = false;
		if (request != null) {
			String agent = request.getHeader("user-agent");
			if(agent!=null){
				agent = agent.toLowerCase();
				if(agent.indexOf(android) > 0 ){
					m = true;
				} else if(agent.indexOf(apple) > 0){
					m = true;
				}
			}
		}
		return m;
	}
}
