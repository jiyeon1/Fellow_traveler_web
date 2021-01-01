<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
						request.setCharacterEncoding("UTF-8");
						Connection conn = null;
						Statement stmt = null;
						ResultSet rs = null;

						String topic = request.getParameter("topic");
						String password = request.getParameter("password");
						String num = request.getParameter("num");
						
						try {
							String url = "jdbc:mysql://localhost:3306/livetalk";
							String userid = "root";
							String passwd = "a19950417";
							
							if(password==null){
								throw new Exception("no password");
							}
							String topicName = null;
							int topicNum;
							String passwdSql = "select password from "+ topic + " where num = " + num + ";";
							String deleteSql = "delete from "+topic+" where num= '"+num +"';";
							String sortSql = "alter table "+topic+" auto_increment=1; ";

							conn = DriverManager.getConnection(url, userid, passwd);
							stmt = conn.createStatement();
							rs = stmt.executeQuery(passwdSql);
							rs.next();
							out.println(rs.getString("password"));
							out.println(password);
							if(rs.getString("password").equals(password)){
								stmt.executeUpdate(deleteSql);
								stmt.executeUpdate(sortSql);
							}
							else
								throw new Exception("wrong password");
							
						
						} catch (Exception e) {
							out.println("<script>alert(\""+e+"\");</script>");
						}
						response.sendRedirect("../?id="+topic);
					%>
</body>
</html>