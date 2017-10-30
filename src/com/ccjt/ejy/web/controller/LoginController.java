package com.ccjt.ejy.web.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.ccjt.ejy.web.commons.Global;
import com.ccjt.ejy.web.commons.MD5;
import com.ccjt.ejy.web.commons.MapToBean;
import com.ccjt.ejy.web.commons.httpclient.HttpClient;
import com.ccjt.ejy.web.service.IndexService;
import com.ccjt.ejy.web.service.back.LoginService;
import com.ccjt.ejy.web.service.back.UserService;
import com.ccjt.ejy.web.vo.Menu;
import com.ccjt.ejy.web.vo.Paramater;
import com.ccjt.ejy.web.vo.Result;
import com.ccjt.ejy.web.vo.User;
import com.ccjt.ejy.web.vo.UserReg;
import com.ccjt.ejy.web.vo.LoginAccount;
@Controller
public class LoginController {
	private UserService userService=new UserService();
	/**
	 * 用户登录界面显示
	 * @param 
	 * @return 登录
	 * @exception 
	 */
	@RequestMapping(value = "/login")
	public ModelAndView manageIndex() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/back/login");
		return modelAndView;
	}
	@RequestMapping("/sysexit")
	private ModelAndView sysexit(HttpServletRequest request){
		request.removeAttribute("sysuser");
		ModelAndView modelAndView=new ModelAndView("/back/login");
		return modelAndView;
	}
	@RequestMapping("/userLogin")
	public ModelAndView userLogin(String name,String pwd,String valcode,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/back/login");
		String loginValicode=request.getSession().getAttribute("loginValicode")==null?"":request.getSession().getAttribute("loginValicode").toString();
		if(loginValicode.toLowerCase().equals(valcode.toLowerCase())){//验证码正确
			User user = userService.login(name, MD5.MD5(pwd));
			if(user==null){
				modelAndView.addObject("flag","fail");
				modelAndView.addObject("msg","用户名密码错误");
			}else{
				request.getSession().setAttribute("sysuser", user);
				modelAndView.addObject("flag","success");
				modelAndView.addObject("msg","登录成功");
			}
		}else{
			modelAndView.addObject("flag","fail");
			modelAndView.addObject("msg","验证码错误");
		}
		return modelAndView;
	}
	/**
	 * 查询用户对应的菜单权限
	 * @param id 用户ID
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/usermenulist",method = RequestMethod.POST)
	@ResponseBody
	public List<Menu> usermenulist(String id,HttpServletRequest request) throws Exception{		
		List<Menu> menu = LoginService.getMenu();
		return menu;
	} 
	/**
	 * 主界面右侧栏显示
	 * @param 
	 * @return first
	 * @exception 
	 */
	@RequestMapping(value="/czcytzjt_first")
	public ModelAndView first(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/back/index");
		User user=(User) request.getSession().getAttribute("sysuser");
		modelAndView.addObject("user",user);
		return modelAndView;
	}
	
	/**
	 * 判断是否已经登陆
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/is_login")
	@ResponseBody
	public Object login_in(HttpSession httpSession) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("login", httpSession.getAttribute("loginAccount") !=null);
		return map;
	}
	
	@RequestMapping(value="/login_in")
	@ResponseBody
	public Object login_in(UserReg user, HttpSession httpSession) {		
		Map<String,Object> map = new HashMap<String,Object>();
		LoginAccount loginAccount = new LoginAccount();
		String msg = "";
		String verCode = (String)httpSession.getAttribute("verCode");
		/*if(verCode == null) {
			msg = "验证码失效，请重新刷新验证码";
    	} else if(!verCode.equalsIgnoreCase(user.getVercode())) {
    		msg = "验证码错误";
    	} */
		if(StringUtils.isEmpty(msg)) {
			Paramater p = new Paramater();
			p.setType("login");	
			user.setVercode(null);
			p.setData(user);
			//判断用户名和密码
			if(StringUtils.isEmpty(user.getLoginName()) && httpSession.getAttribute("loginAccount") ==null){
				msg = "您还没有登陆";
			}else{
				if(httpSession.getAttribute("loginAccount") !=null){
					//已经登陆成功
					msg ="";
				}else{
					String str = JSON.toJSONString(p);
					Result r = HttpClient.call(Global.login_url, str);
					if(r == null) {
						msg = "网络不给力，请稍后重新注册";
					} else if(r.getCode() == 0) {
						map = r.getData().get(0);				
						MapToBean.transMap2Bean(map, loginAccount);
						//保存登录用户到session
						httpSession.setAttribute("loginAccount", loginAccount);
						Map<String, Object> loginInfo = new IndexService().getLoginInfo(loginAccount);
						map.put("loginInfo", loginInfo);
					} else {
						msg = (String)r.getMsg();				
					}
				}
			}
		}
		map.put("msg", msg);
		map.put("loginAccount", loginAccount);
		return map;
	}
	
	@RequestMapping(value="/login_out")
	@ResponseBody
	public Object login_out(HttpServletRequest request, HttpServletResponse response) {	
		Map map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		session.invalidate();
		map.put("code", "0");
		map.put("msg", "会员退出登录成功！");
		return map;
	}
		
//	/**
//	 * 修改密码
//	 * @param 
//	 * @return 密码修改
//	 * @exception 
//	 */
//	@RequestMapping(value="/password")
//	public String password() {
//		return "/main/PasswordReset";
//	}
//	
//	/**
//	 * 实现密码修改
//	 * @param oldPwd 旧密码,rePwd 新密码
//	 * @return 密码修改
//	 * @throws Exception 
//	 */
//	@RequestMapping(value="/updatePWD",method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> updatePWD(String oldPwd,String rePwd,
//			HttpServletRequest request) throws Exception{
//		User u = (User)request.getSession().getAttribute("user");
//		Map<String, Object> map = new HashMap<String, Object>();
//		LoginService service = new LoginService();
//		String msg = service.resetPWD(oldPwd, rePwd, u.getId(),u);
//		map.put("msg", msg);
//		return map;
//	} 
//	
//    /**
//     * 用户注销操作
//     * @param request
//     * @return
//     * @throws Exception
//     */
//	@RequestMapping(value="/login_out") 
//	public String sessionVlidate(HttpServletRequest request ) throws Exception{
//		  request.getSession().invalidate(); 
//		  return "login";
//	}
} 
