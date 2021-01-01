<%@page import="com.project.tfa.*" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
	.my_box3{
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
<body bgcolor="#343f50">
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = request.getParameter("id");
	String std = request.getParameter("std");
	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.searchPw(id,std);
	try{
%>
	<center>
	<form method="post" action="main.jsp">
	<br><br><br><br><br><br><br><br><br>
	<div class="div_a"> <br><br><br><br>
	<font face="함초롬돋움">
	<img src="image/find.png" /><br><br>
	<%
		if(c!= null){
			%>
			<h2><%=id %>님의 비밀번호는&nbsp<big><big><font color="#f08b07"><%= c.getPasswd() %></font></big></big>입니다. </h2>
			<p><br><br>
			<input type="submit" value="로그인하기" class="my_box3">
			<%
		}else{
			%>
			<h2>아이디 또는 학번이 틀렸습니다!<br>다시 입력해 주세요<p></h2><br><br>
			<input type="button" value="다시 입력하기"  class="my_box3" onclick="location.href='searchPwForm.jsp'">
		<%
		}%>
	</font>
	</div>	
	</form>
	</center>
	<%
	}catch(Exception e){}
	%>
</body>
</html>