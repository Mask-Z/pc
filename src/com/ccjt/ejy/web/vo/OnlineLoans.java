package com.ccjt.ejy.web.vo;

import java.util.Date;

/**
 * 在线贷款申请实体类
 */
public class OnlineLoans {
    private Integer id;
    private String biaodiname;//标的名称
    private String biaodiurl;//标的链接
    private Date applytime;//申请时间
    private String  applytime_str;//申请时间(字符串格式)
    private String applyname;//申请人姓名
    private String applytel;//申请人联系方式
    private String applyaddress;//申请人地址
    private String status;//状态 0:待联系;1:已联系;2:完成
    private String remark;//备注

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBiaodiname() {
        return biaodiname;
    }

    public void setBiaodiname(String biaodiname) {
        this.biaodiname = biaodiname;
    }

    public String getBiaodiurl() {
        return biaodiurl;
    }

    public void setBiaodiurl(String biaodiurl) {
        this.biaodiurl = biaodiurl;
    }

    public Date getApplytime() {
        return applytime;
    }

    public void setApplytime(Date applytime) {
        this.applytime = applytime;
    }

    public String getApplytime_str() {
        return applytime_str;
    }

    public void setApplytime_str(String applytime_str) {
        this.applytime_str = applytime_str;
    }

    public String getApplyname() {
        return applyname;
    }

    public void setApplyname(String applyname) {
        this.applyname = applyname;
    }

    public String getApplytel() {
        return applytel;
    }

    public void setApplytel(String applytel) {
        this.applytel = applytel;
    }

    public String getApplyaddress() {
        return applyaddress;
    }

    public void setApplyaddress(String applyaddress) {
        this.applyaddress = applyaddress;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
