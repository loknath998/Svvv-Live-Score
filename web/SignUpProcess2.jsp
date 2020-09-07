<%@page import="java.sql.*" %>


<%
int userOTP=Integer.parseInt(request.getParameter("userOTP"));
//int otp= (int) session.getAttribute("otp");
//String s2=request.getParameter("up");
//if(otp==userOTP)
int otp =0;
try{
    otp= (Integer) session.getAttribute("otp");
}
catch(Exception e)
{
    
}

if(otp==userOTP)
{
    out.println(otp+"-----------------Sucesfull verification ----++++++++++++"+userOTP);

String s1=(String)session.getAttribute("userName1");
String s2=(String)session.getAttribute("userEmail");
String s3=(String)session.getAttribute("userContact");
String s4=(String)session.getAttribute("checkStudent");
String s5,s6;
String s7= (String)session.getAttribute("userPassword");
if(s4!=null)
{
    
    s5=(String)session.getAttribute("userEnrollment");
    s6="svvv";
}
else
{
    s5="NaN";
    s6=(String)session.getAttribute("userCollege");
}

    
//String s1=request.getParameter("userName");
//String s2=request.getParameter("userEmail");
//String s3=request.getParameter("userContact");
//String s4=request.getParameter("userEnrollment");
//String s5=request.getParameter("userCollege");
//String s6=request.getParameter("userPassword");
//String s7=request.getParameter("checkStudent");
out.println("<hr>name :"+s1+"<hr>email :");
out.println(s2+"<hr>phone :");
out.println(s3+"<hr>checkBox::");
out.println(s4+"<hr>Enrollment :");
out.println(s5+"<hr>college:");
//out.println(s6+"<hr>password:");
out.println(s7+"<hr>");
try{
    String uid;
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/svvvscores","root","root");
    
    Statement st=con.createStatement();
    
    ResultSet rs= st.executeQuery("select max(uid) from users");
    
    
    if(rs.next())
    {
//        out.println("<h1>helloaadaf</h1><hr>");
//        out.println("<h1>the id will be:"+rs.getString(1)+"------</h1>");
           if(rs.getString(1)==null)
           {
               uid="svvv2020001";
           }
           else
           {
               uid="svvv"+(Integer.parseInt(rs.getString(1).substring(4,11))+1);
           }
    }
    else
    {
         uid="svvv2020001";
        out.println("<h1>my new uid in else part is svvv2020001</h1>");
   }
    
    
    int rs2=st.executeUpdate("insert into users(uid,name,password,contact_no,email,enrollment,college) values('"+uid+"','"+s1+"','"+s7+"','"+s3 +"','"+s2+"','"+s5+"','"+s6+"')");
    if(rs2!=0)
    {
        out.println("<h2>data inserted</h2><hr>");
    }
    else
        out.println("<hr>data  not inserted<hr>");
    con.close();
//    Thread.sleep(2500);
    session.invalidate();
    response.sendRedirect("Login.jsp");
    
    
}
catch(Exception e)
{
    
    out.println(e);
    e.printStackTrace();
        response.sendRedirect("SignUp.jsp?status=try to sign up again");

}
      
}
else
{
    out.println("###### failed to verify ########");
    response.sendRedirect("SignUp2.jsp?status=incorrect otp try again");
}

%>

