<%-- 
    Document   : AddMyScoreProcess2
    Created on : 1 Jun, 2020, 8:15:27 PM
    Author     : super
--%>
<%@page import='java.sql.*' %>
<%
    String uid=(String)session.getAttribute("uid");
    if(uid==null)
    response.sendRedirect("Login.jsp?status=Please Login First");
    
    String eid=(String)session.getAttribute("eid2");
    
    String s1=request.getParameter("user_score");
    int user_score=0;
    if(s1!=null)
        user_score=Integer.parseInt(s1);
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");
        
        Statement st = con.createStatement();
        
        ResultSet rs  = st.executeQuery("select max(round) from scores where eventid='"+eid+"' and uid='"+uid+"'");
    
        int round =1;
out.println("<hr>hello");
        if(rs.next())
        {
            out.println("<hr>hsdfghjkl<hr>");
            if(rs.getString(1)!=null)
            {
                String s2=rs.getString(1);
            
            out.println("<hr>====<hr>");
            if(s2!=null)
            {
                round=Integer.parseInt(s2)+1;
            }
            
            }
        } 
        out.println("<hr>hello2<hr>");
        int x=st.executeUpdate("insert into scores values('"+eid+"','"+uid+"',"+round+","+ user_score+")");
        
    
        
//        {
            response.sendRedirect("ScoreBoard1.jsp");
//        }
        
        
    }
    catch(Exception e)
    {
        out.println(e);
    }
    
                                            
%>              

        

