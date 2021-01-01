<%@page import="com.project.tfa.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
html {
   background: url(image/dd.png) no-repeat center center fixed;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
}
   .div_a{
      background-color: rgba(255, 255, 255, 0.8);
      height : 500px;
      width : 550px;
      -webkit-box-shadow: 10px 7px 15px 3px rgba(240,237,232,0.72);
      -moz-box-shadow: 10px 7px 15px 3px rgba(240,237,232,0.72);
      box-shadow: 10px 7px 15px 3px rgba(204,198,190,1);
   }
   .my_box{
      font-family: '함초롬돋움';
      color: white;
      border : 0px;
      background-color:#343f50;
      height : 35px;
      width : 400px;
      position : relative;
   }
   .search{
      font-family: '함초롬돋움';
      font-weight: bold;
      font-size: 17px;
   }
   .img-button2{
      background:url("image/ids.png") no-repeat;
      background-size: 430px 60px;
      height:60px;
      width:430px;
      cursor:pointer;
      border:none;
      onfocus:this.blur();
      align:center;
   }
   tr{
      height:30px;
      width:430px;
   }
   
</style>
</head>
<body><br><br>
<center>
   <img src="image/idsearch.png"/><br><br>
   <div class="div_a">
   <form method="post" action="searchId.jsp"><br><Br>
   <img src="image/find.png"/><br>
      <table>
      <tr><td class="search">&nbsp&nbspName</td></tr>
      <tr>
         <td align="center"><input type="text" name="name" class="my_box"/></td>
         </tr>
      <tr><td class="search">&nbsp&nbspStudent-Number</td></tr>
      <tr><td align="center"><input type="text" name="std" class="my_box"/></td>
      <tr><td align="center">&nbsp</td></tr>
      <tr><td><input type="submit" value=" " class="img-button2"></td></tr>
      <tr><td class="search" align="center"><a href="main.jsp">▶ 로그인하기</a></td></tr>
   </table>
   </form>
   </div>
</center>
</body>
</html>