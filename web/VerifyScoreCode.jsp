<%-- 
    Document   : VerifyScoreCode
    Created on : 1 Jun, 2020, 3:48:45 PM
    Author     : super
--%>

<%@page import="java.sql.*" %>

<%
    String uid=(String)session.getAttribute("uid");

    if(uid==null)
        response.sendRedirect("Login.jsp?status=Please Login First");

    String userName=(String)session.getAttribute("userName");
    String eid=(String)session.getAttribute("eid2");
    String score_code=request.getParameter("score_code").trim();

    try
    {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");

        Statement st = con.createStatement();
 
        ResultSet rs = st.executeQuery("select  score , status from codes where  eventid='"+ eid +"' and code='"+ score_code+"' ");

        if(rs.next())
        {
            if("invalid".equals(rs.getString(2)))
            {
                response.sendRedirect("AddMyScoreProcess1.jsp?status1=given code is already used");
            }
            else
            {
            int score=Integer.parseInt(rs.getString(1));
            ResultSet rs1 = st.executeQuery("select max(round) from scores where eventid='"+eid+"' and uid='"+uid+"' ");
                    if(rs1.next())
                    {
                        int round=1;
        //                     out.println("hello<hr>");
                       String s;
                             if(rs1.getString(1)!=null);
                                s=rs1.getString(1);
                                if(s!=null)
                            round=Integer.parseInt(s) +1;

                    int n = st.executeUpdate("insert into scores values( '"+eid+"','"+uid+"',"+round+", "+score+" )");        
                    if(n!=0)
                    {
                        st.executeUpdate("update codes set status='invalid' where eventid='"+eid+"' and code='"+ score_code +"'");
                        response.sendRedirect("ScoreBoard1.jsp");
                    }

                         response.sendRedirect("AddMyScoreProcess1.jsp?status1=Unable to add score please login again");


                    }
                    else
                    {
                         response.sendRedirect("AddMyScoreProcess1.jsp?status1=Unable to add score please login again");

                    }
            
            }
            
        }
        else{
        
            response.sendRedirect("AddMyScoreProcess1.jsp?status1=Invalid code");
        }



        con.close();


    }
    catch(Exception e)
    {
     out.println(e);   
    }
    

%>

