<%-- 
    Document   : HostScoreBoard1
    Created on : 25 May, 2020, 9:26:05 PM
    Author     : super
--%>
<%@page import="java.util.ArrayList"%>
<%-- 
    Document   : CreateEventAddParticipant
    Created on : 22 May, 2020, 10:32:06 PM
    Author     : super
--%>
<%-- 
    Document   : CreateEvent
    Created on : 21 May, 2020, 9:53:16 PM
    Author     : super
--%>
<%@page import="java.sql.*"%>

<%
    String uid = (String) session.getAttribute("uid");
    if (uid != null) {
        String userName = (String) session.getAttribute("userName");
//                String eid =(String)session.getAttribute("eid");
        String x;
        String eid = request.getParameter("eid");

        if (eid == null) {
            x = (String) session.getAttribute("eid1");
            eid = x;
        } else {
            session.setAttribute("eid1", eid);
        }

// Get an array of Cookies associated with the this domain
//        Cookie[] cookies = request.getCookies();
//         if(cookies != null)
//         {
//                        String uid=cookies[1].getValue();
//             String userName=cookies[2].getValue();
//            int n=Integer.parseInt(request.getParameter("no_of_participants"));
//String name_of_event=request.getParameter("name_of_event");
//String hostid= request.getParameter("hostid");
//String start_date=request.getParameter("start_date");
//String end_date = request.getParameter("end_date");
//session.setAttribute("no_of_participants",n);
//session.setAttribute("name_of_event",name_of_event);
//session.setAttribute("hostid",hostid);
//session.setAttribute("start_date",start_date);
//session.setAttribute("end_date",end_date);

%>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width =device-width">

        <meta name="author" content="Loknath Singh">
        <title>SVVV Scores | HostScoreBoard</title>
        <link rel="stylesheet" href="./css/style1.css">
    </head>

    <body class="content">
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
                <h2 align="right"><% out.println(userName); %>  &nbsp <% out.println(uid); %>&nbsp&nbsp</h2>
            </div>
        </section>

        <section id="boxes2">
            <div class="container">
                <form >
                    <%
                        String f = request.getParameter("f");
                        if (f != null) {
                    %>
                    <button id="back_button" type="submit" formaction="PreviousHostedEvent.jsp">back</button><br>
                    <%
                    } else {
                    %>
                    <button id="back_button" type="submit" formaction="HostedEvent.jsp">back</button><br>

                    <%
                        }
                        int n = 4;
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");

                            Statement st = con.createStatement();

                            ResultSet rs = st.executeQuery("select * from events where eventid='" + eid + "'");
                            if (rs.next()) {
                    %>
                    <center>
                        <table id="score_board_table" cellspacing="10px" cellpadding="10px">
                            <tr id="table_head">
                                <td>Event Id</td>
                                <td>Event Name</td>
                                <td>Participants</td>
                                <td>Host Id</td>
                                <td>Start Date</td>
                                <td>End Date</td>
                            </tr>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>
                            </tr>
                        </table></center>
                        <%
                                n = Integer.parseInt(rs.getString(3));
                                session.setAttribute("n1", n);
                            } else {
                                out.println("<h3>no data found</h3>");
                            }
                        %>
                    <button type="submit" formaction="HostAddScore1.jsp">Add Score</button>

                    <center>
                        <table id="score_board_table" cellspacing="5px" cellpadding="5px">
                            <tr >
                                <td>Rounds</td>    
                                <%
                                    ResultSet rs1 = st.executeQuery("select uid from participants where eventid ='" + eid + "'");
                                    String participants[] = new String[n];
                                    String names[] = new String[n];
                                    int i = 0;

                                    while (rs1.next()) {
                                        participants[i++] = rs1.getString(1);
                                    }
                                    for (i = 0; i < n; i++) {
                                        ResultSet rs2 = st.executeQuery("select name from users where uid='" + participants[i] + "'");
                                        if (rs2.next()) {
                                            names[i] = rs2.getString(1);
                                        }
                                    }
                                    for (i = 0; i < n; i++) {


                                %>

                                <td><%=participants[i]%><br><%=names[i]%></td>

                                <%
                                        session.setAttribute("p" + (i + 1), participants[i]);
                                        session.setAttribute("name" + (i + 1), names[i]);

                                    }
                                    out.println("</tr>");

                                    int round = 0;

                                    ResultSet rs3 = st.executeQuery("select max(round) from scores where eventid='" + eid + "'");
                                    if (rs3.next()) {
                                        if (rs3.getString(1) != null) {
                                            round = Integer.parseInt(rs3.getString(1));
                                        }
                                    }
                                    int scores[] = new int[round * n];
                                    if (round == 0) {
                                        out.println("<tr>");
                                        for (i = 0; i < n + 1; i++) {
                                %>
                                <td>0</td>
                                <%
                                        }
                                        out.println("</tr>");
                                    } else {
                                        for (i = 0; i < round; i++) {
                                            for (int j = 0; j < n; j++) {

                                                ResultSet rs4 = st.executeQuery("select score from scores where eventid='" + eid + "' and uid='" + participants[j] + "' and round=" + (i + 1) + " ");
                                                if (rs4.next()) {
                                                    if (rs4.getString(1) != null) {
                                                        scores[i * n + j] = Integer.parseInt(rs4.getString(1));
                                                    } else {
                                                        scores[i * n + j] = 0;
                                                    }

                                                } else {
                                                    scores[i * n + j] = 0;

                                                }
                                                //                out.println("<tr><td colspan='=5'>hello</td></tr>");
                                            }
                                        }
//                                        Object objScore[] = (Object[])scores;
                                        session.setAttribute("scores", scores);
                                        for (i = 0; i < round; i++) {
                                            out.println("<tr><td>" + (i + 1) + "</td>");
                                            for (int j = 0; j < n; j++) {
                                                out.println("<td>" + scores[i * n + j] + "</td>");
                                            }
                                            out.println("<td><button type='submit' style='width:100px; margin:2px;'  formmethod='post' formaction='EditRoundScore.jsp?r=" + (i + 1) + "' >Edit</button></td>");
                                            //        out.println("<td><button type='submit' id='button1' formmethod='post' formaction='EditRoundScore.jsp?r="+(i+1)+"' >Edit</button></td>");
                                            out.println("</tr>");

                                        }

                                    }
                                %>

                        </table>
                    </center>
                    <center>

                        <%
                            ResultSet rs4 = st.executeQuery("select code, score, status from codes where eventid='" + eid + "'");
                            if (rs4.next()) {
                        %>
                        <table  id="score_board_table" cellspacing="10px" cellpadding="10px">
                            <tr id="table_head" >
                                <td>Codes</td>
                                <td>Scores</td>
                                <td>Status</td>
                            </tr>
                            <%
                                do {
                            %>
                            <tr>
                                <td><%=rs4.getString(1)%></td>
                                <td><%=rs4.getString(2)%></td>
                                <td><%=rs4.getString(3)%></td>
                            </tr>
                            <%
                                } while (rs4.next());
                            %>
                        </table>
                    </center>
                    <%      }

                            con.close();
                        } catch (Exception e) {
                            out.println(e);

                        }

                    %>
                </form>

            </div>
        </section>


        <footer style="margin-top:30px;">
            <p>Loknath Singh Web Design, Copyright &copy; 2020</p>
        </footer>
    </body>

    <%              } else {
            response.sendRedirect("Login.jsp?status=Please Login First");
            //            out.println("<h2>you are Not  Logged in</h2>");
        }
    %>
</html>

