package map;
import java.io.*;
import java.sql.*;
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
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      //response.getWriter().append("Served at: ").append(request.getContextPath());
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      
      String list[] = request.getParameterValues("classroom1");
      for(int i = 0; i < list.length; i++ ) {
      out.println(list[i]);
      }
      
      String c1 = request.getParameter("classroom1");
      String c2 = request.getParameter("classroom2");
      
      Building changeToName=new Building();
      String first=changeToName.Building(c1);
      String second=changeToName.Building(c2);
      
      int b1=Integer.parseInt(c1);
      int b2=Integer.parseInt(c2);
           
      Search s=new Search(23);
      
      s.input(1,2,60);s.input(1,3,300);s.input(1, 4, 360);s.input(1, 5, 180);s.input(1, 6, 300);
      s.input(2, 3, 60);s.input(2, 4, 90);s.input(2, 5, 90);s.input(2, 6, 90);
      s.input(3, 4, 40);s.input(3, 5, 40);s.input(3, 6, 30);
      s.input(4, 6, 40);
      s.input(5, 6, 30);s.input(5, 7, 180);
      s.input(6, 7, 150);s.input(6, 8, 120);
      s.input(7, 8, 20);s.input(7, 9, 80);s.input(7, 10, 80);s.input(7, 11, 150);s.input(7, 12, 180);s.input(7, 13, 100);s.input(7, 14, 80);
      s.input(8, 9, 100);s.input(8, 10, 60);s.input(8, 11, 130);s.input(8, 12, 160);s.input(8, 13, 90);s.input(8, 14, 80);
      s.input(9, 10, 80);s.input(9, 11, 150);s.input(9, 12, 190);s.input(9, 13, 110);s.input(9, 14, 50);s.input(9, 16, 120);s.input(9, 17, 160);s.input(9, 19, 185);s.input(9, 21, 150);s.input(9, 22, 155);s.input(9, 23, 175);
      s.input(10,11,30);s.input(10,12,45);s.input(10,13,30);s.input(10,14,35);s.input(10,16,110);s.input(10,17,150);
      s.input(11,12,30);s.input(11,13,30);s.input(11,14,45);
      s.input( 12,13,50);
      s.input(13,14,30);s.input(13,15,45);s.input(13,16,55);s.input(13,17,125);
      s.input(14,16,75);s.input(14,17,105);
      s.input(15,16,30);
      s.input(16,17,20);
      s.input(17,18,20);s.input(17,19,60);s.input(17,21,110);s.input(17,22,90);s.input(17,23,75);
      s.input(18,19,55);s.input(18,21,105);s.input(18,22,85);s.input(18,23,70);
      s.input(19,21,55);s.input(19,22,35);s.input(19,23,25);
      s.input(20,21,15);
      s.input(21,22,30);s.input( 21,23,50);
      s.input(22,23,25);

      
      out.println("<HTML>");
      out.println("<HEAD>");
      out.println("<style>");
      out.println(".my_box2 {\r\n" + 
            "   font-family: '함초롬돋움';\r\n" + 
            "   color: white;\r\n" + 
            "   font-weight: bold;"
            + "font-size: 20px;\r\n" + 
            "   text-align: center;\r\n" + 
            "   border: 2px solid #f08b07;\r\n" + 
            "   background-color: #343f50;\r\n" + 
            "   height: 50px;\r\n" + 
            "   width: 170px;\r\n" + 
            "   border-radius: 5px;\r\n" + 
            "}");
      out.println("#topMenu {\r\n" + 
            "   height: 30px;\r\n" + 
            "   width: 850px;\r\n" + 
            "}\r\n" + 
            "\r\n" + 
            "#topMenu ul li {\r\n" + 
            "   list-style: none;\r\n" + 
            "   color: #343f50;\r\n" + 
            "   background-color: white;\r\n" + 
            "   float: left;\r\n" + 
            "   line-height: 30px;\r\n" + 
            "   vertical-align: middle;\r\n" + 
            "   text-align: center;\r\n" + 
            "}\r\n" + 
            "\r\n" + 
            "#topMenu .menuLink {\r\n" + 
            "   text-decoration: none;\r\n" + 
            "   color: black;\r\n" + 
            "   display: block;\r\n" + 
            "   width: 150px;\r\n" + 
            "   font-size: 12px;\r\n" + 
            "   font-weight: bold;\r\n" + 
            "   font-family: \"Trebuchet MS\";\r\n" + 
            "}\r\n" + 
            "\r\n" + 
            "#topMenu .menuLink:hover {\r\n" + 
            "   color: red;\r\n" + 
            "   background-color: yellow;\r\n" + 
            "}");
      out.println(".div {\r\n" + 
            "   display: table;\r\n" + 
            "   width: 100%;\r\n" + 
            "   height: 100px;\r\n" + 
            "}\r\n" + 
            "\r\n" + 
            ".p {\r\n" + 
            "   display: table-cell;\r\n" + 
            "   text-align: center;\r\n" + 
            "   vertical-align: middle;\r\n" + 
            "   letter-spacing: 50px;\r\n" + 
            "   font-size: 50px;\r\n" + 
            "   text-align: center;\r\n" + 
            "   font-family: 'Do Hyeon', sans-serif;\r\n" + 
            "}");
      out.println("</style>");
      out.println("</HEAD>");
      out.println("<link\r\n" + 
            "   href=\"https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean\"\r\n" + 
            "   rel=\"stylesheet\">");
      out.println("<BODY bgcolor='#343f50'>");
      //출력
      out.println("<div style=\"background-color: white\" style=\"width:100%\">\r\n" + 
            "      <nav id=\"topMenu\">\r\n" + 
            "         <ul>\r\n" + 
            "            <li><a class=\"menuLink\" href=\"three.jsp\">HOME</a></li>\r\n" + 
            "            <li>|</li>\r\n" + 
            "            <li><a class=\"menuLink\" href=\"map.jsp\">MAP</a></li>\r\n" + 
            "            <li>|</li>\r\n" + 
            "            <li><a class=\"menuLink\" href=\"board-list.jsp\">BOARD</a></li>\r\n" + 
            "            <li>|</li>\r\n" + 
            "            <li><a class=\"menuLink\" style=\"color: gray\" href=\"main.jsp?logout=yes\">LOGOUT</a></li>\r\n" + 
            "\r\n" + 
            "         </ul>\r\n" + 
            "      </nav>\r\n" + 
            "   </div>");
      out.println("<center>\r\n" + 
            "      <div class=\"div\" style=\"background-color: #f4c804\">\r\n" + 
            "         <p class=\"p\">길찾기 결과</div>\r\n" + 
            "      </div>\r\n" + 
            "   </center>");
      out.println("<form action='map.jsp' method='get'>");
      out.println("<table bgcolor='white' align='center' style='border-collapse:collapse;width:100%;height:77%;'>");
         out.println("<tr>");
            out.println("<td colspan='3' style='height:3%'>&nbsp</td>");
         out.println("</tr>");
         out.println("<tr>");
            out.println("<td style='width:5%'>&nbsp</td>");
           out.println("<td style='width:40%'><img src='image/campusmap.jpg' style='height:560px; width:780px; border:12px solid #343f50'/></td>");
           out.println("<td style='width:55%; font-family:함초롬돋움; font-size:25px;font-weight:bold;' align='center'>");
           out.println("<font color='#f08b07'> ▶ &nbsp1교시 :&nbsp"+first+
        		   "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <img src=\"image/people-gif.gif\" style='width:55px; height:55px;' /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp▶&nbsp2교시 :&nbsp"
        		   +second+"</font><br><br>"+
                    "1 이동시간 : "+ s.dijkstra(b1, b2) +"초<br>"+ 
                    "2 경로 : "+
                    "<br><br><br>");
           out.println("<input type='submit' value='다른길찾기' class='my_box2'/>");
            out.println("</td>");
        out.println("</tr>");
      out.println("</table>");
      out.println("</form>");
     out.println("</BODY>");
      out.println("</HTML>");
   }
}