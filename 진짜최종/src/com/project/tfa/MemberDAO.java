//���̵�/��й�ȣ �˻�
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
//�α��ν� ���̵�, ��й�ȣ Ȯ���ϱ�
	public int loginCheck(String id,String pw) {
		PreparedStatement pstmt = null;
		Connection conn = DBUtil.getMySQLConnection();
		ResultSet rs = null;
		String dbPW="";	//DB���� ���� ��й�ȣ
		int x=-1;
		
		try {			
			//���� �Էµ� ���̵�� db���� ��й�ȣ ��ȸ
			StringBuffer query = new StringBuffer();
			query.append("select password from member where id=?");
			pstmt=conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {//���̵� �ش��ϴ� ��й�ȣ�� �ִ°��
				dbPW=rs.getString("password");
				if(dbPW.equals(pw))
					x=1;	//db�� ����� ��й�ȣ�� ���� - ��������
				else
					x=0;	//��й�ȣ�� �ٸ� - ��������
			}else {
				x=-1;	//���̵� Ʋ�� ���
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
