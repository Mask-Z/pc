package com.ccjt.ejy.web.controller;

import com.ccjt.ejy.web.service.CqjyService;
import com.ccjt.ejy.web.service.NewsService;
import com.ccjt.ejy.web.service.ZxdkApplyLogService;
import com.ccjt.ejy.web.service.ZxdkApplyService;
import com.ccjt.ejy.web.vo.GongGao;
import com.ccjt.ejy.web.vo.OnlineLoans;
import com.ccjt.ejy.web.vo.ZxdkApply;
import com.ccjt.ejy.web.vo.ZxdkApplyLog;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 在线贷款申请
 */
@Controller
@RequestMapping("/system")
public class ZxdkApplyController {

    private ZxdkApplyService zxdkApplyService = new ZxdkApplyService();

    /**
     * 保存申请记录(初审)
     *
     * @param zxdkApply
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/saveApplyInformation", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveApplyInformation_first(ZxdkApply zxdkApply, HttpServletRequest request) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        if (zxdkApply != null) {
            if (zxdkApply.getMember_type().equals("0")) {//单位类型
                map = zxdkApplyService.saveCompany(zxdkApply);
            } else if (zxdkApply.getMember_type().equals("1")) {//个人类型
                map = zxdkApplyService.saveIndividual(zxdkApply);
            } else {
                map.put("code", -1);
                map.put("msg", "没有该用户类型!");
            }
        }

        //保存成功后发送短信

        return map;
    }

    @RequestMapping(value = "/ZxdkApplyForm")
    public ModelAndView onlineLoansadd(Integer id, HttpServletRequest request,String type) throws Exception {
        ModelAndView mv = new ModelAndView();
        if (id != null) {
            ZxdkApply zxdkApply = zxdkApplyService.getZxdkApplyById(id);
            mv.addObject("zxdkApply", zxdkApply);
            //带出所申请项目的详细信息
            CqjyService cqjyS=new CqjyService();
            GongGao gonggao = cqjyS.detail(zxdkApply.getInfoid());
            mv.addObject("gonggao", gonggao);
            //获取热点标签
            NewsService ns=new NewsService();
            List<String> hotLabelNameList=ns.getHotLabelName(gonggao.getInfoid());
            mv.addObject("hotLabelNameList",hotLabelNameList);
        }
        if (StringUtils.isNotBlank(type)&&type.equals("iframe")){
            mv.setViewName("/back/shenhe_form");
        }else {
            mv.setViewName("/back/rzdk_add");
        }
        return mv;
    }

    /**
     * 根据danweiguid查询用户信息
     */
    public ZxdkApply getZxdkApply(HttpServletRequest request, String danweiguid,String projectInfoid) {
        zxdkApplyService.getZxdkApply(danweiguid,projectInfoid);
        return null;
    }

    /**
     * 更新记录,主要更新审核状态和结果
     */

    public Object updateZxdkApply(HttpServletRequest request, ZxdkApply zxdkApply) {
        zxdkApplyService.updateZxdkApply(zxdkApply);
        return null;
    }

    @RequestMapping(value = "/zxdkApplyList",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getZxdkApplyList(ZxdkApply zxdkApply , Integer page, Integer rows)
            throws Exception {
        Map<String, Object> m = zxdkApplyService.getZxdkApplyList(zxdkApply, page, rows);
        return m;
    }
}
