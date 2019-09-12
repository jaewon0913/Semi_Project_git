package com.semi.reviewboard.dao;

import java.io.IOException;


import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.semi.reviewboard.dto.commentDto;
import com.semi.reviewboard.dto.reviewBoardDto;
import com.semi.reviewboard.dao.sqlMapConfig;



public class reviewBoardDao extends sqlMapConfig {
	
	private String namespace = "reviewboard.";
	
	public int commentCNT(int commentboard_boardno) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			cnt = session.selectOne(namespace+"commentCNT", commentboard_boardno);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		
		
		return cnt;
	}
	
	public int commentAdd(commentDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"commentAdd", dto );
			if(res>0) {
				session.commit();
			}
					
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();		
		}finally {
			session.close();
		}
		return res;
	}
	
	public List<commentDto> selectComment(int commentboard_boardno) {
		
		List<commentDto> list = null;
		SqlSession session = null;
		try {
			System.out.println("comment dao 접속!");
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"commentList", commentboard_boardno);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session !=null) {
				session.close();
			}
		}
		
		return list;
	}

	
	public List<reviewBoardDto> selectListOption(String item, String location, String query, int begin, int end){
		
		List<reviewBoardDto> list = new ArrayList();
		Map<String, String> map = new HashMap<String, String>();

		//순서
		map.put("begin", begin+"");
		map.put("end", end+"");
	
		SqlSession session = null;
		
		if(item.equals("11")) { //제목+내용
			
			map.put("title", query);
			map.put("content", query);

			try {				
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectListOptionTNC", map);			
			}catch (Exception e) {
				e.printStackTrace();
			}

		}else if(item.equals("12")) { //제목
			map.put("title", query);
			try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectListOption", map);			
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(item.equals("13")) { // 내용
			map.put("content", query);
			try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectListOption", map);			
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(item.equals("14")) { //글쓴이
			map.put("writer", query);
			try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectListOption", map);			
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(item.equals("15")) { //지역 카테고리
			if(query.length()==0) {
				map.put("location", location);
				try {
				session = getSqlSessionFactory().openSession();
				list = session.selectList(namespace+"selectListOption", map);			
				}catch (Exception e) {
					e.printStackTrace();
				}	
				
			}else {
				map.put("title", query);				
				map.put("content", query);				
				map.put("location", location);
				try {
				session = getSqlSessionFactory().openSession();
				list = session.selectList(namespace+"selectListOptionTNCNL", map);			
				}catch (Exception e) {
					e.printStackTrace();
				}	
				
			}
			
		}
		
	return list;	
	}


	
	public int delete(int reviewboard_no) {
		int res = 0;
		SqlSession session = null;
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"delete", reviewboard_no);
			if(res>0) {
				System.out.println("삭제성공");
				session.commit();
			}
			
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	public int answerInsert(reviewBoardDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"answerinsert", dto);
			if(res>0) {
				System.out.println("answerinsert 성공");
				session.commit();
			}
			
		}catch (Exception e) {
			System.out.println("answerinsert실패");
			session.rollback();
			e.printStackTrace();			
		}finally {
			session.close();
		}
		
		
		return res;
	}
	
	public int answerUpadte(int reviewboard_no) {
		int res = 0;
		SqlSession session = null;

		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"answerupdate", reviewboard_no);
			if(res>0) {
				System.out.println("answerupdate성공");
				session.commit();
			}
			
		}catch (Exception e) {
			System.out.println("answerupdate실패");
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
		
	}
	
	public int update(reviewBoardDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"update", dto);
			if(res>0) {
				session.commit();
			}
			
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
		
	}
	
	
	public int hitsUpdate(int reviewboard_no, int reviewboard_hits) {
		int res = 0;
		SqlSession session = null;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("reviewboard_no", reviewboard_no);
		map.put("reviewboard_hits", reviewboard_hits);
		
		
		try {
		session = getSqlSessionFactory().openSession(false);
		res = session.update(namespace+"hitsUpdate", map);
		if(res>0) {
			session.commit();
		}
		
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	
	
	public reviewBoardDto selsectOne(int reviewboard_no) {
		
		reviewBoardDto dto = new reviewBoardDto();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("reviewboard_no", reviewboard_no);
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"selectOne",map);	
		}catch (Exception e) {
			e.printStackTrace();			
		}finally {
			session.close();
		}
		
		return dto;
	}
	
	
	
	public int insert(reviewBoardDto dto ) {
		
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert", dto);
			
			if(res>0) {
				session.commit();
			}
						
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.commit();
		}
		
		return res;
	}
	

	public List<reviewBoardDto> selectList(int begin,int end){
       
      Map<String, Integer> map = new HashMap<String, Integer>();
      map.put("begin", begin);
      map.put("end", end);
      
      SqlSession session = null;
      
      session = getSqlSessionFactory().openSession();
      
      List<reviewBoardDto> list = session.selectList(namespace+"selectList",map);
      
      return list;
   }
	
	public int getCount_search(String item, String location, String query) {
	
		int cnt = 0;
		SqlSession session = null;
		Map<String, String> map = new HashMap<String, String>();
		
		if(item.equals("11")) { //제목 내용
			map.put("title", query);
			map.put("content", query);
			try {
				session = getSqlSessionFactory().openSession();
				cnt = session.selectOne(namespace+"selectCountTNC",map);	
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(item.equals("12")) { //제목 
			map.put("title", query);
			try {
				session = getSqlSessionFactory().openSession();
				cnt = session.selectOne(namespace+"selectCountSe",map);	
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(item.equals("13")) { //내용
			map.put("content", query);
			try {
				session = getSqlSessionFactory().openSession();
				cnt = session.selectOne(namespace+"selectCountSe",map);	
			}catch (Exception e) {
				e.printStackTrace();
			}

			
		}else if(item.equals("14")) { //글쓴이
			map.put("writer", query);
			try {
				session = getSqlSessionFactory().openSession();
				cnt = session.selectOne(namespace+"selectCountSe",map);	
			}catch (Exception e) {
				e.printStackTrace();
			}

				
		}else if(item.equals("15")){ //지역카테고리
			if(query.length()==0) {
				map.put("location", location);
				try {
					session = getSqlSessionFactory().openSession();
					cnt = session.selectOne(namespace+"selectCountSe",map);	
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				
			}else {
				map.put("location", location);
				map.put("title", query);
				map.put("content", query);
				try {
					session = getSqlSessionFactory().openSession();
					cnt = session.selectOne(namespace+"selectCountTNCNL",map);	
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}
	
	public int getCount() {
		int cnt =0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			cnt = session.selectOne(namespace+"selectCount");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return cnt;
	}
	
	public List<reviewBoardDto> reviewdata(){
	
	      SqlSession session = null;
	      
	      session = getSqlSessionFactory().openSession();
	      
	      List<reviewBoardDto> list = session.selectList(namespace+"reviewdata");
	      
	      return list;
	}
	

}
