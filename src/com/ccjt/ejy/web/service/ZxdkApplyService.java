package com.ccjt.ejy.web.service;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.ZxdkApply;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

public class ZxdkApplyService {
    private static Logger log = LogManager.getLogger(ZxdkApplyService.class);

    /**
     * 保存单位申请记录(初审)
     *
     * @param zxdkApply
     * @return
     */
    public Map<String, Object> saveCompany(ZxdkApply zxdkApply) {
        Map<String, Object> result = new HashMap<String, Object>();
        String sql = "insert into [web2.0].dbo.online_loan_apply(infoid,user_id,member_type,company_qymc,company_frsfzh,company_yyzzbh,company_frdb," +
                "company_zcrq,company_zczb,company_sjzb,company_khyhzh,company_khyh,company_lxr,company_lxfs,company_lxyx,reviewinfo_shzt," +
                "company_zyywsm,company_jsnnsqk,company_jsnsflxyl,company_jsnqysr,company_jsnqycb,company_qyzzc,company_qyzfz,loaninfo_jkje,loaninfo_jksj,loaninfo_hkfs,loaninfo_zyhkly," +
                "reviewinfo_shjg,create_time,lastupdate_time,weixin_number) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            jdbc.insert(sql, zxdkApply.getInfoid(), zxdkApply.getUser_id(), zxdkApply.getMember_type(), zxdkApply.getCompany_qymc(), zxdkApply.getCompany_frsfzh(),
                    zxdkApply.getCompany_yyzzbh(), zxdkApply.getCompany_frdb(), zxdkApply.getCompany_zcrq(), zxdkApply.getCompany_zczb(), zxdkApply.getCompany_sjzb(),
                    zxdkApply.getCompany_khyhzh(), zxdkApply.getCompany_khyh(), zxdkApply.getCompany_lxr(), zxdkApply.getCompany_lxfs(), zxdkApply.getCompany_lxyx(),
                    0, zxdkApply.getCompany_zyywsm(), zxdkApply.getCompany_jsnnsqk(), zxdkApply.getCompany_jsnsflxyl(), zxdkApply.getCompany_jsnqysr(), zxdkApply.getCompany_jsnqycb(),
                    zxdkApply.getCompany_qyzzc(), zxdkApply.getCompany_qyzfz(), zxdkApply.getLoaninfo_jkje(), zxdkApply.getLoaninfo_jksj(), zxdkApply.getLoaninfo_hkfs(), zxdkApply.getLoaninfo_zyhkly(), 0, new Date(), new Date(), zxdkApply.getWeixin_number());
            result.put("code", 0);
            result.put("msg", "保存成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 1);
            result.put("msg", "保存失败!");
            ConnectionFactory.rollback();
        }
        return result;
    }

    /**
     * 保存个人申请记录(初审)
     *
     * @param zxdkApply
     * @return
     */
    public Map<String, Object> saveIndividual(ZxdkApply zxdkApply) {
        Map<String, Object> result = new HashMap<String, Object>();
        String sql = "insert into [web2.0].dbo.online_loan_apply(infoid,user_id,member_type,individual_xm,individual_sfzh,individual_lxfs,individual_jjlxr,individual_jjlxrlxfs" +
                "individual_zy,individual_gs,individual_grsr,individual_jtsr,individual_hy,individual_dflxr,individual_dflxfs,loaninfo_jkje,loaninfo_jksj,loaninfo_hkfs,loaninfo_zyhkly," +
                "reviewinfo_shzt,reviewinfo_shjg,create_time,lastupdate_time,weixin_number) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            jdbc.insert(sql, zxdkApply.getInfoid(), zxdkApply.getUser_id(), zxdkApply.getMember_type(), zxdkApply.getIndividual_xm(), zxdkApply.getIndividual_sfzh(), zxdkApply.getIndividual_lxfs(),
                    zxdkApply.getIndividual_jjlxr(), zxdkApply.getIndividual_jjlxrlxfs(), zxdkApply.getIndividual_zy(), zxdkApply.getIndividual_gs(), zxdkApply.getIndividual_grsr(),
                    zxdkApply.getIndividual_jtsr(), zxdkApply.getIndividual_hy(), zxdkApply.getIndividual_dflxr(), zxdkApply.getIndividual_dflxfs(), zxdkApply.getLoaninfo_jkje(), zxdkApply.getLoaninfo_jksj(), zxdkApply.getLoaninfo_hkfs(), zxdkApply.getLoaninfo_zyhkly(), 0, 0, new Date(), new Date(), zxdkApply.getWeixin_number());
            result.put("code", 0);
            result.put("msg", "保存成功");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", 1);
            result.put("msg", "保存失败!");
            ConnectionFactory.rollback();
        }
        return result;
    }

    /**
     * 查询一条用户申请记录
     *
     * @param danweiguid
     * @return
     */
    public ZxdkApply getZxdkApply(String danweiguid,String projectinfoid) {
        String sql = "select top 1 create_time as create_time_str,lastupdate_time as lastupdate_time_str,* from [web2.0].dbo.online_loan_apply where user_id=? and infoid=? ";
        ZxdkApply zxdkApply = null;
        try {
            zxdkApply = jdbc.bean(sql, ZxdkApply.class,danweiguid,projectinfoid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return zxdkApply;
    }

    /**
     * 根据id查询一条用户申请记录
     *
     * @param id
     * @return
     */
    public ZxdkApply getZxdkApplyById(int id) {
        String sql = "select top 1 create_time as create_time_str,lastupdate_time as lastupdate_time_str,* from [web2.0].dbo.online_loan_apply where id=? ";
        ZxdkApply zxdkApply = null;
        try {
            zxdkApply = jdbc.bean(sql, ZxdkApply.class,id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return zxdkApply;
    }

    /**
     * 更新记录
     *
     * @param zxdkApply
     */
    public void updateZxdkApply(ZxdkApply zxdkApply) {
        String sql = "update [web2.0].dbo.online_loan_apply set 更新的字段=xx,更新的字段=xx where id=? ";
        try {
            jdbc.execute(sql, zxdkApply.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //获取所有申请记录列表,按照时间倒序,审核状态待审核排序
    public Map<String, Object> getZxdkApplyList(ZxdkApply zxdkApply, Integer page, Integer rows) {
        Map<String, Object> m = new HashMap<String, Object>();
        List<ZxdkApply> list = null;
        try {
            String sql = " select create_time as create_time_str,lastupdate_time as lastupdate_time_str,* from [web2.0].dbo.online_loan_apply where 1=1 ";
            m.put("total", jdbc.getCount(sql));
            sql += " order by create_time desc ,reviewinfo_shjg asc";
            list = jdbc.beanList(sql, page, rows, ZxdkApply.class);
            m.put("rows", list);
        } catch (Exception e) {
            log.error(e);
            e.printStackTrace();
        }

        return m;
    }

    //获取用户所有申请记录列表,按照时间倒序
    public Map<String, Object> getZxdkApplyListById(ZxdkApply zxdkApply, Integer page, Integer rows, String danweiid) {
        Map<String, Object> m = new HashMap<String, Object>();
        List<ZxdkApply> list = null;
        try {
            String sql = " select * from [web2.0].dbo.online_loan_apply where 1=1 and user_id=? ";
            m.put("total", jdbc.getCount(sql));
            sql += " order by create_time desc ";
            list = jdbc.beanList(sql, page, rows, ZxdkApply.class, danweiid);
            m.put("rows", list);
        } catch (Exception e) {
            log.error(e);
            e.printStackTrace();
        }

        return m;
    }
}
