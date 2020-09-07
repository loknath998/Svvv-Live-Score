<%-- 
    Document   : SignUp
    Created on : 19 May, 2020, 11:03:49 PM
    Author     : super
--%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width =device-width">
    
    <!-- below three lines are for seo purpose -->
    <meta name="description" content="Affordable and professional web design">
    <meta name="keywords" content="web design, affordable web design, professional website">
    <meta name="author" content="Loknath Singh">
    <title>SVVV Scores | Home</title>
    <link rel="stylesheet" href="./css/style1.css">

        </head>
  
  <body>
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
                    <li><a href="about.jsp">About</a></li>
            </ul>
        </nav>
      
      </div>
    </header>
    <section id="showcase">
      <div class="container">
      <h1>LogIn</h1>
      <%
          String status=request.getParameter("status");
       if(status!=null){
        	if(status.equals("false")){
        		   out.print("<h3>Incorrect login details!</h3>");	           		
        	}
        	else{
        		out.print("<h3>"+status+"</h3>");
        	}
        }
       String uid=(String)session.getAttribute("uid");
       if(uid!=null)
            response.sendRedirect("UserHome.jsp");
      %>
      </div>
    </section>
    
    <section id="signup"> 
       <div class="container"> 
         <!--<h1>Subscribe to our NewsLetter</h1>--> 
         <form action="LoginProcess.jsp"><center>
                                    <table cellspacing="10px" cellpadding="10px">
                                        <tr>
                                        <td>Enter Phone no.</td>
                                        <td><input type="text" name="userContact" placeholder="Enter Contact No."></td>
                                        </tr>
                                        
                                        <tr>
                                        <td>Enter Password</td>
                                        <td><input type="password" name="userPassword" placeholder="Your Password Here"></td>
                                        </tr>
    
                                        <tr>
                                        <td colspan="2" align="center">
                                        <button type="submit" class="button_1">Login</button> 
                                       </td>
                                       </tr>
                                       <tr >
                                           <td colspan="2" style="text-align:right;" >
                                        <a class="small_links" href="https://www.google.com/" >forget Password?</a>
                                         </td></tr>
                                    </table></center>
                                 </form> 
       </div> 
     </section> 
    
    <footer style="margin-top:80px;">
      <p>Loknath Singh Web Design, Copyright &copy; 2020</p>
    </footer>
    
  </body>


</html>

