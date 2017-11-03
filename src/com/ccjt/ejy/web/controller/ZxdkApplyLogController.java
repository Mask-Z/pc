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
        mv.addObject("flag", "flag");//回传标记
        mv.setViewName("back/shenhe_form");
        return mv;
    }

    /**
     * 根据用户申请表的id查出该记录的所有审核日志
     * @param request
     * @param apply_id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ZxdkApplyLogList")
    public ModelAndView getZxdkApplyLogList(HttpServletRequest request, String apply_id)
            throws Exception {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> result=zxdkApplyLogService.getZxdkApplyLogList(apply_id);
        mv.addObject("result",result);
        mv.setViewName("/back/rzdkLogList");
        return mv;
    }
}
