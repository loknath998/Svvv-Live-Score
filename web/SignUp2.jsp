<%-- 
    Document   : SignUp
    Created on : 19 May, 2020, 11:03:49 PM
    Author     : super
--%>



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
			<h1>Sign Up </h1>
                        <h3 style="margin-top:60px;margin-bottom: 0; ">OTP has been sent to your mobile Enter the OTP below to continue</h3>
			</div>
		</section>
		
		<section id="signup"> 
            <div class="container">
                <%
                String status = request.getParameter("status");
                if(status != null)
                {
                    out.println("<h3>"+status+"</h3>");
                }
                
                %>
                    <!--<h1>Subscribe to our NewsLetter</h1>--> 
                    <form action="SignUpProcess2.jsp"  ><center>
                       <table cellspacing="10px" cellpadding="10px">
                           <tr>
                           <td  align="center">Enter One Time Password</td>
                           </tr>
                           <tr>
                           <td  align="center"><input type="text" name="userOTP" placeholder="Enter OTP" required></td>
                           </tr>
                           <tr>
                           <td  align="center" >
                           <button type="submit" class="button_1">Verify</button> 
                           </td>
                           </tr>
                       </table></center>
                    </form> 
            </div> 
		 </section> 
	<%	
        //int otp= (Integer) session.getAttribute("otp");
//        out.println("<h1>##########"+otp+"</h1>");
%>
		<footer style="margin-top: 100px;">
			<p>Loknath Singh Web Design, Copyright &copy; 2020</p>
		</footer>
		
	</body>


</html>
