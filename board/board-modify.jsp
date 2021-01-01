<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
   .table_border{ /* 흰색배경 css */
      background-color:white;
      -webkit-box-shadow: 10px 10px 11px 2px rgba(219,216,212,0.61);
      -moz-box-shadow: 10px 10px 11px 2px rgba(219,216,212,0.61);
      box-shadow: 10px 10px 11px 2px rgba(204,198,190,1);
      height : 500px;
      width : 700px;   }
   .my_box{ /* 입력 칸 css */
      font-family: '함초롬돋움';
      text-align : left;
      border : 0px;
      background-color:#f5f5f5;
      position : relative;
   }
   .my_box:hover{
      background-color: #9ba3a0;
   }
   .my_box:focus{
      background-color: #b8b8b8;
   }
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
   .wallpaper{
         background-color:#343f50;
   }
</style>
</head>
<body class="wallpaper">
<%
	int id;
	String name="",title="",content="",passwd="";
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	id=Integer.parseInt(request.getParameter("id"));
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/pjboard_db";
		conn=DriverManager.getConnection(url, "root","9878");
		stmt=conn.createStatement();
		String sql="select * from pjboard_tbl where id ="+id;
		rs=stmt.executeQuery(sql);
	}
	catch(Exception e) {
		out.println("DB 연동 오류입니다. : "+e.getMessage());
	}
	passwd=request.getParameter("passwd");
	while(rs.next()) {
		if(!passwd.equals(rs.getString("passwd")))
		{
%>
	<br><br><br><br>
	<center>
	<img src="image/jj.png"/><br><br>
	<div class="table_border">
	<br><big><b>비밀번호가 틀렸습니다.</b></big><br><br>
	<a href="board-read.jsp?id=<%=request.getParameter("id")%>">
	<input type=button value="뒤로가기" class="my_box2"/>
	</a>
	<a href="board-modify-pwd.jsp">
	<input type=button value="다시입력" class="my_box2"/>
	</a>
	</center>
	<%
		}
		else
		{
	%>
	<br><br><br><br>
	<center>
	<img src="image/jj.png"/><br><br>
	<div class="table_border">
	<form action="board-modify-db.jsp" method="post">
	<br><big><b>게시글 수정</b></big><br><br>
	<table border="0" align="center">
      <tr height="40">
         <th>글제목</th>
         <td>▶</td>
         <td><input type="text" name="title" class="my_box" size="30"
         value="<%=rs.getString("title") %>"/></td>
      </tr>
      <tr height="40">
         <th>글쓴이</th>
         <td>▶</td>
         <td><input type="text" name="name" class="my_box" size="15"
         value="<%=rs.getString("name") %>"/></td>
      </tr>
      <tr height="40">
         <th>글내용</th>
         <td>▶</td>
         <td><textarea name="content" cols="65" rows="10" class="my_box"
         value="<%=rs.getString("content") %>"></textarea></td>
      </tr>
   </table><br>
   <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
   <input type="submit" value="등록하기" class="my_box2"/>
   <input type="reset" value="다시쓰기" class="my_box2"/><br><br>
	</form>
	<a href="board-read.jsp?id=<%=request.getParameter("id")%>">취소</a>
	</center>
	<%
		}
	}
	%>
</body>
</html>