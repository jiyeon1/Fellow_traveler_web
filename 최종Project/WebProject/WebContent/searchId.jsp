<%@page import="com.project.tfa.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<style>
html {
   background: url(image/dd.png) no-repeat center center fixed;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
}
.font_a {
   color: #f08b07;
   font-size: 20px;
}

.div_a {
   background-color: rgba(255, 255, 255, 0.8);
   height: 530px;
   width: 600px;
   -webkit-box-shadow: 10px 7px 15px 3px rgba(240, 237, 232, 0.72);
   -moz-box-shadow: 10px 7px 15px 3px rgba(240, 237, 232, 0.72);
   box-shadow: 10px 7px 15px 3px rgba(204, 198, 190, 1);
}

.my_box3 {
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

.my_box3:hover {
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
</style>
</head>
<body>
   <%
      request.setCharacterEncoding("UTF-8");
   %>
   <%
      String name = request.getParameter("name");
      String std = request.getParameter("std");
      LogonDBBean manager = LogonDBBean.getInstance();
      LogonDataBean c = manager.searchId(name, std);
      try {
   %>
   <center>
      <form method="post" action="main.jsp">
         <br> <br> <br> <br> <br> <br> <br>
         <br> <br>
         <div class="div_a">
            <br> <br> <br> <br> <font face="함초롬돋움"> <img
               src="image/find.png" /><br> <br> <%
    if (c != null) {
 %>
               <h2><%=name%>님의 아이디는 &nbsp<big><big><font
                        color="#f08b07"><%=c.getId()%></font></big></big> 입니다.
               </h2>
               <p>
                  <br> <br> <input type="button" value="비밀번호 찾기"
                     class="my_box3" onclick="location.href='searchPwForm.jsp'">
                  <input type="submit" value="로그인하기" class="my_box3">

                  <%
                     } else {
                  %>
               
               <H2>
                  이름 또는 학번이 틀렸습니다!<br>다시 입력해 주세요
                  <p>
               </H2> <br> <br> <input type="button" value="다시 입력하기"
               class="my_box3" onclick="location.href='searchIdForm.jsp'">
               <%
                  }
               %>
            </font>
         </div>
      </form>
   </center>
   <%
      } catch (Exception e) {
      }
   %>
</body>
</html>