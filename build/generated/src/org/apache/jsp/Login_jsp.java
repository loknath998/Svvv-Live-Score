package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width =device-width\">\n");
      out.write("    \n");
      out.write("    <!-- below three lines are for seo purpose -->\n");
      out.write("    <meta name=\"description\" content=\"Affordable and professional web design\">\n");
      out.write("    <meta name=\"keywords\" content=\"web design, affordable web design, professional website\">\n");
      out.write("    <meta name=\"author\" content=\"Loknath Singh\">\n");
      out.write("    <title>SVVV Scores | Home</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"./css/style1.css\">\n");
      out.write("\n");
      out.write("        </head>\n");
      out.write("  \n");
      out.write("  <body>\n");
      out.write("  <!-- for the logo and links in header  -->\n");
      out.write("    <header>\n");
      out.write("      <div class=\"container\">\n");
      out.write("      <!-- below div is for the logo of the website -->\n");
      out.write("        <div id=\"branding\">\n");
      out.write("        <h1>SVVV Live Score</h1>\n");
      out.write("        </div>\n");
      out.write("        <!-- below the navigation links -->\n");
      out.write("        <nav>\n");
      out.write("            <ul>\n");
      out.write("                    <li><a href=\"index.html\">Home</a></li>\n");
      out.write("                    <li><a href=\"Login.jsp\">Login</a></li>\n");
      out.write("                    <li><a href=\"SignUp.jsp\">SignUp</a></li>\n");
      out.write("                    <li><a href=\"about.jsp\">About</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("      \n");
      out.write("      </div>\n");
      out.write("    </header>\n");
      out.write("    <section id=\"showcase\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("      <h1>LogIn</h1>\n");
      out.write("      </div>\n");
      out.write("    </section>\n");
      out.write("    \n");
      out.write("    <section id=\"signup\"> \n");
      out.write("       <div class=\"container\"> \n");
      out.write("         <!--<h1>Subscribe to our NewsLetter</h1>--> \n");
      out.write("         <form action=\"LoginProcess.jsp\"><center>\n");
      out.write("                                    <table cellspacing=\"10px\" cellpadding=\"10px\">\n");
      out.write("                                        <tr>\n");
      out.write("                                        <td>Enter Phone no.</td>\n");
      out.write("                                        <td><input type=\"text\" name=\"userContact\" placeholder=\"Enter Contact No.\"></td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        \n");
      out.write("                                        <tr>\n");
      out.write("                                        <td>Enter Password</td>\n");
      out.write("                                        <td><input type=\"password\" name=\"userPassword\" placeholder=\"Your Password Here\"></td>\n");
      out.write("                                        </tr>\n");
      out.write("    \n");
      out.write("                                        <tr>\n");
      out.write("                                        <td colspan=\"2\" align=\"center\">\n");
      out.write("                                        <button type=\"submit\" class=\"button_1\">Login</button> \n");
      out.write("                                       </td>\n");
      out.write("                                       </tr>\n");
      out.write("                                       <tr >\n");
      out.write("                                           <td colspan=\"2\" style=\"text-align:right;\" >\n");
      out.write("                                        <a class=\"small_links\" href=\"https://www.google.com/\" >forget Password?</a>\n");
      out.write("                                         </td></tr>\n");
      out.write("                                    </table></center>\n");
      out.write("                                 </form> \n");
      out.write("       </div> \n");
      out.write("     </section> \n");
      out.write("    \n");
      out.write("    <footer style=\"margin-top:80px;\">\n");
      out.write("      <p>Loknath Singh Web Design, Copyright &copy; 2020</p>\n");
      out.write("    </footer>\n");
      out.write("    \n");
      out.write("  </body>\n");
      out.write("\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
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
