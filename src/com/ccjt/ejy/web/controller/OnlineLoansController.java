package com.ccjt.ejy.web.controller;

import com.ccjt.ejy.web.service.OnlineLoansService;
import com.ccjt.ejy.web.vo.Entrust;
import com.ccjt.ejy.web.vo.OnlineLoans;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
@Controller
@RequestMapping("/system")
public class OnlineLoansController {

    private OnlineLoansService onlineLoansService=new OnlineLoansService();

    @RequestMapping(value = "/apply_manage")
    public ModelAndView manage(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("back/onlineLoansManager");
        return mv;
    }

    @RequestMapping(value = "/onlineLoansList")
    @ResponseBody
    public Map<String, Object> list(OnlineLoans onlineLoans ,Integer page, Integer rows,String search_start,String search_end)
            throws Exception {
        Map<String, Object> m = onlineLoansService.entrustList(onlineLoans, page, rows,search_start,search_end);
        return m;
    }

    @RequestMapping(value = "/onlineLoansForm")
    public ModelAndView onlineLoansadd(Integer id,HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (id != null) {
            OnlineLoans onlineLoans = onlineLoansService.getOnlineLoans(id);
            mv.addObject("onlineLoans", onlineLoans);
        }
        mv.setViewName("/back/onlineLoans_add");
        return mv;
    }

    @RequestMapping(value = "/onlineLoansSave", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView onlineLoansSave(OnlineLoans onlineLoans ,HttpServletRequest request) throws Exception {
        onlineLoansService.saveOnlineLoans(onlineLoans);
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "success");
        mv.setViewName("back/onlineLoans_add");
        return mv;
    }

    @RequestMapping(value = "/onlineLoansSave/add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> onlineLoansAdd(OnlineLoans onlineLoans,  HttpServletRequest request) throws Exception {
        Map<String,Object> map=new HashMap<String,Object>();
        map= onlineLoansService.saveOnlineLoans(onlineLoans);
        return map;
    }
}
