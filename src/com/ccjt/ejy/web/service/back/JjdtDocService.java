package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.vo.JjdtDoc;

public class JjdtDocService {
	
	private static Logger log = LogManager.getLogger(JjdtDocService.class);

	public Map<String,Object> jjdtDocList(JjdtDoc jjdtDoc,Integer page,Integer rows) {		
		Map<String,Object> m = new HashMap<String, Object>();
		List<JjdtDoc> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = "select * from [web2.0].dbo.jjdt_doc where 1 = 1";
			if(jjdtDoc != null) {
			    if(jjdtDoc.getTitle() != null) {
	                sql += " and title like ?";
	                params.add("%" + jjdtDoc.getTitle() + "%");
	            }   
			}	
			m.put("total", jdbc.getCount(sql,params.toArray())); 			
			sql += " order by order_no desc";			
			list = jdbc.beanList(sql,page,rows,JjdtDoc.class,params.toArray());
			for(JjdtDoc jd : list) {
				String query = "select sum(click) as click from " +
						"(select isnull(sourcejjdt,0) as click from [web2.0].dbo.pv where guid = ?) temp";
				Map map = jdbc.map(query,jd.getInfoid());
				if(map != null) {
					jd.setClick((Integer)map.get("click"));
				}
			}
			m.put("rows", list);			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}		
		return m;		
	}
	
	public JjdtDoc getJjdtDoc(Integer id) {
		JjdtDoc jjdtDoc = null;
		try {
			if(id != null) {
				String sql = "select id,title,linkurl,order_no,infoid,CONVERT(VARCHAR(19),add_time,120) as add_time,state,click " +
						"from [web2.0].dbo.jjdt_doc where id = ?";
				jjdtDoc = jdbc.bean(sql,JjdtDoc.class,id);
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}		
		return jjdtDoc;
	}	
	
	public Map<String,Object> saveJjdtDoc(JjdtDoc jjdtDoc) {
		Map<String,Object> result = new HashMap<String, Object>();
		String sql = "";
		try {
			if(jjdtDoc != null) {
				if(jjdtDoc.getId() != null) {
					if(jjdtDoc.getState() == 1) {
						int count = jdbc.getCount("select * from [web2.0].dbo.jjdt_doc where state = 1");
						if(count >= 5) {
							result.put("code", -1);
							result.put("msg", "最多只能发布5条文字链!");
							return result;
						}
						sql = "update [web2.0].dbo.jjdt_doc set title=?,linkurl=?,order_no=?,infoid=?,state=?,click=?,pub_time=getdate() where id = ?";
					} else {
						sql = "update [web2.0].dbo.jjdt_doc set title=?,linkurl=?,order_no=?,infoid=?,state=?,click=?,pub_time=null where id = ?";
					}					
					jdbc.execute(sql,jjdtDoc.getTitle(),jjdtDoc.getLinkurl(),jjdtDoc.getOrder_no(),jjdtDoc.getInfoid(),jjdtDoc.getState(),jjdtDoc.getClick(),jjdtDoc.getId());
				} else {					
					if(jjdtDoc.getState() == 1) {
						int count = jdbc.getCount("select * from [web2.0].dbo.jjdt_doc where state = 1");
						if(count >= 5) {
							result.put("code", -1);
							result.put("msg", "最多只能发布5条文字链!");
							return result;
						}
						sql = "insert into [web2.0].dbo.jjdt_doc(title,linkurl,order_no,infoid,state,click,add_time,pub_time) values(?,?,?,?,?,?,getdate(),getdate())";
					} else {
						sql = "insert into [web2.0].dbo.jjdt_doc(title,linkurl,order_no,infoid,state,click,add_time) values(?,?,?,?,?,?,getdate())";
					}					
					jdbc.insert(sql,jjdtDoc.getTitle(),jjdtDoc.getLinkurl(),jjdtDoc.getOrder_no(),jjdtDoc.getInfoid(),jjdtDoc.getState(),jjdtDoc.getClick());
				}
				ConnectionFactory.commit();
				result.put("code", 0);
				result.put("msg", "保存成功!");
			}
		} catch (Exception e) {
			ConnectionFactory.rollback();
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 批量删除
	 * delJjdtdoc  
	 * @param ids
	 * @return   
	 * Map<String,Object>  
	 * @exception   
	 * @since  1.0.0
	 */
	public Map<String, Object> delJjdtdoc(String[] ids){
	    Map<String,Object> result = new HashMap<String, Object>();
	    int count = 0;
	    try {
	        for (int i = 0; i < ids.length; i++) {
	            jdbc.delete("delete from [web2.0].dbo.jjdt_doc where id = ?",ids[i]);
	            count++;
	        }
	        ConnectionFactory.commit();
	        result.put("count", count);
            result.put("code", 0);
            result.put("msg", "删除成功!");
        } catch (Exception e) {
            ConnectionFactory.rollback();
            log.error(e);
            e.printStackTrace();
        }
	    return result;
	}
	
	public Map<String, Object> pubJjdtdoc(String id){
	    Map<String,Object> result = new HashMap<String, Object>();
	    int count = 0;
	    try {           
	    	count = jdbc.getCount("select * from [web2.0].dbo.jjdt_doc where state = 1");
			if(count >= 5) {
				result.put("code", -1);
				result.put("msg", "最多只能发布5条文字链!");
				return result;
			}
	    	jdbc.execute("update [web2.0].dbo.jjdt_doc set state=1,pub_time=getdate() where id = ?",id);
	        ConnectionFactory.commit();
	        result.put("count", count);
            result.put("code", 0);
            result.put("msg", "发布成功!");
        } catch (Exception e) {
            ConnectionFactory.rollback();
            log.error(e);
            e.printStackTrace();
        }
	    return result;
	}
	
	public Map<String, Object> recallJjdtdoc(String id){
	    Map<String,Object> result = new HashMap<String, Object>();
	    int count = 0;
	    try {           
	    	jdbc.execute("update [web2.0].dbo.jjdt_doc set state=0,pub_time=null where id = ?",id);
	        ConnectionFactory.commit();
	        result.put("count", count);
            result.put("code", 0);
            result.put("msg", "撤回发布成功!");
        } catch (Exception e) {
            ConnectionFactory.rollback();
            log.error(e);
            e.printStackTrace();
        }
	    return result;
	}
}
