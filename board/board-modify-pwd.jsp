<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<style>
   .table_border{ /* 흰색배경 css */
      background-color:white;
      -webkit-box-shadow: 10px 10px 11px 2px rgba(219,216,212,0.61);
      -moz-box-shadow: 10px 10px 11px 2px rgba(219,216,212,0.61);
      box-shadow: 10px 10px 11px 2px rgba(204,198,190,1);
      height : 500px;
      width : 700px;   }
   .my_box{ /* 입력 칸 css */
      font-family: '함초롬돋움';
      text-align : left;
      border : 0px;
      background-color:#f5f5f5;
      position : relative;
   }
   .my_box:hover{
      background-color: #9ba3a0;
   }
   .my_box:focus{
      background-color: #b8b8b8;
   }
   .my_box2{/*버튼 css  */
      font-family: '함초롬돋움';
      color: white;
      font-weight : bold;
      text-align : center;
      border : 2px solid #f08b07;
      background-color: #343f50;
      height : 40px;
      width : 150px;
      border-radius: 5px;
   }
   .wallpaper{
         background-color:#343f50;
   }
</style>
</head>
<body class="wallpaper">
   <br><br><br><br>
   <center>
   <font face="함초롬돋움">
   <img src="image/jj.png"/><br><br>
   <div class="table_border">
   <form action="board-modify.jsp" method ="post">
   <br><big><b>비밀번호 확인</b></big><br><br>
   <table border="0" align="center">
      <tr height="40">
         <th>비밀번호</th>
         <td>▶</td>
         <td>
         <input type="password" name="passwd" class="my_box" size="30"/>
         <input type="hidden" name="id" value="<%=request.getParameter("id") %>">
         <br></td>
      </tr>
   </table><br>
   <input type="submit" value="수정하기" class="my_box2"/>
   <input type="reset" value="다시쓰기" class="my_box2"/><br><br>
   </form>
   <a href="board-read.jsp?id=<%=request.getParameter("id")%>">수정 취소</a><br>
   </div>
	</center>
</body>
</html>
