<%-- 
    Document   : Logout
    Created on : 23 May, 2020, 5:09:17 PM
    Author     : super
--%>

<%
session.invalidate();
response.sendRedirect("Login.jsp");

%>