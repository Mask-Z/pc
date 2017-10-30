package com.ccjt.ejy.web.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

/**
 * 
 */
public class User implements Serializable {
	
	private static final long serialVersionUID = -1238806933598836923L;
	private Integer id;          //用户id 
	private String name;         //姓名
	private String loginname;    //登录名
	private String pwd;          //登录密码
	private String role_name;     //角色名称 
	private Integer type;//0 无   1  部门负责人   2  公司负责人  3 所有
	private Integer role_id;//角色主键ID 
	public Integer getType() {
		return type;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public void setType(Integer type) {
		this.type = type;
	}

	
	
}