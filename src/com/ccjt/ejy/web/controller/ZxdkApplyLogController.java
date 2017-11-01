package com.ccjt.ejy.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 在线贷款申请后台审核记录
 */
@Controller
@RequestMapping("/system")
public class ZxdkApplyLogController {
    @RequestMapping(value = "/rzdk_manage")
    public ModelAndView manage(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("back/rzdk_manage");
        return mv;
    }
}
