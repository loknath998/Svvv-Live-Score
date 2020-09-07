<%-- 
    Document   : HostAddScore1
    Created on : 25 May, 2020, 9:30:28 PM
    Author     : super
--%>
<%-- 
    Document   : AddScore
    Created on : 21 May, 2020, 10:51:28 PM
    Author     : super
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%
         // Get an array of Cookies associated with the this domain
       String uid=(String)session.getAttribute("uid");
        if(uid !=null)
        {
            String userName=(String)session.getAttribute("userName");
            String eid1=(String)session.getAttribute("eid");
            Integer n=(Integer)session.getAttribute("n1");
            

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta name="viewport" content="width =device-width">
		<!-- below three lines are for seo purpose -->
		<meta name="author" content="Loknath Singh">
        <title>Host Add Score</title>
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
                               <!--<h1>Hello loki here World!</h1>-->
			                <h2 align="right"><%=userName%>&nbsp;<%=uid%>&nbsp;&nbsp;</h2>

			<!--<p><a href="http://svvv.edu.in/">Shri Vaishnav Vidyapeeth Vishwavidyalaya</a> Trust believes in taking the nation forward by improving the quality of life of its citizens by continuously working in the sphere of education, health and environment.</p>-->
		</div>
		</section>
		 <section id="boxes2">
        <div class="container">
            <form action="" method="get">
                <button id="back_button" type="submit" formaction="HostScoreBoard1.jsp">back</button><br>
                                <%
                for(int i=1;i<= n;i++)
                {
                %>
                <label><%=(String)session.getAttribute("p"+(i))%> <%=session.getAttribute("name"+i)%></label><br>
                <input type="text" name="ns<%=i%>" value="0"><br>
                <!--<input type="text" placeholder="Host userid"><br>-->
                <%
                }

                %>
                <button type="submit" formaction="HostAddScore2.jsp">Save</button>

                
                        
</form>

 </div>
                 </section>
        
		<!--<footer style="margin-top:150px;">-->
                <footer >
			<p>Loknath Singh Web Design, Copyright &copy; 2020</p>
		</footer>
	  


        <!--<h1>Hello World!</h1>-->
<%  

        }
        else
            {
               response.sendRedirect("Login.jsp?status=Please login first");

//            out.println("<h3>you are not logged in</h3>");
            }
%>
            </div>
    </body>
</html>
