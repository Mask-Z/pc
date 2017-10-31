package com.ccjt.ejy.web.service;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.ZxdkApply;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.HashMap;
import java.util.Map;

public class ZxdkApplyService {
    private static Logger log = LogManager.getLogger(ZxdkApplyService.class);

    /**
     * 保存记录
     * @param zxdkApply
     * @return
     */
    public Map<String, Object> save(ZxdkApply zxdkApply) {
        Map<String, Object> result = new HashMap<String, Object>();
        String sql = "insert into 用户申请表(?,?,?,?,?,?) values(?,?,?,?,?,?)";
        result.put("code", 1);
        result.put("msg", "提交失败!");
        return result;
    }

    /**
     * 查询一条用户申请记录
     * @param danweiguid
     * @return
     */
    public ZxdkApply getZxdkApply(String danweiguid) {
        String sql="select top 1 * from 用户申请表";
        return null;
    }
}
