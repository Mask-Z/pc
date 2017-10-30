package com.ccjt.ejy.web.vo;


import com.alibaba.fastjson.JSON;

public class Logo {
	private Integer id;
	private String jgmc;
	private String pic;
	private String bigpic;
	private String order_no;
	private String addTime;
	private String danweiName;
	private String danweiAddress;

	public String getBigpic() {
		return bigpic;
	}

	public void setBigpic(String bigpic) {
		this.bigpic = bigpic;
	}

	public String getDanweiAddress() {
		return danweiAddress;
	}

	public void setDanweiAddress(String danweiAddress) {
		this.danweiAddress = danweiAddress;
	}

	public String getDanweiName() {
		return danweiName;
	}

	public void setDanweiName(String danweiName) {
		this.danweiName = danweiName;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getJgmc() {
		return jgmc;
	}

	public void setJgmc(String jgmc) {
		this.jgmc = jgmc;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
}
