<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> 
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <title>Forget Password</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="main">
<!-- Sign in form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Forgot Password</h2>
<form action="forgetservlet" method="post">
 <div class="form-group">
 <label for="email"><i class="zmdi zmdi-email"></i></label>
<input type="email" name="email" placeholder="Enter Email Id" required>
</div>
<br>
 <div class="form-group">
<input type="date" name="dob" required>
<br>
</div>
 <div class="form-group">
 <label for="pass"><i class="zmdi zmdi-lock"></i></label>
<input type="password" name="pass" placeholder="New Password" required><br>
</div>
 <div class="form-group">
<input type="Submit" class="form-submit">
</div></form>
</div>
</div>
</div>
</section>
</div>

</body>
</html>