<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
			request.setCharacterEncoding("UTF-8"); 
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			int topicNum=1;
			
			String topicname = request.getParameter("TopicName");
			
			try{
				String url = "jdbc:mysql://localhost:3306/livetalk";
				String userid = "root";
				String passwd = "a19950417";
				conn = DriverManager.getConnection(url,userid,passwd);
				stmt = conn.createStatement();
				String first_sql = "insert into topic(name) values('"+topicname+"')" ;
				stmt.executeUpdate(first_sql);
				rs = stmt.executeQuery("select num from topic where name='"+topicname+"';");
				rs.next();
				topicNum = rs.getInt("num");
				String secend_sql = "create table TB_"+topicNum + "(num int not null auto_increment primary key, identity varchar(10) character set utf8 not null,password varchar(10) not null, content text character set utf8 not null,imgName varchar(15) ,time timestamp default now())";
				stmt.executeUpdate(secend_sql);		
			
			}catch(Exception e){
				out.println("<script>alert("+e+")</script>");
			}
			finally{
				try{stmt.close();}catch(Exception e){}
				try{conn.close();}catch(Exception e){}
			}
			response.sendRedirect("../?id=TB_"+Integer.toString(topicNum));
		%>
		
</body>
</html>