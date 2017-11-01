package com.ccjt.ejy.web.controller;

import com.ccjt.ejy.web.service.ZxdkApplyLogService;
import com.ccjt.ejy.web.vo.User;
import com.ccjt.ejy.web.vo.ZxdkApplyLog;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 在线贷款申请后台审核记录
 */
@Controller
@RequestMapping("/system")
public class ZxdkApplyLogController {

    private ZxdkApplyLogService zxdkApplyLogService=new ZxdkApplyLogService();

    @RequestMapping(value = "/rzdk_manage")
    public ModelAndView manage(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("back/rzdk_manage");
        return mv;
    }

    /**
     * 保存审核记录
     * @param request
     * @param zxdkApplyLog
     * @return
     * @throws Exception
     */

    @RequestMapping(value = "/zxdkApplyLogSave" ,method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView saveLog(HttpServletRequest request, ZxdkApplyLog zxdkApplyLog) throws Exception {
        ModelAndView mv = new ModelAndView();
        User user= (User) request.getSession().getAttribute("sysuser");
        Map<String, Object> result= zxdkApplyLogService.saveIndividual(zxdkApplyLog,user.getLoginname());
        mv.addObject("msg", result.get("msg"));
        mv.addObject("flag", result.get("flag"));//回传标记
        mv.setViewName("back/rzdk_add");
        return mv;
    }
}