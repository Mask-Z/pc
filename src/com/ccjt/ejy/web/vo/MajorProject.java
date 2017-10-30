package com.ccjt.ejy.web.vo;

import org.apache.commons.lang3.StringUtils;

/**
 * 重点项目
 */
public class MajorProject {
	private String activityName;
	private String activityCreator;
	private String xiaQuCode;
	private String rowGuid;
	private String activityBeginTime;
	private String outLinkAddr;
	private String activityEndTime;
	private String picUrl;
	private String activityContent;
	private Integer row_ID;

	public Integer getRow_ID() {
		return row_ID;
	}

	public void setRow_ID(Integer row_ID) {
		this.row_ID = row_ID;
	}

	public String getActivityContent() {
		return activityContent;
	}

	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getActivityCreator() {
		return activityCreator;
	}

	public void setActivityCreator(String activityCreator) {
		this.activityCreator = activityCreator;
	}

	public String getXiaQuCode() {
		return xiaQuCode;
	}

	public void setXiaQuCode(String xiaQuCode) {
		this.xiaQuCode = xiaQuCode;
	}

	public String getRowGuid() {
		return rowGuid;
	}

	public void setRowGuid(String rowGuid) {
		this.rowGuid = rowGuid;
	}

	public String getActivityBeginTime() {
		return activityBeginTime;
	}

	public void setActivityBeginTime(String activityBeginTime) {
		this.activityBeginTime = activityBeginTime;
	}

	public String getOutLinkAddr() {
		if (StringUtils.isNotBlank(outLinkAddr) && !outLinkAddr.startsWith("http://")) {
			outLinkAddr = "http://" + outLinkAddr;
		}
		return outLinkAddr;
	}

	public void setOutLinkAddr(String outLinkAddr) {
		this.outLinkAddr = outLinkAddr;
	}

	public String getActivityEndTime() {
		return activityEndTime;
	}

	public void setActivityEndTime(String activityEndTime) {
		this.activityEndTime = activityEndTime;
	}
}
