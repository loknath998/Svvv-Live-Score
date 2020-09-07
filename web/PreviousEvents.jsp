<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date"%>
<%
    String uid = (String) session.getAttribute("uid");
    if (uid == null) {
        response.sendRedirect("Login.jsp?status=Please login first");
    } else {
        String userName =(String)session.getAttribute("userName");
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width = device-width">
        <meta name="author" content="Loknath Singh">
        <title>Previous Events</title>
        <link rel="stylesheet" href="./css/style1.css">
    </head>
    <body class = "content">
    <header>
        <div class="container">
            <div id="branding">
                <h1>SVVV Live Score</h1>
            </div>
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
            <h2 align="right"><%=userName%> &nbsp;<%=uid%>&nbsp;&nbsp; </h2>
        </div>
    </section>
    <section id="boxes2">
        <div class ="container">
            <form action="" method="post">
                <button id="back_button" type="submit" formaction="UserHome.jsp">back</button>
                <!--<br>-->
                <center>
                <%
                    try{
                        Date d = new Date();
                        
                        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
                        String date = sdf.format(d);
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select count(eventid) from participants where uid='"+uid+"'");
                        int count = 0;
                        if(rs.next())
                        {
                            count = rs.getInt(1);
//                            out.println(count);
                            String events[] = new String[count];
                            ResultSet rs1 = st.executeQuery("select eventid from participants where uid='"+uid+"' ") ;
                            int i=0;
                            while(rs1.next())
                            {
                                events[i++] = rs1.getString(1);
                            }
                            boolean flag = true;
                            for(int j=0;j<i; j++)
                            {
                                ResultSet rs2 = st.executeQuery("select event_name from events where eventid = '"+events[j] +"' and end_date < '"+date+"'");
                                String event_name = "";
                                if(rs2.next())
                                {
                                    flag = false;
                                    event_name = rs2.getString(1);
                                
                                %>
                                <button id="event_button" type="submit" formaction="ScoreBoard1.jsp?eid=<%=""+events[j]%>&f=0" > <%=event_name+" "+events[j]%></button>
                                <%
//                                if(j%2==1)
//                                    out.println("<br>");
                
                                }
                            }
                            if(flag)
{
%>
    <div class="image_content">
                            <div class="top_of_image"><h3>No events for you here</h3></div>
                            <img src="./img/kick_off.gif">
                            </div>

<%
}
                        }
                        else
    {
%>
    <div class="image_content">
                            <div class="top_of_image"><h3>No events for you</h3></div>
                            <img src="./img/kick_off.gif">
                            </div>

<%
    }
                        con.close();
                        
                    }
                    catch(Exception e)
                    {
                        out.println(e);
//                        response.sendRedirect("UserHome.jsp");
                    }
                
                %>
                
                </center>
            </form>
        </div>
    
    </section>
                <div id="bottom">
    <footer >
        <p>Loknath Singh Web Design, Copyright &copy; 2020</p>
    </footer>
                    </div>
    </body>

</html>


<%
    }

%>

