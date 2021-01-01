<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시판</title>
<style>
html {
   background: url(image/dd.png) no-repeat center center fixed;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
}

.table_border { /* 흰색배경 css */
   background-color: rgba(255, 255, 255, 0.8);
   -webkit-box-shadow: 10px 10px 11px 2px rgba(219, 216, 212, 0.61);
   -moz-box-shadow: 10px 10px 11px 2px rgba(219, 216, 212, 0.61);
   box-shadow: 10px 10px 11px 2px rgba(204, 198, 190, 1);
   height: 550px;
   width: 700px;
   padding-top: 60px;
}

.my_box2 {
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

.my_box2:hover {
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

.content {
   overflow: auto;
   height: 200px;
   padding: 8px;
   background-color: #ededed;
}
</style>
</head>
<body id="body">
   <br>
   <br>
   <center>
      <font face="함초롬돋움"> <img src="image/jj.png" /><br> <br>
         <div class="table_border">
            <br> <big><big><b>게시글 확인</b></big></big><br> <br>

            <%
               int id, ref = 0;
               String name = "", title = "", content = "";
               Connection conn = null;
               Statement stmt = null;
               ResultSet rs = null;

               id = Integer.parseInt(request.getParameter("id"));

               try {
                  Class.forName("com.mysql.jdbc.Driver");
                  String url = "jdbc:mysql://localhost:3306/pjboard_db?useUnicode=true&characterEncoding=utf8";
                  conn = DriverManager.getConnection(url, "root", "0000");
                  stmt = conn.createStatement();
                  String sql = "select * from pjboard_tbl where id = " + id;
                  rs = stmt.executeQuery(sql);
               } catch (Exception e) {
                  out.println("DB 연동 오류입니다. : " + e.getMessage());
               }

               while (rs.next()) {
                  name = rs.getString("name");
                  title = rs.getString("title");
                  content = rs.getString("content");
                  ref = Integer.parseInt(rs.getString("ref"));
               }
            %>
            <table border="0" align="center" width="680">
               <tr height="50">
                  <th>글 제 목</th>
                  <td>▶</td>
                  <td><%=title%></td>
               </tr>
               <tr height="50">
                  <th width="70">글 쓴 이</th>
                  <td width="20">▶</td>
                  <td width="250"><%=name%></td>
               </tr>
               <tr height="150">
                  <th align="top">글 내 용</th>
                  <td>▶</td>
                  <% String Content=content.replaceAll("\n", "<br>"); %>
                  <td><div class="content"><%=Content%></div></td>
               </tr>

               <tr height="80">
                  <td colspan="3" align="center"><br> <a
                     href="board-insert.jsp?ref=<%=ref%>&flag=r"><input
                        type=button value="답글쓰기" class="my_box2"></a> <a
                     href="board-modify-pwd.jsp?id=<%=id%>"><input type=button
                        value="수정" class="my_box2"></a> <a
                     href="board-delete-pwd.jsp?id=<%=id%>"><input type=button
                        value="삭제" class="my_box2"></a> <a href="board-list.jsp"><input
                        type=button value="목록" class="my_box2"></a></td>
               </tr>
            </table>
            <br> <br>
         </div>
      </font>
   </center>
</body>
</html>