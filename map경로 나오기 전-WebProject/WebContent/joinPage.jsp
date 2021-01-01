<!-- 회원가입 하기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" language="JavaScript" src="formCheck.js"></script>
<style>
	table{
		width : 600px;
		height : 300px;
		align : center;
		border-collapse: collapse;
		border : 0px;
	}
	.table_border{
		background-color:white;
		-webkit-box-shadow: 10px 10px 11px 2px rgba(219,216,212,0.61);
		-moz-box-shadow: 10px 10px 11px 2px rgba(219,216,212,0.61);
		box-shadow: 10px 10px 11px 2px rgba(204,198,190,1);
		height : 550px;
		width : 700px;
	}
		
	th{
		padding : 10px;
		text-align : center;
		width : 300px;
		font-size :24px;
		font-weight : bold;
		height:50px;
	}
	td{
		padding : 10px;
		text-align : center;
		width : 300px;
	}
	.my_box{
		font-family: '함초롬돋움';
		text-align : center;
		border : 0px;
		background-color:#f5f5f5;
		height : 35px;
		width : 400px;
		position : relative;
	}
	.my_box:hover{
		background-color: #9ba3a0;
	}
	.my_box:focus{
		background-color: #b8b8b8;
	}
	.my_box2{
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
   		background-size:auto;
   		background-repeat:no-repeat;
	}
</style>
</head>
<body class="wallpaper">
	<br><br>
	<center>
	<font face="consolas">
	<img src="image/이름.png"/><br><br>
	<div class="table_border">
	<br><br>
	<form action="joinOK.jsp" method ="post" onsubmit="return joinCheck(this)">
	<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>"/>
	<table>
		<tr><th colspan="3"><img src="image/user.png"/> </th></tr>
		<tr>
			<td>Id</td>
			<td>▶</td>
			<td><input type="text" name="id" class="my_box"/></td>
		</tr>
		<tr>
			<td>Password</td>
			<td>▶</td>
			<td><input type="password" name="password" class="my_box"/></td>
		</tr>
		<tr>
			<td>Name</td>
			<td>▶</td>
			<td><input type="text" name="name" class="my_box"/></td>
		</tr>
		<tr>
			<td>Student_Number</td>
			<td>▶</td>
			<td><input type="text" name="std" class="my_box"/></td>
		</tr>
		<tr>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="회원가입 하기" class="my_box2"/></td>
		</tr>
	</table>
	</form>
	</div>
	</font>
	</center>
</body>
</html>
