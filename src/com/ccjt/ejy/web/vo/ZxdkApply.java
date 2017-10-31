package com.ccjt.ejy.web.vo;

/**
 * 在线贷款申请
 */
public class ZxdkApply {
    private String displayName;//名称
    private String userGuid;//用户guid
    private String dogNum;
    private String danWeiGuid;
    private String danWeiName;
    private String danWeiType;//注册类型
    private String companyPhone;//办公电话
    private String mobilePhone;//移动电话
    private String idCard;//身份证
    private boolean isFinish;//信息是否完整
    private String memberType;//会员类型

    private String qiyeName;//企业名称
    private String yyzzNum;//营业执照编号
    private String faRen;//法人
    private String regDate;//注册日期
    private String regMoney;//注册资本
    private String sjMoney;//实缴资本
    private String bankNum;//开户银行账号
    private String bankType;//开户行
    private String lianxiRen;//联系人
    private String xianxiType;//联系方式
    private String mail;//邮箱

    private String lendMoney ;//借款金额
    private String lendDate ;//借款日期
    private String repayType ;//还款方式
    private String repaySource ;//还款来源

    private String applyStatus ;//申请状态,初审,复审....
    private String shenheStatus ;//审核状态,通过,不通过...
    private String remark ;//审核结果注释

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getUserGuid() {
        return userGuid;
    }

    public void setUserGuid(String userGuid) {
        this.userGuid = userGuid;
    }

    public String getDogNum() {
        return dogNum;
    }

    public void setDogNum(String dogNum) {
        this.dogNum = dogNum;
    }

    public String getDanWeiGuid() {
        return danWeiGuid;
    }

    public void setDanWeiGuid(String danWeiGuid) {
        this.danWeiGuid = danWeiGuid;
    }

    public String getDanWeiName() {
        return danWeiName;
    }

    public void setDanWeiName(String danWeiName) {
        this.danWeiName = danWeiName;
    }

    public String getDanWeiType() {
        return danWeiType;
    }

    public void setDanWeiType(String danWeiType) {
        this.danWeiType = danWeiType;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public boolean isFinish() {
        return isFinish;
    }

    public void setFinish(boolean finish) {
        isFinish = finish;
    }

    public String getMemberType() {
        return memberType;
    }

    public void setMemberType(String memberType) {
        this.memberType = memberType;
    }

    public String getQiyeName() {
        return qiyeName;
    }

    public void setQiyeName(String qiyeName) {
        this.qiyeName = qiyeName;
    }

    public String getYyzzNum() {
        return yyzzNum;
    }

    public void setYyzzNum(String yyzzNum) {
        this.yyzzNum = yyzzNum;
    }

    public String getFaRen() {
        return faRen;
    }

    public void setFaRen(String faRen) {
        this.faRen = faRen;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getRegMoney() {
        return regMoney;
    }

    public void setRegMoney(String regMoney) {
        this.regMoney = regMoney;
    }

    public String getSjMoney() {
        return sjMoney;
    }

    public void setSjMoney(String sjMoney) {
        this.sjMoney = sjMoney;
    }

    public String getBankNum() {
        return bankNum;
    }

    public void setBankNum(String bankNum) {
        this.bankNum = bankNum;
    }

    public String getBankType() {
        return bankType;
    }

    public void setBankType(String bankType) {
        this.bankType = bankType;
    }

    public String getLianxiRen() {
        return lianxiRen;
    }

    public void setLianxiRen(String lianxiRen) {
        this.lianxiRen = lianxiRen;
    }

    public String getXianxiType() {
        return xianxiType;
    }

    public void setXianxiType(String xianxiType) {
        this.xianxiType = xianxiType;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getLendMoney() {
        return lendMoney;
    }

    public void setLendMoney(String lendMoney) {
        this.lendMoney = lendMoney;
    }

    public String getLendDate() {
        return lendDate;
    }

    public void setLendDate(String lendDate) {
        this.lendDate = lendDate;
    }

    public String getRepayType() {
        return repayType;
    }

    public void setRepayType(String repayType) {
        this.repayType = repayType;
    }

    public String getRepaySource() {
        return repaySource;
    }

    public void setRepaySource(String repaySource) {
        this.repaySource = repaySource;
    }

    public String getApplyStatus() {
        return applyStatus;
    }

    public void setApplyStatus(String applyStatus) {
        this.applyStatus = applyStatus;
    }

    public String getShenheStatus() {
        return shenheStatus;
    }

    public void setShenheStatus(String shenheStatus) {
        this.shenheStatus = shenheStatus;
    }
}
