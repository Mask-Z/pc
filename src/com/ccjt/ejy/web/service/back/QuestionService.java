package com.ccjt.ejy.web.service.back;

import static com.ccjt.ejy.web.commons.JDBC.jdbc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ccjt.ejy.web.commons.db.connection.ConnectionFactory;
import com.ccjt.ejy.web.enums.ProjectType;
import com.ccjt.ejy.web.vo.Question;

public class QuestionService {
	private static Logger log = LogManager.getLogger(QuestionService.class);
	public Map<String,Object> questionList(Question qu,Integer page,Integer rows){
		Map<String,Object> m = new HashMap<String, Object>();
		List<Question> list = null;
		try {
			List<Object> params = new ArrayList<>();
			String sql = " select * from [web2.0].dbo.question where 1=1 ";
			
			if(qu.getTitle()!=null){
				sql += " and title like ?";
				params.add("%"+qu.getTitle()+"%");
			}
			
			m.put("total", jdbc.getCount(sql,params.toArray())); 
			
			sql += " order by order_no desc ";
			
			list = jdbc.beanList(sql,page,rows, Question.class,params.toArray());
			m.put("rows", list);
			
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return m;
		
	}
	
	public Question getQuestion(Integer id){
		Question qu = null;
		try {
			if(id!=null){
				String sql = " select a.*,b.content from [web2.0].dbo.question a "
						+ "        join  [web2.0].dbo.question_text b on a.id=b.q_id"
						+ "    where a.id= "+id;
				qu = jdbc.bean(sql, Question.class);
				sql="select type from [web2.0].dbo.question_type where q_id=?";
				List<String> list=jdbc.getStringList(sql,id);
				qu.setType(listToString(list, ","));
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		
		return qu;
	}
	
	public Map<String,Object> updateReadTime(Integer id){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(id!=null&&!id.equals("")){
				String sql = "update [web2.0].dbo.question set click=isnull(click,0)+1 where id=?";
				jdbc.execute(sql,id);
				ConnectionFactory.commit();
				result.put("code", 0);
				result.put("msg", "更新成功!");
			}
		} catch (Exception e) {
			ConnectionFactory.rollback();
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}
	public Map<String ,Object> saveQuestion(Question qu){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(qu!=null){
				if(qu.getId()!=null){
					String sql = "update [web2.0].dbo.question set title=?,key_word=?,state=?,order_no=? where id=?";
					jdbc.execute(sql, qu.getTitle(),qu.getKey_word(),qu.getState(),qu.getOrder_no(),qu.getId());
					jdbc.execute("update [web2.0].dbo.question_text set content=? where q_id=? ", qu.getContent(),qu.getId());
					addQuestionType(qu.getId(),qu.getType());
				}else{
					String sql = "insert into [web2.0].dbo.question(title,key_word,state,order_no) values(?,?,?,?)";
					int id = jdbc.insert(sql, qu.getTitle(),qu.getKey_word(),qu.getState(),qu.getOrder_no());
					jdbc.insert("insert into [web2.0].dbo.question_text(q_id,content) values(?,?) ", id,qu.getContent());
					addQuestionType(id,qu.getType());
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
	public void addQuestionType(int id,String type){
		try {
			if(type!=null&&!type.equals("")){
				List<String> types=stringToList(type,",");
				jdbc.execute("delete from [web2.0].dbo.question_type where q_id=? ",id);
				for(int i=0;i<types.size();i++){
					jdbc.execute("insert into [web2.0].dbo.question_type (q_id,type) values(?,?)", id,types.get(i));
				}
			}
		} catch (Exception e) {
			ConnectionFactory.rollback();
			log.error(e);
			e.printStackTrace();
		}
	}
	public Map<String ,Object> delQuestion(String[] id){
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			if(id!=null){
				String sql = " delete  from [web2.0].dbo.question where id in("+collectionToStr(id)+") ";
				jdbc.execute(sql);
				 sql = " delete  from [web2.0].dbo.question_text where q_id in("+collectionToStr(id)+") ";
				jdbc.execute(sql);
				ConnectionFactory.commit();
				result.put("code", 0);
				result.put("msg", "删除成功!");
			}
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		return result;
	}
	public static String listToString(List<String> list, String split) {
		String str="";
		for (int i = 0; i < list.size(); i++) {
			str+=list.get(i)+split;
		}
		if(!str.equals("")){
			str=str.substring(0,str.length()-1);
		}
		return str;
	}
	private String collectionToStr(String[] ids){
		String result="";
		if(ids!=null){
			for(int i=0;i<ids.length;i++){
				result+=ids[i]+",";
			}
			if(!result.equals("")){
				result=result.substring(0,result.length()-1);
			}
		}
		return result;
	}
	private  List<String> stringToList(String str, String split) {
		List<String> list = new ArrayList<String>();
		if(str!=null&&!str.equals("")){
			String[] arr = str.split(split);
			for (int i = 0; i < arr.length; i++) {
				list.add(arr[i]);
			}
		}
		return list;
	}
	/**
     * 根据问题分类查询常见问题
     * detail  
     * @param projectStyle
     * @return   
     * List<Question>  
     * @exception   
     * @since  1.0.0
     */
    public List<Question> questions(String projectStyle) {
        List<Question> questions = new ArrayList<Question>();
        try {

            String type = ProjectType.get(projectStyle).getCode();//先根据中文类别名称获取对应的常见问题的类别CODE
			if (StringUtils.isNotBlank(type) && type.equals("QTZC")){
				type="QT";
			}
            String sql = "select top 6 t1.*,t2.type from [web2.0].dbo.question t1 " +
            		"left join [web2.0].dbo.question_type t2 on t1.id = t2.q_id " +
            		"where t2.type = ? and state = 1 order by order_no" ;
            questions = jdbc.beanList(sql,Question.class,type);
        } catch (Exception e) {
            log.error("获取产权详细出错:" ,e);
            e.printStackTrace();
        }
        return questions;
    }
}
