package com.ccjt.ejy.web.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

/**
 * @version 角色类
 * @author 赵永杰
 * @date 2014-07-14
 * @modify
 * 
 */
public class Role implements Serializable{

	private static final long serialVersionUID = -1459985867725027002L;
	private Integer id;      //角色ID
	private String name;     //角色名称
	private String ids;      //所有菜单id 
	private Integer menu_id;//方便重Role_menu中查询菜单权限
	private Integer delete_state;//删除状态
    private String remarks;  //备注 
    private String note;
    private String menuid;
    
    public String getMenuid() {
		return menuid;
	}

	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Role() {
		 
	}
	 
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
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
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Integer getDelete_state() {
		return delete_state;
	}
	public void setDelete_state(Integer delete_state) {
		this.delete_state = delete_state;
	}
	
	@Override
	public boolean equals(Object obj) { 
		return EqualsBuilder.reflectionEquals(this,obj);
	}
	
	@Override
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}

	public Integer getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(Integer menu_id) {
		this.menu_id = menu_id;
	}
}









