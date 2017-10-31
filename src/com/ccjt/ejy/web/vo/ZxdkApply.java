package com.ccjt.ejy.web.vo;

import java.util.Date;

/**
 * 在线贷款申请
 */
public class ZxdkApply {
    private String id;
    private String infoid;//申请贷款的项目公告id
    private String user_id;//用户guid
    private String member_type;//会员类型  单位:0 个人:1

    private String company_qymc;//企业名称
    private String company_frsfzh;//身份证
    private String company_yyzzbh;//营业执照编号
    private String company_frdb;//法人
    private String company_zcrq;//注册日期
    private String company_zczb;//注册资本
    private String company_sjzb;//实缴资本
    private String company_khyhzh;//开户银行账号
    private String company_khyh;//开户行
    private String company_lxr;//联系人
    private String company_lxfs;//联系方式
    private String company_lxyx;//邮箱

    private String company_zyywsm;//主要业务说明
    private String company_jsnnsqk;//近三年纳税情况
    private String company_jsnsflxyl;//近三年是否连续盈利 0:否 1:是
    private String company_jsnqysr;//近三年企业收入
    private String company_jsnqycb;//近三年企业成本
    private String company_qyzzc;//企业总资产
    private String company_qyzfz;//企业总负债

    private String individual_xm;//姓名
    private String individual_sfzh;//身份证号
    private String individual_lxfs;//联系方式
    private String individual_jjlxr;//紧急联系人
    private String individual_jjlxrlxfs;//紧急联系人联系方式

    private String individual_zy;//职业
    private String individual_gs;//公司
    private String individual_grsr;//个人收入
    private String individual_jtsr;//家庭收入
    private String individual_hy;//婚姻
    private String individual_dflxr;//对方联系人
    private String individual_dflxfs;//对方联系方式

    private String loaninfo_jkje ;//借款金额
    private String loaninfo_jksj ;//借款日期
    private String loaninfo_hkfs ;//还款方式
    private String loaninfo_zyhkly ;//还款来源

    private String reviewinfo_shzt ;//审核状态,0：初审；1：补充资料；2：复审；3：合同签署；4：平台放款；5：过户抵押；6：放款审核
    private String reviewinfo_shjg ;//申请结果,0：待审核；1：审核通过；2：审核不通过；3：撤销
    private Date create_time;//该记录创建时间
    private Date lastupdate_time;//该记录最后修改时间
    private String  weixin_number;//申请人微信号

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInfoid() {
        return infoid;
    }

    public void setInfoid(String infoid) {
        this.infoid = infoid;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getMember_type() {
        return member_type;
    }

    public void setMember_type(String member_type) {
        this.member_type = member_type;
    }

    public String getCompany_qymc() {
        return company_qymc;
    }

    public void setCompany_qymc(String company_qymc) {
        this.company_qymc = company_qymc;
    }

    public String getCompany_frsfzh() {
        return company_frsfzh;
    }

    public void setCompany_frsfzh(String company_frsfzh) {
        this.company_frsfzh = company_frsfzh;
    }

    public String getCompany_yyzzbh() {
        return company_yyzzbh;
    }

    public void setCompany_yyzzbh(String company_yyzzbh) {
        this.company_yyzzbh = company_yyzzbh;
    }

    public String getCompany_frdb() {
        return company_frdb;
    }

    public void setCompany_frdb(String company_frdb) {
        this.company_frdb = company_frdb;
    }

    public String getCompany_zcrq() {
        return company_zcrq;
    }

    public void setCompany_zcrq(String company_zcrq) {
        this.company_zcrq = company_zcrq;
    }

    public String getCompany_zczb() {
        return company_zczb;
    }

    public void setCompany_zczb(String company_zczb) {
        this.company_zczb = company_zczb;
    }

    public String getCompany_sjzb() {
        return company_sjzb;
    }

    public void setCompany_sjzb(String company_sjzb) {
        this.company_sjzb = company_sjzb;
    }

    public String getCompany_khyhzh() {
        return company_khyhzh;
    }

    public void setCompany_khyhzh(String company_khyhzh) {
        this.company_khyhzh = company_khyhzh;
    }

    public String getCompany_khyh() {
        return company_khyh;
    }

    public void setCompany_khyh(String company_khyh) {
        this.company_khyh = company_khyh;
    }

    public String getCompany_lxr() {
        return company_lxr;
    }

    public void setCompany_lxr(String company_lxr) {
        this.company_lxr = company_lxr;
    }

    public String getCompany_lxfs() {
        return company_lxfs;
    }

    public void setCompany_lxfs(String company_lxfs) {
        this.company_lxfs = company_lxfs;
    }

    public String getCompany_lxyx() {
        return company_lxyx;
    }

    public void setCompany_lxyx(String company_lxyx) {
        this.company_lxyx = company_lxyx;
    }

    public String getCompany_zyywsm() {
        return company_zyywsm;
    }

    public void setCompany_zyywsm(String company_zyywsm) {
        this.company_zyywsm = company_zyywsm;
    }

    public String getCompany_jsnnsqk() {
        return company_jsnnsqk;
    }

    public void setCompany_jsnnsqk(String company_jsnnsqk) {
        this.company_jsnnsqk = company_jsnnsqk;
    }

    public String getCompany_jsnsflxyl() {
        return company_jsnsflxyl;
    }

    public void setCompany_jsnsflxyl(String company_jsnsflxyl) {
        this.company_jsnsflxyl = company_jsnsflxyl;
    }

    public String getCompany_jsnqysr() {
        return company_jsnqysr;
    }

    public void setCompany_jsnqysr(String company_jsnqysr) {
        this.company_jsnqysr = company_jsnqysr;
    }

    public String getCompany_jsnqycb() {
        return company_jsnqycb;
    }

    public void setCompany_jsnqycb(String company_jsnqycb) {
        this.company_jsnqycb = company_jsnqycb;
    }

    public String getCompany_qyzzc() {
        return company_qyzzc;
    }

    public void setCompany_qyzzc(String company_qyzzc) {
        this.company_qyzzc = company_qyzzc;
    }

    public String getCompany_qyzfz() {
        return company_qyzfz;
    }

    public void setCompany_qyzfz(String company_qyzfz) {
        this.company_qyzfz = company_qyzfz;
    }

    public String getIndividual_xm() {
        return individual_xm;
    }

    public void setIndividual_xm(String individual_xm) {
        this.individual_xm = individual_xm;
    }

    public String getIndividual_sfzh() {
        return individual_sfzh;
    }

    public void setIndividual_sfzh(String individual_sfzh) {
        this.individual_sfzh = individual_sfzh;
    }

    public String getIndividual_lxfs() {
        return individual_lxfs;
    }

    public void setIndividual_lxfs(String individual_lxfs) {
        this.individual_lxfs = individual_lxfs;
    }

    public String getIndividual_jjlxr() {
        return individual_jjlxr;
    }

    public void setIndividual_jjlxr(String individual_jjlxr) {
        this.individual_jjlxr = individual_jjlxr;
    }

    public String getIndividual_jjlxrlxfs() {
        return individual_jjlxrlxfs;
    }

    public void setIndividual_jjlxrlxfs(String individual_jjlxrlxfs) {
        this.individual_jjlxrlxfs = individual_jjlxrlxfs;
    }

    public String getIndividual_zy() {
        return individual_zy;
    }

    public void setIndividual_zy(String individual_zy) {
        this.individual_zy = individual_zy;
    }

    public String getIndividual_gs() {
        return individual_gs;
    }

    public void setIndividual_gs(String individual_gs) {
        this.individual_gs = individual_gs;
    }

    public String getIndividual_grsr() {
        return individual_grsr;
    }

    public void setIndividual_grsr(String individual_grsr) {
        this.individual_grsr = individual_grsr;
    }

    public String getIndividual_jtsr() {
        return individual_jtsr;
    }

    public void setIndividual_jtsr(String individual_jtsr) {
        this.individual_jtsr = individual_jtsr;
    }

    public String getIndividual_hy() {
        return individual_hy;
    }

    public void setIndividual_hy(String individual_hy) {
        this.individual_hy = individual_hy;
    }

    public String getIndividual_dflxr() {
        return individual_dflxr;
    }

    public void setIndividual_dflxr(String individual_dflxr) {
        this.individual_dflxr = individual_dflxr;
    }

    public String getIndividual_dflxfs() {
        return individual_dflxfs;
    }

    public void setIndividual_dflxfs(String individual_dflxfs) {
        this.individual_dflxfs = individual_dflxfs;
    }

    public String getLoaninfo_jkje() {
        return loaninfo_jkje;
    }

    public void setLoaninfo_jkje(String loaninfo_jkje) {
        this.loaninfo_jkje = loaninfo_jkje;
    }

    public String getLoaninfo_jksj() {
        return loaninfo_jksj;
    }

    public void setLoaninfo_jksj(String loaninfo_jksj) {
        this.loaninfo_jksj = loaninfo_jksj;
    }

    public String getLoaninfo_hkfs() {
        return loaninfo_hkfs;
    }

    public void setLoaninfo_hkfs(String loaninfo_hkfs) {
        this.loaninfo_hkfs = loaninfo_hkfs;
    }

    public String getLoaninfo_zyhkly() {
        return loaninfo_zyhkly;
    }

    public void setLoaninfo_zyhkly(String loaninfo_zyhkly) {
        this.loaninfo_zyhkly = loaninfo_zyhkly;
    }

    public String getReviewinfo_shzt() {
        return reviewinfo_shzt;
    }

    public void setReviewinfo_shzt(String reviewinfo_shzt) {
        this.reviewinfo_shzt = reviewinfo_shzt;
    }

    public String getReviewinfo_shjg() {
        return reviewinfo_shjg;
    }

    public void setReviewinfo_shjg(String reviewinfo_shjg) {
        this.reviewinfo_shjg = reviewinfo_shjg;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getLastupdate_time() {
        return lastupdate_time;
    }

    public void setLastupdate_time(Date lastupdate_time) {
        this.lastupdate_time = lastupdate_time;
    }

    public String getWeixin_number() {
        return weixin_number;
    }

    public void setWeixin_number(String weixin_number) {
        this.weixin_number = weixin_number;
    }
}
