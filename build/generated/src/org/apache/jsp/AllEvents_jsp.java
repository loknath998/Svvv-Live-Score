package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public final class AllEvents_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width =device-width\">\n");
      out.write("        <!-- below three lines are for seo purpose -->\n");
      out.write("        <meta name=\"author\" content=\"Loknath Singh\">\n");
      out.write("        <title>All Events | List</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/style1.css\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body class=\"content\">\n");
      out.write("        <!-- for the logo and links in header  -->\n");
      out.write("        <header>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <!-- below div is for the logo of the website -->\n");
      out.write("                <div id=\"branding\">\n");
      out.write("                    <h1>SVVV Live Score</h1>\n");
      out.write("                </div>\n");
      out.write("                <!-- below the navigation links -->\n");
      out.write("                <nav>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"index.html\">Home</a></li>\n");
      out.write("                        <!--<li><a href=\"about.html\">Login</a></li>-->\n");
      out.write("                        <li><a href=\"Login.jsp\">Login</a></li>\n");
      out.write("                        <li><a href=\"SignUp.jsp\">SignUp</a></li>\n");
      out.write("                        <li><a href=\"About.jsp\">About</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </nav>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </header>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <section id=\"showcase\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <h2>List of All the events</h2>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <section id=\"boxes4\">\n");
      out.write("            <!--<section id=\"boxes2\">-->\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <form action=\"\" method=\"post\">\n");
      out.write("                    <button type=\"submit\" formaction=\"index.html\">back</button><br>\n");
      out.write("                    <center>\n");
      out.write("                        <div id=\"search\">\n");
      out.write("\n");
      out.write("                            ");

                                String message = request.getParameter("message");

                                if (message != null) {
                            
      out.write("                              \n");
      out.write("                            <h2> <span id=\"message\" >");
      out.print(message);
      out.write("</span></h2>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("\n");
      out.write("                            <input type=\"radio\" id=\"c1\" name=\"choice\" value=\"eid\"><label class=\"rb\" for=\"c1\">Event Id</label>\n");
      out.write("                            <input type=\"radio\" id=\"c2\" name=\"choice\" value=\"ename\"><label class=\"rb\" for=\"c2\">Event Name</label><br>\n");
      out.write("                            <input type=\"text\" name=\"eventid\" placeholder=\"id of event\">\n");
      out.write("                            <button type=\"submit\" formaction=\"\" >Search</button>\n");
      out.write("                            ");

                                String choice = request.getParameter("choice");
                                String query = "select * from events where ";
                                String key = request.getParameter("eventid");
                                if (key != null) {
                                    if ("ename".equals(choice)) {
                                        query = query + " event_name =";
                                    } else {
                                        query = query + " eventid =";
                                    }
                                    // out.println("<h1>"+query+"</h1>");
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");
                                        Statement st = con.createStatement();

                                        ResultSet rs = st.executeQuery(query + "'" + key + "'");
                                        if (rs.next()) {
                            
      out.write("\n");
      out.write("\n");
      out.write("                            <table id=\"live_event_details\" cellpadding=\"5px\" cellspacing=\"5px\" >\n");
      out.write("                                <tr id=\"table_head\">\n");
      out.write("                                    <td>Event Id</td>\n");
      out.write("                                    <td>Event Name</td>\n");
      out.write("                                    <td>Participants</td>\n");
      out.write("                                    <td>Host Id</td>\n");
      out.write("                                    <td>Start Date</td>\n");
      out.write("                                    <td>End Date</td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr >\n");
      out.write("                                    <td><button type=\"submit\" formaction=\"LiveScore1.jsp?eid=");
      out.print(rs.getString(1));
      out.write("\" >");
      out.print(rs.getString(1));
      out.write("</button></td>\n");
      out.write("                                    <td>");
      out.print(rs.getString(2));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(rs.getString(3));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(rs.getString(4));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(rs.getString(5));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(rs.getString(6));
      out.write("</td>\n");
      out.write("                                </tr>\n");
      out.write("\n");
      out.write("                                ");

                                            } else {
                                                response.sendRedirect("AllEvents.jsp?message=Record not found, try again");
                                            }

                                            con.close();
                                        } catch (Exception e) {
                                            out.println(e);
                                        }

                                    }


                                
      out.write("\n");
      out.write("\n");
      out.write("                            </table>           \n");
      out.write("                        </div>    \n");
      out.write("                        <table id=\"live_event_details\" cellpadding=\"10px\" cellspacing=\"10px\" >\n");
      out.write("                            <tr id=\"table_head\">\n");
      out.write("                                <td>Event Id</td>\n");
      out.write("                                <td>Event Name</td>\n");
      out.write("                                <td>Participants</td>\n");
      out.write("                                <td>Host Id</td>\n");
      out.write("                                <td>Start Date</td>\n");
      out.write("                                <td>End Date</td>\n");
      out.write("                            </tr>\n");
      out.write("                            ");
    try {
                            //        Date d=new Date();
                            //        
                            //        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
                            //        
                            //        String date=sdf.format(d);
                            //        
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");

                                    Statement st = con.createStatement();
                                    //out.println("<h2>"+date+"</h2>");
                            //        ResultSet rs= st.executeQuery("select count(eventid) from events where end_date >='"+date+"' ");

                            //        if(rs.next())
                            //        n = Integer.parseInt(rs.getString(1));
                            //        
                                    ResultSet rs1 = st.executeQuery("select * from events");
                                    if (rs1.next()) {
                                        do {
                                            out.println("<tr>");
                            //              for(int i=1;i<7;i++)
                            //              {

      out.write("   \n");
      out.write("                            <td><button type=\"submit\" formaction=\"LiveScore1.jsp?eid=");
      out.print(rs1.getString(1));
      out.write("\"  > ");
      out.print(rs1.getString(1));
      out.write(" </button></td> \n");
      out.write("                            <td>");
      out.print(rs1.getString(2));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs1.getString(3));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs1.getString(4));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs1.getString(5));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs1.getString(6));
      out.write("</td>\n");
      out.write("\n");
      out.write("\n");
      out.write("                            ");

             //              }
                                        out.println("</tr>");
                                    } while (rs1.next());
                                } else {
                                    out.println("<h2>there are none previous events</h2>");
                                }

             //        while(rs.next())
             //        {
                                //x++;

                            
      out.write("\n");
      out.write("                        </table></center>\n");
      out.write("                        ");
//            out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getString(4)+"  "+rs.getString(5)+"  "+rs.getString(6)+"  "+"<hr>");
            //        }
            //        if(n==0)
            //    {
            //        out.println("<h2>No Live events are going on</h2>");
            //    }
                                con.close();

                            } catch (Exception e) {
                                out.println(e);
            //    System.out.println("helooooooooooooooooooo world");
                                e.printStackTrace();
                            }


                        
      out.write("        \n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("       \t<!--<footer style=\"margin-top:150px;\">-->\n");
      out.write("        <footer >\n");
      out.write("            <p>Loknath Singh Web Design, Copyright &copy; 2020</p>\n");
      out.write("        </footer>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
