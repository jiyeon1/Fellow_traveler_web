<%@page import="map.*" %>
<%@page import="com.project.tfa.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-color: #343f50;
}

table {
	height: 100px;
	margin: auto;
	text-align: center;
	border-collapse: collapse;
}

.back {
	background-color: #343f50;
	width: 100%;
}

#topMenu {
	height: 30px;
	width: 850px;
}

#topMenu ul li {
	list-style: none;
	color: #343f50;
	background-color: white;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: black;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS";
}

#topMenu .menuLink:hover {
	color: red;
	background-color: yellow;
}
</style>
</head>
<body>
	<div style="background-color: white" style="width:100%">
		<nav id="topMenu">
			<ul>
				<li><a class="menuLink" href="three.jsp">HOME</a></li>
				<li>|</li>
				<li><a class="menuLink" href="map.jsp">MAP</a></li>
				<li>|</li>
				<li><a class="menuLink" href="board-list.jsp">BOARD</a></li>
				<li>|</li>
				<li><a class="menuLink" href="main.jsp?logout=yes">LOGOUT</a></li>

			</ul>
		</nav>
	</div>
	<div class="back">
		<table style="width: 100%">
			<tr>
				<td colspan="2">&nbsp</td>
			</tr>
			<tr style="background-color: white">
				<td style="width: 40%"><img src="image/campusmap.jpg" style="height: 560px; width: 780px;"/></td>
				<td style="width: 60%">
				<form action="Route" method="get">
					<select name="classroom1">
						<option value="" selected> -선택- </option>
						<option value="1">학술관</option>
						<option value="2">문화관</option>
						<option value="3">사회과학관</option>
						<option value="4">경영관</option>
						<option value="5">박물관</option>
						<option value="6">혜화관</option>
						<option value="7">법학관</option>
						<option value="8">만해관</option>
						<option value="9">다향관</option>
						<option value="10">명진관</option>
						<option value="11">과학관</option>
						<option value="12">상록원</option>
						<option value="13">중앙도서관</option>
						<option value="14">본관</option>
						<option value="15">신공학관</option>
						<option value="16">원흥관</option>
						<option value="17">정보문화관</option>
						<option value="18">학생회관</option>
						<option value="19">계산관B</option>
						<option value="20">금강관</option>
						<option value="21">체육관</option>
						<option value="22">학림관</option>
						<option value="23">계산관A</option>
					</select><br>
					<select name="classroom2">
						<option value="" selected> -선택- </option>
						<option value="1">학술관</option>
						<option value="2">문화관</option>
						<option value="3">사회과학관</option>
						<option value="4">경영관</option>
						<option value="5">박물관</option>
						<option value="6">혜화관</option>
						<option value="7">법학관</option>
						<option value="8">만해관</option>
						<option value="9">다향관</option>
						<option value="10">명진관</option>
						<option value="11">과학관</option>
						<option value="12">상록원</option>
						<option value="13">중앙도서관</option>
						<option value="14">본관</option>
						<option value="15">신공학관</option>
						<option value="16">원흥관</option>
						<option value="17">정보문화관</option>
						<option value="18">학생회관</option>
						<option value="19">계산관B</option>
						<option value="20">금강관</option>
						<option value="21">체육관</option>
						<option value="22">학림관</option>
						<option value="23">계산관A</option>
					</select><br>
					<select name="classroom3">
						<option value="" selected> -선택- </option>
						<option value="1">학술관</option>
						<option value="2">문화관</option>
						<option value="3">사회과학관</option>
						<option value="4">경영관</option>
						<option value="5">박물관</option>
						<option value="6">혜화관</option>
						<option value="7">법학관</option>
						<option value="8">만해관</option>
						<option value="9">다향관</option>
						<option value="10">명진관</option>
						<option value="11">과학관</option>
						<option value="12">상록원</option>
						<option value="13">중앙도서관</option>
						<option value="14">본관</option>
						<option value="15">신공학관</option>
						<option value="16">원흥관</option>
						<option value="17">정보문화관</option>
						<option value="18">학생회관</option>
						<option value="19">계산관B</option>
						<option value="20">금강관</option>
						<option value="21">체육관</option>
						<option value="22">학림관</option>
						<option value="23">계산관A</option>
					</select><br>
					<input type="submit" value="확인"/>
				</form>
				</td>
			</tr>
		</table>

	</div>
</body>
</html>