<%-- 
    Document   : SignUp
    Created on : 19 May, 2020, 11:03:49 PM
    Author     : super
--%>

<!DOCTYPE html>
<html>
    <head>
        <script type='text/javascript' src='Validation.js'>
        </script>

        <meta charset="utf-8">
        <meta name="viewport" content="width =device-width">

        <!-- below three lines are for seo purpose -->
        <meta name="description" content="Affordable and professional web design">
        <meta name="keywords" content="web design, affordable web design, professional website">
        <meta name="author" content="Loknath Singh">
        <title>SVVV Scores | Home</title>
        <link rel="stylesheet" href="./css/style1.css">

        <script type="text/javascript">
            function ShowHideDiv(checkStudent)
            {
                var yesSVVV = document.getElementById("yesSVVV");
                yesSVVV.style.display = checkStudent.checked ? "block" : "none";

                var noSVVV = document.getElementById("noSVVV");
                noSVVV.style.display = checkStudent.checked ? "none" : "block";
            }
        </script>

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
                <%
                    String status = request.getParameter("status");
                    if (status != null) {
                        out.println("<h3>" + status + "</h3>");
                    }
                %>
            </div>
        </section>

        <section id="signup"> 
            <div class="container"> 
                <!--<h1>Subscribe to our NewsLetter</h1>--> 
                <form action="SignUpProcess1OTP.jsp"  ><center>
                        <table cellspacing="10px" cellpadding="10px">
                            <tr>
                                <td>Enter Name</td>
                                <td><input type="text" name="userName" placeholder="Enter Name" required>
                                    <br><span id='e1'></span>
                                </td>
                            </tr>
                            <tr>
                                <td>Enter Email</td>
                                <td><input type="email" name="userEmail" required placeholder="Enter email">
                                    <br><span id='e2'></span>

                                </td>
                            </tr>
                            <tr>
                                <td>Enter Contact No.</td>
                                <td><input type="text" name="userContact" placeholder="Enter contact No.">
                                    <br><span id='e3'></span>
                                </td>
                            </tr>

                            <tr  >
                                <td colspan="2"><center>
                                <!--<input type="checkbox" id="clg" name="college" value="no">-->
                                <input type="checkbox" id="checkStudent" name="checkStudent" value="on" onclick="ShowHideDiv(this)">
                                <label for="checkStudent">SVVV student</label>
                            </center>
                            </td>
                            </tr>
                            <!--SDFGYJIOOLKHGHJNKL-->


                            <tr>
                                <!--<td colspan="2" align="center">-->
                                <td colspan="2" >
                                    <div id="yesSVVV" style="display: none" >

                                        Enter Enrollment&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" name="userEnrollment"  placeholder="Enter Enrollment">
                                    </div>
                                    <br><span id='e4'></span>                             
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" >
                                    <div id="noSVVV" style="display:block">
                                        Enter College Name&nbsp;
                                        <input type="text" name="userCollege"  placeholder="Enter College Name">
                                    </div>
                                    <br><span id='e4'></span>

                                </td>
                            </tr>




                            <!--ASDFGHJKLKJHGFD-->
                            <tr>
                                <td>Enter Password</td>
                                <td><input type="password" name="userPassword"  placeholder="Enter Password">
                                    <br><span id='e5'></span>
                                </td>
                            </tr>
                            <!--                                        <tr>
                                                                    <td>Enter College Name</td>
                                                                    <td><input type="text" placeholder="Enter Name"></td>
                                                                    </tr>-->

                            <tr>
                                <td colspan="2" align="center">
                                    <button type="submit" class="button_1">Sign Up</button> 
                                </td>
                        </table></center>
                </form> 
            </div> 
        </section> 

        <!--		<section id="boxes">
                                <div class="container">
                                        
                                        <div class="box">
                                        <a href="./img/abc3.jpg">
                                        <img src="./img/live.png">
                                        <h3>Live Events</h3>
                                        </a>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                        </div>
                                        <div class="box">
                                        <a href="./img/abc3.jpg">
                                        <img src="./img/logo_css.png">
                                        <h3>Previous Events</h3>
                                        </a>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                        </div>
                                        <div class="box">
                                        <a href="./img/abc3.jpg">
                                        <img src="./img/logo_brush.png">
                                        <h3>Graphic Design</h3>
                                        </a>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                        </div>
                                        
                                </div>
                        </section>
        -->
        <footer>
            <p>Loknath Singh Web Design, Copyright &copy; 2020</p>
        </footer>

    </body>


</html>
