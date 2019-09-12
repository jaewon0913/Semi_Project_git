package com.semi.noticeboard.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;

import com.semi.noticeboard.dto.*;

public class noticeboarddao extends SqlMapConfig{
	String namespace = "noticeboardmapper.";
	
	public List<noticeboarddto> selectList(){
		List<noticeboarddto> list = new ArrayList<noticeboarddto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "selectlist");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public List<noticeboarddto> pagelist(int page){
		int startnum = (page-1)*10+1;
		int endnum = page*10;
		List<noticeboarddto> list= new ArrayList<noticeboarddto>();
		SqlSession session = null;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		System.out.println(startnum + " : " + endnum);
		map.put("startNum", startnum);
		map.put("endNum",endnum);
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "pagelist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int getAllcount() {
		SqlSession session = null;
		int count = 0;
		try {
			session = getSqlSessionFactory().openSession();
			count = session.selectOne(namespace + "pagecount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int write(noticeboarddto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "write", dto);
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
	
	public noticeboarddto selectone(String no) {
		SqlSession session = null;
		noticeboarddto dto = null;
		int res = 0;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("noticeboard_no", no);
		try {
			session = getSqlSessionFactory().openSession();
			res = session.update(namespace + "clickcount", map);
			
			if(res > 0) {
				session.commit();
				dto = session.selectOne(namespace + "selectone", map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
}
