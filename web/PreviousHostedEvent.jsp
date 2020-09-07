<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%
    String uid = (String) session.getAttribute("uid");
    if (uid == null) {
        response.sendRedirect("Login.jsp?status=Please login first");
    } else {
        String userName = (String) session.getAttribute("userName");
%>
<html>
    <head>
        <meta charset="utf-8">

        <title>Previous Hosted Events</title>
        <link rel="stylesheet" href="./css/style1.css">
        <!--<link rel="stylesheet" href="./css/style1.css">-->
    </head>
    <body class="content">
        <header>
            <div class="container">
                <div id="branding">
                    <h1>SVVV Live Score</h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="Logout.jsp">Logout</a></li>
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
            <div id="container">
                <form action="" method="post">
                    <button id="back_button" type="submit" formaction="UserHome.jsp">back</button>
                    <center>
                        <%
                            try {
                                Date d = new Date();
                                SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
                                String date = sdf.format(d);

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");
                                Statement st = con.createStatement();
                                ResultSet rs1 = st.executeQuery("select eventid , event_name from events where hostid='" + uid + "' and end_date < '" + date + "' and start_date < '" + date + "' ");
                                boolean flag = true;
                                while (rs1.next()) {
                                    flag = false;
                        %>
                        <button id="event_button" type="submit" formaction="HostScoreBoard1.jsp?eid=<%=rs1.getString(1)%>&f=1" ><%=rs1.getString(1) + " " + rs1.getString(2)%></button>

                        <%
                            }
                            if (flag) {
                        %>

                        <div class="image_content">
                            <div class="top_of_image"><h3>Zero events Hosted by you</h3></div>
                            <img src="./img/kick_off.gif">
                        </div>                               
                        <%
//                                    out.println("Total 0 hosted events by you");
                                }

                            } catch (Exception e) {
                                out.println(e);
                            }


                        %>
                    </center>

                </form>
            </div>
        </section>

        <div id="bottom">
            <footer>
                <p>Loknath Singh Web Design, Copyright &copy; 2020</p>
            </footer>
        </div>
    </body>

</html>



<%        }
%>

