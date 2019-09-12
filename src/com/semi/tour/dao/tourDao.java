package com.semi.tour.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.tour.dto.itemDto;
import com.semi.tour.dto.paymentDto;
import com.semi.tour.dto.placeDto;

public class tourDao extends sqlMapConfig {
	
	String namespace = "tour.";
	
	public List<itemDto> selectList(String day){
		
		List<itemDto> list = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectList", day);
			
		}catch (Exception e) {
			e.printStackTrace();		
		}finally {
			if(session !=null) {
				session.close();
			}
		}
		return list;
	}
	
	public placeDto selectOne(String query) {
		
		placeDto dto = new placeDto();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"selectone", query);
		}catch (Exception e) {
			e.printStackTrace();
		}if(session !=null) {
			session.close();
		}
		
		
		return dto;
	}
	
	
	public int insertPayment(paymentDto dto) {
		
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insertPayment", dto);
			
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
	
	
	public List<paymentDto> selectOnePayment(String payment_id){
		
		List<paymentDto> list = null;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectListpayment", payment_id);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session !=null) {
				session.close();
			}
		}
		return list;
	}
	
	

}
