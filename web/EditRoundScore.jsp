<%-- 
    Document   : EditRoundScore
    Created on : 25 May, 2020, 11:38:36 PM
    Author     : super
--%>

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
            int scores[] = (int[])session.getAttribute("scores");
            int r = Integer.parseInt(request.getParameter("r"));
            session.setAttribute("round",r);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta name="viewport" content="width =device-width">
		<!-- below three lines are for seo purpose -->
		<meta name="author" content="Loknath Singh">
        <title>Host Edit Score</title>
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
			<h2 align="right"><% out.println(userName); %>  &nbsp <% out.println(uid); %>&nbsp&nbsp</h2>
		</div>
		</section>
		 <section id="boxes2">
        <div class="container">
            <form action="" method="get">
                <button id="back_button" type="submit" formaction="HostScoreBoard1.jsp">back</button><br>

                
                <%
                    if( !  ((n)*r <= scores.length))
                    {
                        out.println("<h2>"+r+" is not a valid round <h2>");
                    }
                    else{
                for(int i=1;i<= n;i++)
                {
                %>
                <label><%=(String)session.getAttribute("p"+(i))%> <%=session.getAttribute("name"+i)%></label><br>
                <input type="text" name="ns<%=i%>" value="<%=scores[(r-1)*n + i-1] %>"><br>
                <!--<input type="text" placeholder="Host userid"><br>-->
                <%
                }

                %>
                <button type="submit" formaction="EditRoundScoreProcess.jsp">Save</button>
<% 
}
%>
                
                        
</form>

 </div>
                 </section>
        
		<!--<footer style="margin-top:150px;">-->
                <footer style="margin-top: 230px;" >
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
<!--............................................................
        for(int j=0;j<n;j++)
    {

        ResultSet rs4=st.executeQuery("select score from scores where eventid='"+eid+"' and uid='"+participants[j]+"' and round="+(i+1)+" ");
        if(rs4.next())
{
    if(rs4.getString(1)!=null)
        scores[i*n+j]=Integer.parseInt(rs4.getString(1));
    else
        scores[i*n+j]=0;

        

        
}
else{
            scores[i*n+j]=0;

}
//                out.println("<tr><td colspan='=5'>hello</td></tr>");
            }-->