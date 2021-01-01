<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean"
	rel="stylesheet">
<style>
body {
	text-align: center;
	margin: 0 auto;
}

#logo {
	margin-top: 5%;
	width: 300px;
	height: 150px;
	margin: 10px;
}

#box {
	position: absolute;
	width: 100%;
	height: 500px;
	top: 60%;
	margin-top: -300px;
	border: #000 solid 1px;
	background: #343f50;
}

#circle {
	width: 250px;
	height: 250px;
}

.threesteps {
	margin-top: 125px;
	float: left;
	width: 33%;
}

.card {
	width: 250px;
	height: 250px;
	position: relative;
	display: inline-block;
}

.card .img-top {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 99;
	width: 250px;
}

.card:hover .img-top {
	display: inline;
}

.card .over {
	display: none;
}

.card:hover .over {
	font-size: 30px;
	font-family: 'Do Hyeon', sans-serif;
	display: inline;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 250px;
	height: 250px;
	margin-top: 40px;
	text-align: center;
	line-height: 200%;
	z-index: 99;
}
</style>
</head>
<body>
	<img id="logo" src="image/로고.jpg">

	<div id="box">
		<div class="threesteps">
			<div class="card">

				<img src="image/1.png" alt="Card Back" style="width: 250px"> <img
					src="image/11.png" class="img-top" alt="Card Front">
				<div class="over"><br>
					<a href="map.jsp"
						style="text-decoration: none; color: white; font-size:40px;">길찾기</a>
				</div>
			</div>
		</div>
		<div class="threesteps">
			<div class="card">

				<img src="image/2.png" alt="Card Back" style="width: 250px"> <img
					src="image/22.png" class="img-top" alt="Card Front">
				<div class="over"><br>
					<a href="board-list.jsp"
						style="text-decoration: none; color: white; font-size:40px;">게시판</a>
				</div>
			</div>
		</div>
		<div class="threesteps">
			<div class="card">
				<img src="image/3.png" alt="Card Back" style="width: 250px"> <img
					src="image/33.png" class="img-top" alt="Card Front">
				<div class="over">
					<a href="http://www.dongguk.edu"
						style="text-decoration: none; color: white">동국대학교</a><br> <a
						href="http://lib.dongguk.edu/"
						style="text-decoration: none; color: white">중앙도서관</a><br> <a
						href="https://eclass.dongguk.edu/"
						style="text-decoration: none; color: white">이클래스</a>

				</div>
			</div>
		</div>
	</div>


</body>
</html>