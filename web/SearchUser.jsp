<%-- 
    Document   : SearchUser
    Created on : 15 Aug, 2020, 10:25:28 AM
    Author     : super
--%>
<%-- 
    Document   : AllEvents
    Created on : 24 May, 2020, 6:21:58 AM
    Author     : super
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width =device-width">
        <!-- below three lines are for seo purpose -->
        <meta name="author" content="Loknath Singh">
        <title>Search Users | List</title>
        <link rel="stylesheet" href="./css/style1.css">
        <script type="text/javascript" src="Validation.js"></script>
        
        
        
        
        <script src='jsscript/jquery.js'></script>
    </head>
    <body class="content">
        <!-- for the logo and links in header  -->
        <header>
            <div class="container">
                <!-- below div is for the logo of the website -->
                <div id="branding">
                    <h1>SVVV Live Score</h1>
                </div>
                <!-- below the navigation links -->
                <nav>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="Login.jsp">Login</a></li>
                        <li><a href="SignUp.jsp">SignUp</a></li>
                        <li><a href="About.jsp">About</a></li>
                    </ul>
                </nav>

            </div>
        </header>

                    <center>

        <section id="showcase">
            <div class="container">
                <h2>List of Users</h2>
            </div>
        </section>

        <section id="boxes4">
            <!--<section id="boxes2">-->
            <div class="container">
                 <div id="search">
                <form name="form2s" action="" method="get">
                    <button type="submit" formaction="index.html">back</button><br>
                       

                            <%
                                String message = request.getParameter("message");

                                if (message != null) {
                            %>                              
                            <h2> <span id="message" ><%=message%></span></h2>
                                <%
                                    }
                                %>

                            <label style="font-size:20px;" for="cars">Search for:</label>
                            <select name="keys" id="keys" style="height: 30px; width: 100px; font-size: 17px; border-width: 3px;border-radius: 8px;">
                                <option value="uid">User ID</option>
                                <option value="name">Name</option>
                                <option value="email">Email</option>
                                <option value="contact_no">Contact no</option>
                                <option value="enrollment">Enrollment</option>
                                <option value="college">College</option>
                            </select>
                            <input type="text"  id="search_key" name="search_key" placeholder="Start typing" oninput="search()"  >
<!--                            <button type="button" onclick="search()" >Search User</button>-->
                </form>
                        </div>  

            </div>
        </section>
        <%--<%@include file="UserSearchTable.jsp"%>--%>
 <span id="userSearchTable">

     
     
     
             </span>
</center>

    <!--<footer style="margin-top:150px;">-->
    <footer style="margin-top: 250px;">
        <p>Loknath Singh Web Design, Copyright &copy; 2020</p>
    </footer>



</body>
</html>
