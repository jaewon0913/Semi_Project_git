package com.semi.member.dao;

import org.apache.ibatis.session.SqlSession;

import com.semi.member.dto.memberdto;

import java.util.*;

public class memberdao extends SqlMapConfig {
	String namespace= "membermapper.";
	
	public memberdto idchk(String id) {
		SqlSession session = null;
		memberdto dto = null;
		
		System.out.println(id);
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "idchk", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}

	public int insert(memberdto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "memberinsert", dto);
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	public int memberinfo(String id) {
		return 0;
		
	}
	
	public memberdto login(String id, String pw) {
		memberdto dto = new memberdto();
		
		HashMap<String,String> map = new HashMap<>();
		map.put("member_id", id);
		map.put("member_pw", pw);
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession();
		
		dto = session.selectOne(namespace + "login", map);
		
		return dto;
	}
	
	public memberdto findid(String name, String email) {
		memberdto dto = new memberdto();
		HashMap<String,String> map = new HashMap<>();
		map.put("member_name", name);
		map.put("member_email", email);
		SqlSession session = null;
		session = getSqlSessionFactory().openSession();
	    dto = session.selectOne(namespace+"findid",map);   
		
		return dto;
	}

	 public memberdto findpw(String name, String id, String email) {
	      memberdto dto = new memberdto();
	      Map<String,String> map = new HashMap<String, String>();
	      System.out.println("name : " + name + " , id : " + id + " , email : " + email);
	      map.put("member_name", name);
	      map.put("member_id", id);
	      map.put("member_email", email);
	      
	      SqlSession session = null;
	      session = getSqlSessionFactory().openSession();
	      dto = session.selectOne(namespace+"findpw", map);
	      
	      return dto;
	   }
	 
	 public memberdto selectOne(String id) {
			System.out.println(id);
			
			memberdto dto = new memberdto();
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("member_id", id);
			
			SqlSession session = null;
			
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace + "idchk", map);

			return dto;
		}

	 public int infoupdate(memberdto dto) {
	      int res = 0;
	      SqlSession session = null;
	      session = getSqlSessionFactory().openSession();
	      res = session.update(namespace+"infoUpdate", dto);
	      
	      if(res > 0) {
	         session.commit();
	      }
	      return res;
	   }
}
