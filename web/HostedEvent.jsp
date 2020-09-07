<%-- 
    Document   : AddScore
    Created on : 21 May, 2020, 10:51:28 PM
    Author     : super
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*" %>
<%
    // Get an array of Cookies associated with the this domain
    String uid = (String) session.getAttribute("uid");
    if (uid != null) {
        String userName = (String) session.getAttribute("userName");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width =device-width">
        <!-- below three lines are for seo purpose -->
        <meta name="author" content="Loknath Singh">
        <title>Hosted Events</title>
        <link rel="stylesheet" href="./css/style1.css">

    </head>
    <body class="content">
        <div id="wrapper">
            <!-- for the logo and links in header  -->
            <header>
                <div class="container">
                    <!-- below div is for the logo of the website -->
                    <div id="branding">
                        <h1>SVVV Live Score</h1>
                    </div>
                    <!-- below the navigation links -->
                    <nav>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <!--<li><a href="about.html">Login</a></li>-->
                            <li><a href="Profile.jsp">Profile</a></li>
                            <li><a href="Logout.jsp">LogOut</a></li>
                        </ul>
                    </nav>

                </div>
            </header>


            <section id="showcase">
                <div class="container">
                    <h2 align="right"><%=userName%>&nbsp;<%=uid%>&nbsp;&nbsp;</h2>

                </div>
            </section>
            <section id="boxes2">
                <div class="container">
                    <form action="" method="post">
                        <button id="back_button" type="submit" formaction="UserHome.jsp">back</button><br>
                        <center>

                            <%

                                try {
                                    Date d = new Date();
                                    SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
                                    String date = sdf.format(d);
                                    //                                out.println(date);
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");

                                    Statement st = con.createStatement();

                                    ResultSet rs = st.executeQuery("select eventid, event_name from events where hostid='" + uid + "' and end_date >= '" + date + "'");
                                    boolean flag = true;
                                    while (rs.next()) {
                                        flag = false;
                            %>
                            <button id="event_button" type="submit"  formaction="HostScoreBoard1.jsp?eid=<%=rs.getString(1)%>" > <%="" + rs.getString(1) + " " + rs.getString(2)%> </button> 
                            <%
                                }
                                if (flag) {

                            %>
                            <div class="image_content">
                                <div class="top_of_image"><h3>No events for you here</h3></div>
                                <img src="./img/kick_off.gif">
                            </div>
                            <%                                    }
                                    con.close();

                                } catch (Exception e) {
                                    out.println(e);
                                }

                            %>        
                        </center>
                    </form>
                </div>
            </section>

            <!--<footer style="margin-top:150px;">-->
            <div id="bottom">
                <footer >
                    <p>Loknath Singh Web Design, Copyright &copy; 2020</p>
                </footer>
            </div>


            <%    } else {
                    response.sendRedirect("Login.jsp?status=Please login first");
                }
            %>
        </div>
    </body>
</html>
