package com.ccjt.ejy.web.controller;

import com.ccjt.ejy.web.service.ZxdkApplyService;
import com.ccjt.ejy.web.vo.OnlineLoans;
import com.ccjt.ejy.web.vo.ZxdkApply;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 在线贷款申请
 */
@Controller
@RequestMapping("/system")
public class ZxdkApplyController {

    private ZxdkApplyService zxdkApplyService=new ZxdkApplyService();
    /**
     * 保存申请记录(初审)
     * @param zxdkApply
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/saveApplyInformation", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> saveApplyInformation_first(ZxdkApply zxdkApply, HttpServletRequest request) throws Exception {
        Map<String,Object> map=new HashMap<String,Object>();
        if (zxdkApply!=null){
            if (zxdkApply.getMember_type().equals("0")){//单位类型
                map=zxdkApplyService.saveCompany(zxdkApply);
            }else if (zxdkApply.getMember_type().equals("1")){//个人类型
                map=zxdkApplyService.saveIndividual(zxdkApply);
            }else{
                map.put("code", -1);
                map.put("msg", "没有该用户类型!");
            }
        }
        return map;
    }

    /**
     * 根据danweiguid查询用户信息
     */
    public ZxdkApply getZxdkApply(HttpServletRequest request,String danweiguid){
        zxdkApplyService.getZxdkApply(danweiguid);
        return null;
    }

    /**
     * 更新记录,主要更新审核状态和结果
     */

    public Object updateZxdkApply(HttpServletRequest request,ZxdkApply zxdkApply){
        zxdkApplyService.updateZxdkApply(zxdkApply);
        return null;
    }
}
