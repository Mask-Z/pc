package com.ccjt.ejy.web.commons.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * @author XXF
 * 
 */
public class LoginIntercepter extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// 此处实现登陆的拦截
		if (request.getSession().getAttribute("sysuser") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		} else {
			return true;
		}
	}

}