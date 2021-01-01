//check
package com.project.tfa;
import java.sql.*;

public class loginChceck {
	public static boolean pass(String id, String password) {//로그인 체크
		String pass;
		Connection conn = DBUtil.getMySQLConnection();
		
		String sql = "select * from member where id =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pass = rs.getString("password");
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
			if(pass.equals(password)) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean check(String id) {//아이디 중복체크
		Connection conn = DBUtil.getMySQLConnection();
		String sql = "select id from member";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("id").equals(id)) {
					return true;
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
