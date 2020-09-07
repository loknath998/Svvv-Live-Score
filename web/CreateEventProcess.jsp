<%-- 
    Document   : CreateEventProcess
    Created on : 22 May, 2020, 10:49:26 PM
    Author     : super
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//    try{
    String uid = (String) session.getAttribute("uid");
    if (uid != null) {

        String userName = (String) session.getAttribute("user");

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%                Integer n = (Integer) session.getAttribute("no_of_participants");

                String p[] = new String[n];

                for (int i = 0; i < n; i++) {
                    String s2 = "p" + (i + 1);
                    p[i] = request.getParameter(s2);

                }

                String name_of_event = (String) session.getAttribute("name_of_event");
                String hostid = (String) session.getAttribute("hostid");
                String start_date = (String) session.getAttribute("start_date");
                String end_date = (String) session.getAttribute("end_date");

                try {
                    Class.forName("com.mysql.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores", "root", "root");

                    Statement st = con.createStatement();
                    
                    boolean flag1= false;
                    for(int i = 0; i< p.length ; i++)
                    {
                         ResultSet rst = st.executeQuery("select uid from users where uid='"+p[i]+"'");
                         if(!rst.next())
                         {
                             flag1 = true;
                             response.sendRedirect("CreateEventAddParticipant.jsp?status=Inavlid userid:"+p[i]);
                             break;
                         }
//                         else
//                         {
//                         }
                    }
                    
                    if (flag1) {
                        response.sendRedirect("CreateEvent.jsp?status=Some problem occured try again");

                    } else {

                        ResultSet rs = st.executeQuery("select max(eventid) from events");
                        String eid = "";
                        if (rs.next()) {
                            if (rs.getString(1) != null) {
                                eid = "evn" + (Integer.parseInt(rs.getString(1).substring(3, 9)) + 1);
                            } else {
                                eid = "evn202001";
                            }
                        } else {
                            eid = "evn202001";
                        }

                        int insert = st.executeUpdate("insert into events values('" + eid + "','" + name_of_event + "'," + n + ",'" + hostid + "','" + start_date + "','" + end_date + "' )");

                        if (insert == 0) {
                            response.sendRedirect("CreateEvent.jsp?status=Event not Created, please create another Event");
                        }
                        boolean flag = false;
                        int ar[] = new int[n];

                        for (int i = 0; i < n; i++) {
                            ar[i] = st.executeUpdate("insert into participants values('" + eid + "','" + p[i] + "')");
                            if (uid.equals(p[i])) {
                                flag = true;
                            }
                        }

                        for (int i = 0; i < n; i++) {
                            if (ar[i] == 0) {
                                out.println("data not inserted for " + (i + 1) + " participant<br>");
                                response.sendRedirect("CreateEventAddParticipant.jsp?status=Participant Not Added please try again  or create another Event");

                            }
                        }

                        int in_score[] = new int[4];

                        String want_keys = request.getParameter("want_keys");
                        int rounds = Integer.parseInt(request.getParameter("rounds"));
                        if ("on".equals(want_keys)) {
                            for (int i = 0; i < 4; i++) {
                                String xm = request.getParameter("tf" + (i + 1));
                                if (xm != null) {
                                    in_score[i] = Integer.parseInt(xm);
                                } else {
                                    in_score[i] = 0;
                                }

                                out.println(in_score[i] + "<hr>");
                            }

//        int  n= (Integer)session.getAttribute("no_of_participants");
                            out.println(rounds + "<hr>");
                            out.println(n + "<hr>");

                            int ck = 1;
                            for (int i = 0; i < rounds * n * 4; i++) {
                                if (i % (n * rounds) == 0 && i != 0) {
                                    ck++;
                                }

                                int y1 = (int) Math.round(Math.random() * 25 + 1);
                                int y2 = (int) Math.round(Math.random() * 25 + 1);
                                int y3 = (int) Math.round(Math.random() * 25 + 1);
                                int y4 = (int) Math.round(Math.random() * 25 + 1);
                                char x1 = (char) (y1 + 64);
                                char x2 = (char) (y2 + 64);
                                char x3 = (char) (y3 + 64);
                                char x4 = (char) (y4 + 64);
//           if(x=='A' || x=='Z')
                                int num = (int) Math.round(Math.random() * 10000 + 1);
                                String code = "" + x1 + x2 + x3 + x4 + num;
//           if(ck==1)
                                st.executeUpdate("insert into codes (eventid, code, score) values('" + eid + "','" + code + "'," + in_score[ck - 1] + "   ) ");
//           else if(ck==2)
//               st.executeUpdate("insert into codes (eventid, code, score) values('"+ eid+"','"+ num +"',"+in_score[ck-1]+"   ) ");
//           else if(ck==3)
//               st.executeUpdate("insert into codes (eventid, code, score) values('"+ eid+"','"+ num +"',"+in_score[ck-1]+"   ) ");
//           else if(ck==4)
//               st.executeUpdate("insert into codes (eventid, code, score) values('"+ eid+"','"+ num +"',"+in_score[ck-1]+"   ) ");

                            }

                        }

                        con.close();
//    session.setAttribute("eid", eid);
                        if (uid.equals(hostid)) {
                            response.sendRedirect("HostScoreBoard1.jsp?eid=" + eid);
                        }
                        if (flag) {
                            response.sendRedirect("ScoreBoard1.jsp?eid=" + eid);
                        }

                        response.sendRedirect("LiveScore.jsp?eid=" + eid);
                    }
                } catch (Exception e) {
                    out.println(e + "this is exception======================");
                    e.printStackTrace();
                }

//        String event_name=request.getParameter("event_name");
//        String hostid= request.getParameter("hostid");
//        String start_date=request.getParameter("start_date");
//        String end_date=request.getParameter("end_date");
//out.println("<h3>"+name_of_event+"</h3>");
//out.println("<h3>"+hostid+"</h3>");
//out.println("<h3>"+start_date+"</h3>");
//out.println("<h3>"+end_date+"</h3>");
//out.println("<h3>"+p[1]+"</h3>");
//out.println("<h3>"+p[2]+"</h3>");
//          response.sendRedirect("ScoreBoard1.jsp?eid="+eid);
            } else {
                response.sendRedirect("Login.jsp?status=Please login first");
            }
        %>

        <!--<h1>Hello World!</h1>-->
    </body>
</html>
