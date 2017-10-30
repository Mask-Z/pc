package com.ccjt.ejy.web.vo;
// default package

/**
 * SysUser entity. @author MyEclipse Persistence Tools
 */

public class SysUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String loginname;
	private String name;
	private String pwd;
	private String roleId;
	private String departmentid;
	private Integer unitid;
	private String position;
	private String mobile;
	private String email;
	private String address;
	private String logintime;
	private Integer deleteState;
	private Integer useState;
	private Integer showorder;

	// Constructors

	/** default constructor */
	public SysUser() {
	}

	/** full constructor */
	public SysUser(String loginname, String name, String pwd, String roleId,
			String departmentid, Integer unitid, String position,
			String mobile, String email, String address, String logintime,
			Integer deleteState, Integer useState, Integer showorder) {
		this.loginname = loginname;
		this.name = name;
		this.pwd = pwd;
		this.roleId = roleId;
		this.departmentid = departmentid;
		this.unitid = unitid;
		this.position = position;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.logintime = logintime;
		this.deleteState = deleteState;
		this.useState = useState;
		this.showorder = showorder;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginname() {
		return this.loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getDepartmentid() {
		return this.departmentid;
	}

	public void setDepartmentid(String departmentid) {
		this.departmentid = departmentid;
	}

	public Integer getUnitid() {
		return this.unitid;
	}

	public void setUnitid(Integer unitid) {
		this.unitid = unitid;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLogintime() {
		return this.logintime;
	}

	public void setLogintime(String logintime) {
		this.logintime = logintime;
	}

	public Integer getDeleteState() {
		return this.deleteState;
	}

	public void setDeleteState(Integer deleteState) {
		this.deleteState = deleteState;
	}

	public Integer getUseState() {
		return this.useState;
	}

	public void setUseState(Integer useState) {
		this.useState = useState;
	}

	public Integer getShoworder() {
		return this.showorder;
	}

	public void setShoworder(Integer showorder) {
		this.showorder = showorder;
	}

}