<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/NewStyle.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
      <script src="https://kit.fontawesome.com/d4d53379c7.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        

    function display_user(){
        var x=document.getElementsByClassName("user-control")[0];
        if (x.style.display === "none"){
            x.style.display = "block";
        }
        else{
            x.style.display = "none";
        }
      } function display_search(){
          var x=document.getElementsByClassName("search-bar")[0];
          if (x.style.display === "none"){
              x.style.display = "block";
          }
          else{
              x.style.display = "none"
          }
        }
     
    	  
      
          
    </script>
    <title>Web|Home</title>
</head>
     
<body>
    <section class="background-img">
        <div class="navbar">
            <div class="nav-content">
                <div class="nav-head font_medium_large">
                    <a href="">Virtual Office</a>
                </div>
                <div class="nav-items">
                    
                        <ul>
                        <li class="nav_home"><a href="index.jsp">Home</a>
                            <div class="home">
                                <ul>
                                    <li><a href="#id-about">About</a></li>
                                 
                                    <li><a href="#id-developers">Developers</a></li>
                                    
                                </ul>  
                            </div>
                        </li>
                        
                         <li class="nav_home"><a href="Login.jsp">Login</a>
                            <div class="home">
                                
                            </div>
                        </li>
                        
                     <%--    <li class="nav_main"><a href="">Main</a>
                            <div class="main">
                                <ul>
                                    <li>
                                   <%
										HttpSession hs2=request.getSession(false);  
 										if(hs2.getAttribute("email")==null){%> <a href="Login.jsp">Questions</a></li>
 										<li><a href="FetchData1.jsp">Review</a></li>
 										<li><a href="Login.jsp">Help</a></li>
 										<% }
 										else{
 										 %> <a href="post.jsp">Questions</a></li>
 										 <li><a href="FetchData1.jsp">Review</a></li>
                                    <li><a href="help.jsp">Help</a></li> 
                                    <% }%>
                                    
                                </ul>
                            </div>
                        </li> --%>
                        
                        <!-- <li class="nav_search"><a href="javascript:void()" onclick="display_search();"><i class="material-icons">search</i></a>
                            <div class="search-bar">
                                <form action="SearchServlet">
                                    <input type="text" name="searchQue" placeholder="Search">
                                </form>
                            </div>
                        </li> -->
                        <%-- <li class="nav_user"><a href="javascript:void()" onclick="display_user();"><i class="material-icons">account_circle</i></a>
                        <div class="user-control">
                            <%
HttpSession hs1=request.getSession(false);  
 if(hs1.getAttribute("email")==null){%>
  <a href="Login.jsp" id="b">Log-in</a>
  <a href="UserSignup.jsp" id="a">Sign-up</a>
  <% }
 else{
  %>
   <a href="profile.jsp" id="b">Profile</a>
   <a href="LogoutServlet" id="a" >Logout</a>
  <% }%>
                            
                            
                        </div>
                    </li> --%>
                    
                    </ul>
                </div>
            </div>
        </div>
        <div class="mySlides fade">
            <div class="numbertext">1 / 3</div>
            <img src="images/1_Brp0qm8rMELM402JCHqikA.jpeg" style="width:100%; height:100%;">
            <!-- <div class="text">Caption Text</div> -->
          </div>
          <div class="mySlides fade">
            <div class="numbertext">2 / 3</div>
            <img src="images/1_Brp0qm8rMELM402JCHqikA.jpeg" style="width:100%; height:100%;">
            <!-- <div class="text">Caption Two</div> -->
          </div>
          
          <div class="mySlides fade">
            <div class="numbertext">3 / 3</div>
            <img src="images/closed-finger-on-keyboard-word-260nw-572013592.jpg" style="width:100%; height:100%;">
            <!-- <div class="text">Caption Three</div> -->
          </div>
          
          </div>
          <br>
          
          <div style="text-align:center" class="dots-class">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
          </div>
          
    </section>
    


    <section class="about background" id="id-about">
        <div class="container about_style">
            <div class="about-head">
                <h1>About Us</h1>
            </div>
            <div class="about-content">
                <p>Internet completely change our lives today when we want to know any information about answer to our questions, what do we do? We just ask to google and hope that google answer is correct one.  But how you get to know that it’s the correct answer. It is a pretty difficult situation. So, at this situation, consider looking at community web. <br><br><br>
Community web is a question/answer site for the people or we say that community web is a duet of search engine and social media network, but its main purpose is to give you the answers and allow you to answer the questions asked by others of subjects in which you are knowledgeable.<br><br><br>
The website serves as a platform for users to ask questions and answer and though membership and active participation to vote questions and answers up and down and edit questions and answers in a fashion. In our websites community web users earns credit points for example a user awarded with some points for receiving an up vote on a question and also for answer of any question. Our website group all the questions which are belong to same field or have same criteria so that you will find all relatable answers at a place. It’s an easy shuffle through all the discussions at a place so we save our time without surfing more on the google/internet.</p> 
            </div>
        </div>
        
    </section>


  <!--   <section class="display-menu background" id="id-services">
        <div class="container">
            <div class="disp-head">
                <h1>Services</h1>
            </div>

            <div class="disp-container">
                <div class="disp-items que">
                    <h1 class="font_medium_large">Post Que?</h1>
                    <p class="font_medium">This will help you to post your Query/Questions and help you to resolve them as soon as possible.</p>
                    <div class="visit-content-que">
                        <a href="post.jsp">Visit</a>
                    </div>
                </div>
                <div class="disp-items review-que">
                    <h1 class="font_medium_large">Review que?</h1>
                    <p class="font_medium">This will help you to review your posted questions as well as other question and you can also answer them as well.</p>
                    <div class="visit-content-review">
                        <a href="FetchData1.jsp">Visit</a>
                    </div>
                </div>
                <div class="disp-items disp-help">
                    <h1 class="font_medium_large">Help?</h1>
                    <p class="font_medium">If you have any issue with the platform or to the content posted on it and similar issues as well, you can post your issues over here.</p>
                    <div class="visit-content-help">
                        <a href="help.jsp">Visit</a>
                    </div>
                </div>
            </div>
            
        </div>
       
        
    </section> -->

    <section class="developers background" id="id-developers">
        <div class="container">
            <div class="dev-head">
                <h1>Our Team</h1>
            </div>
            <div class="dev-container">
                <div class="dev">
                    <img style="widht:200px;height:200px;border-radius:50%;" src="img/vy.jpeg" alt="sorry">
                    <br>
                    <br><h1 style="font-size:22px;">Varun Yadav</h1>
                    <h2 style="font-size:22px;">Back-end Developer</h2><br>
                </div>
                <div class="dev">
                    <img style="widht:200px;height:200px;border-radius:50%;" src="img/aadarsh.jpeg" alt="sorry">
                    <br>
                    <br><h1 style="font-size:22px;">Aadarsh Jaiswal</h1>
                    <h2 style="font-size:22px;">Back-end Developer</h2><br>
                </div>
                <div class="dev">
                   <img style="widht:200px;height:200px;border-radius:50%;" src="img/ansh.jpeg" alt="sorry">
                    <br><br><h1 style="font-size:22px;">Ansh Sahu</h1>
                    <h2 style="font-size:22px;">Front-end Developer</h2><br>
                </div>
                <div class="dev">
                    <img style="widht:200px;height:200px;border-radius:50%;" src="img/pankaj.jpeg" alt="sorry">
                    <br><br><h1 style="font-size:22px;">Pankaj Chouhan</h1>
                    <h2 style="font-size:22px;">Front-end Developer</h2><br>
                </div>
            </div>
            
        </div>
    </section>

    <section class="footer foot-background light-color" id="id-footer">
        <div class="foot-head ">
            <h1 class="foot-items font_medium_large">Community Web</h1>
            <h2 class="foot-items">&copy; All rigths reserved</h2>
            <h2 class="foot-items">Contact : +919926385892</h2>
            <h2 class="foot-items">Mail : web-community@community.com</h2>
            <div class="social-media">
                <i class="fab fa-facebook fa-3x"></i>
                <i class="fab fa-instagram fa-3x"></i>
                <i class="fab fa-twitter fa-3x"></i>
            </div>
        </div>
    </section>
    <script>
        var slideIndex = 0;
            showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}    
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block";  
            dots[slideIndex-1].className += " active";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
            }
            
          function display_search(){
            var x=document.getElementsByClassName("search-bar")[0];
            if (x.style.display === "none"){
                x.style.display = "block";
            }
            else{
                x.style.display = "none"
            }
          }
    </script>
</body>
</html>