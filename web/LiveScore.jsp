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
                   String eid=request.getParameter("eid");
%>

<html>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width =device-width">

        <!-- below three lines are for seo purpose -->
        <meta name="author" content="Loknath Singh">
        <title>SVVV Scores | LiveScore</title>
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
            <h2>Live Scores</h2>
            
            </div>
    </section>

<section id="boxes2">
<div class="container">
    <form >
        <button type="submit" formaction="LiveEvents.jsp">back</button><br>

        <%
            int n=4;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root","root");
    
        
        Statement st= con.createStatement();
        
        ResultSet rs= st.executeQuery("select * from events where eventid='"+eid+"'");
        if(rs.next())
        {
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
              n=Integer.parseInt(rs.getString(3));  
        }
        else
{
        out.println("<h3>no data foung</h3>");
}
        %>
<!--        <button type="submit" formaction="AddScoreProcess1.jsp">Add Score</button>-->

        <center>
        <table id="score_board_table" cellspacing="10px" cellpadding="10px">
        <tr >
        <td>Rounds</td>    
        <%
        ResultSet rs1=st.executeQuery("select uid from participants where eventid ='"+eid+"'");
        String participants[]=new String[n];
        String names[]=new String[n];
        int i=0;
        while(rs1.next())
        {
            participants[i++]=rs1.getString(1);
        }
        for(i=0;i<n;i++)
        {
        ResultSet rs2 = st.executeQuery("select name from users where uid='"+ participants[i]+"'");
        if(rs2.next())
            names[i]=rs2.getString(1);
        }
        for(i=0;i<n;i++)
        {
            
        
        %>
        
            <td><%=participants[i]%><br><%=names[i]%></td>
            
            <%
        }
        out.println("</tr>");

int round=0;
        
ResultSet rs3 = st.executeQuery("select max(round) from scores where eventid='"+eid+"'");
        if(rs3.next())
        if(rs3.getString(1)!=null)
        round = Integer.parseInt(rs3.getString(1));
int scores[]=new int[round*n];        
        if(round==0)
        { 
        out.println("<tr>");
            for( i =0;i<n+1;i++)
            {
             %>
                <td>0</td>
             <%
            }
            out.println("</tr>");
        }
        else
        {
           for(i=0;i<round;i++)
            {
        for(int j=0;j<n;j++)
    {

        ResultSet rs4=st.executeQuery("select score from scores where eventid='"+eid+"' and uid='"+participants[j]+"' and round="+(i+1)+" ");
        if(rs4.next())
{
scores[i*n+j]=Integer.parseInt(rs4.getString(1));
}
else{
            scores[i*n+j]=0;

}
//                out.println("<tr><td colspan='5'>hello</td></tr>");
            }
    }




        for( i =0; i<round;i++)
    {
        out.println("<tr><td>"+(i+1)+"</td>");
        for(int j=0;j<n;j++)
{
        out.println("<td>"+scores[i*n+j] +"</td>");
}
        out.println("</tr>");
             


    }


        }

%>
        


            
        </table>
        </center>

    
    <%
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
		
    
		<footer style="margin-top:30px;">
			<p>Loknath Singh Web Design, Copyright &copy; 2020</p>
		</footer>
	</body>

</html>

