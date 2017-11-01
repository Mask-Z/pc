package com.ccjt.ejy.web.service;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.ZxdkApply;
import com.ccjt.ejy.web.vo.ZxdkApplyLog;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

public class ZxdkApplyLogService {
    private static Logger log = LogManager.getLogger(ZxdkApplyLogService.class);

    /**
     * 保存审核记录,每更新一次状态都会插入一条记录
     *
     * @param log
     * @param operation_name 跟单人员登录名
     * @return
     */
    public Map<String, Object> saveIndividual(ZxdkApplyLog log, String operation_name) {
        Map<String, Object> result = new HashMap<String, Object>();
        String sql = "insert into [web2.0].dbo.online_loan_apply_log(apply_id,audit_status,audit_result,operation_time,operation_name,remark,apply_jkjeqr) values(?,?,?,?,?,?,?)";
        try {
            jdbc.insert(sql, log.getApply_id(), log.getAudit_status(), log.getAudit_result(), new Date(), operation_name, log.getRemark(), log.getApply_jkjeqr());
            result.put("code", "0");
            result.put("msg", "保存成功");
            ConnectionFactory.commit();
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code", "1");
            result.put("msg", "保存失败!");
            ConnectionFactory.rollback();
        }
        if (result.get("code").equals("0")) {//保存成功需要更新申请表
            try {
                jdbc.execute("update [web2.0].dbo.online_loan_apply set reviewinfo_shzt=?,reviewinfo_shjg=?,lastupdate_time=? where id=?", log.getAudit_status(), log.getAudit_result(), new Date(), log.getApply_id());
                ConnectionFactory.commit();
            } catch (Exception e) {
                e.printStackTrace();
                ConnectionFactory.rollback();
            }
        }
        return result;
    }


    /**
     * 根据申请id查询最新一条审核记录
     *
     * @param id
     * @return
     */
    public ZxdkApplyLog getZxdkApplyById(int id) {
        String sql = "select top 1 * from [web2.0].dbo.online_loan_apply_log where apply_id=? order by operation_time desc";
        ZxdkApplyLog zxdkApplyLog = null;
        try {
            zxdkApplyLog = jdbc.bean(sql, ZxdkApplyLog.class,id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return zxdkApplyLog;
    }
}