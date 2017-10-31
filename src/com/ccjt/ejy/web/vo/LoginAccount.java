package com.ccjt.ejy.web.vo;

public class LoginAccount implements java.io.Serializable, Cloneable {
	/**
	 *
	 */
	private static final long serialVersionUID = -1000703002130601000L;
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

	public boolean getIsFinish() {
		return isFinish;
	}

	public void setIsFinish(boolean isFinish) {
		this.isFinish = isFinish;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	@Override
	public String toString() {
		return "LoginAccount [displayName=" + displayName + ", userGuid="
				+ userGuid + ", dogNum=" + dogNum + ", danWeiGuid="
				+ danWeiGuid + ", danWeiName=" + danWeiName + ", danWeiType="
				+ danWeiType + ", companyPhone=" + companyPhone
				+ ", mobilePhone=" + mobilePhone + ", idCard=" + idCard
				+ ", isFinish=" + isFinish + ", memberType=" + memberType + "]";
	}

}
