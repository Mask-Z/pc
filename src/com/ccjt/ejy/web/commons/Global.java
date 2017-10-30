package com.ccjt.ejy.web.commons;

public class Global {

	/**
	 * 网站调用业务系统登录接口url地址
	 */
	public static String login_url = PropertiesReader.get("login_url");
	
	/**
	 * 网站调用业务系统报名接口url地址
	 */
	public static String baoming_url = PropertiesReader.get("baoming_url");

	/**
	 * 交易公告中的图片链接替换
	 */
	public static final String old_pic_2 = "\"/ejyzx/";

	public static final String old_pic_2_new = "\"http://www.e-jy.com.cn/ejyzx/";
	
	public static final String gonggao_file_dir = PropertiesReader.get("gonggao_file_dir");
	
	public static final String pic_url = "http://www.e-jy.com.cn";
	
	/**
	 * 附件下载路径
	 */
	public static String bm_file_download = PropertiesReader.get("bm_file_download");
	
	/**
	 * 注册类型（竞买方）
	 */
	public static String danWeiType_jmf = "44";
	
	/**
	 * 会员类型（单位）
	 */
	public static String memberType_dw = "0";
	
	/**
	 * 会员类型（个人）
	 */
	public static String memberType_gr = "1";
	
	/**
	 * 数据库链接名
	 */
	public static final String connection_name = PropertiesReader.get("connection_name");

	/**
	 * 标的类型
	 */
	public static final String[] categories={"股权","债权","增资扩股","房地产","二手车","资产招租","废旧物资", "土地","粮食","工美藏品","花木交易","船舶","矿权","林权","农村产权","广告经营权","二手设备","其他"};
}
