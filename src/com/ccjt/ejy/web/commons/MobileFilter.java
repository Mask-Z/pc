package com.ccjt.ejy.web.commons;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;

public class MobileFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		try {
			HttpServletRequest req = (HttpServletRequest) request;
			System.out.println( req.getRequestURI());;
				
			if(OS.isMobile((HttpServletRequest) request)){
				((HttpServletResponse)response).sendRedirect("/mejy");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		chain.doFilter(request, response);
		
	}

	@Override
	public void destroy() {

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

}