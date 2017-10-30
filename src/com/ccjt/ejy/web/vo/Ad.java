package com.ccjt.ejy.web.vo;

public class Ad {

	private Integer id;
	private String title;
	private String url;
	private String pic;
	private Integer index;
	private String begin_time;
	private String end_time;
	private Integer state;
	private String content;
	private String order_no;
	private String adtype;//广告位置
	private String isShow;
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
	public String getAdtype() {
        return adtype;
    }
    public void setAdtype(String adtype) {
        this.adtype = adtype;
    }
    public String getOrder_no() {
        return order_no;
    }
    public void setOrder_no(String order_no) {
        this.order_no = order_no;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public String getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(String begin_time) {
		this.begin_time = begin_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
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
	@Override
	public String toString() {
		return "Ad [id=" + id + ", title=" + title + ", url=" + url + ", pic="
				+ pic + ", index=" + index + ", begin_time=" + begin_time
				+ ", end_time=" + end_time + ", state=" + state + "]";
	}

	
	
}
