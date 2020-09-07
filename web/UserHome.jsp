<%-- 
    Document   : main
    Created on : 21 May, 2020, 4:54:40 PM
    Author     : super
--%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

     <%
         String uid= (String)session.getAttribute("uid");
         // Get an array of Cookies associated with the this domain
       // Cookie[] cookies = request.getCookies();
         if(uid != null)
         {
//             String userName=cookies[2].getValue();
             String userName=(String)session.getAttribute("userName");
         
         %>

<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width =device-width">
		
		<!-- below three lines are for seo purpose -->
		<meta name="author" content="Loknath Singh">
		<title>SVVV Scores | UserHome</title>
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
			<!--<div class="container2">-->
			<div class="container">
			<h2 align="right"><% out.println(userName); %>  &nbsp; <% out.println(uid); %>&nbsp;&nbsp;</h2>
			</div>
		</section>
		
		<section id="boxes1">
			<div class="container">
				
				<div class="box">
				<a href="AddScore.jsp">
				<img src="./img/AddScore.png">
				<h3>Add Score</h3>
				</a>
				<p>Add your Score for on going events</p>
				<p>(Add Score, Add Round)</p>
				</div>
				<div class="box">
				<a href="CreateEvent.jsp">
				<img src="./img/CreateEvent.png">
				<h3>Create Event</h3>
				</a>
				<p>Create new Event</p>
				<p>(Add participant, Select duration, Generate keys)</p>
				</div>
				<div class="box">
				<a href="HostedEvent.jsp">
				<img src="./img/HostedEvents.png">
				<h3>Hosted events</h3>
				</a>
				<p>List of your live events</p>
				<p>(Add scores, Edit scores, Add rounds)</p>
				</div>
				<div class="box">
				<a href="PreviousEvents.jsp">
				<img src="./img/PreviousEvents.png">
				<h3>Previous Events</h3>
				</a>
				<p>List of events you have participated</p>
				</div>
                            <div class="box">
                            <span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </div>	
                            <div class="box">
				<a href="PreviousHostedEvent.jsp">
				<img src="./img/PHostedEvents.png">
				<h3>Previous Hosted events</h3>
				</a>
				<p>List of all previous events you have hosted</p>
				<p>(Edit scores, Add new scores)</p>
				</div>

                            
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







