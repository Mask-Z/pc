package com.ccjt.ejy.web.vo;

/**
 * 在线贷款申请后台审核记录bean
 */
public class ZxdkApplyLog {
    private int id;
    private int apply_id;//在线贷款申请表主键
    private int audit_status;//该审核动作的审核状态（0：初审；1：补充资料；2：复审；3：合同签署；4：平台放款；5：过户抵押；6：放款审核）
    private int audit_result;//该审核动作的审核结果（0：待审核；1：审核通过；2：审核不通过；3：撤销）
    private String operation_time;//该审核记录操作时间
    private String operation_name;//该审核记录操作人名称
    private String remark;//审核备注
    private String apply_jkjeqr;//借款额度确认

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
