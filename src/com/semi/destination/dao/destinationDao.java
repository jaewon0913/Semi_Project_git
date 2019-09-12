package com.semi.destination.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.common.JDBCTemplate;
import com.semi.destination.dto.destinationDto;

public class destinationDao extends JDBCTemplate {

	public List<destinationDto> destinationList(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<destinationDto> list = new ArrayList<>();
		
		String des_List = " SELECT * FROM PLACE ";
		
		try {
			pstm = con.prepareStatement(des_List);
			System.out.println("03 query 준비");
			rs = pstm.executeQuery();
			System.out.println("04 query 실행 및 리턴");
			while(rs.next()) {
				destinationDto dto = new destinationDto();
				dto.setPlace_no(rs.getInt(1));
				dto.setCity_name(rs.getString(2));
				dto.setPlace_name(rs.getString(3));
				dto.setPhon(rs.getString(4));
				dto.setAddress(rs.getString(5));
				dto.setLatitude(rs.getString(6));
				dto.setLongitude(rs.getString(7));
				dto.setPlace_hits(rs.getInt(8));
				dto.setPlace_like(rs.getInt(9));
				dto.setGuide(rs.getString(10));
				dto.setPlace_info(rs.getString(11));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}try {
			rs.close();
			pstm.close();
			con.close();
			System.out.println("05 DB종료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int getAllcount(String city) {
		int count = 0;
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String sql = " SELECT COUNT(*) AS COUNT FROM PLACE WHERE CITY_NAME = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, city);
			
			System.out.println("03 query 준비");
			
			rs = pstm.executeQuery();
			
			System.out.println("04 query 실행 및 리턴");
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("05 DB 에러");
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstm.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("05 DB 에러");
				e.printStackTrace();
			}
		}
		
		return count;
	}
	
	public List<destinationDto> pagelist(int page, String cityname){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int startnum = (page-1)*10+1;
		int endnum = page*10;
		List<destinationDto> list= new ArrayList<destinationDto>();
	
		System.out.println(startnum + " : " + endnum);
		
		String sql = " 		SELECT * \n" + 
				"		FROM (SELECT * \n" + 
				"			FROM ( SELECT ROWNUM as row_num, PLACE.* \n" + 
				"				FROM (SELECT * FROM PLACE ORDER BY PLACE_NO) PLACE WHERE CITY_NAME = ? )\n" + 
				"			WHERE row_num >= ? ) \n" + 
				"		WHERE row_num <= ? \n" + 
				"		ORDER BY ROW_NUM DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03 query 준비");
			pstm.setString(1, cityname);
			pstm.setInt(2, startnum);
			pstm.setInt(3, endnum);
			
			rs = pstm.executeQuery();
			System.out.println("04 query 실행 및 리턴");
			while(rs.next()) {
				destinationDto dto = new destinationDto();
				dto.setPlace_no(rs.getInt(2));
				dto.setCity_name(rs.getString(3));
				dto.setPlace_name(rs.getString(4));
				dto.setPhon(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setLatitude(rs.getString(7));
				dto.setLongitude(rs.getString(8));
				dto.setPlace_hits(rs.getInt(9));
				dto.setPlace_like(rs.getInt(10));
				dto.setGuide(rs.getString(11));
				dto.setPlace_info(rs.getString(12));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}try {
			rs.close();
			pstm.close();
			con.close();
			System.out.println("05 DB종료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return list;
	}
	
	public destinationDto detail(String primarykey) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		destinationDto dto = null;
		
		String sql = " SELECT * FROM PLACE WHERE PLACE_NO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, primarykey);
			System.out.println("03 query 준비");
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto = new destinationDto();
				dto.setPlace_no(rs.getInt(1));
				dto.setCity_name(rs.getString(2));
				dto.setPlace_name(rs.getString(3));
				dto.setPhon(rs.getString(4));
				dto.setAddress(rs.getString(5));
				dto.setLatitude(rs.getString(6));
				dto.setLongitude(rs.getString(7));
				dto.setPlace_hits(rs.getInt(8));
				dto.setPlace_like(rs.getInt(9));
				dto.setGuide(rs.getNString(10));
				dto.setPlace_info(rs.getString(11));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} try {
			rs.close();
			pstm.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
}





















