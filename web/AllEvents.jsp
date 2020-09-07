<%-- 
    Document   : AllEvents
    Created on : 24 May, 2020, 6:21:58 AM
    Author     : super
--%>


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
        <title>All Events | List</title>
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
                <h2>List of All the events</h2>
            </div>
        </section>

        <section id="boxes4">
            <!--<section id="boxes2">-->
            <div class="container">
                <form action="" method="post">
                    <button id="back_button" type="submit" formaction="index.html">back</button><br>
                    <center>
                        <div id="search">

                            <%
                                String message = request.getParameter("message");

                                if (message != null) {
                            %>                              
                            <h2> <span id="message" ><%=message%></span></h2>
                                <%
                                    }
                                %>

                            <input type="radio" id="c1" name="choice" value="eid"><label class="rb" for="c1">Event Id</label>
                            <input type="radio" id="c2" name="choice" value="ename"><label class="rb" for="c2">Event Name</label><br>
                            <input type="text" name="eventid" placeholder="id of event">
                            <button type="submit" formaction="" >Search</button>
                            <%
                                String choice = request.getParameter("choice");
                                String query = "select * from events where ";
                                String key = request.getParameter("eventid");
                                if (key != null) {
                                    if ("ename".equals(choice)) {
                                        query = query + " event_name =";
                                    } else {
                                        query = query + " eventid =";
                                    }
                                    // out.println("<h1>"+query+"</h1>");
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");
                                        Statement st = con.createStatement();

                                        ResultSet rs = st.executeQuery(query + "'" + key + "'");
                                        if (rs.next()) {
                            %>

                            <table id="live_event_details" cellpadding="5px" cellspacing="5px" >
                                <tr id="table_head">
                                    <td>Event Id</td>
                                    <td>Event Name</td>
                                    <td>Participants</td>
                                    <td>Host Id</td>
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                </tr>
                                <tr >
                                    <td><button type="submit" formaction="LiveScore1.jsp?eid=<%=rs.getString(1)%>" ><%=rs.getString(1)%></button></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(5)%></td>
                                    <td><%=rs.getString(6)%></td>
                                </tr>

                                <%
                                            } else {
                                                response.sendRedirect("AllEvents.jsp?message=Record not found, try again");
                                            }

                                            con.close();
                                        } catch (Exception e) {
                                            out.println(e);
                                        }

                                    }


                                %>

                            </table>           
                        </div>    
                        <table id="live_event_details" cellpadding="10px" cellspacing="10px" >
                            <tr id="table_head">
                                <td>Event Id</td>
                                <td>Event Name</td>
                                <td>Participants</td>
                                <td>Host Id</td>
                                <td>Start Date</td>
                                <td>End Date</td>
                            </tr>
                            <%    try {
                            //        Date d=new Date();
                            //        
                            //        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
                            //        
                            //        String date=sdf.format(d);
                            //        
                                    Class.forName("com.mysql.jdbc.Driver");

                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");

                                    Statement st = con.createStatement();
                                    //out.println("<h2>"+date+"</h2>");
                            //        ResultSet rs= st.executeQuery("select count(eventid) from events where end_date >='"+date+"' ");

                            //        if(rs.next())
                            //        n = Integer.parseInt(rs.getString(1));
                            //        
                                    ResultSet rs1 = st.executeQuery("select * from events");
                                    if (rs1.next()) {
                                        do {
                                            out.println("<tr>");
                            //              for(int i=1;i<7;i++)
                            //              {
%>   
                            <td><button type="submit" formaction="LiveScore1.jsp?eid=<%=rs1.getString(1)%>"  > <%=rs1.getString(1)%> </button></td> 
                            <td><%=rs1.getString(2)%></td>
                            <td><%=rs1.getString(3)%></td>
                            <td><%=rs1.getString(4)%></td>
                            <td><%=rs1.getString(5)%></td>
                            <td><%=rs1.getString(6)%></td>


                            <%
             //              }
                                        out.println("</tr>");
                                    } while (rs1.next());
                                } else {
                                    out.println("<h2>there are none previous events</h2>");
                                }

             //        while(rs.next())
             //        {
                                //x++;

                            %>
                        </table></center>
                        <%//            out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getString(4)+"  "+rs.getString(5)+"  "+rs.getString(6)+"  "+"<hr>");
            //        }
            //        if(n==0)
            //    {
            //        out.println("<h2>No Live events are going on</h2>");
            //    }
                                con.close();

                            } catch (Exception e) {
                                out.println(e);
            //    System.out.println("helooooooooooooooooooo world");
                                e.printStackTrace();
                            }


                        %>        
                </form>
            </div>
        </section>

       	<!--<footer style="margin-top:150px;">-->
        <footer >
            <p>Loknath Singh Web Design, Copyright &copy; 2020</p>
        </footer>



    </body>
</html>
