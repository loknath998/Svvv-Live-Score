<%-- 
    Document   : AddScoreProcess1
    Created on : 22 May, 2020, 11:50:51 PM
    Author     : super
--%>

<%-- 
    Document   : CreateEvent
    Created on : 21 May, 2020, 9:53:16 PM
    Author     : super
--%>
<%@page import="java.sql.*"%>
     <%
     
         String uid = (String)session.getAttribute("uid"); 
         if(uid!=null)
         {
             String userName= (String)session.getAttribute("userName");
             String status1 =request.getParameter("status1");
             String status2 = request.getParameter("status2");
             String eid=(String) session.getAttribute("eid2");
         %>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width =device-width">

        <!-- below three lines are for seo purpose -->
        <meta name="author" content="Loknath Singh">
        <title>SVVV Scores | create Event</title>
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
                   <!--<h1>Hello loki here World!</h1>-->
			<h2 align="right"><% out.println(userName); %>  &nbsp <% out.println(uid); %>&nbsp&nbsp</h2>

            </div>
    </section>

    <section id="boxes2">
        <div class="container">
            <form>
                <button id="back_button" type="submit" formaction="ScoreBoard1.jsp">back</button><br>
                <%
try{             
    

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from codes where eventid='"+eid +"'");
//out.println("<hr>hello 1<hr>");
                
                
                if(rs.next())
                {
                    
                %>
                
                <span>Event :<%=eid %></span><br>
                <input type="text" name="score_code" placeholder="Enter code to add score"><br>
<!--                <input type="text" name="hostid" placeholder="Host userid"><br>-->
                <!--<span>no of participant </span><br>-->
                <%  
                if(status1!=null)
                out.println("<hr><span>"+status1+"</span><hr>");
                %>

                <!--<button type="submit" formaction="//response.sendRedirect("CreateEventAddParticipant.jsp")" >next</button>-->
                <button type="submit" formaction="VerifyScoreCode.jsp" >verify</button>
                 <%
                 }
                  else
                {
              
//out.println("<hr>hello<hr>");
                %>
                
                <span>Event :<%=eid%></span>
                <input type="text" name="user_score" placeholder="Enter score" ><br>
                <%
                if(status2!=null)
                {
                    out.println("<span>"+ status2 +"</span><br>");
                }
                %>
                <button type="submit" formaction="AddMyScoreProcess2.jsp">Add My Score</button>
                
                <%
                }

con.close();
}
catch(Exception e)
{
out.println(e);
}
                 
                 %>   
                
                
            </form>

        </div>
    </section>
                 <div id="bottom">
		<footer >
			<p>Loknath Singh Web Design, Copyright &copy; 2020</p>
		</footer>
                     </div>
	</body>

<%              }
          else {
                response.sendRedirect("Login.jsp?status=Please login first");

//            out.println("<h2>you are Not  Logged in</h2>");
         }
      %>
</html>







