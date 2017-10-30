package com.ccjt.ejy.web.service;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.Entrust;
import com.ccjt.ejy.web.vo.OnlineLoans;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.*;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

public class OnlineLoansService {
    private static Logger log = LogManager.getLogger(OnlineLoansService.class);
    public Map<String,Object> saveOnlineLoans(OnlineLoans onlineLoans) {
            Map<String,Object> result = new HashMap<String, Object>();
            try {
                if(onlineLoans!=null){
                    if(onlineLoans.getId()!=null){
                        String sql = "update [web2.0].dbo.OnlineLoans set status=?,remark=? where id=?";
                        jdbc.execute(sql, onlineLoans.getStatus(),onlineLoans.getRemark(),onlineLoans.getId());
                    }else{
                        String sql = "insert into [web2.0].dbo.OnlineLoans(applytime,biaodiname,biaodiurl,applyname,applytel,applyaddress) values(?,?,?,?,?,?)";
                        jdbc.insert(sql, new Date(),onlineLoans.getBiaodiname(),onlineLoans.getBiaodiurl(),onlineLoans.getApplyname(),onlineLoans.getApplytel(),onlineLoans.getApplyaddress());
                    }
                    ConnectionFactory.commit();
                    result.put("code", 0);
                    result.put("msg", "提交成功!");
                }
            } catch (Exception e) {
                result.put("code", 1);
                result.put("msg", "提交失败!");
                ConnectionFactory.rollback();
                log.error(e);
                e.printStackTrace();
            }
            return result;
    }

    public Map<String,Object> entrustList(OnlineLoans onlineLoans, Integer page, Integer rows,String search_start,String search_end) {
        Map<String,Object> m = new HashMap<String, Object>();
        List<OnlineLoans> list = null;
        try {
            List<Object> params = new ArrayList<>();
            String sql = " select applytime as applytime_str,* from [web2.0].dbo.OnlineLoans where 1=1 ";

            if (StringUtils.isNotBlank(onlineLoans.getStatus())){
                sql += " and status = ?";
                params.add(onlineLoans.getStatus());
            }
            if (StringUtils.isNotBlank(onlineLoans.getApplyname())){//关键词查询
                String keywords=onlineLoans.getApplyname();
                sql += " and (applyname like ? or biaodiname like ? or applytel like ?)";
                params.add("%"+keywords+"%");
                params.add("%"+keywords+"%");
                params.add("%"+keywords+"%");
            }
            if (StringUtils.isNotBlank(search_start)){
                sql += " and applytime>CONVERT(datetime,'"+search_start+"',120)";
            }

            if (StringUtils.isNotBlank(search_end)){
                sql += "and (applytime-1)<CONVERT(datetime,'"+search_end+"',120)";
            }

            m.put("total", jdbc.getCount(sql,params.toArray()));

            sql += " order by id desc ";

            list = jdbc.beanList(sql,page,rows, OnlineLoans.class,params.toArray());
            m.put("rows", list);

        } catch (Exception e) {
            log.error(e);
            e.printStackTrace();
        }

        return m;
    }

    public OnlineLoans getOnlineLoans(Integer id) {
        OnlineLoans onlineLoans = null;
        try {
            if(id!=null){
                String sql = " select * from [web2.0].dbo.OnlineLoans  where id= "+id;
                onlineLoans = jdbc.bean(sql, OnlineLoans.class);
            }
        } catch (Exception e) {
            log.error(e);
            e.printStackTrace();
        }

        return onlineLoans;
    }
}
