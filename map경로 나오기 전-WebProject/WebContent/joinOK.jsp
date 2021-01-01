<!-- 회원가입 연동 확인  -->
<%@page import="com.project.tfa.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 연동</title>
<style>
	.font_a{
		color : #f08b07;
		font-size : 20px;
	}
	.div_a{
		background-color:white;
		height : 530px;
		width : 600px;
		-webkit-box-shadow: 10px 7px 15px 3px rgba(240,237,232,0.72);
		-moz-box-shadow: 10px 7px 15px 3px rgba(240,237,232,0.72);
		box-shadow: 10px 7px 15px 3px rgba(204,198,190,1);
	}
	.button_a{
		border: 0;
		background: transparent;
	}
</style>
</head>
<body bgcolor="#343f50">
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String std = request.getParameter("std");
		String ip = request.getParameter("ip");
		
		if(loginChceck.check(id)){
			out.println("<script>");
			out.println("alert('아이디가 중복됩니다! 다른 아이디를 사용해 주세요.')");
			out.println("location.href='joinPage.jsp'");
			out.println("</script>");
		}
		else{
		Connection conn = DBUtil.getMySQLConnection();
		String sql = "insert into member(id, password, name, std, ip) values(?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		pstmt.setString(2,password);
		pstmt.setString(3,name);
		pstmt.setString(4,std);
		pstmt.setString(5,ip);
		
		try{
			pstmt.executeUpdate();
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
		
		DBUtil.close(pstmt);
		DBUtil.close(conn);
	%>
	<br><br><br><br><br><br><br><br><br>
	<center>
	<div class="div_a"> <br><br><br><br>
	<font face="함초롬돋움">
	<img src="image/success.png" /><br><br>
	<h2>회원가입이 완료 되었습니다 :)</h2>
	<h4><font class="font_a"><%=name %></font>&nbsp&nbsp님의 회원가입을 축하합니다! <br><br> </h4>
	<hr width="500" color="lightgray"><br>
	<button type="submit" class="button_a" onclick="location.href='main.jsp'">
    	<img src="image/start.png" width="390" height="60" alt="submit" />
	</font>
	</div>
	</center>
	<%} %>
</body>
</html>