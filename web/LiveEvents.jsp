
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import ="java.text.SimpleDateFormat"%>
<%@page import ="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta name="viewport" content="width =device-width">
		<!-- below three lines are for seo purpose -->
		<meta name="author" content="Loknath Singh">
        <title>Live Events | List</title>
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
                                    <li><a href="Login.jsp">Login</a></li>
                                    <li><a href="SignUp.jsp">SignUp</a></li>
                                    <li><a href="About.jsp">About</a></li>
                            </ul>
                    </nav>

            </div>
        </header>
	

<section id="showcase">
			<div class="container">
                               <!--<h1>Hello loki here World!</h1>-->
			<h2>List of live events</h2>
			<!--<p><a href="http://svvv.edu.in/">Shri Vaishnav Vidyapeeth Vishwavidyalaya</a> Trust believes in taking the nation forward by improving the quality of life of its citizens by continuously working in the sphere of education, health and environment.</p>-->
		</div>
		</section>
		 
 <section id="boxes4">
 <!--<section id="boxes2">-->
        <div class="container">
            <form action="" method="post">
                <button type="submit" formaction="index.html">back</button><br>
                        <center>
                <table id="live_event_details" cellpadding="10px" cellspacing="10px" >
                     <tr id="table_head">
                    <td>Event Id</td>
                    <td>Event Name</td>
                    <td>Participants</td>
                    <td>Host Id</td>
                    <td>Start Date</td>
                    <td>End Date</td>
                </tr>
<%
        try{
        Date d=new Date();
        
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
        
        String date=sdf.format(d);
        
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");

        Statement st = con.createStatement();
        //out.println("<h2>"+date+"</h2>");
//        ResultSet rs= st.executeQuery("select count(eventid) from events where end_date >='"+date+"' ");
//        int n = 0 ;
//        if(rs.next())
        
//        n = Integer.parseInt(rs.getString(1));
        
        ResultSet rs1 = st.executeQuery("select * from events where end_date>='"+date+"'");
        if(rs1.next())
        {
        do
        {
            out.println("<tr>");
//              for(int i=1;i<7;i++)
//              {
               %>   
               <td><button type="submit" formaction="LiveScore.jsp?eid=<%=rs1.getString(1)%>"  > <%=rs1.getString(1)%> </button></td> 
               <td><%=rs1.getString(2)%></td>
               <td><%=rs1.getString(3)%></td>
               <td><%=rs1.getString(4)%></td>
               <td><%=rs1.getString(5)%></td>
               <td><%=rs1.getString(6)%></td>
               
               
               <%
//              }
             out.println("</tr>");
        }while(rs1.next());
        
//        while(rs.next())
//        {
            //x++;
            
            %>
                </table></center>
            <%
//            out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getString(4)+"  "+rs.getString(5)+"  "+rs.getString(6)+"  "+"<hr>");
            
//        }
}
        else
    {
        out.println("<h2>No Live events are going on</h2>");
    }

                    
        con.close();
    
}
catch(Exception e)
{
    out.println(e);
//    System.out.println("helooooooooooooooooooo world");
    e.printStackTrace();
}




%>        
            </form>
      </div>
                 </section>
               
       	<footer style="margin-top:100px;">
		<!--<footer >-->
			<p>Loknath Singh Web Design, Copyright &copy; 2020</p>
		</footer>
	  


    </body>
</html>
