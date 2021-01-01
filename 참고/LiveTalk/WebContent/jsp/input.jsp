<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*, java.io.File, java.io.IOException, com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<%
			request.setCharacterEncoding("UTF-8"); 
			String savePath = request.getServletContext().getRealPath("/LiveTalk/img");
			
			int sizeLimit = 1024*1024*5;
			MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			
			File file=null;
			Connection conn = null;
			Statement stmt = null;
			
			String identify = multi.getParameter("identity");
			String content = multi.getParameter("content");
			String topic = multi.getParameter("topic");
			String password = multi.getParameter("password");
			

			try{
				String url = "jdbc:mysql://localhost:3306/livetalk";
				String userid = "root";
				String passwd = "a19950417";
				String fileName = multi.getFilesystemName("uploadFile");  
				String sql = "";
				if(fileName!=null){
					file = new File(savePath, fileName);
					sql = "insert into " + topic +"(identity, password , content, imgName) values('"+identify+"','"+password+"','"+content+"','"+ fileName +"');";
					}
				else{
					sql = "insert into " + topic +"(identity, password , content) values('"+identify+"','"+password+"','"+content+"');";
				}
				conn = DriverManager.getConnection(url,userid,passwd);
				stmt = conn.createStatement();
		
				stmt.executeUpdate(sql);
			
			}catch(Exception e){
				out.println(e);
			}
			finally{
				try{stmt.close();}catch(Exception e){}
				try{conn.close();}catch(Exception e){}
			}
			response.sendRedirect("../?id="+topic);
		%>
		
</body>
</html>