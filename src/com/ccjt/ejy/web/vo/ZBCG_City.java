package com.ccjt.ejy.web.vo;

import org.apache.commons.lang3.StringUtils;

import java.util.List;

public class ZBCG_City implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1128535851000001223L;
	
	private String code;
	private String name;
	private List<ZBCG_City> subCity;
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		if(StringUtils.isNotBlank(name)){
			name = name.replace("维吾尔", "")
					.replace("回族", "")
					.replace("自治区", "").replace("壮族", "").replace("特别行政区", "");
		}
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<ZBCG_City> getSubCity() {
		return subCity;
	}

	public void setSubCity(List<ZBCG_City> subCity) {
		this.subCity = subCity;
	}
	
	

}
