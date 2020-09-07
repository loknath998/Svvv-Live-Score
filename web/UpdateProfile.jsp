<%-- 
    Document   : newjsp1
    Created on : 2 Jun, 2020, 6:50:05 PM
    Author     : super
--%>
<%@page import="java.sql.*" %>
<%
    String uid =(String) session.getAttribute("uid");
    if(uid == null)
    {
        response.sendRedirect("Login.jsp?status=please Login First");
    
    }
    String newpass = request.getParameter("newPass");
    String nm = request.getParameter("nm1");
    String cont1 = request.getParameter("cont1");
    if(newpass !=null )
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");
        Statement st = con.createStatement();
        int i = st.executeUpdate("update users set password='"+newpass +"' where uid='"+uid+"' ");
        con.close();
        if(i==0)
        {
              response.sendRedirect("Profile.jsp?status=Password Not Updated");
        }
        else
        {
            response.sendRedirect("Profile.jsp?status=Password Updated Succesfully");
        }
        
    }
    else if(nm != null && cont1 != null)
    {
        String email = request.getParameter("email1");
        String roll = request.getParameter("roll1");
        String clg = request.getParameter("clg1");
  
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");
        Statement st = con.createStatement();
        int i = st.executeUpdate("update users set name='"+ nm +"' ,contact_no='"+ cont1 +"' ,email='"+ email +"' ,enrollment='"+ roll +"', college='"+ clg +"'  where uid='"+ uid +"' ");
        con.close();
        if(i==0)
        {
              response.sendRedirect("Profile.jsp?status=Details Not Updated");
        }
        else
        {
                 session.setAttribute("userName",nm);
            response.sendRedirect("Profile.jsp?status=Details Updated Succesfully");
        }
        
    }
    else
    {
        out.println("<center><h1> why you are here  </h1></center>");
    }
    
    


%>