<%-- 
    Document   : EditRoundScoreProcess
    Created on : 24 Aug, 2020, 10:51:43 PM
    Author     : super
--%>
<%@page import="java.sql.*" %>

<%
    String uid = (String) session.getAttribute("uid");
    if (uid == null) {
        response.sendRedirect("Login.jsp?status=Please login first");
    } 
    else
    {
        String eid1 = (String) session.getAttribute("eid1");
        out.println("<p>"+eid1+"</p>");
        Integer r = (Integer) session.getAttribute("round");
        out.println("<p>"+r+"</p>");
        Integer n = (Integer) session.getAttribute("n1");
        String players[] = new String[n];
        int scores[] = new int[n];
        for (int i = 0; i < n; i++) {
            players[i] = (String) session.getAttribute("p" + (i+1));
            scores[i] = Integer.parseInt(request.getParameter("ns" + (i + 1)));
        out.println("<p>"+players[i]+" "+scores[i] +"</p>");
        }

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");
            Statement st = con.createStatement();
            PreparedStatement pSelect = con.prepareStatement("select * from scores where eventid =? and uid =? and round =? ");
            PreparedStatement pInsert = con.prepareStatement("insert into scores values(?,?,?,?)");
            PreparedStatement pUpdate = con.prepareStatement("update scores set score =? where eventid =? and uid =? and round =? ");
            
            for(int i = 0; i<n; i++)
            {
                pSelect.setString(1,eid1);
                pSelect.setString(2,players[i]);
                pSelect.setInt(3,r);
                ResultSet rs = pSelect.executeQuery(); 
                if(rs.next())
                {
                    pUpdate.setInt(1,scores[i]);
                    pUpdate.setString(2,eid1);
                    pUpdate.setString(3,players[i]);
                    pUpdate.setInt(4,r);
                    int res = pUpdate.executeUpdate();
                    if(res==0)
                    {
                        out.println("<p>failed"+pUpdate+"</p>");
                    }
                    else
                        out.println("<p>success"+pUpdate+"</p>");

                    
                }
                else
                {
                    pInsert.setString(1,eid1);
                    pInsert.setString(2,players[i]);
                    pInsert.setInt(3,r);
                    pInsert.setInt(4,scores[i]);
                
                    int res = pInsert.executeUpdate();
                    if(res == 0)
                    {
                        out.println("<p>failed"+pInsert+"</p>");
                    }
                    else
                    {
                        out.println("<p>success"+pInsert+"</p>");

                    }
                }
            
            }
        response.sendRedirect("HostScoreBoard1.jsp");
        con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
        
           
        
        
    }

%>