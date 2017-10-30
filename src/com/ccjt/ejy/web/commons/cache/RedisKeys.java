package com.ccjt.ejy.web.commons.cache;

/**
 * redis key 定义
 * @author xxf
 *
 */
public class RedisKeys {

	/**
	 * 竞价大厅
	 */
	public static String KEY_JJDT = "WEB_JJDT_CACHE_";
	
	/**
	 * 竞价大厅的有序 field列表
	 */
	public static String KEY_JJDT_FIELD = "WEB_JJDT_FIELD_";
	
	
	/**
	 * 数据库缓存key
	 */
	public static String KEY_DB_CACHE = "WEB_DATA_CACHE_";
	
	/**
	 * 首页交易公告
	 */
	public static String KEY_DB_CACHE_INDEX_JYGG = "INDEX_JYGG";
	
	/**
	 * 首页成交公告
	 */
	public static String KEY_DB_CACHE_INDEX_CJGG = "INDEX_CJGG";
	
	/**
	 * 首页成交公告_所有
	 */
	public static String KEY_DB_CACHE_INDEX_CJGG_8_ROWS = "INDEX_CJGG_8_ROWS";

	/**
	 * 首页招标采购--招标公告
	 */
	public static String KEY_DB_CACHE_ZBCG_ZBGG = "INDEX_ZBCG_ZBGG";

	/**
	 * 首页招标采购--成交公告
	 */
	public static String KEY_DB_CACHE_ZBCG_CJGG_GC = "INDEX_ZBCG_CJGG_GC";//工程
	public static String KEY_DB_CACHE_ZBCG_CJGG_HW = "INDEX_ZBCG_CJGG_HW";//货物
	public static String KEY_DB_CACHE_ZBCG_CJGG_FW = "INDEX_ZBCG_CJGG_FW";//服务

	/**
	 * 首页统计信息
	 */
	public static String KEY_DB_CACHE_INDEX_TJXX = "INDEX_TJXX";
	
	public static String KEY_DB_CACHE_INDEX_ZDTJ = "INDEX_ZDTJ";
	
	public static String WEB_DATA_CACHE_CITY = "WEB_DATA_CACHE_CITY";
	
	/**
	 * 竞价大厅的key的key
	 */
	public static String KEY_JJDT_key = "jjdt_key";
	
	public static String WEB_DATA_CACHE_PROJECTTYPE = "PROJECTTYPE";
	
	public static String KEY_DB_CACHE_INDEX_CJGG_20_ROWS = "INDEX_CJGG_20_ROWS";
	
	/**
	 * 竞价大厅_招标采购
	 */
	public static String JJDT_ZBCG_KEY = "JJDT_ZBCG_KEY_";

	public static String COMPANY_LOGO_KEY = "COMPANY_LOGO_KEY";
	
	/**
	 * 首页快捷采购
	 */
	public static String index_kjcgs = "index_kjcgs";
	
	/**
	 * 快捷采购 成交公告
	 */
	public static String index_kjcg_cjgg = "index_kjcg_cjgg";
	
}
