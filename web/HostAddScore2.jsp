<%-- 
    Document   : HostAddScore2
    Created on : 27 May, 2020, 12:10:29 AM
    Author     : super
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%  
         // Get an array of Cookies associated with the this domain
       String uid=(String)session.getAttribute("uid");
        if(uid ==null)
        {
        response.sendRedirect("Login.jsp?status=Please login first");
        }
        else{
            String userName=(String)session.getAttribute("userName");
            String eid1=(String)session.getAttribute("eid1");
            try {
                out.println(eid1+"<hr>");
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");
                    Statement st = con.createStatement();
                   
                    
                    out.println(uid+"<hr>");
                   
                    ResultSet rs = st.executeQuery("select * from events where eventid='"+eid1+"' and hostid='"+uid+"'; ");
                    if(!rs.next())
                    {
                        con.close();
                        response.sendRedirect("you are  not authorised to change this scoreboard");
                        
                    }                 
                    
            
            Integer n=(Integer)session.getAttribute("n1");
            int new_scores[]=new int[n];
            String players[]=new String[n];
            String names[]=new String[n];
            ResultSet rs2= st.executeQuery("select max(round) from scores where eventid='"+eid1 +"' ");
            int new_round=1;
            if(rs2.next())
            {
                if(rs2.getString(1)!=null)
                {

                    out.println("<hr>"+rs2.getString(1)+"<hr>");
                    new_round=Integer.parseInt(rs2.getString(1))+1;
                }
//                else
//                {
//                    
//                    out.println("<hr>no round till now<hr>");
//                }
            }
//            else
//                out.println("<hr> no  max round found<hr>");



            
            int x=0;
            for(int i=1;i<=n;i++)
            {
                new_scores[i-1]=Integer.parseInt(request.getParameter("ns"+(i)));
                players[i-1]=(String)session.getAttribute("p"+(i));
                names[i-1]=(String)session.getAttribute("name"+(i));
                out.println("<h3>"+new_scores[i-1]+" "+ players[i-1]+" "+names[i-1]+"</h3>");
                String q1="insert into scores values( '"+eid1+"', '"+players[i-1]+"',"+ new_round+","+new_scores[i-1] +"  )";
                x=st.executeUpdate(q1);
                
            }
            out.println("<hr>data inserted");
            response.sendRedirect("HostScoreBoard1.jsp");
    
con.close();
                }
            catch(Exception e)
            {
                out.println(e);
            }



}
%>
