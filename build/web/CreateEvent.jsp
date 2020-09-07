<%-- 
    Document   : CreateEvent
    Created on : 21 May, 2020, 9:53:16 PM
    Author     : super
--%>

     <%
     
         String uid = (String)session.getAttribute("uid"); 
         if(uid!=null)
         {
             String userName= (String)session.getAttribute("userName");
// Get an array of Cookies associated with the this domain
//        Cookie[] cookies = request.getCookies();
//         if(cookies != null)
//         {
//            String uid=cookies[1].getValue();
//            String userName=cookies[2].getValue();
//            
            


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
            <%
            String s = request.getParameter("status");
            if(s!= null)
            out.println("<p style='color:red;'>"+s+"</p>");
            %>
    </section>

    <section id="boxes2">
        <div class="container">
            <form >
                <button id="back_button" type="submit" formaction="UserHome.jsp">back</button><br>
            </form>
            <form>
                <input type="text" required name="name_of_event" placeholder="Enter name of the event"><br>
                <input type="text" required  name="hostid" placeholder="Host userid"><br>
                <span>no of participant </span><br>

                <input type="number" required  name="no_of_participants" value="4"><br>
                <div class="box">
                <span>Event start date </span><br>
                <input name="start_date"  required="true"  type="date" >
                </div>
                <div class="box">
                    <span>Event end date</span><br>
                    <input name="end_date" required="true"  type="date" >
                </div>
                <!--<button type="submit" formaction="//response.sendRedirect("CreateEventAddParticipant.jsp")" >next</button>-->
                <button type="submit" formaction="CreateEventAddParticipant.jsp" >next</button>
                    
                
                
            </form>

        </div>
    </section>
		
    </section>
		<footer style="margin-top:30px;">
			<p>Loknath Singh Web Design, Copyright &copy; 2020</p>
		</footer>
	</body>

<%              }
          else {
                response.sendRedirect("Login.jsp?status=Please login first");

//            out.println("<h2>you are Not  Logged in</h2>");
         }
      %>
</html>







