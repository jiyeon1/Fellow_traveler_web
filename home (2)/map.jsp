<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-color:#343f50;
}
table, td {
	border: 1px solid white
}

table {
	height: 100px;
	margin: auto;
	text-align: center;
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
                        text-decoration:none;
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
<div style="background-color:white" style="width:100%">
	<nav id="topMenu" >
		<ul>
			<li><a class="menuLink" href="three.jsp">HOME</a></li>
			<li>|</li>
			<li><a class="menuLink" href="map.jsp">MAP</a></li>
			<li>|</li>
			<li><a class="menuLink" href="board_list">BOARD</a></li>
			<li>|</li>
			<li><a class="menuLink" href="">LOGOUT</a></li>
			
			
		</ul>
	</nav>
	</div>
	<div class="back">
		
		<table style="width:100%"  frame=void>
			<tr>
				<td colspan="4">여백</td>
			</tr>

			<tr style="background-color:white">
			<td style="width: 200px;"></td>
				<td><img src="image/campusmap.jpg"
					style="height: 500px; width: 600px;"></td>
				<td style="width: 500px">길찾기</td>
			<td style="width: 200px;"></td>
			</tr>
		</table>
	
	</div>
</body>
</html>