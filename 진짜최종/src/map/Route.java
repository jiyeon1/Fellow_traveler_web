package map;

import java.io.*;
import java.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Route")
public class Route extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public Route() {
      super();
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
      String c1 = request.getParameter("classroom1");
      String c2 = request.getParameter("classroom2");// String 타입 숫자

      // 시간 탐색 위한 변수
      Building changeToName = new Building();
      String first = changeToName.Building(c1);// 건물 이름
      String second = changeToName.Building(c2);

      int b1 = Integer.parseInt(c1);// int타입 숫자
      int b2 = Integer.parseInt(c2);

      // 경로 탐색 위한 변수
      path_Building numToName = new path_Building();
      String pathstart = numToName.Building(b1 - 1);
      String pathfinal = numToName.Building(b2 - 1);

      int p1 = b1 - 1;
      int p2 = b2 - 1;

      Search s = new Search(23);// 시간검색
      s.input(1, 2, 60);
      s.input(1, 3, 300);
      s.input(1, 4, 360);
      s.input(1, 5, 180);
      s.input(1, 6, 300);
      s.input(2, 3, 60);
      s.input(2, 4, 90);
      s.input(2, 5, 90);
      s.input(2, 6, 90);
      s.input(3, 4, 40);
      s.input(3, 5, 40);
      s.input(3, 6, 30);
      s.input(4, 6, 40);
      s.input(5, 6, 30);
      s.input(5, 7, 180);
      s.input(6, 7, 150);
      s.input(6, 8, 120);
      s.input(7, 8, 20);
      s.input(7, 9, 80);
      s.input(7, 10, 80);
      s.input(7, 11, 150);
      s.input(7, 12, 180);
      s.input(7, 13, 100);
      s.input(7, 14, 80);
      s.input(8, 9, 100);
      s.input(8, 10, 60);
      s.input(8, 11, 130);
      s.input(8, 12, 160);
      s.input(8, 13, 90);
      s.input(8, 14, 80);
      s.input(9, 10, 80);
      s.input(9, 11, 150);
      s.input(9, 12, 190);
      s.input(9, 13, 110);
      s.input(9, 14, 50);
      s.input(9, 16, 120);
      s.input(9, 17, 160);
      s.input(9, 19, 185);
      s.input(9, 21, 150);
      s.input(9, 22, 155);
      s.input(9, 23, 175);
      s.input(10, 11, 30);
      s.input(10, 12, 45);
      s.input(10, 13, 30);
      s.input(10, 14, 35);
      s.input(10, 16, 110);
      s.input(10, 17, 150);
      s.input(11, 12, 30);
      s.input(11, 13, 30);
      s.input(11, 14, 45);
      s.input(12, 13, 50);
      s.input(13, 14, 30);
      s.input(13, 15, 45);
      s.input(13, 16, 55);
      s.input(13, 17, 125);
      s.input(14, 16, 75);
      s.input(14, 17, 105);
      s.input(15, 16, 30);
      s.input(16, 17, 20);
      s.input(17, 18, 20);
      s.input(17, 19, 60);
      s.input(17, 21, 110);
      s.input(17, 22, 90);
      s.input(17, 23, 75);
      s.input(18, 19, 55);
      s.input(18, 21, 105);
      s.input(18, 22, 85);
      s.input(18, 23, 70);
      s.input(19, 21, 55);
      s.input(19, 22, 35);
      s.input(19, 23, 25);
      s.input(20, 21, 15);
      s.input(21, 22, 30);
      s.input(21, 23, 50);
      s.input(22, 23, 25);

      Path d = new Path(23);// 경로 검색
      d.input(0, 1, 60);
      d.input(0, 2, 300);
      d.input(0, 3, 360);
      d.input(0, 4, 180);
      d.input(0, 5, 300);
      d.input(1, 2, 60);
      d.input(1, 3, 90);
      d.input(1, 4, 90);
      d.input(1, 5, 90);
      d.input(2, 3, 40);
      d.input(2, 4, 40);
      d.input(2, 5, 30);
      d.input(3, 5, 40);
      d.input(4, 5, 30);
      d.input(4, 6, 180);
      d.input(5, 6, 150);
      d.input(5, 7, 120);
      d.input(6, 7, 20);
      d.input(6, 8, 80);
      d.input(6, 9, 80);
      d.input(6, 10, 150);
      d.input(6, 11, 180);
      d.input(6, 12, 100);
      d.input(6, 13, 80);
      d.input(7, 8, 100);
      d.input(7, 9, 60);
      d.input(7, 10, 130);
      d.input(7, 11, 160);
      d.input(7, 12, 90);
      d.input(7, 13, 80);
      d.input(8, 9, 80);
      d.input(8, 10, 150);
      d.input(8, 11, 190);
      d.input(8, 12, 110);
      d.input(8, 13, 50);
      d.input(8, 15, 120);
      d.input(8, 16, 160);
      d.input(8, 18, 185);
      d.input(8, 20, 150);
      d.input(8, 21, 155);
      d.input(8, 22, 175);
      d.input(9, 10, 30);
      d.input(9, 11, 45);
      d.input(9, 12, 30);
      d.input(9, 13, 35);
      d.input(9, 15, 110);
      d.input(9, 16, 150);
      d.input(10, 11, 30);
      d.input(10, 12, 30);
      d.input(10, 13, 45);
      d.input(11, 12, 50);
      d.input(12, 13, 30);
      d.input(12, 14, 45);
      d.input(12, 15, 55);
      d.input(12, 16, 125);
      d.input(13, 15, 75);
      d.input(13, 16, 105);
      d.input(14, 15, 30);
      d.input(15, 16, 20);
      d.input(16, 17, 20);
      d.input(16, 18, 60);
      d.input(16, 20, 110);
      d.input(16, 21, 90);
      d.input(16, 22, 75);
      d.input(17, 18, 55);
      d.input(17, 20, 105);
      d.input(17, 21, 85);
      d.input(17, 22, 70);
      d.input(18, 20, 55);
      d.input(18, 21, 35);
      d.input(18, 22, 25);
      d.input(19, 20, 15);
      d.input(20, 21, 30);
      d.input(20, 22, 50);
      d.input(21, 22, 25);

      out.println("<HTML>");
      out.println("<HEAD>");
      out.println("<style>");
      out.println(".my_box2 {\r\n" + "    font-family: '함초롬돋움';\r\n" + "   color: white;\r\n"
            + "   font-weight: bold;\r\n" + "   text-align: center;\r\n" + "   border: 2px solid #343f50;\r\n"
            + "   height: 40px;\r\n" + "   width: 150px;\r\n" + "   border-radius: 5px;\r\n"
            + "   background-color: #343f50;\r\n" + "\r\n" + "}\r\n" + "\r\n" + ".my_box2:hover {\r\n"
            + "   font-family: '함초롬돋움';\r\n" + "   color: white;\r\n" + "   font-weight: bold;\r\n"
            + "   text-align: center;\r\n" + "   border: 0px;\r\n" + "   background-color: #f2b604;\r\n"
            + "   color: black;\r\n" + "   -webkit-transition: all 0.3s;\r\n" + "   -moz-transition: all 0.3s;\r\n"
            + "   -o-transition: all 0.3s;\r\n" + "   transition: all 0.3s;\r\n" + "}");
      out.println(".map {\r\n" + "   width: 100%;\r\n" + "   height: 77%;\r\n" + "   border-collapse: collapse;\r\n"
            + "   background-color:white;\r\n" + "}");
      out.println(
            ".walk {\r\n" + "   font-size: 30px;\r\n" + "   font-family: '함초롱돋음';\r\n" + "   text-align: left;\r\n"
                  + "   font-weight: bold;\r\n" + "color : #ef8a07;" + "   text-align: center;\r\n" + "}");
      out.println(".path {\r\n" + "   font-size: 22px;\r\n" + "   font-family: '함초롱돋음';\r\n"
            + "   text-align: left;\r\n" + "}");
      out.println("#topMenu {\r\n" + "   height: 30px;\r\n" + "   width: 850px;\r\n" + "}\r\n" + "\r\n"
            + "#topMenu ul li {\r\n" + "   list-style: none;\r\n" + "   color: #343f50;\r\n"
            + "   background-color: white;\r\n" + "   float: left;\r\n" + "   line-height: 30px;\r\n"
            + "   vertical-align: middle;\r\n" + "   text-align: center;\r\n" + "}\r\n" + "\r\n"
            + "#topMenu .menuLink {\r\n" + "   text-decoration: none;\r\n" + "   color: black;\r\n"
            + "   display: block;\r\n" + "   width: 150px;\r\n" + "   font-size: 12px;\r\n"
            + "   font-weight: bold;\r\n" + "   font-family: \"Trebuchet MS\";\r\n" + "}\r\n" + "\r\n"
            + "#topMenu .menuLink:hover {\r\n" + "   color: #DF0101;\r\n" + "   background-color: #f4c804;\r\n"
            + "   -webkit-transition: all 0.5s;\r\n" + "   -moz-transition: all 0.5s;\r\n"
            + "   -o-transition: all 0.5s;\r\n" + "   transition: all 0.5s;\r\n" + "}");
      out.println(".div {\r\n" + "   display: table;\r\n" + "   width: 100%;\r\n" + "   height: 100px;\r\n" + "}\r\n"
            + "\r\n" + ".p {\r\n" + "   display: table-cell;\r\n" + "   text-align: center;\r\n"
            + "   vertical-align: middle;\r\n" + "   letter-spacing: 50px;\r\n" + "   font-size: 50px;\r\n"
            + "   text-align: center;\r\n" + "   font-family: 'Do Hyeon', sans-serif;\r\n" + "}");
      out.println("</style>");
      out.println("</HEAD>");
      out.println("<link\r\n" + "   href=\"https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean\"\r\n"
            + "   rel=\"stylesheet\">");
      out.println("<BODY bgcolor='#343f50'>");
      // 출력
      out.println("<div style=\"background-color: white\" style=\"width:100%\">\r\n"
            + "      <nav id=\"topMenu\">\r\n" + "         <ul>\r\n"
            + "            <li><a class=\"menuLink\" href=\"three.jsp\">HOME</a></li>\r\n"
            + "            <li>|</li>\r\n"
            + "            <li><a class=\"menuLink\" href=\"map.jsp\">MAP</a></li>\r\n"
            + "            <li>|</li>\r\n"
            + "            <li><a class=\"menuLink\" href=\"board-list.jsp\">BOARD</a></li>\r\n"
            + "            <li>|</li>\r\n"
            + "            <li><a class=\"menuLink\" style=\"color: gray\" href=\"main.jsp?logout=yes\">LOGOUT</a></li>\r\n"
            + "\r\n" + "         </ul>\r\n" + "      </nav>\r\n" + "   </div>");
      out.println("<center>\r\n" + "      <div class=\"div\" style=\"background-color: #f4c804\">\r\n"
            + "         <p class=\"p\">길찾기 결과</div>\r\n" + "      </div>\r\n" + "   </center>");
      out.println("<form action='map.jsp' method='get'>");

      out.println("<table class=\"map\">\r\n" + "      <tr>\r\n"
            + "         <td colspan=\"5\" style=\"width:100%\">&nbsp</td>\r\n" + "      </tr>\r\n" + "\r\n"
            + "      <tr>\r\n" + "         <td rowspan=\"3\" style=\"width:7%\" ></td>\r\n"
            + "         <td rowspan=\"3\" ><img\r\n" + "            src=\"image/campusmap.jpg\"\r\n"
            + "            style=\"height: 560px; width: 780px; border: 12px solid #343f50\">\r\n"
            + "         </td>\r\n" + "");
      out.println("<td style=\"width:7%\" >&nbsp;</td>");
      out.println("<td class=\"walk\" style=\"width: 40%\">\r\n" + "<br>" + first
            + "&nbsp;&nbsp;-----<img src='image/people-gif.gif' style='width: 55px; height: 55px;' />----->&nbsp;&nbsp;"
            + second + "<br><br><hr size=5px noshade>&nbsp;");
      out.println("</td>\r\n" + "<td rowspan=\"3\" style=\"width:7%\" >&nbsp;</td>\r\n" + "      </tr>\r\n"
            + "      <tr class=\"path\">\r\n" + "<td style=\"width: 7%\">&nbsp;</td>" + "         <td>\r\n"
            + "                  &nbsp;<br><big><b>경로</b></big><br>\r\n" + "         <br>");
      for (int i = 0; i < +d.dijkstra(p1, p2).size(); i++) {
         out.print(d.dijkstra(p1, p2).get(i));
         out.print(" ▶ ");
      }
      out.print(pathfinal);
      if(s.dijkstra(b1, b2)<=60) {
         out.println("<br>\r\n" + "         <br><br><b><big>총 이동시간은 " + s.dijkstra(b1, b2) + "초 입니다.</big></b><br><br>");         
      }
      else {
         out.println("<br>\r\n" + "         <br><br><b><big>총 이동시간은 " + s.dijkstra(b1, b2)/60 +"분 "+s.dijkstra(b1,b2)%60+"초 입니다.</big></b><br><br>");                  
      }
         
      out.println("<br><br><center><input type='submit' value='다른길찾기' class='my_box2'/></center><Br><br><Br><Br>");

      out.println("         <br>\r\n" + "         </td>\r\n" + "      </tr>");

      out.println("</table>");
      out.println("</form>");
      out.println("</BODY>");
      out.println("</HTML>");
   }
}