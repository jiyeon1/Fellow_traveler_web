//아이디/비밀번호 검사
package com.project.tfa;

import java.sql.*;
import javax.naming.NamingException;

public class MemberDAO {
    private Connection getConnection() throws Exception
    {
          String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";

          return DriverManager.getConnection(jdbcDriver);
    }


	private static MemberDAO instance;
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		if(instance==null)
			instance=new MemberDAO();
		return instance;
	}
//로그인시 아이디, 비밀번호 확인하기
	public int loginCheck(String id,String pw) {
		PreparedStatement pstmt = null;
		Connection conn = DBUtil.getMySQLConnection();
		ResultSet rs = null;
		String dbPW="";	//DB에서 꺼낸 비밀번호
		int x=-1;
		
		try {			
			//먼저 입력된 아이디로 db에서 비밀번호 조회
			StringBuffer query = new StringBuffer();
			query.append("select password from member where id=?");
			pstmt=conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {//아이디에 해당하는 비밀번호가 있는경우
				dbPW=rs.getString("password");
				if(dbPW.equals(pw))
					x=1;	//db에 저장된 비밀번호와 같음 - 인증성공
				else
					x=0;	//비밀번호가 다름 - 인증실패
			}else {
				x=-1;	//아이디가 틀린 경우
			}
			return x;
		}
		catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		finally {
			try {
				if(pstmt!=null) {pstmt.close(); pstmt=null;}
				if(conn!=null) {conn.close(); conn=null;}
				}catch(Exception ee){
				throw new RuntimeException(ee.getMessage());
			}
		}
	}
}
