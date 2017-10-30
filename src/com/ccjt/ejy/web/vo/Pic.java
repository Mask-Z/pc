package com.ccjt.ejy.web.vo;

public class Pic implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3932733211308108113L;
	private String path;
	private String bpath;
	private String type;
	private String title;

	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getBpath() {
		return bpath;
	}
	public void setBpath(String bpath) {
		this.bpath = bpath;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "Pic [path=" + path + ", bpath=" + bpath + ", type=" + type
				+ "]";
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	
	
	
}
