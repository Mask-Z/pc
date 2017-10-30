package com.ccjt.ejy.web.service;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.ccjt.ejy.web.cache.redis.JedisTemplate;
import com.ccjt.ejy.web.commons.PageUtil;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.commons.cache.RedisTemplateFactory;
import com.ccjt.ejy.web.vo.Jjdt;
import com.ccjt.ejy.web.vo.Page;

/**
 * 【竞价大厅】产权交易业务处理类
 * 
 * @author rocky(huangchunjie0513@163.com)
 * 
 */
@SuppressWarnings("rawtypes")
public class JjdtCqjyService extends JjdtService{
    private static Logger log = LogManager.getLogger(JjdtCqjyService.class);

    /**
     * 获取多个标的信息列表
     * 
     * @param biaodinos 标的编号集合
     * @return
     */
    @SuppressWarnings("unchecked")
    public List jjdt_cqjy(String[] biaodinos) {
    	//是否有标的需要刷新
    	if(biaodinos == null || biaodinos.length == 0){
    		return null;
    	}
    	List<Jjdt> jjdtList = new ArrayList<Jjdt>();
    	JedisTemplate redis = null;    			
    	try {
    		redis = RedisTemplateFactory.template.getJedisTemplate();
    		String uuid = redis.get(RedisKeys.KEY_JJDT_key);
    		String field_key = RedisKeys.KEY_JJDT_FIELD + uuid;
    		String jjdt_key = RedisKeys.KEY_JJDT + uuid;
    		if(!StringUtils.isNotBlank(field_key)){
    			return null;
    		}
    		Long len = redis.llen(field_key);
    		if(len == null || len == 0){
    			return null;
    		}
    		int total = len.intValue();
    		List<String> row_keys = redis.lrange(field_key, 0, total);
    		if(row_keys == null ){
    			return null;
    	    }
    		for(String bino : biaodinos){
    			for(String row_key : row_keys){
    			    if(row_key.endsWith(bino)){
    					String json =redis.hget(jjdt_key, row_key);    							
    					Jjdt jt = JSON.parseObject(json, Jjdt.class);
    					jjdtList.add(jt);
    					continue;
    				}
    			}
    		}
    	} catch (Exception e) {
    		log.error("获取竞价大厅缓存出错:" ,e);
    		e.printStackTrace();
    	}
    	return OP(jjdtList);
    }
    
    /**
     * 默认获取前7条数据
     * @return
     */
    public List<Jjdt> jjdt_cqjy() {
        Page page =new Page();
        page.setCurrentPage(1);
        page.setRows(7);
        return jjdt_cqjy(page);
    }
    
    /**
     * 从缓存中获取竞价列表
     * 
     * @param page
     * @return
     */
    public List<Jjdt> jjdt_cqjy(Page page) {
        return jjdt_cqjy(page, null);
    }

    /**
     * 从缓存中获取竞价列表
     * 
     * @param page
     * @param condition 条件
     * @return
     */
    public List<Jjdt> jjdt_cqjy(Page page, Map<String, String> condition) {
    	List<Jjdt> jjdtList = new ArrayList<Jjdt>();
		JedisTemplate redis = null;
		//条件
		String con_orgid =null;//机构id
		String con_biaodiname =null;//标的名称 关键字
		String con_status =null;//报名状态
		String con_type =null;//项目类型
//		String con_sheng = null;
		String con_shi = null;
		if(condition !=null){
			con_orgid =condition.get("orgid").trim();
			con_biaodiname =condition.get("biaodiname").trim();
			con_status =condition.get("status").trim();
			con_type =condition.get("type").trim();
//			con_sheng =condition.get("sheng").trim();
			con_shi =condition.get("shi").trim();
		}
		boolean hasConditon =!(StringUtils.isBlank(con_orgid) && StringUtils.isBlank(con_status)
				&& StringUtils.isBlank(con_type) && StringUtils.isBlank(con_biaodiname)&& StringUtils.isBlank(con_shi));
		try {
			redis = RedisTemplateFactory.template.getJedisTemplate();
			String uuid = redis.get(RedisKeys.KEY_JJDT_key);
			String field_key = RedisKeys.KEY_JJDT_FIELD + uuid;
			String jjdt_key = RedisKeys.KEY_JJDT + uuid;
			if(StringUtils.isBlank(field_key)){
				return null;
			}
			int start = (page.getCurrentPage()-1) * page.getRows();
			
			Long len = redis.llen(field_key);
			
			
			if(len == null || len == 0){
				return null;
			}
			int total = len.intValue();
			List<String> row_keys = redis.lrange(field_key, 0, total);
			
			if(row_keys==null || row_keys.size() ==0){
				return null;
			}
			//redis缓存中有数据，开始遍历
			
			int show = page.getRows();
			
			String[] _arr;
			String _biaodiname, _type ,_status ,_orgid,_sheng,_shi;
			int index =-1;
			//-----------------------------没有查询条件-----------------------------
			if(!hasConditon){
				page.setTotal(total);
				page.setTotalPage(getTotalPage(total, show));
				if(page.getCurrentPage() >page.getTotalPage()){
					page.setCurrentPage(page.getTotalPage());
				}
				//如果start起始索引超出总数据长度，直接获取最后一页的数据
				if(start > row_keys.size() -1){
					start = PageUtil.getStart(page.getTotalPage(), show);
				}
				for(String row_key : row_keys){
					index++;
					if(index <start)continue;
					if(show ==0){
						break;
					}
					Jjdt jt = JSON.parseObject(redis.hget(jjdt_key, row_key), Jjdt.class);
					if(jt == null){
						log.error("竞价大厅:" + jjdt_key + "row_key - : " + row_key);
					}else{
						jjdtList.add(jt);
						show--;
						index++;
					}
					
				}
				return OP(jjdtList);
			}
			
			//-----------------------------有查询条件-----------------------------
			total =0;
			show =page.getRows();
			index =-1;
			boolean f =true;//符合条件
			List<String> key_list =new ArrayList<String>();
			for(String row_key : row_keys){
				_arr = row_key.split("ζ");
				_status =_arr[0];//0未开始、1报价中、2已结束
				_type =_arr[1];
				_biaodiname =_arr[2];
				_orgid =_arr[3];
				_sheng = _arr[4];
				_shi = _arr[5];
				//查询条件成立的数据为合法数据，需要累积index
				if(StringUtils.isNotBlank(con_orgid) && !con_orgid.trim().equals(_orgid) ){
					continue;
				}
				if(StringUtils.isNotBlank(con_shi) ){
					con_shi=con_shi.trim();
					if (con_shi.endsWith("0000")&&!con_shi.substring(0,2).equals(_shi.substring(0,2))){//320000,320400
						continue;
					}else if (con_shi.endsWith("00")&&!con_shi.endsWith("0000")&&!con_shi.substring(0,4).equals(_shi.substring(0,4))) {
						continue;
					}
				}
				if(StringUtils.isNotBlank(con_biaodiname) &&_biaodiname !=null && !_biaodiname.contains(con_biaodiname) ){
					continue;
				}
				if(StringUtils.isNotBlank(con_status) &&!con_status.equals(_status) ){
					continue;
				}
				if(StringUtils.isNotBlank(con_type) &&!con_type.equals(_type)){
					continue;
				}
				if(f){
					key_list.add(row_key);
				}
			}
			//
			total =key_list.size();
			page.setTotal(total);
			if(page.getCurrentPage() > page.getTotalPage()){
				page.setCurrentPage(page.getTotalPage());
			}
			if(start >page.getTotal() - 1){
				start =PageUtil.getStart(page.getTotalPage(), show);
			}
			int end =start + page.getRows();
			end =end > page.getTotal() -1 ?page.getTotal() :end;
			key_list = key_list.subList(start, end);
			
			
			for(String row_key : key_list){
				Jjdt jt = JSON.parseObject(redis.hmget(jjdt_key, row_key).get(0), Jjdt.class);
				jjdtList.add(jt);
			}
			return OP(jjdtList);
		} catch (Exception e) {
			log.error("获取竞价大厅缓存出错:" ,e);
			e.printStackTrace();
		}
		
		return OP(jjdtList);		
    }


	/**
	 * 从缓存中获取首页竞价大厅列表
	 * @param page
	 * @param
	 * @return
	 */
	public List<Jjdt> index_jjdt_cqjy(Page page,  String citycode,String provincecode) {
		List<Jjdt> jjdtList = new ArrayList<Jjdt>();
		JedisTemplate redis = null;
		//条件
		boolean hasConditon =StringUtils.isNotBlank(citycode)||StringUtils.isNotBlank(provincecode) ;
		try {
			redis = RedisTemplateFactory.template.getJedisTemplate();
			String uuid = redis.get(RedisKeys.KEY_JJDT_key);
			String field_key = RedisKeys.KEY_JJDT_FIELD + uuid;
			String jjdt_key = RedisKeys.KEY_JJDT + uuid;
			if(StringUtils.isBlank(field_key)){
				return null;
			}
			int start = (page.getCurrentPage()-1) * page.getRows();

			Long len = redis.llen(field_key);


			if(len == null || len == 0){
				return null;
			}
			int total = len.intValue();
			List<String> row_keys = redis.lrange(field_key, 0, total);

			if(row_keys==null || row_keys.size() ==0){
				return null;
			}
			//redis缓存中有数据，开始遍历

			int show = page.getRows();

			String[] _arr;
			String _shi,_sheng;
			int index =-1;
			//-----------------------------没有查询条件-----------------------------
			if(!hasConditon){
				page.setTotal(total);
				page.setTotalPage(getTotalPage(total, show));
				if(page.getCurrentPage() >page.getTotalPage()){
					page.setCurrentPage(page.getTotalPage());
				}
				//如果start起始索引超出总数据长度，直接获取最后一页的数据
				if(start > row_keys.size() -1){
					start = PageUtil.getStart(page.getTotalPage(), show);
				}
				for(String row_key : row_keys){
					index++;
					if(index <start)continue;
					if(show ==0){
						break;
					}
					Jjdt jt = JSON.parseObject(redis.hget(jjdt_key, row_key), Jjdt.class);
					if(jt == null){
						log.error("竞价大厅:" + jjdt_key + "row_key - : " + row_key);
					}else{
						jjdtList.add(jt);
						show--;
						index++;
					}

				}
				return OP(jjdtList);
			}

			//-----------------------------有查询条件-----------------------------
			show =page.getRows();
//			boolean f =true;//符合条件
			List<String> key_list =new ArrayList<String>();
			if (StringUtils.isNotBlank(citycode)) {//如果城市code不为空,查询该城市列表
				citycode = citycode.trim();
				for (String row_key : row_keys) {
					_arr = row_key.split("ζ");
					_shi = _arr[5];
					if (citycode.endsWith("0000") && !citycode.substring(0, 2).equals(_shi.substring(0, 2))) {//320000,320400
						continue;
					} else if (citycode.endsWith("00") && !citycode.endsWith("0000") && !citycode.substring(0, 4).equals(_shi.substring(0, 4))) {
						continue;
					}

					if (key_list.size()==8) {//如果列表已有8条数据,直接跳出循环不再继续遍历
						break;
					}else{
						key_list.add(row_key);
					}
				}
			}
			//如果市级不够8条,省级来凑
			if (key_list.size()<8){
				provincecode=provincecode.trim();
				for(String row_key : row_keys){
					_arr = row_key.split("ζ");
					_sheng = _arr[4];

					if (!provincecode.equals(_sheng)||key_list.contains(row_key)){//如果省级code不等或者列表中已包含该key,则跳过该循环
							continue;
					}
					if (key_list.size()==8) {//如果列表已有8条数据,直接跳出循环不再继续遍历
						break;
					}else{
						key_list.add(row_key);
					}
				}
			}

			//如果加上省级还不够8条,全国来凑
			if (key_list.size()<8){
				for(String row_key : row_keys){
					if (key_list.contains(row_key)){//如果列表中已包含该key,则跳过该循环
						continue;
					}
					if (key_list.size()==8) {//如果列表已有8条数据,直接跳出循环不再继续遍历
						break;
					}else{
						key_list.add(row_key);
					}
				}
			}

			total =key_list.size();
			page.setTotal(total);
			if(page.getCurrentPage() > page.getTotalPage()){
				page.setCurrentPage(page.getTotalPage());
			}
			if(start >page.getTotal() - 1){
				start =PageUtil.getStart(page.getTotalPage(), show);
			}
			int end =start + page.getRows();
			end =end > page.getTotal() -1 ?page.getTotal() :end;
			key_list = key_list.subList(start, end);//截取多余的列表


			for(String row_key : key_list){
				Jjdt jt = JSON.parseObject(redis.hmget(jjdt_key, row_key).get(0), Jjdt.class);
				jjdtList.add(jt);
			}
			return OP(jjdtList);
		} catch (Exception e) {
			log.error("获取竞价大厅缓存出错:" ,e);
			e.printStackTrace();
		}

		return OP(jjdtList);
	}
    /**
	 * 为节约网络带宽,部分值设置为null,不返回给客户端
	 * @param jjdtList
	 * @return
	 */
	private List<Jjdt> OP(List<Jjdt> jjdtList){
		Date now = new Date();
		if(jjdtList!=null && jjdtList.size() > 0){
			for(Jjdt jjdt : jjdtList){
				jjdt.setCurrent(now.getTime());
				jjdt.setSheng(null);
				jjdt.setShi(null);
				jjdt.setOrgname(null);
				jjdt.setProjecttype(null);
				if(jjdt.getGonggaofromdate().before(now) && jjdt.getGonggaotodate().after(now)){//报名中
					
					jjdt.setStatus("4");//报名中
					jjdt.setStatusCN("报名中");//报名中
				}
				if(jjdt.getStart().before(now) && jjdt.getEndtime().after(now)){
					jjdt.setStatus("0");
					jjdt.setStatusCN("报价中");
				}
				
				jjdt.setGonggaofromdate(null);
				jjdt.setGonggaotodate(null);
				jjdt.setInfoguid(null);
				//排序需要将竞价中的排在前面, 竞价中、延时竞价 的状态改成 0 、1  竞价暂停 、未开始改为  2 、 3 为已结束
				try {
					Jjdt j = jdbc.bean("SELECT cast(a.PlanEndTime as datetime) endtime,cast(a.BeginDate as datetime) start" +
							",(case when a.MaxQuotePrice is null then '0' else '1' end) as hasBid ,(case when a.ProjectStatus = '0' THEN '2' WHEN (a.ProjectStatus = '1' or a.ProjectStatus = '2') THEN '0' WHEN (a.ProjectStatus = '4') THEN '1'  ELSE '3' END)AS status  " +
							" ,(case when a.ProjectStatus = '0' THEN '未开始' WHEN a.ProjectStatus=1 THEN '报价中' WHEN a.ProjectStatus=2 THEN '报价中' WHEN a.ProjectStatus=4 THEN '报价暂停' WHEN a.ProjectStatus=3 THEN '已结束' END)AS statusCN  " +
							" ,CAST(CAST((CASE WHEN a.CurrencyUnit = '2' THEN ISNULL(a.MaxQuotePrice, a.FromPrice) *10000 ELSE ISNULL(a.MaxQuotePrice, a.FromPrice) END) as decimal(18, 2)) as VARCHAR ) as maxPrice  " +
							"from JQXT_ProjectInfo a where ProjectGuid=?",Jjdt.class,jjdt.getProjectguid());
					
					if(j!=null){
						if(j.getStart()!=null) jjdt.setStart(j.getStart());
						if(j.getEndtime()!=null) jjdt.setEndtime(j.getEndtime());
						
						if("3".equals(jjdt.getJingJiaFangShi()) && !"3".equals(j.getStatus())){//密封式报价且报价未结束
							jjdt.setMaxprice("****");
						}
						else {
							jjdt.setMaxprice(j.getMaxprice());
						}
						jjdt.setHasbid(j.getHasbid());
						jjdt.setStatus(j.getStatus());
						jjdt.setStatusCN(j.getStatusCN());
						
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				if(!"2".equals(jjdt.getStatus())){//所有未结束的都返回剩余时间
					jjdt.setLast_times(jjdt.getEndtime().getTime() - now.getTime());
				}
			}
		}
		
		return jjdtList;
	}
	
	private static int getTotalPage(int count, int pageSize) {
		if (count < pageSize || pageSize ==0) { return 1; }
		return count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
	}
}
