package com.ccjt.ejy.web.vo;

import java.util.Date;
/**
 * 询价公告信息
 * @author jdandian.com
 * @date 2017年08月31日
 */
public class PurchaseNotice {
    /**
     * id
     */
    private Integer id;
    /**
     * 逻辑删除[0正常 1已删除]
     */
    private int isdelete;
    /**
     * 展示顺序，越大越靠前
     */
    private int showorder;
    /**
     * 分包编号：外键
     */
    private String sectionNo;
    /**
     * 下一步处理级别
     */
    private Integer level;
    /**
     * 公告标题
     */
    private String title;
    /**
     * 公告内容
     */
    private String content;
    /**
     * 报名开始日期：yyyy-MM-dd
     */
    private String signBeginDate;
    /**
     * 报名结束日期：yyyy-MM-dd 
     */
    private String signEndDate;
    
    /**
     * 保证金(元)
     */
    private String guaranteePrice;
    /**
     * 保证金缴纳截止日期：yyyy-MM-dd 
     */
    private String guaranteeEndDate;
    
  
	/**
     * 交货时间
     */
    private String dealTime;
    /**
     * 交货地点
     */
    private String dealSite;
    /**
     * 交易方式[网上询价,招标采购]
     */
    private String tradeType;
    /**
     * 报价方式[1:一次性报价 2:多轮次报价],交易方式为网上询价的时候才需要选
     */
    private String offerType;
    /**
     * 是否允许报数量[1:是 0:否],网上询价一次性报价才需要选
     */
    private int reportNum;
    /**
     * 公告模板选择(默认-1表示不使用公告模板)
     */
    private int noticeTemplateId;
    /**
     * 供应商类别(以;分隔)：b_dictionary外键
     */
    private String cateId;
    /**
     * 银行接口
     */
    private String bankId;
    /**
     * 报价开始时间(一次性报价)
     */
    private String oneBeginTime;
    /**
     * 报价结束时间(一次性报价)
     */
    private String oneEndTime;
    /**
     * 最高限价（一次性报价）
     */
    private String maxoffer;
    /**
     * 报价开始日期(多轮次报价) 
     */
    private String offerBeginDate;
    /**
     * 竞价时长(分钟) (多轮次报价)
     */
    private Integer offerTimes;
    /**
     * 延长周期(秒) (多轮次报价)
     */
    private Integer offerInterval;
    /**
     * 起始价(元) (多轮次报价)
     */
    private String initialPrice;
    /**
     * 竞价阶梯(元) (多轮次报价)
     */
    private String stepPrice;
    /**
     * 上传标书(招标采购)
     */
    private String bidDoc;
    /**
     * 标书费
     */
    private String bidDocMoney;
    /**
     * 标书下载开始时间
     */
    private String bidDocDownloadtime;
    /**
     * 修改时间
     */
    private Date lastupdateTime;
    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 分包名称
     */
    private String sectionName;
    
    /**
     * 报名状态
     */
    private int signInfoCount;
    /**
     * 保证金 有效无效   
     */
    private Integer isPayed;
    /**
     * 有效保证金   
     */
    private String effectiveDeposit;
    /**
     * 创建人id
     */
    private String createuserId;
    /**
     * 记录公告归属企业或个人的三证合一码或者身份证
     */
    private String idcode;
    /**
     * 点击数
     */
    private Integer hitcount;
    /**
     * 采购单位
     */
    private String purchaseCompany;
    /**
     * 采购方式
     */
    private String acquireType;
    /**
     * 最近标书下载时间
     */
    
    private String payType;
    public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public int getPaystate() {
		return paystate;
	}
	public void setPaystate(int paystate) {
		this.paystate = paystate;
	}
	private int paystate;
    private String downTime;
    public String getDownTime() {
		return downTime;
	}
	public void setDownTime(String downTime) {
		this.downTime = downTime;
	}
	public String getPrintTime() {
		return printTime;
	}
	public void setPrintTime(String printTime) {
		this.printTime = printTime;
	}
	/**
     * 最近发票下载时间
     */
    private String printTime;
    
    private String providerName;
    /**
     * 1正常 -2废标 -1流标
     */
    private Integer status;
    /**
     * 流标时间
     */
    private String exileTime;
    /**
     * 废标时间
     */
    private String discardTime;
    /**
     * 手动流标操作人员
     */
    private String exileuserId;
    /**
     * 废标操作人员
     */
    private String discarduserId;
    
    public String getProviderName() {
		return providerName;
	}
	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}
	public String getProviderPrincipal() {
		return providerPrincipal;
	}
	public void setProviderPrincipal(String providerPrincipal) {
		this.providerPrincipal = providerPrincipal;
	}
	public String getProviderCompanyPhone() {
		return providerCompanyPhone;
	}
	public void setProviderCompanyPhone(String providerCompanyPhone) {
		this.providerCompanyPhone = providerCompanyPhone;
	}
	public String getProviderPhone() {
		return providerPhone;
	}
	public void setProviderPhone(String providerPhone) {
		this.providerPhone = providerPhone;
	}
	public String getProviderFax() {
		return providerFax;
	}
	public void setProviderFax(String providerFax) {
		this.providerFax = providerFax;
	}
	public String getProviderEmail() {
		return providerEmail;
	}
	public void setProviderEmail(String providerEmail) {
		this.providerEmail = providerEmail;
	}
	/**
     * 供应商负责人
     */
    private String providerPrincipal;
    /**
     * 公司电话
     */
    private String providerCompanyPhone;
    /**
     * 联系手机
     */
    private String providerPhone;
    
    
    /**
     * 传真
     */
    private String providerFax;
    /**
     * Email
     */
    private String providerEmail;
    /**
     * 供应商ID
     */
    private String providerId;
    
    public String getProviderId() {
		return providerId;
	}
	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}
	private String guaranteeEndDateTime;
    public String getGuaranteeEndDateTime() {
		return guaranteeEndDateTime;
	}
	public void setGuaranteeEndDateTime(String guaranteeEndDateTime) {
		this.guaranteeEndDateTime = guaranteeEndDateTime;
	}
    public String getAcquireType() {
		return acquireType;
	}
	public void setAcquireType(String acquireType) {
		this.acquireType = acquireType;
	}
	public String getPurchaseCompany() {
		return purchaseCompany;
	}
	public void setPurchaseCompany(String purchaseCompany) {
		this.purchaseCompany = purchaseCompany;
	}

	public int getIsPayed() {
		return isPayed;
	}
	public void setIsPayed(int isPayed) {
		this.isPayed = isPayed;
	}
	public int getSignInfoCount() {
		return signInfoCount;
	}
	public void setSignInfoCount(int signInfoCount) {
		this.signInfoCount = signInfoCount;
	}
	public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
    }
    public String getSectionName() {
        return sectionName;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public int getIsdelete() {
        return isdelete;
    }
    public void setIsdelete(int isdelete) {
        this.isdelete = isdelete;
    }
    public int getShoworder() {
        return showorder;
    }
    public void setShoworder(int showorder) {
        this.showorder = showorder;
    }
    public String getSectionNo() {
        return sectionNo;
    }
    public void setSectionNo(String sectionNo) {
        this.sectionNo = sectionNo;
    }
    public Integer getLevel() {
        return level;
    }
    public void setLevel(Integer level) {
        this.level = level;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getDealSite() {
        return dealSite;
    }
    public void setDealSite(String dealSite) {
        this.dealSite = dealSite;
    }
    public String getTradeType() {
        return tradeType;
    }
    public void setTradeType(String tradeType) {
        this.tradeType = tradeType;
    }
    public String getOfferType() {
        return offerType;
    }
    public void setOfferType(String offerType) {
        this.offerType = offerType;
    }
    public Integer getReportNum() {
        return reportNum;
    }
    public void setReportNum(Integer reportNum) {
        this.reportNum = reportNum;
    }
    public Integer getNoticeTemplateId() {
        return noticeTemplateId;
    }
    public void setNoticeTemplateId(Integer noticeTemplateId) {
        this.noticeTemplateId = noticeTemplateId;
    }
    public String getCateId() {
        return cateId;
    }
    public void setCateId(String cateId) {
        this.cateId = cateId;
    }
    public String getBankId() {
        return bankId;
    }
    public void setBankId(String bankId) {
        this.bankId = bankId;
    }
    public Integer getOfferTimes() {
        return offerTimes;
    }
    public void setOfferTimes(Integer offerTimes) {
        this.offerTimes = offerTimes;
    }
    public Integer getOfferInterval() {
        return offerInterval;
    }
    public void setOfferInterval(Integer offerInterval) {
        this.offerInterval = offerInterval;
    }
    public String getBidDoc() {
        return bidDoc;
    }
    public void setBidDoc(String bidDoc) {
        this.bidDoc = bidDoc;
    }
    public String getCreateuserId() {
        return createuserId;
    }
    public void setCreateuserId(String createuserId) {
        this.createuserId = createuserId;
    }
    public String getIdcode() {
        return idcode;
    }
    public void setIdcode(String idcode) {
        this.idcode = idcode;
    }
    public Integer getHitcount() {
        return hitcount;
    }
    public void setHitcount(Integer hitcount) {
        this.hitcount = hitcount;
    }
    public String getSignBeginDate() {
        return signBeginDate;
    }
    public void setSignBeginDate(String signBeginDate) {
        this.signBeginDate = signBeginDate;
    }
    public String getSignEndDate() {
        return signEndDate;
    }
    public void setSignEndDate(String signEndDate) {
        this.signEndDate = signEndDate;
    }
    public String getGuaranteeEndDate() {
        return guaranteeEndDate;
    }
    public void setGuaranteeEndDate(String guaranteeEndDate) {
        this.guaranteeEndDate = guaranteeEndDate;
    }
    public String getDealTime() {
        return dealTime;
    }
    public void setDealTime(String dealTime) {
        this.dealTime = dealTime;
    }
    public String getOneBeginTime() {
        if("".equals(oneBeginTime)){
            oneBeginTime = null;
        }
        return oneBeginTime;
    }
    public void setOneBeginTime(String oneBeginTime) {
        this.oneBeginTime = oneBeginTime;
    }
    public String getOneEndTime() {
        if("".equals(oneEndTime)){
            oneEndTime=null;
        }
        return oneEndTime;
    }
    public void setOneEndTime(String oneEndTime) {
        this.oneEndTime = oneEndTime;
    }
    public String getOfferBeginDate() {
        if("".equals(offerBeginDate)){
            offerBeginDate=null;
        }
        return offerBeginDate;
    }
    public void setOfferBeginDate(String offerBeginDate) {
        this.offerBeginDate = offerBeginDate;
    }
    public String getBidDocDownloadtime() {
        if("".equals(bidDocDownloadtime)){
            bidDocDownloadtime=null;
        }
        return bidDocDownloadtime;
    }
    public void setBidDocDownloadtime(String bidDocDownloadtime) {
        this.bidDocDownloadtime = bidDocDownloadtime;
    }
    public Date getLastupdateTime() {
        return lastupdateTime;
    }
    public void setLastupdateTime(Date lastupdateTime) {
        this.lastupdateTime = lastupdateTime;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public String getGuaranteePrice() {
        return guaranteePrice;
    }
    public void setGuaranteePrice(String guaranteePrice) {
        this.guaranteePrice = guaranteePrice;
    }
    public String getMaxoffer() {
        if("".equals(maxoffer)){
            maxoffer = null;
        }
        return maxoffer;
    }
    public void setMaxoffer(String maxoffer) {
        this.maxoffer = maxoffer;
    }
    public String getInitialPrice() {
        if("".equals(initialPrice)){
            initialPrice=null;
        }
        return initialPrice;
    }
    public void setInitialPrice(String initialPrice) {
        this.initialPrice = initialPrice;
    }
    public String getStepPrice() {
        if("".equals(stepPrice)){
            stepPrice=null;
        }
        return stepPrice;
    }
    public void setStepPrice(String stepPrice) {
        this.stepPrice = stepPrice;
    }
    public String getBidDocMoney() {
        return bidDocMoney;
    }
    public void setBidDocMoney(String bidDocMoney) {
        this.bidDocMoney = bidDocMoney;
    }
    public String getEffectiveDeposit() {
        return effectiveDeposit;
    }
    public void setEffectiveDeposit(String effectiveDeposit) {
        this.effectiveDeposit = effectiveDeposit;
    }
    public void setReportNum(int reportNum) {
        this.reportNum = reportNum;
    }
    public void setNoticeTemplateId(int noticeTemplateId) {
        this.noticeTemplateId = noticeTemplateId;
    }
    public void setIsPayed(Integer isPayed) {
        this.isPayed = isPayed;
    }
    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
    public String getExileTime() {
        return exileTime;
    }
    public void setExileTime(String exileTime) {
        this.exileTime = exileTime;
    }
    public String getDiscardTime() {
        return discardTime;
    }
    public void setDiscardTime(String discardTime) {
        this.discardTime = discardTime;
    }
    public String getExileuserId() {
        return exileuserId;
    }
    public void setExileuserId(String exileuserId) {
        this.exileuserId = exileuserId;
    }
    public String getDiscarduserId() {
        return discarduserId;
    }
    public void setDiscarduserId(String discarduserId) {
        this.discarduserId = discarduserId;
    }
    
}