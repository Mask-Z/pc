package com.ccjt.ejy.web.controller.back;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ccjt.ejy.web.service.back.MenuService;
import com.ccjt.ejy.web.vo.User;

@Controller
@RequestMapping("/menu")
public class MenuController {
	private MenuService menuS=new MenuService();
	/**
	 * 加载菜单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/initmenus")
	public String initMenus(int pid) {
		List<Map<String, Object>> datas = menuS.initTree(new ArrayList<Map<String, Object>>(), pid);
		return JSON.toJSONString(datas);
	}
	/**
	 * 根据用户的menuid去查找menu
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/initmenusByUser")
	public String initMenuByUser(HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute("sysuser");
		List<Map<String, Object>> datas =new ArrayList<Map<String, Object>>();
		if(user!=null&&user.getRole_id()!=null&&!user.getRole_id().equals("")){
			 datas = menuS.initTree(new ArrayList<Map<String,Object>> (), 0,user.getRole_id());
		}else{
			datas=menuS.initTree(new ArrayList<Map<String,Object>> (), 0);
		}
		return JSON.toJSONString(datas);
	}
}
