package com.ccjt.ejy.web.controller.back;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.ccjt.ejy.web.controller.BaseController;
import com.ccjt.ejy.web.service.back.RoleService;
import com.ccjt.ejy.web.vo.Role;
@Controller
@RequestMapping(value = "/role")
public class RoleController extends BaseController{
	private static Log log = LogFactory.getLog(RoleController.class); 
	private RoleService roleService=new RoleService();
	/**
	 * 主页面
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index() {
		ModelAndView m = new ModelAndView();
		m.setViewName("/back/role/index");
		return m;
	}
	@RequestMapping(value = "/openFormWin")
	public ModelAndView accountall(Integer id) {
		ModelAndView mv = new ModelAndView();
		if (id != null) {
			Role role = roleService.getInfo(id);
			mv.addObject("role", role);
			mv.addObject("type", "edit");
		}else{
			mv.addObject("type", "add");
		}
		mv.setViewName("/back/role/form");
		return mv;
	}
	
	/**
	 * 数据列表查询
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/gridList")
	public Map<String,Object> mainIndex(Role role ,Integer page, Integer rows) {
		Map<String, Object> m = roleService.gridList(role, page, rows);
		return m;
	}
	
	/**
	 * 新增/修改角色
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save")
	public ModelAndView save(Role role,HttpServletRequest request) throws Exception {
		roleService.add(role);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "success");
        mv.setViewName("/back/role/form");
		return mv;
	}
	
	/**
	 * 批量删除数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/delete")
	public Map<String, Object> delete(String[] ids,HttpServletRequest request) throws Exception {
		Map<String, Object> map = roleService.delete(ids);
		return map;
	}
	
	/**
	 * 保存关联
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/saveRelate")
	public void saveRelate(int roleId,String[] menuIds) {
		roleService.saveRelate(roleId,menuIds);
	}
	
	/**
	 * 查询已有关联
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryMenusByRoleid")
	public List<Role> queryMenusByRoleid(int roleId) {
		List<Role> list=roleService.queryMenusByRoleid(roleId);
		return list;
	}
	/**
	 * 下拉框数据源
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/comboData")
	public List<Role> comboData() {
		List<Role> list=roleService.comboData();
		return list;
	}

}
