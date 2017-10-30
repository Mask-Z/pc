package com.ccjt.ejy.web.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


public class Menu implements Serializable{

	private static final long serialVersionUID = 7202983241390627671L;
	private Integer id;     //菜单id
	private Integer par_id; //节点ID
	private String name;    //菜单名称
	private String url;     //访问路径
	private String text;    //菜单名称
	private String state;   //菜单状态（打开、关闭）
	private Map<String,String> attributes;
	private List<Menu> children;  //菜单值显示
	private Integer role_id; //角色ID
	private Integer menu_id; //菜单ID
	
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public Integer getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(Integer menu_id) {
		this.menu_id = menu_id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Map<String, String> getAttributes() {
		return attributes;
	}
	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}
	public List<Menu> getChildren() {
		return children;
	}
	public void setChildren(List<Menu> children) {
		this.children = children;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPar_id() {
		return par_id;
	}
	public void setPar_id(Integer par_id) {
		this.par_id = par_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
