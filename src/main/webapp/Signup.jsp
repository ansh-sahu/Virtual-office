<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="main">
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                   
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="Login.jsp" class="signup-image-link">I am already member</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign Up</h2>
                        
                        
                        <form method="POST" action="connectiongoogle" class="register-form" id="login-form">
                        
                        
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="your_name" id="your_name" required placeholder="Your Name"/>
                            </div>


                            <div class="form-group">
                                <label for="date"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="date" id="date" required placeholder="Date of Birth" onclick="type='date'" />
                            </div>
                         
                           
                            <div class="form-group">
                            <label for="email"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="email" name="email" id="email" required placeholder="Mail Id"/>
                            </div>

                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="your_pass" id="your_pass" required placeholder="Password"/>
                            </div>

                     <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" required  placeholder="Repeat your password"/>
                            </div>
                            
                             
							<div class="form-group">
  							 <div class="radio">
                            	Administrator:<input type ="radio" name ="typeof" value="admin"> 
								
								Employee:<input type = "radio" name="typeof" value="emp"> 
							</div> 
						</div>
						<!-- <div class="form-group">
                                <input type="checkbox" name="agree-term" required id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div> -->
                                <input type="hidden" name="flag" value="1"/>

                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Register"/>
                            </div>
                        </form>

                        <div class="social-login">
                          <!--  <span class="social-label">Or login with</span> -->
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>