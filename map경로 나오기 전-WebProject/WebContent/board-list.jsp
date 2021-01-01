<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link
   href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean"
   rel="stylesheet">
<style>
#body {
   background-color: #343f50;
}

.table_border { /* 흰색배경 css */
   background-color: white;
   width: 100%;
   padding-bottom: 10%;
}

.tbl {
   letter-spacing: 10px;
   font-family: 'Do Hyeon', sans-serif;
   height:40px;
   font-size: 20px;
}

#topMenu {
   height: 30px;
   width: 850px;
}

#topMenu ul li {
   list-style: none;
   color: #343f50;
   background-color: white;
   float: left;
   line-height: 30px;
   vertical-align: middle;
   text-align: center;
}

#topMenu .menuLink {
   text-decoration: none;
   color: black;
   display: block;
   width: 150px;
   font-size: 12px;
   font-weight: bold;
   font-family: "Trebuchet MS";
}

#topMenu .menuLink:hover {
   color: red;
   background-color: yellow;
}
.div {
   display: table;
   width: 100%;
   height: 200px;
}

.p {
   display: table-cell;
   text-align: center;
   vertical-align: middle;
   letter-spacing: 50px;
   font-size: 80px;
   font-family: 'Do Hyeon', sans-serif;
   text-align: center;
}
</style>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body id="body">
   <div style="background-color:white" style="width:100%">
   <nav id="topMenu" >
      <ul>
         <li><a class="menuLink" href="three.jsp">HOME</a></li>
         <li>|</li>
         <li><a class="menuLink" href="map.jsp">MAP</a></li>
         <li>|</li>
         <li><a class="menuLink" href="board-list.jsp">BOARD</a></li>
         <li>|</li>
         <li><a class="menuLink" style="color: gray" href="main.jsp?logout=yes">LOGOUT</a></li>
      </ul>
   </nav>
   </div>
       <center>
      <div class="div" style="background-color: #f4c804">
         <p class="p">게시판</div>

      </div>
      <div class="table_border">         
            <table align="center" width="80%">
               <tr>
                  <td colspan="3" align="right">
                     <form action="board-insert.jsp">
                        <input type="image" src="image/writing.png"
                           style="width:65px; height:65px">
                     </form>
                  </td>
               </tr >
               <tr  class="tbl" bgcolor="#f4c804" align="center" width="60%">
                  <th width="5">글번호</th>
                  <th width="55">글제목</th>
                  <th width="15">글쓴이</th>
                  <%
               int id, ref, rownum = 0;
               Connection conn = null;
               Statement stmt = null;
               String sql = null;
               ResultSet rs = null;
               try {
                  Class.forName("com.mysql.jdbc.Driver");
                  String jdbcurl = "jdbc:mysql://localhost:3306/pjboard_db?useUnicode=true&characterEncoding=utf8";
                  conn = DriverManager.getConnection(jdbcurl, "root", "0000");
                  stmt = conn.createStatement();
                  sql = "select * from pjboard_tbl order by ref desc, id asc";
                  rs = stmt.executeQuery(sql);
               } catch (Exception e) {
                  out.println("DB연동오류입니다.:" + e.getMessage());
               }
               rs.last();
               rownum = rs.getRow();
               rs.beforeFirst();

               while (rs.next()) {
                  id = Integer.parseInt(rs.getString("id"));
                  ref = Integer.parseInt(rs.getString("ref"));

            %>
               </tr>
               <tr>
                  <td align="center"><%= rownum %></td>
                  <td align="left">
                     <% if(id != ref) out.println("└→"); %> <a href=board-read.jsp?id=<%=rs.getString("id")%> width="250"> <%=rs.getString("title")%></a>
                  </td>
                  <td align="center"><%=rs.getString("name")%></td>
               </tr>
               <%
            rownum--;
            }
         %>
            </table> <%
         stmt.close();
         conn.close();
      %>
      </div>
   </center>
</body>
</html>