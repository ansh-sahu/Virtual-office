
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> 
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="819652053316-jtublcaa2ljj25s0vqot685fdf982qg4.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <title>Sign In</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<!-- <a href="javascript:void(0)" onclick="logout()">Logout</a>
<div class="g-signin2" data-onsuccess="onSignIn" data-prompt="select_account" ></div> -->

    

    <div class="main">
<!-- Sign in form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign In</h2>
                        <form method="POST"action="LoginServlet" class="register-form" id="register-form" >
                            
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" required name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password"  required name="pass" id="pass" placeholder="Password"/>
                            </div>
						 <a href="forget_pass.jsp" class="signup-image-link">Forgot Password ?</a>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Login"/>
                                <br><br>
                                </div>
							<!-- 	<div class="g-signin2" data-onsuccess="onSignIn" data-prompt="select_account"></div>
                            </div> -->
                          
                            
                       
                        </form>
                    </div>
                   
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                        <a href="Signup.jsp" class="signup-image-link">Create an account</a>
                        </div>
                    
                </div>
            </div>
        </section>
    </div>
     <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script>
    function logout()
    {
    	var lo=gapi.auth2.getAuthInstance();
    	lo.signOut();
    }
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());
	
         var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);

  var redirectUrl = 'connectiongoogle';

        //using jquery to post data dynamically
        var form = $('<form action="' + redirectUrl + '" method="post">' +
                         '<input type="text" name="name" value="' +
                         profile.getName()+ '" />' +
                         
                         '<input type="text" name="email" value="' +profile.getEmail()+ '" />'
                         +

                         
                         '<input type="text" name="userid" value="' +profile.getId()+ '" />'
                         +
                         
                         '<input type="text" name="imageurl" value="' +profile.getImageUrl()+ '" />'
                         +
                         '<input type="hidden" name="flag" value="0" />'
                         +
                                                               '</form>');
        $('body').append(form);
        form.submit();
     
      }
    </script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>