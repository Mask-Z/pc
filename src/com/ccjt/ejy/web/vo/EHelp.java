package com.ccjt.ejy.web.vo;

public class EHelp {
	private Integer id;
	private String title;
	private String area;
	private String org;
	private String pic;
	private String price;
	private Integer state;	
	private String content;
	private String order_no;
    private String isShow;
    private String ehelp_projectType;
    private String ehelp_city;
	private String addTime;
	
	
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public String getIsShow() {
		return isShow;
	}
	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	
    public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}	
	public String getOrder_no() {
        return order_no;
    }
    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }
	@Override
	public String toString() {
		return "EHelp [id=" + id + ", title=" + title + ", area=" + area + ", org=" + org + ", pic="
				+ pic + ", price=" + price + ", state=" + state + ", content=" + content + ", order_no=" + order_no + "]";
	}
	public String getEhelp_projectType() {
		return ehelp_projectType;
	}
	public void setEhelp_projectType(String ehelp_projectType) {
		this.ehelp_projectType = ehelp_projectType;
	}
	public String getEhelp_city() {
		return ehelp_city;
	}
	public void setEhelp_city(String ehelp_city) {
		this.ehelp_city = ehelp_city;
	}	
}
