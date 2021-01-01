<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<link
   href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean"
   rel="stylesheet">
<style>
html {
   background: url(image/dd.png) no-repeat center center fixed;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
}

body {
   text-align: center;
   margin: 0 auto;
}

#logo {
   margin-top: 1%;
   width: 300px;
   height: 150px;
   margin: 3px;
}
#box {
   position: absolute;
   width: 100%;
   height: 500px;
   top: 60%;
   margin-top: -300px;
   background: white;
   background-color: rgba(255, 255, 255, 0.8);
}
#circle {
   width: 250px;
   height: 250px;
}
.threesteps {
   float: left;
   width: 33%;
}

.card {
   width: 250px;
   height: 250px;
   position: relative;
   display: inline-block;
}

.card .img-top {
   display: none;
   position: absolute;
   top: 0;
   left: 0;
   z-index: 99;
   width: 250px;
}

.card:hover .img-top {
   display: inline;
}

.card .over {
   display: none;
}

.card:hover .over {
   font-size: 30px;
   font-family: 'Do Hyeon', sans-serif;
   display: inline;
   position: absolute;
   top: 0px;
   left: 0px;
   width: 250px;
   height: 250px;
   margin-top: 40px;
   text-align: center;
   line-height: 200%;
   z-index: 99;
}

.img-button {
margin-top:15px;
   background: url("image/logout.png") no-repeat;
   /* background-size: 100px 100px; */
   height: 110px;
   width: 110px;
   cursor: pointer;
   border: none;
   onfocus: this.blur();
}
</style>
</head>
<body>
   <br><br><br>
   <img id="logo" src="image/로고.png" />

   <div id="box">
      <form align="right">
      <input type="button" class="img-button" title="로그아웃"
         onclick="location.href='main.jsp?logout=yes'">
      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   </form>
      <div class="threesteps">
         <div class="card">
            <img src="image/1.png" alt="Card Back" style="width: 250px"> <img
               src="image/11.png" class="img-top" alt="Card Front">
            <div class="over">
               <br> <a href="map.jsp"
                  style="text-decoration: none; color: white; font-size: 40px;">길찾기</a>
            </div>
         </div>
      </div>
      <div class="threesteps">
         <div class="card">

            <img src="image/2.png" alt="Card Back" style="width: 250px"> <img
               src="image/22.png" class="img-top" alt="Card Front">
            <div class="over">
               <br> <a href="board-list.jsp"
                  style="text-decoration: none; color: white; font-size: 40px;">게시판</a>
            </div>
         </div>
      </div>
      <div class="threesteps">
         <div class="card">
            <img src="image/3.png" alt="Card Back" style="width: 250px"> <img
               src="image/33.png" class="img-top" alt="Card Front">
            <div class="over">
               <a href="http://www.dongguk.edu" target="_blank"
                  style="text-decoration: none; color: white">동국대학교</a><br> <a
                  href="http://lib.dongguk.edu/" target="_blank"
                  style="text-decoration: none; color: white">중앙도서관</a><br> <a
                  href="https://eclass.dongguk.edu/" target="_blank"
                  style="text-decoration: none; color: white">이클래스</a>

            </div>
         </div>
      </div>
   </div>


</body>
</html>