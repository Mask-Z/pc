/**  
 * 包名：com.ccjt.ejy.web.controller  
 * 文件名：BaseController.java  
 * 版本信息：V1.0  
 * 日期：2017年8月1日-下午4:02:51  
 * Copyright(c)2017
 *   
 */
package com.ccjt.ejy.web.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.ccjt.ejy.web.service.NewsService;
import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ccjt.ejy.web.commons.NetworkUtil;
import com.ccjt.ejy.web.commons.cache.DBCacheManage;
import com.ccjt.ejy.web.commons.cache.RedisKeys;
import com.ccjt.ejy.web.commons.httpclient.HttpClient;
import com.ccjt.ejy.web.service.IndexService;
import com.ccjt.ejy.web.vo.FastCaiGou;
import com.ccjt.ejy.web.vo.GongGao;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

/**  
 *   
 * 类名称：BaseController  
 * 类描述：
 * 创建人：qiaojoy99  
 * 修改人：qiaojoy99 
 * 修改时间：2017年8月1日 下午4:02:51  
 * 修改备注：  
 * @version 1.0.0  
 *   
 */
public class BaseController {
    
    private IndexService indexService = new IndexService();
    private NewsService ns = new NewsService();

    /**
     * 归属地判断
     * initPosition  
     * @param request   
     * void  
     * @exception   
     * @since  1.0.0
     */
    protected void initPosition(HttpServletRequest request) {
    	Object obj = request.getSession().getAttribute("region");
        if(obj == null || StringUtils.isBlank(obj.toString())){//首次存储用户归属地
            String ip = NetworkUtil.getIpAddress(request);
            Map<String, Object> map = indexService.iparea(ip, ip.hashCode());
            if(map == null) {//本地库中未找到
                try {
                    String result = HttpClient.httpcall("http://ip.taobao.com/service/getIpInfo.php?ip=" + ip, "");
                    JSONObject reJson = JSONObject.parseObject(result);
                    if(reJson.getInteger("code") == 0){
                        request.getSession().setAttribute("region", reJson.getJSONObject("data").get("region").toString());
                        request.getSession().setAttribute("region_id", reJson.getJSONObject("data").get("region_id").toString());
                        request.getSession().setAttribute("city", reJson.getJSONObject("data").get("city").toString());
                        request.getSession().setAttribute("city_id", reJson.getJSONObject("data").get("city_id").toString());
                        indexService.saveiparea(reJson, ip, ip.hashCode());
                    }else{
                        request.getSession().setAttribute("region", "");
                        request.getSession().setAttribute("region_id", "");
                        request.getSession().setAttribute("city", "");
                        request.getSession().setAttribute("city_id", "");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                request.getSession().setAttribute("region", map.get("region").toString());
                request.getSession().setAttribute("region_id", map.get("region_id").toString());
                request.getSession().setAttribute("city", map.get("city").toString());
                request.getSession().setAttribute("city_id", map.get("city_id").toString());
            }
        }
    }
    /**
     * 公告状态翻译
     * gonggaoStateTranslate  
     * @return   
     * List<GongGao>  
     * @exception   
     * @since  1.0.0
     */
    protected List<GongGao> gonggaoStateTranslate(List<GongGao> gongGaos) {
        Date now = new Date();
        DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
        for (int i = 0; i < gongGaos.size(); i++) {
            GongGao gg=gongGaos.get(i);

            if (StringUtils.isNotBlank(gg.getIspllr()) && gg.getIspllr().equals("1")) {//如果项目是批量挂牌,重新设置开始,结束时间
                
                List<Map> plist = ns.getProjectList_date(gg.getInfoid());
                //批量挂牌多个标的的挂牌截止时间可能不一致,分别取最大和最小时间
                for (Map map : plist) {

                    Object str = map.get("GongGaoFromDate");
                    Object str2 = map.get("GongGaoToDate");

                    Date ggstart = new DateTime().parse(str.toString(), format).toDate();
                    Date ggend = new DateTime().parse(str2.toString(), format).toDate();

                    if (null==gg.getGonggaotodate() || gg.getGonggaotodate().before(ggend)) {
                        gg.setGonggaotodate(ggend);
                    }
                    if (null==gg.getGonggaofromdate() || gg.getGonggaofromdate().after(ggstart)) {
                        gg.setGonggaofromdate(ggstart);
                    }

                }
            }

            String  controlType=gg.getProjectcontroltype();
            if(gg.getGonggaofromdate() != null && now.before(gg.getGonggaofromdate())){//报名未开始
                gg.setStatus_name("未开始");
            } else if(StringUtils.isNotBlank(gg.getCjgg_guid())){//已成交
                gg.setStatus_name("已成交");
            }
            /**
             * 如果中止终结状态不为空,就在列表页显示中止终结的状态
             */
            else if (StringUtils.isNotBlank(controlType)&&(controlType.equals("1") || controlType.equals("2"))){
                if (controlType.equals("1")){
                    gg.setStatus_name("终结");
                }else if(controlType.equals("2")){
                    gg.setStatus_name("中止");
                }
            } else if(gg.getJingjia_end()!=null && gg.getJingjia_start()!=null && now.after(gg.getJingjia_start())){//有竞价数据
                String jjia_status = gg.getJjia_status();
                if(StringUtils.isNotBlank(jjia_status)&&jjia_status.equals("4")){//jjia_status为4,代表竞价暂停
                    gg.setStatus_name("竞价暂停");
                } else if(("1".equals(jjia_status) || "2".equals(jjia_status)) && gg.getGonggaofromdate() !=null && now.after(gg.getGonggaofromdate()) && now.before(gg.getGonggaotodate())){//报名中和竞价中
                    gg.setStatus_name("报名中竞价中");
                }else if("1".equals(jjia_status) || "2".equals(jjia_status)){//竞价中
                    gg.setStatus_name("竞价中");
                } else if("3".equals(jjia_status)){//竞价已结束
                    gg.setStatus_name("竞价已结束");
                }
            }else if(gg.getGonggaofromdate() != null && now.after(gg.getGonggaofromdate()) && now.before(gg.getGonggaotodate())){//报名中
                gg.setStatus_name("报名中");
            } else if(gg.getGonggaotodate() != null && now.after(gg.getGonggaotodate())){//报名已截止
                gg.setStatus_name("报名已截止");

            }
        }
        return gongGaos;
    }
    
    protected GongGao gonggaoStateTranslate(GongGao gg) {
        if(gg!=null){
                Date now=new Date();
//            if (StringUtils.isNotBlank(gongGao.getIspllr()) && gongGao.getIspllr().equals("1")) {//如果项目是批量挂牌,重新设置开始,结束时间
//                DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
//                List<Map> plist = ns.getProjectList(gongGao.getInfoid());
//                //批量挂牌多个标的的挂牌截止时间可能不一致,分别取最大和最小时间
//                for (Map map : plist) {
//
//                    Object str = map.get("GongGaoFromDate");
//                    Object str2 = map.get("GongGaoToDate");
//
//                    Date ggstart = new DateTime().parse(str.toString(), format).toDate();
//                    Date ggend = new DateTime().parse(str2.toString(), format).toDate();
//
//                    if (null==gongGao.getGonggaotodate() || gongGao.getGonggaotodate().before(ggend)) {
//                        gongGao.setGonggaotodate(ggend);
//                    }
//                    if (null==gongGao.getGonggaofromdate() || gongGao.getGonggaofromdate().after(ggstart)) {
//                        gongGao.setGonggaofromdate(ggstart);
//                    }
//
//                }
//            }
//
//            if(gongGao.getProjectcontroltype()!=null&&gongGao.getProjectcontroltype().equals("1")){
//                gongGao.setStatus_name("终结");
//            }else if(gongGao.getProjectcontroltype()!=null&&gongGao.getProjectcontroltype().equals("2")){
//                gongGao.setStatus_name("中止");
//            }else{
//                Date date = new Date();
//                if(gongGao.getGonggaofromdate()!=null){
////                    if(date.getTime() < gongGao.getGonggaofromdate().getTime()){
//                    if(date.before(gongGao.getGonggaofromdate())){
//                        gongGao.setStatus_name("未开始");
////                    }else if(date.getTime() >= gongGao.getGonggaofromdate().getTime() &&date.getTime() <= gongGao.getGonggaotodate().getTime()){
//                    }else if(date.after(gongGao.getGonggaofromdate())&& date.before(gongGao.getGonggaotodate())){
//                        gongGao.setStatus_name("报名中");
////                    }else if(date.getTime() > gongGao.getGonggaotodate().getTime()){
//                    }else if(date.after(gongGao.getGonggaotodate())){
//
//                    	gongGao.setStatus_name("报名已截止");
//
//                    }
//                }
//
//                if(gongGao.getJingjia_start()!=null){//有竞价
//
//                    String jjia_status=gongGao.getJjia_status();
//                    if(StringUtils.isNotBlank(jjia_status)&&jjia_status.equals("4")){//jjia_status为4,代表竞价暂停
//                        gongGao.setStatus_name("竞价暂停");
//                    } else if(date.getTime() > gongGao.getJingjia_start().getTime() && date.getTime() < gongGao.getJingjia_end().getTime() ){
//                		gongGao.setStatus_name("竞价中");
//                	}else if(date.getTime() > gongGao.getJingjia_end().getTime()){
//                        gongGao.setStatus_name("竞价结束");
//                    }
//            	}
//
//                if(StringUtils.isNotBlank(gongGao.getCjgg_guid())){
//                    gongGao.setStatus_name("已成交");
//                }
//            }
            if (StringUtils.isNotBlank(gg.getIspllr()) && gg.getIspllr().equals("1")) {//如果项目是批量挂牌,重新设置开始,结束时间
                DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
                List<Map> plist = ns.getProjectList(gg.getInfoid());
                //批量挂牌多个标的的挂牌截止时间可能不一致,分别取最大和最小时间
                for (Map map : plist) {

                    Object str = map.get("GongGaoFromDate");
                    Object str2 = map.get("GongGaoToDate");

                    Date ggstart = new DateTime().parse(str.toString(), format).toDate();
                    Date ggend = new DateTime().parse(str2.toString(), format).toDate();

                    if (null==gg.getGonggaotodate() || gg.getGonggaotodate().before(ggend)) {
                        gg.setGonggaotodate(ggend);
                    }
                    if (null==gg.getGonggaofromdate() || gg.getGonggaofromdate().after(ggstart)) {
                        gg.setGonggaofromdate(ggstart);
                    }

                }
            }

            String  controlType=gg.getProjectcontroltype();
            if(gg.getGonggaofromdate() !=null && now.before(gg.getGonggaofromdate())){//报名未开始
                gg.setStatus_name("未开始");
            } else if(StringUtils.isNotBlank(gg.getCjgg_guid())){//已成交
                gg.setStatus_name("已成交");
            }
            /**
             * 如果中止终结状态不为空,就在列表页显示中止终结的状态
             */
            else if (StringUtils.isNotBlank(controlType)&&(controlType.equals("1") || controlType.equals("2"))){
                if (controlType.equals("1")){
                    gg.setStatus_name("终结");
                }else if(controlType.equals("2")){
                    gg.setStatus_name("中止");
                }
            } else if(gg.getJingjia_end()!=null && gg.getJingjia_start()!=null && now.after(gg.getJingjia_start())){//有竞价数据
                String jjia_status=gg.getJjia_status();
                if(StringUtils.isNotBlank(jjia_status)&&jjia_status.equals("4")){//jjia_status为4,代表竞价暂停
                    gg.setStatus_name("竞价暂停");
                } else if(("1".equals(jjia_status) || "2".equals(jjia_status)) && gg.getGonggaofromdate() !=null && now.after(gg.getGonggaofromdate()) && now.before(gg.getGonggaotodate())){//报名中和竞价中
                    gg.setStatus_name("报名中竞价中");
                }else if("1".equals(jjia_status) || "2".equals(jjia_status)){//竞价中
                    gg.setStatus_name("竞价中");
                } else if("3".equals(jjia_status)){//竞价已结束
                    gg.setStatus_name("竞价已结束");
                }
            }else if(gg.getGonggaofromdate() !=null && now.after(gg.getGonggaofromdate()) && now.before(gg.getGonggaotodate())){//报名中
                gg.setStatus_name("报名中");
            } else if(gg.getGonggaotodate() !=null && now.after(gg.getGonggaotodate())){//报名已截止
                gg.setStatus_name("报名已截止");

            }
        }
        return gg;
    }

    /**
     * 招标采购状态翻译
     * gonggaoStateTranslate
     * @return   
     * List<GongGao>  
     * @exception   
     * @since  1.0.0
     */
    protected List<FastCaiGou> fastcaigouStateTranslate(List<FastCaiGou> fastCaiGous) {
        for (int i = 0; i < fastCaiGous.size(); i++) {
            Date date = new Date();
            if(date.getTime() < fastCaiGous.get(i).getBaomingstart().getTime()){
                fastCaiGous.get(i).setStatus_name("未开始");
            }else if(date.getTime() >= fastCaiGous.get(i).getBaomingstart().getTime()
                    &&date.getTime() <= fastCaiGous.get(i).getBaomingend().getTime()){
                fastCaiGous.get(i).setStatus_name("报名中");
            }else if(date.getTime() > fastCaiGous.get(i).getBaomingend().getTime()){
                fastCaiGous.get(i).setStatus_name("报名已截止");
            }
        }
        return fastCaiGous;
    }
    protected JSONObject getCitys() {
    	 String citys= DBCacheManage.get(RedisKeys.WEB_DATA_CACHE_CITY);
         citys=citys.replace("code", "id");
         citys=citys.replace("subCity", "city");

         JSONArray province=(JSONArray) JSONArray.parse(citys);
         JSONArray hot=getHotCity();
         JSONObject json=new JSONObject();
         json.put("hot", hot);
         json.put("province", province);
         return json;
    }
    private JSONArray getHotCity(){
   	 JSONArray hot=new JSONArray();
        JSONObject json =new JSONObject();
        json.put("pid", "110000");
        json.put("pname", "北京");
        json.put("id", "110000");
        json.put("name", "北京");
        hot.add(json);
        json.put("pid", "310000");
        json.put("pname", "上海");
        json.put("id", "310000");
        json.put("name", "上海");
        hot.add(json);
        json.put("pid", "440000");
        json.put("pname", "广东");
        json.put("id", "440000");
        json.put("name", "广东");
        hot.add(json);
      return hot;
   }
}
