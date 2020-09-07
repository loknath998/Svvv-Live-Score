<%-- 
    Document   : Profile
    Created on : 21 Jun, 2020, 2:24:58 PM
    Author     : super
--%>
<%-- 
    Document   : CreateEvent
    Created on : 21 May, 2020, 9:53:16 PM
    Author     : super
--%>
<%@page import="java.sql.*" %>
<%

    String uid = (String) session.getAttribute("uid");
    if (uid == null) {
        response.sendRedirect("Login.jsp?status=Please login first");
    }

    String userName = (String) session.getAttribute("userName");
    String status = request.getParameter("status");
%>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width =device-width">
        <meta name="author" content="Loknath Singh">
        <title>SVVV Scores | Profile</title>
        <link rel="stylesheet" href="./css/style1.css">


        <script type='text/javascript' src='Validation.js'>


        </script>
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
                        <li><a href="Profile.jsp">Profile</a></li>
                        <li><a href="Logout.jsp">LogOut</a></li>
                    </ul>
                </nav>

            </div>
        </header>
        <section id="showcase">
            <div class="container">
                <!--<h1>Hello loki here World!</h1>-->
                <h2 align="right"><% out.println(userName); %>  &nbsp <% out.println(uid); %>&nbsp&nbsp</h2>

                <%
                    if (status != null) {
                        out.println("<h2>" + status + "</h2>");
                    }
                %>
            </div>
        </section>

        <section id="boxes2">
            <div class="container">
                <center>
                    <form action="UpdateProfile.jsp" method="post">
                        <button id="back_button" type="submit" formaction="UserHome.jsp">back</button><br>

                        <table id="live_event_details" cellpadding="10px" cellspacing="10px" >
                            <tr id="table_head"><td>Fields</td><td>values</td></tr>

                            <%
                                String pass = "";
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from users where uid='" + uid + "'");
                                    if (rs.next()) {

                                        out.println("<tr><td>ID</td><td>" + rs.getString(1) + "</td></tr>");
                                        out.println("<tr><td>Name</td><td> <input id='nm1' name='nm1' type='text' readonly style='background:#D3D3D3;' value='" + rs.getString(2) + "' ></td></tr>");
        //          out.println("<tr><td>Password</td><td>"  +rs.getString(3)+"</td></tr>");
                                        out.println("<tr><td>Contact.no</td><td><input id='cont1' name='cont1' type='text' readonly  style='background:#D3D3D3;'  value='" + rs.getString(4) + "'></td></tr>");
                                        out.println("<tr><td>Email</td><td><input id='email1' name='email1' type='email' readonly  style='background:#D3D3D3;'  value='" + rs.getString(5) + "'></td></tr>");
                                        out.println("<tr><td>Roll.no</td><td><input id='roll1' name='roll1' type='text' readonlu  style='background:#D3D3D3;'  value='" + rs.getString(6) + "'></td></tr>");
                                        out.println("<tr><td>College</td><td><input id='clg1' name='clg1' type='text' readonly  style='background:#D3D3D3;'  value='" + rs.getString(7) + "'></td></tr>");
                                        pass = rs.getString(3);
                                    } else {
                                        out.println("problem occured in fetching your data please try to register again");
                                    }
                                    con.close();

                            %>




                            <%    } catch (Exception e) {
                                    out.println("<h1>" + e + "</h1>");
                                }


                            %>

                        </table>
                        <button type="button" onclick="toggleUpdate()"  >Edit</button>
                        <button type="submit"  >Update</button>


                    </form>
                    <br>
                    <form id="form2" name="form2" action="UpdateProfile.jsp" method="post">
                        <button type="button" onclick="myFunction()" >Edit Password</button>
                        <!--<p id='passs'>rs.getString(3)</p>-->
                        <div id="editPassword" style="display: none;">
                            <hr>
                            <input type="password" id='oldpass'  name="oldPass" onkeyup="passwordCheck('<%=pass%>')" placeholder="Old Passord">
                            <input type="password"  id='newpass' name="newPass" onkeyup="passwordCheck2()"  placeholder="New Passord">
                            <button type="button" onclick="UpdatePass('<%=pass%>')" >Update Password</button>
                            <br><span id="pwdCheck" style="color:red;"></span>
                            <hr>
                        </div>
                    </form>
                </center>
            </div>
        </section>

        <div id="footer">
            <footer style="margin-top:30px;">
                <p>Loknath Singh Web Design, Copyright &copy; 2020</p>
            </footer>
        </div>
    </body>

</html>



















