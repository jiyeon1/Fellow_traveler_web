<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
#body {
	background-color: #343f50;
}

.table_border { /* 흰색배경 css */
	background-color: white;
	-webkit-box-shadow: 10px 10px 11px 2px rgba(219, 216, 212, 0.61);
	-moz-box-shadow: 10px 10px 11px 2px rgba(219, 216, 212, 0.61);
	box-shadow: 10px 10px 11px 2px rgba(204, 198, 190, 1);
	height: 500px;
	width: 700px;
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
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body id="body">
	<div style="background-color:white" style="width:100%">
   <nav id="topMenu" >
      <ul>
         <li><a class="menuLink" href="three.jsp">HOME</a></li>
         <li>|</li>
         <li><a class="menuLink" href="map.jsp">MAP</a></li>
         <li>|</li>
         <li><a class="menuLink" href="board-list">BOARD</a></li>
         <li>|</li>
         <li><a class="menuLink" href="main.jsp?logout=yes">LOGOUT</a></li>
      </ul>
   </nav>
   </div>
	<br>
	<br>
	<br>
	<br>
	<center>
		<img src="image/jj.png" /><br>
		<br>
		<div class="table_border">
			<font face="함초롬돋움"> <br>
			<big><b>▲ 게 시 판 ▲</b></big><br>
			<br>
				<table align="center" width="600">
					<tr>
						<td colspan="3" align="right">
							<form action="board-insert.jsp">
								<input type="image" src="image/new.png"
									style="width: 70px; height: 35px">
							</form>
						</td>
					</tr>
					<tr bgcolor="#343f50" align="center" width="75">
						<th width="5"><font color="white"> 글번호 </font></th>
						<th width="55"><font color="white"> 글제목 </font></th>
						<th width="15"><font color="white"> 글쓴이 </font></th>
						<%
					int id, ref, rownum = 0;
					Connection conn = null;
					Statement stmt = null;
					String sql = null;
					ResultSet rs = null;
					try {
						Class.forName("com.mysql.jdbc.Driver");
						String jdbcurl = "jdbc:mysql://localhost:3306/pjboard_db?useUnicode=true&characterEncoding=utf8";
						conn = DriverManager.getConnection(jdbcurl, "root", "9878");
						stmt = conn.createStatement();
						sql = "select * from pjboard_tbl order by ref desc, id asc";
						rs = stmt.executeQuery(sql);
					} catch (Exception e) {
						out.println("DB연동오류입니다.:" + e.getMessage());
					}
					rs.last();
					rownum = rs.getRow();
					rs.beforeFirst();

					while (rs.next()) {
						id = Integer.parseInt(rs.getString("id"));
						ref = Integer.parseInt(rs.getString("ref"));

				%>
					</tr>
					<tr>
						<td align="center"><%= rownum %></td>
						<td align="left">
							<% if(id != ref) out.println("└→"); %> <a href=board-read.jsp?id=<%=rs.getString("id")%> width="250"> <%=rs.getString("title")%></a>
						</td>
						<td align="center"><%=rs.getString("name")%></td>
					</tr>
					<%
				rownum--;
				}
			%>
				</table> <%
			stmt.close();
			conn.close();
		%>
			</font>
		</div>
	</center>
</body>
</html>