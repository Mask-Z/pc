package com.ccjt.ejy.web.service;

import com.ccjt.ejy.web.vo.ZxdkApply;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

public class ZxdkApplyService {
    private static Logger log = LogManager.getLogger(ZxdkApplyService.class);

    /**
     * 保存记录
     * @param zxdkApply
     * @return
     */
    public Map<String, Object> save(ZxdkApply zxdkApply) {
        Map<String, Object> result = new HashMap<String, Object>();
        String sql = "insert into online_loan_apply(?,?,?,?,?,?) values(?,?,?,?,?,?)";
        result.put("code", 1);
        result.put("msg", "提交失败!");
        return result;
    }
    /**
     * 保存单位申请记录(初审)
     * @param zxdkApply
     * @return
     */
    public Map<String, Object> saveCompany(ZxdkApply zxdkApply) {
        Map<String, Object> result = new HashMap<String, Object>();
        String sql = "insert into online_loan_apply(infoid,user_id,member_type,company_qymc,company_frsfzh,company_yyzzbh,company_frdb," +
                "company_zcrq,company_zczb,company_sjzb,company_khyhzh,company_khyh,company_lxr,company_lxfs,company_lxyx,reviewinfo_shzt," +
                "reviewinfo_shjg,create_time,lastupdate_time) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            jdbc.insert(sql,zxdkApply.getInfoid(),zxdkApply.getUser_id(),zxdkApply.getMember_type(),zxdkApply.getCompany_qymc(),zxdkApply.getCompany_frsfzh(),
                    zxdkApply.getCompany_yyzzbh(),zxdkApply.getCompany_frdb(),zxdkApply.getCompany_zcrq(),zxdkApply.getCompany_zczb(),zxdkApply.getCompany_sjzb(),
                    zxdkApply.getCompany_khyhzh(),zxdkApply.getCompany_khyh(),zxdkApply.getCompany_lxr(),zxdkApply.getCompany_lxfs(),zxdkApply.getCompany_lxyx(),
                    "0","0",new Date(),new Date());
            result.put("code", 0);
            result.put("msg", "保存成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 1);
            result.put("msg", "保存失败!");
        }
        return result;
    }

    /**
     * 保存个人申请记录(初审)
     * @param zxdkApply
     * @return
     */
    public Map<String, Object> saveIndividual(ZxdkApply zxdkApply) {
        Map<String, Object> result = new HashMap<String, Object>();
        String sql = "insert into online_loan_apply(infoid,user_id,member_type,individual_xm,individual_sfzh,individual_lxfs,individual_jjlxr,individual_jjlxrlxfs" +
                "reviewinfo_shzt,reviewinfo_shjg,create_time,lastupdate_time) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            jdbc.insert(sql,zxdkApply.getInfoid(),zxdkApply.getUser_id(),zxdkApply.getMember_type(),zxdkApply.getIndividual_xm(),zxdkApply.getIndividual_sfzh(),zxdkApply.getIndividual_lxfs(),
                    zxdkApply.getIndividual_jjlxr(),zxdkApply.getIndividual_jjlxrlxfs(), "0","0",new Date(),new Date());
            result.put("code", 0);
            result.put("msg", "保存成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 1);
            result.put("msg", "保存失败!");
        }
        return result;
    }
    /**
     * 查询一条用户申请记录
     * @param danweiguid
     * @return
     */
    public ZxdkApply getZxdkApply(String danweiguid) {
        String sql="select top 1 * from online_loan_apply";
        ZxdkApply zxdkApply=null;
        try {
            zxdkApply= jdbc.bean(sql,ZxdkApply.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return zxdkApply;
    }

    /**
     * 更新记录
     * @param zxdkApply
     */
    public void updateZxdkApply(ZxdkApply zxdkApply) {
        String sql="update online_loan_apply set 更新的字段=xx,更新的字段=xx where id=? ";
        try {
            jdbc.execute(sql,zxdkApply.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
