<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 게시판 </title>
<style>
#body{
	background-color:#343f50;
}
.table_border{ /* 흰색배경 css */
      background-color:white;
      -webkit-box-shadow: 10px 10px 11px 2px rgba(219,216,212,0.61);
      -moz-box-shadow: 10px 10px 11px 2px rgba(219,216,212,0.61);
      box-shadow: 10px 10px 11px 2px rgba(204,198,190,1);
      height : 500px;
      width : 700px;   }
</style>
</head>
<body id="body">
	<br><br><br><br>
	<center>
	<font face="함초롬돋움">
    <img src="image/jj.png"/><br><br>
    <div class="table_border">
    <br><big><b>▲ 게시글 내용 ▲</b></big><br><br>
    
	<%
		int id, ref =0;
		String name="", title="", content="";
		Connection conn = null;
		Statement stmt=null;
		ResultSet rs=null;
		
		id=Integer.parseInt(request.getParameter("id"));
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/pjboard_db?useUnicode=true&characterEncoding=utf8";
			conn=DriverManager.getConnection(url,"root","9878");
			stmt=conn.createStatement();
			String sql="select * from pjboard_tbl where id = " +id;
			rs=stmt.executeQuery(sql);
		} catch(Exception e) {
			out.println("DB 연동 오류입니다. : "+e.getMessage());	
		}
		
		while(rs.next()) {
			name=rs.getString("name");
			title=rs.getString("title");
			content=rs.getString("content");
			ref=Integer.parseInt(rs.getString("ref"));
		}
	%>
	<table border="0" align="center">
		<tr height="50">
			<th>글 제 목</th>
         	<td>▶</td>
			<td><%= title %></td>
		</tr>
		<tr height="50">
			<th width="70">글 쓴 이 </th>
         	<td width="20">▶</td>
			<td width="300"><%= name %></td>
		</tr>
		<tr height="50">
			<th>글 내 용</th>
         	<td>▶</td>
         	<td> <%= content %></td>
		</tr>
		<tr height="80">
			<td colspan="3" align="right">
			<a href="board-insert.jsp?ref=<%=ref%>&flag=r"><input type=button value="답글쓰기"></a>			
			<a href="board-modify-pwd.jsp?id=<%=id%>"><input type=button value="수정"></a>
			<a href="board-delete-pwd.jsp?id=<%=id%>"><input type=button value="삭제"></a>
			<a href="board-list.jsp"><input type=button value="목록"></a>
			
			</td>
		</tr>
	</table><br><br>
	</div>
	</font>
	</center>
</body>
</html>