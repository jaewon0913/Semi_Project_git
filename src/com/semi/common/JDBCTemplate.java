package com.semi.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {

	public static Connection getConnection() {
		Connection con = null;
		// 1. dricver 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("01.driver 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("01.driver 연결 실패");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "kh";
			String pw = "kh"; // 확장성을 위해서 변수를 대입하는것이 좋다
			con = DriverManager.getConnection(url, id, pw);
			con.setAutoCommit(false);
			System.out.println("02. 계정 연결");
		} catch (SQLException e) {
			System.out.println("02. 계정 연결 실패");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	public static void close(Statement stmt) {
		
		try {
			if(stmt != null) {
			stmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs != null) {
			rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(Connection con) {
		try {
			if(con != null) { //nullpointexeption방지 // 단점: 오류났을때 찾기 어려울수도 있다 //없어도 됨;
			con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void commit(Connection con) {
		if(con != null) {
			try {
				con.commit(); //저장되어 있지 않은 데이터를 저장하고 트랜잭션 종료
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void rollback(Connection con) {
		if(con!=null) {
			try {
				con.rollback(); //저장되어 있지 않은 데이터를 모두 취소 후 트랜잭션을 종료
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
