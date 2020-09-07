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
<%@page import = "java.sql.*"%>
<%
    String uid = (String) session.getAttribute("uid");
    if (uid != null) {
        String userName = (String) session.getAttribute("userName");

// Get an array of Cookies associated with the this domain
//        Cookie[] cookies = request.getCookies();
//         if(cookies != null)
//         {
//                        String uid=cookies[1].getValue();
//             String userName=cookies[2].getValue();
        int n = Integer.parseInt(request.getParameter("no_of_participants"));
        String name_of_event = request.getParameter("name_of_event");
        String hostid = request.getParameter("hostid");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        session.setAttribute("no_of_participants", n);
        session.setAttribute("name_of_event", name_of_event);
        session.setAttribute("hostid", hostid);
        session.setAttribute("start_date", start_date);
        session.setAttribute("end_date", end_date);

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");
            Statement st = con.createStatement();
            
            ResultSet rs = st.executeQuery("select uid from users where uid='"+ hostid+"'");
            if(!rs.next())
            {
                response.sendRedirect("CreateEvent.jsp?status=Invalid host id :"+hostid);
            }
            
        }
        catch(Exception e)
        {
            out.println(e);
        }


%>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width =device-width">

        <!-- below three lines are for seo purpose -->
        <meta name="author" content="Loknath Singh">
        <title>SVVV Scores | Add Participant</title>
        <link rel="stylesheet" href="./css/style1.css">
        <script>
            function showHide(chk)
            {
//            var txtfield=document.getElementById('t1');
                var txtfield = document.getElementById('fields');
                //    txtfield.style.display='block';
//            var fortext= document.getElementById('forText');

                var msg = txtfield.style.display;
                if (msg === "block")
                    txtfield.style.display = 'none';
                else
                    txtfield.style.display = 'block';
//        fortext.innerHTML=txtfield.style.display;

            }
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
                        <!--<li><a href="about.html">Login</a></li>-->
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

            </div>
                            <%
            String s = request.getParameter("status");
            if(s!= null)
            out.println("<p style='color:red;'>"+s+"</p>");
            %>

        </section>

        <section id="boxes2">
            <div class="container">
                <form >
                    <button id="back_button" type="submit" formaction="CreateEvent.jsp">back</button><br>
                </form>
                <form >
                    <center>
                        <%
                            
                            
                            
                            for (int i = 1; i <= n; i++) {
                        %>
                        <input required type="text" name="p<%=i%>" placeholder="Enter id of participant <%=i%>"><br>
                        <!--<input type="text" placeholder="Host userid"><br>-->
                        <%
                            }

                        %>

                        <input type="checkbox"  id="ckbox" onclick="showHide(this)" style="width:80px;" name="want_keys"><label for="ckbox">Want keys for scores</label>
                        <!--<br><input type="text" id="t1" style='display:none;' name="tf1" placeholder="Enter required score 1">-->
                        <div id='fields'style='display:none;'>
                            <br><font>Enter required score 1</font><input required type="number" id="t1"  name="tf1" value='50'>
                            <br><font>Enter required score 2</font><input  required  type="number" id="t1"  name="tf2" value="100">
                            <br><font>Enter required score 3</font><input  required  type="number" id="t1"  name="tf3" value="150">
                            <br><font>Enter required score 4</font><input  required  type="number" id="t1"  name="tf4" value="200">
                            <!--<br><font>Enter required score 5</font><input type="text" id="t1"  name="tf5" placeholder="">-->
                            <br><font>Enter no of rounds</font><input type='number' id='t1' name='rounds' value='3' >
                        </div>
                        <!--<br><span id="forText" ></span>-->
                        <br><button type="submit" formaction="CreateEventProcess.jsp">Create</button>
                        <!--<br><button type="submit" formaction="newjsp.jsp">Create</button>-->

                    </center>
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







