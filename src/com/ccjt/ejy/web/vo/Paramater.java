package com.ccjt.ejy.web.vo;

/**
 * 接口参数对象
 * @author cjh
 *
 */
public class Paramater implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1000511020502700005L;
	private String type;
	private Object data;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
}
