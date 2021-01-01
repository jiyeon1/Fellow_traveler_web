<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8">
<style>
html { 
  background: url(image/dd.png) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

</style>
</head>
<body>
<%
	int temp=0, cnt;
	int new_id=0, ref=0;
	String name, title, content, passwd, reply;
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	String sql_update;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/pjboard_db?useUnicode=true&characterEncoding=utf8";
		conn=DriverManager.getConnection(url, "root", "0000");
		stmt=conn.createStatement();
		String sql="select max(id) as max_id, count(*) as cnt from pjboard_tbl";
		rs = stmt.executeQuery(sql);
	} catch(Exception e) {
		out.println("DB 연동 오류입니다. : "+e.getMessage());
	}
	while(rs.next()) {
		cnt=Integer.parseInt(rs.getString("cnt"));
		if(cnt != 0)
			new_id = Integer.parseInt(rs.getString("max_id"));
	}
	
	new_id++;
	name=request.getParameter("name");
	title=request.getParameter("title");
	content=request.getParameter("content");
	passwd=request.getParameter("passwd");
	reply=request.getParameter("reply");
	
	if("y".equals(reply)) {
		ref=Integer.parseInt(request.getParameter("ref"));
	}else {
		ref = new_id;
	}
	
	sql_update="insert into pjboard_tbl values (" + new_id + ",'" + name+ "','" + 
	title+"','"+content+"','"+passwd+"',"+ref+")";
	try {
		stmt.executeUpdate(sql_update);
	} catch(Exception e) {
		out.println("DB 연동 오류입니다. : "+e.getMessage());
	}
%>
<%
	out.println("<script>");
	out.println("alert('작성된 글이 등록되었습니다.')");
	out.println("location.href='board-list.jsp'");
	out.println("</script>");
%>
</body>
</html>