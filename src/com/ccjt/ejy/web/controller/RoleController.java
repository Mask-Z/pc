//package com.ccjt.ejy.web.controller;
//
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.HashMap;
//import java.util.HashSet;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//
//import com.ccjt.ejy.web.service.RoleService;
//import com.ccjt.ejy.web.vo.Menu;
//import com.ccjt.ejy.web.vo.Role;
//import com.ccjt.ejy.web.vo.User;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
///**
// *
// */
//@Controller
//public class RoleController {
//	
//	/**
//	 * @throws Exception 
//	 * 角色管理主界面显示
//	 * @param 
//	 * @return 页面视图
//	 * @exception 
//	 */
//	@RequestMapping(value = "/role")
//	public ModelAndView getRoleManagement(HttpServletRequest request,
//			Integer id) throws Exception{
//		ModelAndView mv = new ModelAndView();
//		 
//		mv.setViewName("/system/role_manage");
//		return mv;
//	}
//	
//	/**
//	 * 角色管理查询所有数据信息
//	 * 根据角色名称查询角色信息
//	 * @param name 角色名称
//	 * @return 部门信息lsit
//	 * @throws Exception 
//	 */
//	@RequestMapping(value = "/roleList",method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String,Object> roleList(String name,
//			Integer page,Integer rows) throws Exception{
//		RoleService service = new RoleService();
//		/*调用service方法实现查询及模糊查询*/
//		Map<String,Object> m = service.roleList(name, page, rows);
//		return m;
//	}
//	
//	/**
//	 * @throws Exception 
//	 * 角色添加主界面显示
//	 * @param 
//	 * @return 页面视图
//	 * @exception 
//	 */
//	@RequestMapping(value = "/toinsertrole")
//	public ModelAndView toinsertrole(HttpServletRequest request,
//			Integer id) throws Exception{
//		ModelAndView mv = new ModelAndView();
////		RoleService service = new RoleService();
////		List<Menu> list = service.getCRUDList(u,id);
//		mv.setViewName("/system/add_role");
////		mv.addObject("list",list);
//		return mv;
//	}
//	/**
//	 * 查询菜单Tree列表
//	 * @param 
//	 * @return 菜单信息
//	 * @throws Exception 
//	 */
//	@RequestMapping(value = "/menuList",method = RequestMethod.POST)
//	@ResponseBody
//	public List<Menu> getMenuList() throws Exception{
//		RoleService service = new RoleService();
//		/*查询所有父节点信息*/
//		List<Menu> list = service.getMenuList();
//		for(Menu me: list){
//			/*查询该父节点下子节点信息并存入children*/
//			List<Menu> list1 = service.getMenuByParId(me.getId());
//			me.setChildren(list1);
//		}
//		return list;
//	}
//	
//	/**
//	 * 新增角色信息
//	 * @param name 角色名称，remarks备注
//	 * @return 角色信息
//	 * @throws Exception 
//	 */
//	@RequestMapping(value = "/insertRole",method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, String> insertRole(String name,String remarks,String[] id,HttpServletRequest request)
//			throws Exception{
//		User user=(User) request.getSession().getAttribute("user");
//		Map<String, String> map = new HashMap<String, String>();
//		RoleService service = new RoleService();
//		List<String> list = Arrays.asList(id);
//		HashSet<String> h = new HashSet<String>(list);
//		list=new ArrayList<String>();
//	    list.addAll(h);
//		/*调用service方法实现角色添加*/
//		String msg = service.addRole(name,remarks,list,user);
//		map.put("msg", msg);
//		return map;
//	}
//	
//	/**
//	 * 删除角色信息
//	 * @param id 删除角色id
//	 * @return 角色信息
//	 * @throws Exception 
//	 */
//	@RequestMapping(value = "/delRole",method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> delRole(String id,HttpServletRequest request) throws Exception{
//		Map<String, Object> map = new HashMap<String, Object>();
//		User user=(User) request.getSession().getAttribute("user");
//		RoleService service = new RoleService();
//		List<String> ids = Arrays.asList(id);
//		String msg = service.delRole(ids,user);
//		map.put("msg", msg);
//		return map;
//	}
//	
//	/**
//	 * 根据id查询角色信息
//	 * 
//	 * @param id 角色id
//	 * @return 角色信息
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/editRoleById",method = RequestMethod.GET)
//	@ResponseBody
//	public ModelAndView getRoleEdit(Integer id) throws Exception{
//		RoleService service = new RoleService();
//		/*调用service实现根据ID查询*/
//		Role role = service.getRoleById(id);
//		ModelAndView model=new ModelAndView();
//		model.addObject("role", role);
//		model.setViewName("/system/edit_role");
//		return model;
//	}
//	
//	/**
//	 * 修改角色信息
//	 * 
//	 * @param id 角色id
//	 * @return 角色信息
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/updateRole",method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> updateRole(String name,String remarks,
//			Integer id,String[] ids,HttpServletRequest request) throws Exception{ 
//		Map<String, Object> map = new HashMap<String, Object>();
//		RoleService service = new RoleService();
//		List<String> list = Arrays.asList(ids);
//		HashSet<String> h = new HashSet<String>(list);
//		list=new ArrayList<String>();
//	    list.addAll(h);
//		/*调用service实现角色信息修改*/
//        User user=(User) request.getSession().getAttribute("user");
//		Integer result = service.updateRole(name, remarks, id, list,user);
//		if(result==1){
//			map.put("msg","操作成功!");
//			map.put("result",1);
//			return map;
//		}
//		if(result==0){
//			map.put("msg","操作失败!");
//			map.put("result",0);
//			return map;
//		}
//		if(result==-1){
//			map.put("msg","角色名已存在!");
//			map.put("result",-1);
//			return map;
//		} 
//		return map;
//	}
//	
//	/**
//	 * 修改角色信息
//	 * 
//	 * @param id 角色id
//	 * @return 角色信息
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/getRoleByID",method = RequestMethod.POST)
//	@ResponseBody
//	public Role getRoleById(Integer id) throws Exception{
//		RoleService service = new RoleService();
//		/*调用service实现根据ID查询*/
//		Role role = service.getRoleById(id);
//		return role;
//	}
//	
//} 