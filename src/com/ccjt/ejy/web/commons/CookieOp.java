package com.ccjt.ejy.web.commons;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Cookie工具类,封装Cookie常用操作
 *
 * @author carrkevin
 * @version v 0.1
 */
public class CookieOp {
    /**
     * 设置cookie有效期，根据需要自定义[本系统设置为30天]
     */
    private final static int COOKIE_MAX_AGE = 1000 * 60 * 60 * 24 * 30;
    
    /**
     * 删除Cookie
     * @param response
     * @param name	cookie中的key
     */
    public static void removeCookie(HttpServletRequest request,HttpServletResponse response, String name){
    	Cookie tmp =getCookie(request, name);
    	removeCookie(response, tmp);
    }

    /**
     * 删除指定Cookie，默认项目域
     *
     * @param response
     * @param cookie
     */
    public static void removeCookie(HttpServletResponse response, Cookie cookie) {
        if (cookie != null) {
            cookie.setPath("/");
            cookie.setValue("");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }

    /**
     * 删除指定Cookie
     *
     * @param response
     * @param cookie
     * @param domain    顶级域名
     * 比如二级域名：
     * site1.domain.com
     * site2.domain.com
     * 那么cookie的domain(顶级域名)为domain.com
     * 备注：设置二级域名的好处可以共享cookie
     */
    public static void removeCookie(HttpServletResponse response, Cookie cookie, String domain) {
        if (cookie != null) {
            cookie.setPath("/");
            cookie.setValue("");
            cookie.setMaxAge(0);
            cookie.setDomain(domain);
            response.addCookie(cookie);
        }
    }

    /**
     * 根据Cookie名称得到Cookie的值，没有返回Null
     *
     * @param request
     * @param name
     * @return
     */
    public static String getCookieValue(HttpServletRequest request, String name) {
        Cookie cookie = getCookie(request, name);
        if (cookie != null) {
            return cookie.getValue();
        } else {
            return null;
        }
    }

    /**
     * 根据Cookie名称得到Cookie对象，不存在该对象则返回Null
     *
     * @param request
     * @param name
     * @return
     */
    public static Cookie getCookie(HttpServletRequest request, String name) {
        Cookie cookies[] = request.getCookies();
        if (cookies == null || name == null || name.length() == 0) {
            return null;
        }
        Cookie cookie = null;
        for (Cookie cookie1 : cookies) {
            if (!cookie1.getName().equals(name)) {
                continue;
            }
            cookie = cookie1;
            if (request.getServerName().equals(cookie.getDomain())) {
                break;
            }
        }

        return cookie;
    }

    /**
     * 根据部署路径，将cookie保存在根目录 添加一条新的Cookie信息，默认有效时间为一个月
     *
     * @param response
     * @param name      cookie键名
     * @param value     cookie键值
     */
    public static void setCookie(HttpServletResponse response, String name, String value) {
        setCookie(response, name, value, COOKIE_MAX_AGE ,null);
    }
    
    /**
     * 根据部署路径，将cookie保存在根目录 添加一条新的Cookie信息，默认有效时间为一个月
     *
     * @param response
     * @param name      cookie键名
     * @param value     cookie键值
     * @param domain    顶级域名
     */
    public static void setCookie(HttpServletResponse response, String name, String value ,String domain) {
        setCookie(response, name, value, COOKIE_MAX_AGE ,domain);
    }

    /**
     * 根据部署路径，将cookie保存在根目录 添加一条新的Cookie信息，可以设置其最长有效时间(单位：秒)
     *
     * @param response
     * @param name      cookie键名
     * @param value     cookie键值
     * @param maxAge    最长有效时间(单位：秒)
     * @param domain    顶级域名，如domain.com
     */
    public static void setCookie(HttpServletResponse response, String name, String value, int maxAge ,String domain) {
        if (value == null) {
            value = "";
        }
        Cookie cookie = new Cookie(name, value);
        if (maxAge != 0) {
            cookie.setMaxAge(maxAge);
        } else {
            cookie.setMaxAge(COOKIE_MAX_AGE);
        }
        cookie.setPath("/");
        if(domain !=null) cookie.setDomain(domain);
        response.addCookie(cookie);
    }
}

