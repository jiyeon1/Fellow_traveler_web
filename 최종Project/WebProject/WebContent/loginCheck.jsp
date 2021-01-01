<!-- 로그인 확인 -->
<%@page import="com.project.tfa.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>login check</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id= request.getParameter("id");
		String pass = request.getParameter("password");
		session.setAttribute("id",id);
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.loginCheck(id,pass);

		if(check == 1){	//로그인 성공
			out.println("<script>");
			out.println("alert('로그인 되었습니다! :)')");
			out.println("location.href='three.jsp'");
			out.println("</script>");
		}else if(check == 0){//비밀번호 틀림
			out.println("<script>");
			out.println("alert('정보가 틀렸습니다!다시 입력하세요.')");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		}else{//id 틀림
			out.println("<script>");
			out.println("alert('정보가 틀렸습니다!다시 입력하세요.')");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		}
	%>
</body>
</html>