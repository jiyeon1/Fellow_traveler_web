<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 완료</title>
<style>
   .wallpaper{
         background-color:#343f50;
   }
   .table_border{ /* 흰색배경 css */
      background-color:white;
      -webkit-box-shadow: 10px 10px 11px 2px rgba(219,216,212,0.61);
      -moz-box-shadow: 10px 10px 11px 2px rgba(219,216,212,0.61);
      box-shadow: 10px 10px 11px 2px rgba(204,198,190,1);
      height : 500px;
      width : 700px;   }
   .my_box2{/*버튼 css  */
      font-family: '함초롬돋움';
      color: white;
      font-weight : bold;
      text-align : center;
      border : 2px solid #f08b07;
      background-color: #343f50;
      height : 40px;
      width : 150px;
      border-radius: 5px;
   }
</style>
</head>
<body  class="wallpaper">
<%
	int id;
	String name="", title="", content="";
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	id=Integer.parseInt(request.getParameter("id"));
	name=request.getParameter("name");
	title=request.getParameter("title");
	content=request.getParameter("content");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/pjboard_db";
		conn=DriverManager.getConnection(url,"root","9878");
		stmt=conn.createStatement();
		String sql_update="update pjboard_tbl set name= '" + name +"', title = '"
				+title+"', content= '"+content+"' where id = " + id;
		stmt.executeUpdate(sql_update);
	}
	catch(Exception e) {
		out.println("DB 연동 오류입니다. : " + e.getMessage());
	}
%>
   <br><br><br><br>
   <center>
   <img src="image/jj.png"/><br><br>
   <div class="table_border">
   <br><big><b>게시글이 수정되었습니다.</b></big><br><br>
   <a href="board-read.jsp?id=<%=request.getParameter("id")%>">
   	<input type="button" value="글 확인" class="my_box2" onclick="location.href='board-list.jsp'"/>
   </a>
   <a href="board-list.jsp">
   	<input type="button" value="목록" class="my_box2"/>
   </a>
   </div>
	</center>
</body>
</html>