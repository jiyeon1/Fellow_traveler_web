<!-- 로그인 -->
<%@page import="com.project.tfa.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script type="text/javascript" language="JavaScript" src="formCheck.js"></script>
<style>
	.div_a{
		background-color:white;
		height : 500px;
		width : 680px;
		-webkit-box-shadow: 10px 7px 15px 3px rgba(240,237,232,0.72);
		-moz-box-shadow: 10px 7px 15px 3px rgba(240,237,232,0.72);
		box-shadow: 10px 7px 15px 3px rgba(204,198,190,1);
	}
	.wallpaper{
   		background-color:#343f50;
   		background-size:auto;
   		background-repeat:no-repeat;
	}
	.my_box{
		font-family: '함초롬돋움';
		color: white;
		/* text-align : center; */
		border : 0px;
		background-color:#343f50;
		height : 35px;
		width : 400px;
		position : relative;
	}
	.my_box:hover{
		background-color: #5b79a6;
	}
	.search{
		font-family: '함초롬돋움';
		font-weight: bold;
		font-size: 17px;
	}
	.img-button{
		background:url("image/join_button.png") no-repeat;
		background-size: 100px 48px;
		height:50px;
		width:100px;
		cursor:pointer;
		border:none;
		onfocus:this.blur();
	}
</style>
</head>
<body class="wallpaper">
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	if(loginChceck.pass(id,password)){
		session.setAttribute("id",id);
		session.setAttribute("login","yes");
	}
	String logout = request.getParameter("logout");
	if(logout != null && logout.equals("yes")){
		session.removeAttribute("id");
		session.removeAttribute("login");
	}
	String login = (String)session.getAttribute("login");
	if(login != null && login.equals("yes")){
		out.println("<script>");
		out.println("alert('로그인 되었습니다.환영합니다!')");
		out.println("location.href='three.jsp'");
		out.println("</script>");
	}else{
%>
	<br><br><br><br>
	<center>
	<img src="image/이름.png"/>
	<br>
	<div class="div_a">
	<br><Br>
    <font face="consolas">
	<form action="loginCheck.jsp" method="post" onsubmit="return loginCheck(this)">
	<img src="image/arrow.png"/><Br>
	<table>
		<tr><td colspan="3" class="search">ID</td></tr>
		<tr>
			<td colspan="2"><input type="text" name="id" class="my_box"/></td>
			<td rowspan="3" align="center"width="110"><button type="submit" style="border: 0; background: transparent">
    			<img src="image/signin_button.png"  width="100" height="145" alt="submit" /></td>
		</tr>
		<tr><td colspan="3" class="search">PW</td></tr>
		<tr><td colspan="2"><input type="password" name="password" class="my_box"/></td>
		<tr><td colspan="3">&nbsp</td></tr>
		<tr>
			<td class="search" align="center"><a href="searchIdForm.jsp">▶ 아이디 찾기</a></td>
			<td class="search" align="center"><a href="searchPwForm.jsp">▶ 비밀번호 찾기</a></td>
			<td align="center"><input type="button" class="img-button" onclick="location.href='joinPage.jsp'"></td>
		</tr>
	</table>
	</form>
	</font>
	</center>
	</div>
	</center>
	<%} %>
</body>
</html>