package com.semi.tour.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.semi.common.JDBCTemplate;
import com.semi.tour.dto.itemDto;
import com.semi.tour.dto.placeDto;



public class doDao extends JDBCTemplate  {

	
	
	public int insertPlace(List<placeDto> dtos) {
		Connection con = getConnection();
		PreparedStatement pstm = null;		
		int res = 0;
		
		String sql = " INSERT INTO PLACE VALUES(PLACESEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, 0, 0, ?, ? )";
		
		int [] cnt = null;
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03 query 준비"+sql);
			
			for(int i=0; i<dtos.size(); i++) {
				placeDto dto  = dtos.get(i);
				pstm.setString(1, dto.getCity_name());
				pstm.setString(2, dto.getPlace_name());
				pstm.setString(3, dto.getPhone());
				pstm.setString(4, dto.getAdress());
				pstm.setString(5, dto.getLatitude());
				pstm.setString(6, dto.getLongitude());
				pstm.setString(7, dto.getGuide());
				pstm.setString(8, dto.getPlace_info());
				
				pstm.addBatch();
			}
			
			cnt = pstm.executeBatch();
			System.out.println("04 실행및 리턴");
			
			for(int i=0; i<cnt.length;i++) {
				if(cnt[i]==-2) {
					res++;
					
				}
			}
			
			if(res==dtos.size()) {
				System.out.println("commit 성공");
				commit(con);
			}else {
				System.out.println("실패: rollback");
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("0304 에로");
			e.printStackTrace();
		}finally {
			
			close(pstm);
			close(con);
			System.out.println("05 db종료");
		}
		return res;
	}
	

	
	public int insertitem01(List<itemDto> dtos) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		int [] cnt = null;
		
		String sql = " INSERT INTO ITEM01 VALUES( ITEMSEQ01.NEXTVAL, ?, ?, ?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03 query 준비" + sql);
			
			
			for(int i = 0; i<dtos.size(); i++) {
				itemDto dto = dtos.get(i);

				pstm.setString(1, dto.getItem_day());
				pstm.setString(2, dto.getItem_city());
				pstm.setString(3, dto.getItem_place());
				
				pstm.addBatch();
			}
			
			cnt = pstm.executeBatch();
			System.out.println("04 실행 및 리턴");
			
			for(int i=0; i<cnt.length; i++) {
				if(cnt[i]==-2) {
					res++;
				}
			}
			
			if(res == dtos.size()) {
				System.out.println("성공: commit");
				commit(con);
			}else {
				System.out.println("실패: rollback");
			}
			
		} catch (SQLException e) {
			System.out.println("0304 실패");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("db종료");
		}
		
		
		return res;
	}
	
	
	

}
