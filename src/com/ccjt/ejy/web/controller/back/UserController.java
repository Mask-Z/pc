package com.ccjt.ejy.web.controller.back;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ccjt.ejy.web.commons.MD5;
import com.ccjt.ejy.web.service.back.UserService;
import com.ccjt.ejy.web.vo.User;
@Controller
@RequestMapping("/user")
public class UserController {
	private UserService userService=new UserService();
	/**
	 * 列表数据
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/gridList")
	public Map<String,Object> mainIndex(User user ,Integer page, Integer rows) {
		Map<String, Object> m = userService.userList(user, page, rows);
		return m;
	}
	@RequestMapping(value = "/index")
	public ModelAndView manageIndex() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/back/user/index");
		return modelAndView;
	}
	/**
	 * 用户信息一览
	 * 
	 * @return
	 */
	@RequestMapping(value = "/openFormWin")
	public ModelAndView accountall(Integer id) {
		ModelAndView mv = new ModelAndView();
		if (id != null) {
			User user = userService.getUser(id);
			mv.addObject("user", user);
			mv.addObject("type", "edit");
		}else{
			mv.addObject("type", "add");
		}
		mv.setViewName("/back/user/form");
		return mv;
	}
	/**
	 * 新增/修改角色
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save")
	public ModelAndView save(User user,HttpServletRequest request) throws Exception {
		userService.saveUser(user);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "success");
        mv.setViewName("/back/user/form");
		return mv;
	}
	
	/**
	 * 批量删除数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/delete")
	public Map<String, Object> delete(String[] ids,HttpServletRequest request) throws Exception {
		Map<String, Object> map = userService.delUser(ids);
		return map;
	}
	/**
	 * 检查用户名是否被占用
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkUserCode")
	public int checkUserCode(String loginname,String id) {
		int count=userService.checkUserCode(loginname,id);
		return count;
	}
	/**
	 * 打开修改密码页面
	 * @return
	 */
	@RequestMapping(value = "/openUpdatePwdFormWin")
	public ModelAndView openUpdatePwdFormWin(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/back/user/updatePwd");
		User user=(User) request.getSession().getAttribute("sysuser");
		modelAndView.addObject("loginname",user.getLoginname());
		return modelAndView;
	}
	@RequestMapping("/updatePassword")
	public ModelAndView updatePassword(User u,String loginname,String oldpassword){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("/back/user/updatePwd");
		User user = userService.login(loginname,MD5.MD5(oldpassword));
		if(user==null){
			mv.addObject("flag", "fail");
			mv.addObject("msg", "输入旧密码有误！");
		}else{
			userService.updatePwd(u);
			mv.addObject("flag", "success");
		}
		return mv;
	}
}
