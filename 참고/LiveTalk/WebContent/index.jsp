<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Live Talk</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<link rel="stylesheet" type="text/css" href="./css/mycss.css">
<script type="text/javascript" src="./js/myjs.js"></script>
</head>
<body>
	<div id="title">
		<h1>
			<a href=".">LiveTalk</a>
		</h1>
	</div>
	<div id="content">

		<div id="nav">
			<div id="plustopic">
				<a href="javascript:newtopic()" id="toggle"> 항목 추가 +</a>
				<div id="addtopic">
					<form action="./jsp/topic.jsp" method=post>
						<input type="text" name="TopicName"></input> <input class="submit"
							type="submit" value="add"></input>
					</form>
				</div>
			</div>
			<div id="topmenu">
				<ul>
					<%
							request.setCharacterEncoding("UTF-8");
							Connection conn = null;
							Statement stmt = null;
							ResultSet rs = null;
	
							String url = "jdbc:mysql://localhost:3306/livetalk";
							String userid = "root";
							String passwd = "a19950417";
							try {
	
								String topicName = null;
								int topicNum;
								String sql = "select * from topic";
	
								conn = DriverManager.getConnection(url, userid, passwd);
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
	
									topicName = rs.getString("name");
									topicNum = rs.getInt("num");
									out.println("<li><a class='topicStyle' href='?id=TB_" + topicNum + "'>" + topicName + "</a></li>");
	
								}
	
							} catch (Exception e) {
								out.println(e);
	
							}
						%>
				</ul>
			</div>
		</div>


		<div id="article">
			<div id="introduce">
				<h1>Hello Welcome to Live Talk</h1>
				<p>What is your today's Topic?</p>
			</div>
			<div id="writearea">
				<script>
					var para = getParam("id");
					var write = document.getElementById("writearea");
					var intro = document.getElementById("introduce");
					if (para == "")
						write.style.display = "none";
					else
						intro.style.display = "none";
				</script>
				<form class="write" action="./jsp/input.jsp" method=post
					enctype="multipart/form-data">
					<ul>
						<li><input type="text" name="identity" value="ID"
							onFocus="clearText(this)"> <input type="password"
							name="password" value="Password" onFocus="clearText(this)">
						</li>
						<li><textarea class="field-style" name="content" cols=10
								rows=5 maxlength="150"></textarea> <script>
								document.writeln("<input type='hidden' 	name='topic' value='"+para+"'>");
							</script></li>
						<li><input type="file" name="uploadFile"
							accept=".gif, .jpg, .png"> <input type="submit"
							value="Send"></li>
					</ul>
				</form>
			</div>
			<div id="talkarea">
				<%	
					try {
						String topic = null;
						topic = request.getParameter("id");
						if (topic != null) {
							String sql = "select * from " + topic + " order by num desc;";
	
							conn = DriverManager.getConnection(url, userid, passwd);
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
							while (rs.next()) {
								out.println("<div class='talk'>");
								out.println("<h3 class='title'>" + rs.getInt("num") + " " + rs.getString("identity") + "</h3> <p class='time'> " + rs.getString("time") + "</p>");
								out.println("<a class='deltalk' href='javascript:deltalk( " + rs.getInt("num") + " , \"" + topic + "\")'>x</a>");
								out.println("<form style='display:none' id='talk" + rs.getInt("num") + "' action='./jsp/deltalk.jsp'></form>");
								out.println("<p class='content'>" + rs.getString("content") + "</p>");
								if(rs.getString("imgName")!=null)
									out.println("<a class='aimg' href='./img/" + rs.getString("imgName") + "'> 이미지 보기 </a> <img src='./img/" + rs.getString("imgName") + "' class='img' > ");
								out.println("</div>");
							}
						}
					} catch (Exception e) {
					} finally {
						try {
							stmt.close();
						} catch (Exception e) {
						}
						try {
							conn.close();
						} catch (Exception e) {
						}
					}
				%>
			</div>
		</div>


	</div>
	<div id="foot">
		<p>⊙ Copyright(c)2016 by 김현수. All Page content is property of 김현수
		</p>
	</div>
</body>
</html>
