<%-- 
    Document   : AddScore
    Created on : 21 May, 2020, 10:51:28 PM
    Author     : super
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <title>Add Score</title>
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
                    <h2 align="right"><% out.println(userName); %>  &nbsp; <% out.println(uid); %>&nbsp;&nbsp;</h2>
                </div>
            </section>
            <section id="boxes2">
                <div class="container">
                    <form action="" method="post">
                        <button id="back_button" type="submit" formaction="UserHome.jsp">back</button><br>
                        <!--<br>-->
                        <center>

                            <%

                                try {
                                    Date d = new Date();

                                    SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");

                                    String date = sdf.format(d);

                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");

                                    Statement st = con.createStatement();

                                    ResultSet rs = st.executeQuery("select count(eventid) from participants where uid='" + uid + "'");

                                    int count = 0;
                                    if (rs.next()) {
                                        count = rs.getInt(1);

                                        String events[] = new String[count];
                                        int i = 0;
                                        ResultSet rs2 = st.executeQuery("select eventid from participants where uid='" + uid + "'");

                                        while (rs2.next()) {
                                            events[i++] = rs2.getString(1);
                                        }
                                        boolean flag = true;
                                        for (int j = 0; j < i; j++) {
                                            ResultSet rs5 = st.executeQuery("select event_name from events where eventid='" + events[j] + "' and end_date>='" + date + "' ");
                                            String event_name = "";
                                            if (rs5.next()) {
                                                flag = false;
                                                event_name = rs5.getString(1);
                            %>
                            <button id="event_button" type="submit"  formaction="ScoreBoard1.jsp?eid=<%=events[j]%>" > <%="" + event_name + " " + events[j]%> </button> 


                            <%
//                                out.println("<br>");
                                    }

                                }
                                if (flag) {
                            %>
                            <div class="image_content">
                            <div class="top_of_image"><h3>No ongoing events for you</h3></div>
                            <img src="./img/kick_off.gif">
                            </div>

                            <%
                                //                                out.println("right now you are not participating for any event");
                            //                                out.println("<img src='./img/kick_off.gif'>");

                            }
                            %>
                        </center>
                    </form>
                    <%                    } else {
                                %>
                                 <div class="image_content">
                            <div class="top_of_image"><h3> You have zero participation</h3></div>
                            <img src="./img/kick_off.gif">
                            </div>
                                
<%
//out.println("<h3>you have not participated in any event</h3>");
                            }
                            con.close();

                        } catch (Exception e) {
                            out.println(e);
                            //    System.out.println("helooooooooooooooooooo world");
                            e.printStackTrace();
                        }


                    %>        
                </div>
            </section>
            <div id="bottom">
                <!--<footer style="margin-top:150px;">-->
                <footer >
                    <p>Loknath Singh Web Design, Copyright &copy; 2020</p>
                </footer>
            </div>


            <!--<h1>Hello World!</h1>-->
            <%    } else {
                    response.sendRedirect("Login.jsp?status=Please login first");

                    //            out.println("<h3>you are not logged in</h3>");
                }
            %>
        </div>
    </body>
</html>
