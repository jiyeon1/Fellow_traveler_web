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
<style>
html { 
  background: url(image/dd.png) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
</style>
</head>
<body>
   <script>
   window.onload = function() {
   <%
      request.setCharacterEncoding("UTF-8");
      String id= request.getParameter("id");
      String pass = request.getParameter("password");
      session.setAttribute("id",id);
      MemberDAO dao = MemberDAO.getInstance();
      int check = dao.loginCheck(id,pass);

      if(check == 1){   //로그인 성공
   %>
      alert("로그인 되었습니다!");
      location.href='three.jsp';
   <%   }else if(check == 0){//비밀번호 틀림 %>
      alert("정보가 틀렸습니다!다시 입력하세요.");
      location.href='main.jsp';
   <%    }else{//id 틀림 %>
      alert("정보가 틀렸습니다!다시 입력하세요.");
      location.href='main.jsp';
   <%   }   %>
   }
   </script>
</body>
</html>