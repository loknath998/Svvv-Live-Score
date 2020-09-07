<%-- 
    Document   : process
    Created on : 20 May, 2020, 1:37:39 PM
    Author     : super
--%>

<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.net.HttpURLConnection;"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("userName");
String email=request.getParameter("userEmail");
String userContact=request.getParameter("userContact");
String password=request.getParameter("userPassword");
String enroll=request.getParameter("userEnrollment");
String college=request.getParameter("userCollege");

String checkStudent=request.getParameter("checkStudent");


session.setAttribute("userName1",name);
session.setAttribute("userEmail",email);
session.setAttribute("userContact",userContact);
session.setAttribute("checkStudent",checkStudent);
session.setAttribute("userPassword",password);
session.setAttribute("userEnrollment",enroll);
session.setAttribute("userCollege",college);
int otp=999999;


session.setAttribute("otp",otp);
response.sendRedirect("SignUp2.jsp");
//String sendSms1;
//            sendSms1 = sendSms();
//            System.out.println(sendSms1);
            
%>
<%!   
//public String sendSms() {
//		try {
//                    int otp;
//                    Random rand=new Random();
//                    otp=rand.nextInt(999999);
//                    String name="loknath";
//                    String number="9981782556";
//			// Construct data
//			String apiKey = "apikey=" + "T8rYTIA1XG0-lq409PZlTEfxgQKS9QupoSOfUw57BQ";
//			String message = "&message=" + "hey "+name+" your otp is "+otp;
//			String sender = "&sender=" + "TXTLCL";
//			String numbers = "&numbers=" + number;
//			
//			// Send data
//			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
//			String data = apiKey + numbers + message + sender;
//			conn.setDoOutput(true);
//			conn.setRequestMethod("POST");
//			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
//			conn.getOutputStream().write(data.getBytes("UTF-8"));
//			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			final StringBuffer stringBuffer = new StringBuffer();
//			String line;
//			while ((line = rd.readLine()) != null) {
//				stringBuffer.append(line);
//			}
//			rd.close();
//			JOptionPane.showMessageDialog(null,"OTP is sent succesfully");
//			response.sendRedirect("otp.jsp");
//                        return stringBuffer.toString();
//		} catch (Exception e) {
//			System.out.println("Error SMS "+e);
//			JOptionPane.showMessageDialog(null,"Error SMS "+e);
//			return "Error "+e;
//		}
//	}


  
%>  
</body>
</html>