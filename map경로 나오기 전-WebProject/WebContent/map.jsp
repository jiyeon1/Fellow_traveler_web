<%@page import="map.*"%>
<%@page import="com.project.tfa.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean"
	rel="stylesheet">
<meta charset="UTF-8">
<title>길찾기</title>
<style>
body {
	background-color: #343f50;
}

table {
	height: 300px;
	width: 100%;
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
	background-color: #f4c804;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}

h2 {
	font-family: '함초롬돋움';
}

select {
	width: 250px;
	padding: .8em .5em;
	font-family: '함초롬돋움';
	font-size: 15px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: url("image/화살표.png") no-repeat 95% 50%;
	background-size: 27px 27px;
	border: 3px solid #343f50;
}

.my_box2 {
	 font-family: '함초롬돋움';
   color: white;
   font-weight: bold;
   text-align: center;
   border: 2px solid #343f50;
   height: 40px;
   width: 150px;
   border-radius: 5px;
   background-color: #343f50;

}

.my_box2:hover {
	font-family: '함초롬돋움';
	color: white;
	font-weight: bold;
	text-align: center;
	border: 0px;
	background-color: #f2b604;
	color: black;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.div {
	display: table;
	width: 100%;
	height: 100px;
}

.p {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
	letter-spacing: 50px;
	font-size: 50px;
	text-align: center;
	font-family: 'Do Hyeon', sans-serif;
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
				<li><a class="menuLink" style="color: gray"
					href="main.jsp?logout=yes">LOGOUT</a></li>
			</ul>
		</nav>
	</div>
	<center>
		<div class="div" style="background-color: #f4c804">
			<p class="p">길찾기
		</div>
		</div>
	</center>
	<div class="back">
		<table>
			<tr style="background-color: white; height: 700px;">
				<td style="width: 5%">&nbsp</td>
				<td style="width: 40%"><img src="image/campusmap.jpg"
					style="height: 560px; width: 780px; border: 12px solid #343f50" /></td>
				<td style="width: 55%"><img src="image/map.png" />
					<form action="Route" method="get">
						<h2>1교시 수업이 있는 장소를 선택하세요.</h2>
						<select name="classroom1">
							<option value="" selected>-선택-</option>
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
						<h2>2교시 수업이 있는 장소를 선택하세요.</h2>
						<select name="classroom2">
							<option value="" selected>-선택-</option>
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
						</select><br><br><br><br>
						<input type="submit" value="확인" class="my_box2" />
					</form></td>
			</tr>
		</table>
	</div>
</body>
</html>