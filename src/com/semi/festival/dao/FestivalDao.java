package com.semi.festival.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.semi.common.JDBCTemplate;
import com.semi.festival.dto.FestivalDto;

public class FestivalDao extends JDBCTemplate {

	// 전국 축제 DB에 저장하기
	public int SaveFestivalData(List<FestivalDto> list) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String festivalDBinsert = " INSERT INTO FESTIVAL_DB VALUES(FESTIVAL_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?) ";

		try {
			pstm = con.prepareStatement(festivalDBinsert);
			for (int i = 0; i < list.size(); i++) {
				FestivalDto dto = list.get(i);
				pstm.setString(1, dto.getFestival_name());
				pstm.setString(2, dto.getFestival_place());
				pstm.setString(3, dto.getFestival_start());
				pstm.setString(4, dto.getFestival_end());
				pstm.setString(5, dto.getFestival_img());
				pstm.setString(6, dto.getFestival_con());
				pstm.setString(7, dto.getFestival_num());
				pstm.setString(8, dto.getHomepage());
				pstm.setString(9, dto.getAddress());
				pstm.setString(10, dto.getAgency());

				pstm.addBatch();
			}
			int[] result = pstm.executeBatch();
			System.out.println("04. query 실행 및 리턴");
			for (int i = 0; i < result.length; i++) {
				if (result[i] == -2) {
					res++;
				}
			}
			if (res == list.size()) {
				commit(con);
			} else {
				rollback(con);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return res;
	}
	//----삭제하기
	public int delete() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String deleteDB = " DELETE FROM FESTIVAL_DB ";

		try {
			pstm = con.prepareStatement(deleteDB);
			System.out.println("03. query 준비");
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstm.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return res;
	}

	// 전국 축제 전체 보기
	public List<FestivalDto> FestivalList() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<FestivalDto> list = new ArrayList<>();

		String FestivalList = " SELECT * FROM FESTIVAL_DB ORDER BY FESTIVAL_START ";

		try {
			pstm = con.prepareStatement(FestivalList);
			System.out.println("03 query 준비");
			rs = pstm.executeQuery();
			while (rs.next()) {
				FestivalDto dto = new FestivalDto();
				dto.setFestival_seq(rs.getInt(1));
				dto.setFestival_name(rs.getString(2));
				dto.setFestival_place(rs.getString(3));
				dto.setFestival_start(rs.getString(4));
				dto.setFestival_end(rs.getString(5));
				dto.setFestival_img(rs.getString(6));
				dto.setFestival_con(rs.getString(7));
				dto.setFestival_num(rs.getString(8));
				dto.setHomepage(rs.getString(9));
				dto.setAddress(rs.getString(10));
				dto.setAgency(rs.getString(11));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstm.close();
				con.close();
				System.out.println("05 DB종료");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	// 월별 축제 보기
	public List<FestivalDto> MonthFestival(String month) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<FestivalDto> list = new ArrayList<>();

		String MonthFestival = " SELECT * FROM FESTIVAL_DB WHERE SUBSTR(FESTIVAL_START,6,2) = ? ORDER BY FESTIVAL_START ";

		try {
			pstm = con.prepareStatement(MonthFestival);
			pstm.setString(1, month);
			System.out.println("03 query 준비");
			rs = pstm.executeQuery();
			while (rs.next()) {
				FestivalDto dto = new FestivalDto();
				dto.setFestival_seq(rs.getInt(1));
				dto.setFestival_name(rs.getString(2));
				dto.setFestival_place(rs.getString(3));
				dto.setFestival_start(rs.getString(4));
				dto.setFestival_end(rs.getString(5));
				dto.setFestival_img(rs.getString(6));
				dto.setFestival_con(rs.getString(7));
				dto.setFestival_num(rs.getString(8));
				dto.setHomepage(rs.getString(9));
				dto.setAddress(rs.getString(10));
				dto.setAgency(rs.getString(11));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstm.close();
				con.close();
				System.out.println("05 DB종료");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;

	}// 축제 1개 자세히 보기
	public FestivalDto selectFestival(int seq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		FestivalDto dto = null;

		String selectFestival = " SELECT * FROM FESTIVAL_DB WHERE FESTIVAL_SEQ = ? ";
		try {
			pstm = con.prepareStatement(selectFestival);
			pstm.setInt(1, seq);
			System.out.println("03 query 준비");
			rs = pstm.executeQuery();

			while (rs.next()) {
				dto = new FestivalDto();
				dto.setFestival_seq(rs.getInt(1));
				dto.setFestival_name(rs.getString(2));
				dto.setFestival_place(rs.getString(3));
				dto.setFestival_start(rs.getString(4));
				dto.setFestival_end(rs.getString(5));
				dto.setFestival_img(rs.getString(6));
				dto.setFestival_con(rs.getString(7));
				dto.setFestival_num(rs.getString(8));
				dto.setHomepage(rs.getString(9));
				dto.setAddress(rs.getString(10));
				dto.setAgency(rs.getString(11));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstm.close();
				con.close();
				System.out.println("05 DB종료");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dto;
	}
}