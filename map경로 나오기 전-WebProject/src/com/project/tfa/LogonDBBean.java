package com.project.tfa;

import java.sql.*;
import java.util.Vector;

public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean();

	public static LogonDBBean getInstance() {
		return instance;
	}

	private LogonDBBean() {
	}

	// 아이디 찾기
	public LogonDataBean searchId(String name, String std)throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean sid = null;

		try {
			conn = DBUtil.getMySQLConnection();
			pstmt = conn.prepareStatement("select id from member where name = ? " + "and std = ?");
			pstmt.setString(1, name);
			pstmt.setString(2, std);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sid = new LogonDataBean();
				sid.setId(rs.getString("id"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return sid;
	}

	// 비밀번호 찾기
	public LogonDataBean searchPw(String id, String std) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean spw = null;

		try {
			conn = DBUtil.getMySQLConnection();
			pstmt = conn.prepareStatement("select password from member where id = ? " + "and std = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, std);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				spw = new LogonDataBean();
				spw.setPasswd(rs.getString("password"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return spw;
	}
}
