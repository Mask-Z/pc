/**  
 * 包名：com.ccjt.ejy.web.vo  
 * 文件名：FastCaiGou.java  
 * 版本信息：V1.0  
 * 日期：2017年8月2日-上午10:04:30  
 * Copyright(c)2017
 *   
 */
package com.ccjt.ejy.web.vo;

import com.alibaba.fastjson.JSON;

import java.io.Serializable;
import java.util.Date;

/**  
 *   
 * 类名称：FastCaiGou  
 * 类描述：
 * 创建人：qiaojoy99  
 * 修改人：qiaojoy99 
 * 修改时间：2017年8月2日 上午10:04:30  
 * 修改备注：  
 * @version 1.0.0  
 *   
 */
public class FastCaiGou implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    private Date baomingstart;//报名开始时间
    private Date baomingend;//报名结束时间

    private String  baomingstart_str;//报名开始时间
    private String  baomingend_str;//报名结束时间
    private String xiaQuCode;//辖区编码
    private Date start_time;//竞价开始时间
    private Date end_time;//竞价结束时间
    private String biaoduanname;//标段名称
    private Integer clickTimes;
    private String infoID;
    private String categorynum;
    private String categoryname;
    private String xiaquname;
    private String status_name;
    private String ggtype;//公告类型

    private String projectNum;//项目编号

    public String getBaomingstart_str() {
        return baomingstart_str;
    }

    public void setBaomingstart_str(String baomingstart_str) {
        this.baomingstart_str = baomingstart_str;
    }

    public String getBaomingend_str() {
        return baomingend_str;
    }

    public void setBaomingend_str(String baomingend_str) {
        this.baomingend_str = baomingend_str;
    }

    public String getProjectNum() {
        return projectNum;
    }

    public void setProjectNum(String projectNum) {
        this.projectNum = projectNum;
    }

    public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getGgtype() {
        return ggtype;
    }
    public void setGgtype(String ggtype) {
        this.ggtype = ggtype;
    }
    public String getStatus_name() {
        return status_name;
    }
    public void setStatus_name(String status_name) {
        this.status_name = status_name;
    }
    public String getXiaquname() {
        return xiaquname;
    }
    public void setXiaquname(String xiaquname) {
        this.xiaquname = xiaquname;
    }
    public String getCategorynum() {
        return categorynum;
    }
    public void setCategorynum(String categorynum) {
        this.categorynum = categorynum;
    }
    public Integer getClickTimes() {
        return clickTimes;
    }
    public void setClickTimes(Integer clickTimes) {
        this.clickTimes = clickTimes;
    }
    public String getInfoID() {
        return infoID;
    }
    public void setInfoID(String infoID) {
        this.infoID = infoID;
    }
    public Date getBaomingstart() {
        return baomingstart;
    }
    public void setBaomingstart(Date baomingstart) {
        this.baomingstart = baomingstart;
    }
    public Date getBaomingend() {
        return baomingend;
    }
    public void setBaomingend(Date baomingend) {
        this.baomingend = baomingend;
    }
    public String getXiaQuCode() {
        return xiaQuCode;
    }
    public void setXiaQuCode(String xiaQuCode) {
        this.xiaQuCode = xiaQuCode;
    }
    public Date getStart_time() {
        return start_time;
    }
    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }
    public Date getEnd_time() {
        return end_time;
    }
    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }
    public String getBiaoduanname() {
        return biaoduanname;
    }
    public void setBiaoduanname(String biaoduanname) {
        this.biaoduanname = biaoduanname;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }

}
