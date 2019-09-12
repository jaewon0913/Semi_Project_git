package com.semi.freeboard.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;

import com.semi.freeboard.dto.freeboarddto;

public class freeboarddao extends SqlMapConfig {
	String namespace = "freeboardmapper.";
	
	public List<freeboarddto> selectList(){
		List<freeboarddto> list= new ArrayList<freeboarddto>();
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
	
	public List<freeboarddto> pagelist(int page){
		int startnum = (page-1)*10+1;
		int endnum = page*10;
		List<freeboarddto> list= new ArrayList<freeboarddto>();
		SqlSession session = null;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startnum);
		map.put("endNum",endnum);
		System.out.println(startnum + " : " + endnum);
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
	
	public int write(freeboarddto dto) {
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
	
	public freeboarddto selectone(String no) {
		SqlSession session = null;
		freeboarddto dto = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("freeboardno", no);
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace + "selectone", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
}
