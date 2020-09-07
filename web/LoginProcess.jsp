<%@page import="java.sql.*"%>

<%
String userContact=request.getParameter("userContact");
String userPassword=request.getParameter("userPassword");

try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");
    
    Statement st= con.createStatement();
    
    ResultSet rs= st.executeQuery("select uid,name from users where contact_no='"+userContact+"' and password='"+userPassword+"'");
    
    if(rs.next())
    {
        session.setAttribute("uid",rs.getString(1));
        session.setAttribute("userName",rs.getString(2));
        response.sendRedirect("UserHome.jsp");
                
                
//        session.setAttribute("email",loginBean.getEmail());
//	response.sendRedirect("home.jsp");
//        
//        Cookie ck1=new Cookie("userName",rs.getString(2));
//        Cookie ck2=new Cookie("uid",rs.getString(1));
//        ck1.setMaxAge(60*60);
//        ck2.setMaxAge(60*60);
//        response.addCookie(ck1);
//        response.addCookie(ck2);
        
//        response.sendRedirect("UserHome.jsp");
    }
    else
    {   
        
        response.sendRedirect("Login.jsp?status=false");
    }
//        out.println("wrong id password");
//                response.sendRedirect("Login.jsp?s=INVALID  LOGIN  DATA FOR "+ s1+" ");

    
    con.close();
        response.sendRedirect("Login.jsp?status=error");

}
catch(Exception e)
{
    out.println(e);
    e.printStackTrace();
}


%>
