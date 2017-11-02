package com.ccjt.ejy.web.vo;

/**
 * 在线贷款申请后台审核记录bean
 */
public class ZxdkApplyLog {
    private int id;
    private int apply_id;//在线贷款申请表主键
    private int audit_status;//该审核动作的审核状态 0：初审；1：材料审核；2：合同签署；3：放款监管；4：产权变更；5：线下打款；6：还款
    private int audit_result;//该审核动作的审核结果 -1:已失效 0：待绑定；1：待审核；2：未通过；3：已通过   4:不完备  5:已完备  6:待签署 7:已签署 8:待办理 9:已提交 10:已办理 11:待打款 12:已打款 13:当月未还 14:当月已还
    private String operation_time;//该审核记录操作时间
    private String operation_time_str;//该审核记录操作时间(字符串格式)
    private String operation_name;//该审核记录操作人名称
    private String remark;//审核备注
    private String apply_jkjeqr;//借款额度确认

    public String getOperation_time_str() {
        return operation_time_str;
    }

    public void setOperation_time_str(String operation_time_str) {
        this.operation_time_str = operation_time_str;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getApply_id() {
        return apply_id;
    }

    public void setApply_id(int apply_id) {
        this.apply_id = apply_id;
    }

    public int getAudit_status() {
        return audit_status;
    }

    public void setAudit_status(int audit_status) {
        this.audit_status = audit_status;
    }

    public int getAudit_result() {
        return audit_result;
    }

    public void setAudit_result(int audit_result) {
        this.audit_result = audit_result;
    }

    public String getOperation_time() {
        return operation_time;
    }

    public void setOperation_time(String operation_time) {
        this.operation_time = operation_time;
    }

    public String getOperation_name() {
        return operation_name;
    }

    public void setOperation_name(String operation_name) {
        this.operation_name = operation_name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getApply_jkjeqr() {
        return apply_jkjeqr;
    }

    public void setApply_jkjeqr(String apply_jkjeqr) {
        this.apply_jkjeqr = apply_jkjeqr;
    }
}
