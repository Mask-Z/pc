package com.ccjt.ejy.web.service;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.ZxdkApplyLog;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.*;

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
        Date saveDate=new Date();
        try {
            jdbc.insert(sql, log.getApply_id(), log.getAudit_status(), log.getAudit_result(), saveDate, operation_name, log.getRemark(), log.getApply_jkjeqr());
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
                jdbc.execute("update [web2.0].dbo.online_loan_apply set reviewinfo_shzt=?,reviewinfo_shjg=?,lastupdate_time=? where id=?", log.getAudit_status(), log.getAudit_result(), saveDate, log.getApply_id());
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
            zxdkApplyLog = jdbc.bean(sql, ZxdkApplyLog.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return zxdkApplyLog;
    }

    /**
     * 根据用户申请表的id查出该记录的所有审核日志
     * @param apply_id
     * @return
     */
    public Map<String,Object> getZxdkApplyLogList(String apply_id) {
        String sql = "select  operation_time as operation_time_str,* from [web2.0].dbo.online_loan_apply_log where apply_id=? ";
        List<ZxdkApplyLog> logs=new ArrayList<>();
        Map<String, Object> m = new HashMap<String, Object>();
        try {
            m.put("total", jdbc.getCount(sql,apply_id));
            sql+=" order by operation_time asc";
            logs=jdbc.beanList(sql,ZxdkApplyLog.class,apply_id);
            m.put("rows", logs);
        }catch (Exception e){
            e.printStackTrace();
        }
        return m;
    }
}
