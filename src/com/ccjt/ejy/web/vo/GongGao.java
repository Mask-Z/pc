package com.ccjt.ejy.web.vo;

import com.alibaba.fastjson.JSON;
import com.ccjt.ejy.web.cache.redis.JedisTemplate;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.commons.cache.RedisTemplateFactory;
import com.ccjt.ejy.web.enums.ProjectType;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 成交/交易公告
 * 
 * @author xxf
 * 
 */
public class GongGao implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1020202040884356491L;
	private static Logger log = LogManager.getLogger(GongGao.class);

	private String isCommonTemplate;//是否使用新模板 (1 使用)

	private List<String> hotLabelName;//标的热点词
	private String hotLabelName_s;//标的热点词

	private String orgPic;//机构图片地址
	private String danw;//单位
	
	private String orgLXR;//机构联系人
	private String orgPhone;//机构联系电话
	private String orgAddress;//机构联系地址
	private String danweiname;//机构名称
    private String oldprojectguid;//重新挂牌的项目对应的原项目的pjguid


	private String projectcontroltype;//项目状态   2中止   1终结  3重新挂牌  除去 1 2 都认为是正常项目
	private String  jjia_status; //竞价状态 4.竞价暂停
	private String systemtype;
	private String zt;//专厅guid
	private String allowmorejqxt;//1   二次竞价
	private String sbm;//是否显示报名信息
	private Integer count;//批量挂牌,标的数量
	private Integer allcount;//关注数
	private String isfrompricexs;//是否显示低价
	private String jingjiafangshi;//竞价方式
	private String jingjiafangshi_1;//二次竞价方式
	private int currencyunit;//币种：1是元，2是万元
	private Integer controltype;//项目状态           2中止   1终结  3重新挂牌  除去 1 2 都认为是正常项目
	private String ismiany;//面议
	private String zhuanrangftj;//与转让相关其他条件
	private String projectnum;// 项目编号
	private String title;// 公告标题
	private String projectstyle;// 项目类型
	private String projecttype;//项目类型
	private String enddate;
	private Date lastupdate;
	private String projectname;
	
	
	private String zhongdcontent;//重大事项披露
	private String chengjiaodate;//成交时间
	private Date cjdate;//成交时间
	
	private String jygg_guid;
	private String cjgg_guid;
	private String infoid;
	private String titlepic;// 标题图片
	private String categorynum;// 栏目编码
	private String categoryname;// 栏目名称
	private String ispllr;// 1 批量挂牌
	private String projectguid;// 项目编号
	private String baozhengjprice;// 保证金
	private String guapaiprice;// 挂牌价
	private Date gonggaofromdate;// 公告开始时间
	private Date gonggaotodate;// 公告截止时间
	private String currentprice;// 当前价
	private String chengjiaoprice;// 成交价
	private Integer click;// 点击数
	private Integer bmrs;// 报名人数
	private String infodate;
	private String cqywtype;//业务类型
	private String shengname;
	private String shiname;
	
	private String sheng;
	private String shi;
	private String gonggaotitle;
	private String baomingfromdate;
	private String baomingenddate;
	private String cityname;

	private String areaName;
	private String beforeTime;
	private String beforeTimeUnit;
	

	private String examinResult;
	private String isJiaoNaBZJ;

	private String chengjiaogg;//成交公告
	
	private String zzkg_zztype;
	private String zzkg_guapaitype;
	private String zzkg_guapaiprice;
	private String zzkg_guapaidj;

	public String getIsCommonTemplate() {
		return isCommonTemplate;
	}

	public void setIsCommonTemplate(String isCommonTemplate) {
		this.isCommonTemplate = isCommonTemplate;
	}

	public List<String> getHotLabelName() {
		if(hotLabelName==null){
			hotLabelName = new ArrayList<>();
			if(getHotLabelName_s()!=null){
				String ddd [] = getHotLabelName_s().split(",");
				for(String d : ddd){
					if(!"".equals(d))hotLabelName.add(d);
				}
			}
		}
		return hotLabelName;
	}

	public void setHotLabelName(List<String> hotLabelName) {
		this.hotLabelName = hotLabelName;
	}

	public String getJjia_status() {
		return jjia_status;
	}

	public void setJjia_status(String jjia_status) {
		this.jjia_status = jjia_status;
	}

	public String getProjectcontroltype() {
		return projectcontroltype;
	}

	public void setProjectcontroltype(String projectcontroltype) {
		this.projectcontroltype = projectcontroltype;
	}

	public String getChengjiaogg() {
        return chengjiaogg;
    }

    public void setChengjiaogg(String chengjiaogg) {
        this.chengjiaogg = chengjiaogg;
    }

    public String getGonggaotitle() {
		return gonggaotitle;
	}

	public void setGonggaotitle(String gonggaotitle) {
		this.gonggaotitle = gonggaotitle;
	}

	public String getBaomingfromdate() {
		return baomingfromdate;
	}

	public void setBaomingfromdate(String baomingfromdate) {
		this.baomingfromdate = baomingfromdate;
	}

	public String getBaomingenddate() {
		return baomingenddate;
	}

	public void setBaomingenddate(String baomingenddate) {
		this.baomingenddate = baomingenddate;
	}

	public String getCityname() {
		return cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	public String getShengname() {
        return shengname;
    }

    public void setShengname(String shengname) {
        this.shengname = shengname;
    }

    public String getShiname() {
        return shiname;
    }

    public void setShiname(String shiname) {
        this.shiname = shiname;
    }
    
    public String getAreaName() {
//		if(StringUtils.isNotBlank(areaName)){
//			areaName = areaName.replace("维吾尔", "").replace("省", "")
//					.replace("市", "").replace("回族", "")
//					.replace("自治区", "").replace("壮族", "");
//		}
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	public String getBeforeTime() {
        return beforeTime;
    }

    public void setBeforeTime(String beforeTime) {
        this.beforeTime = beforeTime;
    }
    
    public String getBeforeTimeUnit() {
        return beforeTimeUnit;
    }

    public void setBeforeTimeUnit(String beforeTimeUnit) {
        this.beforeTimeUnit = beforeTimeUnit;
    }

    /**
	 * 招标采购部分属性
	 */
	private String state;
	private String XiaQuCode;
	private String zgj;//最高价
	private String orgname;//机构名称
	private Integer baojiafangshi;
	private String biaoduanguid;//标段guid
	private String biaoduanbH;//标段编号
	private String xiangmulbcode;//项目类别
	
	private String jiaohuodate;//交货日期
	private String fabudate;//发布日期
	private Integer bjtotalnum;//报价次数
	
	private Date jingjiastartdate;
	private Date jingjiaenddate;
	private String hotlable;
	private Integer orderbyno;//排序字段
	
	
	/**
	 * 0  未开始<br>
	 * 1 报名中<br>
	 * 2 报名已截止<br>
	 * 3 竞价未开始<br>
	 * 4  竞价中<br>
	 * 5 竞价已截止<br>
	 * 6 已成交<br>
	 */
	private Integer status;//自定义状态
	private String status_name;//自定义状态

	public String getXiaQuCode() {
		return XiaQuCode;
	}

	public void setXiaQuCode(String xiaQuCode) {
		XiaQuCode = xiaQuCode;
	}

	private Date jingjia_start;//竞价开始时间
	private Date jingjia_end;//竞价结束时间

	private String s0;// 省市code
	private String s1;// 省
	private String s2;// 市
	private Integer id;
	private String content;
	private String info_date;
	private String start_date;
	private String end_date;
	private String description;// 资产描述
	private String zgtj;// 受让方资格条件
	private String project_no;
	private String baoliuprice;
	private String haspriority;// 优先购买权
	private List<Pic> picList;

	private String hasBuyIntent; //企业管理层是否参与受让(股权)
	private String  hasInvestIntent; //企业管理层或员工是否有参与融资意向(增资扩股)

	public String getHasBuyIntent() {
		return hasBuyIntent;
	}

	public void setHasBuyIntent(String hasBuyIntent) {
		this.hasBuyIntent = hasBuyIntent;
	}

	public String getHasInvestIntent() {
		return hasInvestIntent;
	}

	public void setHasInvestIntent(String hasInvestIntent) {
		this.hasInvestIntent = hasInvestIntent;
	}

	public String getChengjiaodate() {
		if(StringUtils.isNotBlank(chengjiaodate) && chengjiaodate.length() > 19){
			chengjiaodate = chengjiaodate.substring(0,19);
		}
		
		return chengjiaodate;
	}

	public void setChengjiaodate(String chengjiaodate) {
		this.chengjiaodate = chengjiaodate;
	}

	private Integer chengjiao;// 是否成交

	private String gonggaofromdate_str;
	private String gonggaotodate_str;
	
	private String jingjiastartdate_str;
	private String jingjiaenddate_str;
	
	private String source;

	public String getTitlepic() {
//		if (StringUtils.isBlank(titlepic)) {
//			if (getCategoryname() != null || getProjectstyle()!=null) {
//				String typename = getCategoryname()==null?getProjectstyle():getCategoryname();
//				ProjectType type = ProjectType.get(typename);
//				if (type != null) {
//					titlepic = type.getPic();
//				}
//			}
//		}
		if (StringUtils.isBlank(titlepic)) {
			log.info("获取默认图片开始.......");
			if (StringUtils.isNotBlank(title)&&(title.equals("常州市新北区汤庄桥小学部分资产电子竞价公告")||title.equals("常州市田家炳高级中学等单位部分资产电子竞价公告") ||title.equals("常州市市北实验初级中学等单位部分资产电子竞价公告")
					||title.equals("常州市城市照明工程有限公司部分资产电子竞价公告")||title.equals("常州市第一人民医院部分资产电子竞价公告")||title.equals("灶台等报废厨房用具一批电子竞价公告"))){
				setXiaQuCode("101001");
			}
			if (null != getXiaQuCode()) {
				String code = getXiaQuCode();
				JedisTemplate redis = null;
				try {
					redis = RedisTemplateFactory.template.getJedisTemplate();
					String key = RedisKeys.COMPANY_LOGO_KEY;
					String json = redis.hget(key, code);
					Logo logo = JSON.parseObject(json, Logo.class);
					if (null != logo) {
						titlepic = logo.getBigpic();
					}
					log.info("获取默认图片结束.......");
				} catch (Exception e) {
					log.error("获取公司logo缓存出错:" + e);
					e.printStackTrace();
				}
			}
		}
		return titlepic;
	}

	public void setTitlepic(String titlepic) {
		this.titlepic = titlepic;
	}

	public String getProjectnum() {
		return projectnum;
	}

	public void setProjectnum(String projectnum) {
		this.projectnum = projectnum;
	}

	public String getTitle() {
		if(StringUtils.isNotBlank(title)){
			if(title.startsWith("[")){
				int index = title.indexOf("]");
				if(index > 0){
					title = title.substring(index+1);
				}
			}
			
		}
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getProjectstyle() {

		ProjectType pt = ProjectType.get(projectstyle);
		if(pt!=null){
			return pt.getName();
		}
		
		return projectstyle;
	}
	
	public void setProjecttype(String projecttype){
		this.projecttype =projecttype;
	}
	
	public String getProjecttype(){
		ProjectType pt = ProjectType.get(projectstyle);
		if(pt!=null){
			return pt.getCode();
		}
		return projecttype;
	}

	public void setProjectstyle(String projectstyle) {
		this.projectstyle = projectstyle;
	}

	public String getEnddate() {
		if(StringUtils.isNotBlank(enddate) && enddate.length() > 19){
			enddate = enddate.substring(0,19);
		}
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public Date getLastupdate() {
		return lastupdate;
	}

	public void setLastupdate(Date lastupdate) {
		this.lastupdate = lastupdate;
	}

	public String getInfoid() {
		return infoid;
	}

	public void setInfoid(String infoid) {
		this.infoid = infoid;
	}

	public String getCategorynum() {
		return categorynum;
	}

	public void setCategorynum(String categorynum) {
		this.categorynum = categorynum;
	}

	public String getInfodate() {
		try {
			if (StringUtils.isNotBlank(infodate)) {
				SimpleDateFormat sdf = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				infodate = sdf1.format(sdf.parse(infodate));
			}
		} catch (Exception e) {
		}
		return infodate;
	}

	public void setInfodate(String infodate) {
		this.infodate = infodate;
	}

	public String getBaozhengjprice() {
		try {
			if (StringUtils.isNotBlank(baozhengjprice) && !baozhengjprice.equals("0.00") && baozhengjprice.indexOf(",")<0) {
				DecimalFormat df = new DecimalFormat("###,###,###,###,###,###,###.00");
				double gpj = Double.valueOf(baozhengjprice);
				baozhengjprice = df.format(gpj);
				if (baozhengjprice.indexOf(".")==0){
					baozhengjprice="0"+baozhengjprice;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return baozhengjprice;
	}

	public void setBaozhengjprice(String baozhengjprice) {
		this.baozhengjprice = baozhengjprice;
	}

	public String getGuapaiprice() {
		try {
			if (StringUtils.isNotBlank(guapaiprice)){
				if (guapaiprice.indexOf("-")<0 && guapaiprice.indexOf("*") < 0 && !"1".equals(getIsmiany()) && guapaiprice.indexOf(",")<0){
					DecimalFormat df = new DecimalFormat("###,###,###,###,###,###,###.00");
					double gpj = Double.valueOf(guapaiprice);
					guapaiprice = df.format(gpj);
				}
			}else{
				guapaiprice = "-";
			}
			if("3".equals(getJingjiafangshi())){
				if(!"1".equals(getIsfrompricexs())){
					guapaiprice = "-";
				}
			}

			if("1".equals(getIsmiany())){
				guapaiprice = "面议";
			}

			if (guapaiprice.indexOf(".")==0){
				guapaiprice="0"+guapaiprice;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return guapaiprice;
	}

	public void setGuapaiprice(String guapaiprice) {

		this.guapaiprice = guapaiprice;
	}

	public Date getGonggaofromdate() {
		return gonggaofromdate;
	}

	public void setGonggaofromdate(Date gonggaofromdate) {
		this.gonggaofromdate = gonggaofromdate;
	}

	public Date getGonggaotodate() {
		return gonggaotodate;
	}

	public void setGonggaotodate(Date gonggaotodate) {
		this.gonggaotodate = gonggaotodate;
	}

	public String getChengjiaoprice() {
		
		try {
			if (StringUtils.isNotBlank(chengjiaoprice) && chengjiaoprice.indexOf(",")<0) {
				DecimalFormat df = new DecimalFormat("###,###,###,###,###,###,###.00");
				double gpj = Double.valueOf(chengjiaoprice);
				chengjiaoprice = df.format(gpj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return chengjiaoprice;
	}

	public void setChengjiaoprice(String chengjiaoprice) {
		this.chengjiaoprice = chengjiaoprice;
	}

	public String getProjectguid() {
		return projectguid;
	}

	public void setProjectguid(String projectguid) {
		this.projectguid = projectguid;
	}

	public String getCurrentprice() {
		try {
			if (StringUtils.isBlank(currentprice) && !"面议".equals(getGuapaiprice())) {
				currentprice = getGuapaiprice();
			}
			if (StringUtils.isNotBlank(currentprice) && currentprice.indexOf("-") < 0 && currentprice.indexOf(",")<0) {
				
//				DecimalFormat df = new DecimalFormat("0.00");
				DecimalFormat df = new DecimalFormat("###,###,###,###,###,###,###.00");
				double gpj = Double.valueOf(currentprice);
				currentprice = df.format(gpj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return currentprice;
	}

	public void setCurrentprice(String currentprice) {
		this.currentprice = currentprice;
	}

	public String getGonggaofromdate_str() {
		if (gonggaofromdate != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sdf.format(gonggaofromdate);
		}
		return "";
	}

	public void setGonggaofromdate_str(String gonggaofromdate_str) {

		this.gonggaofromdate_str = gonggaofromdate_str;
	}

	public String getGonggaotodate_str() {
		if (gonggaotodate != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sdf.format(gonggaotodate);
		}
		return "";
	}

	public void setGonggaotodate_str(String gonggaotodate_str) {
		this.gonggaotodate_str = gonggaotodate_str;
	}

	public Integer getClick() {
		return click;
	}

	public void setClick(Integer click) {
		this.click = click;
	}

	public Integer getChengjiao() {
		return chengjiao;
	}

	public void setChengjiao(Integer chengjiao) {
		this.chengjiao = chengjiao;
	}

	public Integer getBmrs() {
		if(bmrs==null){
			bmrs = 0;
		}
		return bmrs;
	}

	public void setBmrs(Integer bmrs) {
		this.bmrs = bmrs;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getInfo_date() {
		return info_date;
	}

	public void setInfo_date(String info_date) {
		this.info_date = info_date;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getDescription() {
//		if(StringUtils.isBlank(description)){
//			return "详见公告";
//		}
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getZgtj() {
//		if(StringUtils.isBlank(zgtj)){
//			return "详见公告";
//		}
		return zgtj;
	}

	public void setZgtj(String zgtj) {
		this.zgtj = zgtj;
	}

	public String getProject_no() {
		return project_no;
	}

	public void setProject_no(String project_no) {
		this.project_no = project_no;
	}

	public String getBaoliuprice() {
		return baoliuprice;
	}

	public void setBaoliuprice(String baoliuprice) {
		this.baoliuprice = baoliuprice;
	}

	public String getHaspriority() {
		return haspriority;
	}

	public void setHaspriority(String haspriority) {
		this.haspriority = haspriority;
	}

	public List<Pic> getPicList() {
		return picList;
	}

	public void setPicList(List<Pic> picList) {
		this.picList = picList;
	}

	public String getJygg_guid() {
		return jygg_guid;
	}

	public void setJygg_guid(String jygg_guid) {
		this.jygg_guid = jygg_guid;
	}

	public String getS1() {
		return s1;
	}

	public void setS1(String s1) {
		this.s1 = s1;
	}

	public String getS2() {
		return s2;
	}

	public void setS2(String s2) {
		this.s2 = s2;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public String getIspllr() {
		return ispllr;
	}

	public void setIspllr(String ispllr) {
		this.ispllr = ispllr;
	}
	
	public Date getJingjia_start() {
		return jingjia_start;
	}

	public void setJingjia_start(Date jingjia_start) {
		this.jingjia_start = jingjia_start;
	}

	public Date getJingjia_end() {
		return jingjia_end;
	}

	public void setJingjia_end(Date jingjia_end) {
		this.jingjia_end = jingjia_end;
	}

	public String getCjgg_guid() {
		return cjgg_guid;
	}

	public void setCjgg_guid(String cjgg_guid) {
		this.cjgg_guid = cjgg_guid;
	}
	/**
	 * 0  未开始<br>
	 * 1 报名中<br>
	 * 2 报名已截止<br>
	 * 3 竞价未开始<br>
	 * 4  竞价中<br>
	 * 5 竞价已截止<br>
	 * 6 已成交<br>
	 */
	public Integer getStatus() {
		return status;
	}
	/**
	 * 0  未开始<br>
	 * 1 报名中<br>
	 * 2 报名已截止<br>
	 * 3 竞价未开始<br>
	 * 4  竞价中<br>
	 * 5 竞价已截止<br>
	 * 6 已成交<br>
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	
	/**
	 * 0  未开始<br>
	 * 1 报名中<br>
	 * 2 报名已截止<br>
	 * 3 竞价未开始<br>
	 * 4  竞价中<br>
	 * 5 竞价已截止<br>
	 * 6 已成交<br>
	 */
	public String getStatus_name() {

//		if(status!=null){
//
//			if (status == 0) {
//				return "未开始";
//			} else if (status == 1) {
//				return "报名中";
//			} else if (status == 2) {
//				return "报名已截止";
//			} else if (status == 3) {
//				return "竞价未开始";
//			} else if (status == 4) {
//				return "竞价中";
//			} else if (status == 5) {
//				return "竞价已截止";
//			} else if (status == 6) {
//				return "已成交";
//			} else {
//				return "";
//			}
//		}

		return status_name;
	}

	public String getSystemtype() {
		return systemtype;
	}

	public void setSystemtype(String systemtype) {
		this.systemtype = systemtype;
	}

	public int getCurrencyunit() {
		return currencyunit;
	}

	public void setCurrencyunit(int currencyunit) {
		this.currencyunit = currencyunit;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public String getZhongdcontent() {
//		if(StringUtils.isBlank(zhongdcontent)){
//			return "详见公告";
//		}
		return zhongdcontent;
	}

	public void setZhongdcontent(String zhongdcontent) {
		this.zhongdcontent = zhongdcontent;
	}

	
	public String getJingjiafangshi() {
		return jingjiafangshi;
	}

	public void setJingjiafangshi(String jingjiafangshi) {
		this.jingjiafangshi = jingjiafangshi;
	}
	
	public String getState() {
		if(state==null){
			state = "";
		}
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZgj() {
		
		try {
			if (StringUtils.isNotBlank(zgj)){
				if (zgj.indexOf("-")<0 && zgj.indexOf(",")<0){
					DecimalFormat df = new DecimalFormat("###,###,###,###,###,###,###.00");
					double temp_zgj = Double.valueOf(zgj);
					if(temp_zgj > 0){
						zgj = df.format(temp_zgj);
					}else{
						zgj = "-";
					}
				}
			}else{
				zgj = "-";
			}
//			if (StringUtils.isNotBlank(zgj) && zgj.indexOf("-")<0 && zgj.indexOf(",")<0) {
//				DecimalFormat df = new DecimalFormat("###,###,###,###,###,###,###.00");
//				double temp_zgj = Double.valueOf(zgj);
//				if(temp_zgj > 0){
//					zgj = df.format(temp_zgj);
//				}else{
//					zgj = "-";
//				}
//
//			}else{
//				zgj = "-";
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return zgj;
	}

	public void setZgj(String zgj) {
		this.zgj = zgj;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public Integer getBaojiafangshi() {
		return baojiafangshi;
	}

	public void setBaojiafangshi(Integer baojiafangshi) {
		this.baojiafangshi = baojiafangshi;
	}

	public String getBiaoduanguid() {
		return biaoduanguid;
	}

	public void setBiaoduanguid(String biaoduanguid) {
		this.biaoduanguid = biaoduanguid;
	}

	public String getBiaoduanbH() {
		return biaoduanbH;
	}

	public void setBiaoduanbH(String biaoduanbH) {
		this.biaoduanbH = biaoduanbH;
	}

	public String getXiangmulbcode() {
		return xiangmulbcode;
	}

	public void setXiangmulbcode(String xiangmulbcode) {
		this.xiangmulbcode = xiangmulbcode;
	}

	public String getJiaohuodate() {
		return jiaohuodate;
	}

	public void setJiaohuodate(String jiaohuodate) {
		this.jiaohuodate = jiaohuodate;
	}

	public String getFabudate() {
		return fabudate;
	}

	public void setFabudate(String fabudate) {
		this.fabudate = fabudate;
	}

	public Integer getBjtotalnum() {
		return bjtotalnum;
	}

	public void setBjtotalnum(Integer bjtotalnum) {
		this.bjtotalnum = bjtotalnum;
	}
	
	public String getZhuanrangftj() {
		return zhuanrangftj;
	}

	public void setZhuanrangftj(String zhuanrangftj) {
		this.zhuanrangftj = zhuanrangftj;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	public Date getCjdate() {
		return cjdate;
	}

	public void setCjdate(Date cjdate) {
		this.cjdate = cjdate;
	}
	
	public String getIsfrompricexs() {
		return isfrompricexs;
	}

	public void setIsfrompricexs(String isfrompricexs) {
		this.isfrompricexs = isfrompricexs;
	}
	
	

	public String getSbm() {
		return sbm;
	}

	public void setSbm(String sbm) {
		this.sbm = sbm;
	}

	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	
	
	public Integer getControltype() {
		return controltype;
	}

	public void setControltype(Integer controltype) {
		this.controltype = controltype;
	}

	public String getIsmiany() {
		return ismiany;
	}

	public void setIsmiany(String ismiany) {
		this.ismiany = ismiany;
	}
	


	public String getAllowmorejqxt() {
		return allowmorejqxt;
	}

	public void setAllowmorejqxt(String allowmorejqxt) {
		this.allowmorejqxt = allowmorejqxt;
	}

	public String getCqywtype() {
		return cqywtype;
	}

	public void setCqywtype(String cqywtype) {
		this.cqywtype = cqywtype;
	}


	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}

	public String getSheng() {
		return sheng;
	}

	public void setSheng(String sheng) {
		this.sheng = sheng;
	}

	public String getShi() {
		return shi;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public String getExaminResult() {
		return examinResult;
	}

	public void setExaminResult(String examinResult) {
		this.examinResult = examinResult;
	}

	public String getIsJiaoNaBZJ() {
		return isJiaoNaBZJ;
	}

	public void setIsJiaoNaBZJ(String isJiaoNaBZJ) {
		this.isJiaoNaBZJ = isJiaoNaBZJ;
	}

	public String getOrgPic() {
		if (StringUtils.isNotBlank(title)&&(title.equals("常州市新北区汤庄桥小学部分资产电子竞价公告")||title.equals("常州市田家炳高级中学等单位部分资产电子竞价公告") ||title.equals("常州市市北实验初级中学等单位部分资产电子竞价公告")
				||title.equals("常州市城市照明工程有限公司部分资产电子竞价公告")||title.equals("常州市第一人民医院部分资产电子竞价公告")||title.equals("灶台等报废厨房用具一批电子竞价公告"))){
			setOrgPic("2017/09/06/931f78da-1f65-4950-b3b8-bfebfd3d1bf7.png");
		}
		return orgPic;
	}

	public void setOrgPic(String orgPic) {
		this.orgPic = orgPic;
	}

	public String getOrgLXR() {
		return orgLXR;
	}

	public void setOrgLXR(String orgLXR) {
		this.orgLXR = orgLXR;
	}

	public String getOrgPhone() {
		return orgPhone;
	}

	public void setOrgPhone(String orgPhone) {
		this.orgPhone = orgPhone;
	}

	public String getOrgAddress() {
		if (StringUtils.isNotBlank(title)&&(title.equals("常州市新北区汤庄桥小学部分资产电子竞价公告")||title.equals("常州市田家炳高级中学等单位部分资产电子竞价公告") ||title.equals("常州市市北实验初级中学等单位部分资产电子竞价公告")
				||title.equals("常州市城市照明工程有限公司部分资产电子竞价公告")||title.equals("常州市第一人民医院部分资产电子竞价公告")||title.equals("灶台等报废厨房用具一批电子竞价公告"))){
			setOrgAddress("常州市新北区龙锦路1259-2号");
		}
		return orgAddress;
	}

	public void setOrgAddress(String orgAddress) {
		this.orgAddress = orgAddress;
	}

	public String getDanweiname() {
		if (StringUtils.isNotBlank(title)&&(title.equals("常州市新北区汤庄桥小学部分资产电子竞价公告")||title.equals("常州市田家炳高级中学等单位部分资产电子竞价公告") ||title.equals("常州市市北实验初级中学等单位部分资产电子竞价公告")
				||title.equals("常州市城市照明工程有限公司部分资产电子竞价公告")||title.equals("常州市第一人民医院部分资产电子竞价公告")||title.equals("灶台等报废厨房用具一批电子竞价公告"))){
			setDanweiname("常州产权交易所");
		}
		return danweiname;
	}

	public void setDanweiname(String danweiname) {
		this.danweiname = danweiname;
	}

	public String getJingjiafangshi_1() {
		return jingjiafangshi_1;
	}

	public void setJingjiafangshi_1(String jingjiafangshi_1) {
		this.jingjiafangshi_1 = jingjiafangshi_1;
	}

	public Date getJingjiastartdate() {
		return jingjiastartdate;
	}

	public void setJingjiastartdate(Date jingjiastartdate) {
		this.jingjiastartdate = jingjiastartdate;
	}

	public Date getJingjiaenddate() {
		return jingjiaenddate;
	}

	public void setJingjiaenddate(Date jingjiaenddate) {
		this.jingjiaenddate = jingjiaenddate;
	}
	
	public String getJingjiastartdate_str() {
		if (jingjiastartdate != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sdf.format(jingjiastartdate);
		}
		return "";
	}

	public void setJingjiastartdate_str(String jingjiastartdate_str) {
		this.jingjiastartdate_str = jingjiastartdate_str;
	}

	public String getJingjiaenddate_str() {
		if (jingjiaenddate != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sdf.format(jingjiaenddate);
		}
		return "";
	}
	
	public void setJingjiaenddate_str(String jingjiaenddate_str) {
		this.jingjiaenddate_str = jingjiaenddate_str;
	}

	public String getHotlable() {
		return hotlable;
	}

	public void setHotlable(String hotlable) {
		this.hotlable = hotlable;
	}

	public Integer getAllcount() {
		return allcount;
	}

	public void setAllcount(Integer allcount) {
		this.allcount = allcount;
	}

	public Integer getOrderbyno() {
		return orderbyno;
	}

	public void setOrderbyno(Integer orderbyno) {
		this.orderbyno = orderbyno;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public String getOldprojectguid() {
		return oldprojectguid==null?"":oldprojectguid;
	}

	public void setOldprojectguid(String oldprojectguid) {
		this.oldprojectguid = oldprojectguid;
	}

	public String getDanw() {
		return danw;
	}

	public void setDanw(String danw) {
		this.danw = danw;
	}

	public String getS0() {
		return s0;
	}

	public void setS0(String s0) {
		this.s0 = s0;
	}


	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getHotLabelName_s() {
		return hotLabelName_s;
	}

	public void setHotLabelName_s(String hotLabelName_s) {
		this.hotLabelName_s = hotLabelName_s;
	}

	public String getZzkg_zztype() {
		return zzkg_zztype;
	}

	public void setZzkg_zztype(String zzkg_zztype) {
		this.zzkg_zztype = zzkg_zztype;
	}

	public String getZzkg_guapaitype() {
		return zzkg_guapaitype;
	}

	public void setZzkg_guapaitype(String zzkg_guapaitype) {
		this.zzkg_guapaitype = zzkg_guapaitype;
	}

	public String getZzkg_guapaiprice() {
		if("1".equals(getZzkg_guapaitype())) {
			zzkg_guapaiprice = getGuapaiprice() + " 元";
		} else {
			DecimalFormat df = new DecimalFormat("###,###,###,###,###,###,###.00");
			if(getZzkg_guapaidj() != null) {
				double gpj = Double.valueOf(getZzkg_guapaidj());
				String gpj_str = df.format(gpj);
				if(gpj_str.startsWith(".")) {
					gpj_str = 0 + gpj_str;
				}
				if("BL".equals(getZzkg_zztype())) {				
					zzkg_guapaiprice = gpj_str + " 元/每注册资本金元";
				} else if("GF".equals(getZzkg_zztype())) {
					zzkg_guapaiprice = gpj_str + " 元/股";
				} else {
					zzkg_guapaiprice = gpj_str + " 元/每注册资本金元";
				}
			}			
		}
		return zzkg_guapaiprice;
	}

	public void setZzkg_guapaiprice(String zzkg_guapaiprice) {
		this.zzkg_guapaiprice = zzkg_guapaiprice;
	}

	public String getZzkg_guapaidj() {
		return zzkg_guapaidj;
	}

	public void setZzkg_guapaidj(String zzkg_guapaidj) {
		this.zzkg_guapaidj = zzkg_guapaidj;
	}

	
	
}
