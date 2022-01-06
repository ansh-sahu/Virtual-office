<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html lang="en">

<head>
<style> 
#boldish
{
width: 40%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid black;
  border-radius: 4px;
}
label
{
width: 40%;
  padding: 12px 20px;
  margin: 8px 0;
    font-weight: bold;
}

</style>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Virtual Office</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: iPortfolio - v3.6.0
  * Template URL: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body style="background-image: url('../img/hero-bg.jpg')">

  <!-- ======= Mobile nav toggle button ======= -->
  <i class="bi bi-list mobile-nav-toggle d-xl-none"></i>

  <!-- ======= Header ======= -->
  <header id="header">
    <div class="d-flex flex-column">

      <div class="profile">
        <img src="assets/img/profile-img.jpg" alt="" class="img-fluid rounded-circle">
        <%try
        {
        	 Class.forName("com.mysql.jdbc.Driver");
    	     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
    	     PreparedStatement ps=con.prepareStatement("Select username,admin from client where email=?");
    	     ps.setString(1,(String)session.getAttribute("email"));
    	     ResultSet r=ps.executeQuery();
    	     if(r.next()){
      /*   	 PreparedStatement p=con.prepareStatement("update client set visit=? where email=?");
        	 p.setInt(1,1);
        	 p.setString(2,) */
        %>
        <h1 class="text-light"><a href="index.jsp"><%=r.getString("username")%></a></h1>
       
        <div class="social-links mt-3 text-center">
        <!--   <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
          <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a> -->
        </div>
      </div>

      <nav id="navbar" class="nav-menu navbar">
        <ul>
        <%if(r.getString("admin").equals("Y")){ %>
          <li><a href="#Administration" class="nav-link scrollto"><i class="bi-diagram-3-fill"></i> <span>Administration</span></a></li>
          <%}else{ %>
          <li><a href="#Employee" class="nav-link scrollto"><i class="bi-person-circle"></i><span>Employee</span></a></li>      
          <%} %>
          <li><a href="#contact" class="nav-link scrollto"><i class="bx bxs-contact"></i> <span>Contact</span></a></li>
        </ul>
      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero r" class="d-flex flex-column justify-content-center align-items-center r">
    <div class="hero-container-r" style="background-image: url('../img/hero-bg.jpg')" data-aos="fade-in">
      <h1><b>Virtual Office</b></h1>
      <p>It contains <span class="typed" data-typed-items="Video Conferrencing,Chats,Upload works,Task add"></span></p>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <%if(r.getString("admin").equals("Y")){ %>
    <!-- ======= Administration Section ======= -->
    <section id="Administration" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>Administration</h2>
           </div>

        
 <form method="POST" action="Org_setup_1"  >
                            
                        <div class="form-group">
                                <label for="org_name">Name of organization</label>
                                <input type="text" required name="org _name" id="boldish" placeholder="Name of Organization"/>
                            </div>
                            <div class="form-group">
                                <label for="no_of_depts">Numbers of Departments</label>
                                <input type="number"  required name="no_of_depts" id="boldish" placeholder="Numbers of Departments"/>
                            </div>
                           
                            <div class="form-group">
                                <label for="no_of_employees">Numbers of Employees</label>
                                <input type="number"  required name="no_of_employees" id="boldish" placeholder="Numbers of Employees"/>
                            </div>
                             <div class="form-group">
                                <label for="creation_date">Creation Date</label>
                                <input type="date"  required name="creation_date" id="boldish" placeholder="Creation Date"/>
                            </div>
                            <div class="form-group">
                                <label for="org_email">Organization Email</label>
                                <input type="email"  required name="org_email" id="boldish" placeholder="Organization Email"/>
                            </div>
                            <br/><br/>

							 <div class="form-group form-button">
							 <input type="hidden" value="0" name="hiddened" >
							
                                <input type="submit" name="signup" id="button" class="btn btn-primary" value="submit"/>
                            
                            </div>
   </form>
      </div>
    </section><!-- End Administration Section -->

   

<%}else{ %>
    <!-- ======= Portfolio Section ======= -->
    <section id="Employee" class="portfolio section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Employee</h2>
          <form action="feeddata" method="post">
          <!-- <form method="POST" action="RegisterServlet">
 
 <label for="register">Join a company</label>
  <input type="submit" name="register" value="employee">
  </form> -->
  <label>Join as Employee</label>
  <br/>
  <label for="org_name">Organization Name</label>
  <%-- <%
  try
  {
		 Class.forName("com.mysql.jdbc.Driver");
	     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
	     PreparedStatement pstmt = null;
	     String SQL = "Select org_name from organizations order by org_name ";
	     pstmt = con.prepareStatement(SQL);
	     ResultSet rs=pstmt.executeQuery();  
	     while(rs.next()){   %>
	     <input type="checkbox" name="org_name"><%=rs.getString(1)%>
	     <br/>
         <% }  
	     

  }catch(Exception e)
  {
  e.printStackTrace();
  }  %>  --%>
  <%
 
 Statement s=con.createStatement();
 String sql="select org_name from organizations order by org_name ";

 ResultSet rs=s.executeQuery(sql);
 %>
    <select name="company" id="boldish" required>
     <option>Please choose Company</option>
     <%
 while(rs.next())
 {
     String name=rs.getString(1);
    %>
    
    <option value="<%=name%>"><%=name%></option>

    <%
        }
%>
</select>
    <center>
    <br/><input type="submit" name="signup" id="button" class="btn btn-primary" value="submit"/></center>
    </form>
</div>
      </div>
    </section><!-- End Employee Section -->

 <%}
    	     
    	     
        }}catch(Exception e)
        {
        	e.printStackTrace();
        }
        %>
    <!-- ======= Contact Section ======= -->
         <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <h2>Contact</h2>
            </div>

        <div class="row" data-aos="fade-in">

          <div class="col-lg-5 d-flex align-items-stretch">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Location:</h4>
                <p>48,Tilak Nagar Indore</p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>virtual.office.aapv@gmail.com</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>Call:</h4>
                <p>+91 9589082610</p>
              </div>

            <!--   <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" style="border:0; width: 100%; height: 290px;" allowfullscreen></iframe>
             --></div>

          </div>

          <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
            <form action="feedback" method="post" role="form"  >
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="name">Your Name</label>
                  <input type="text" name="name" class="form-control" id="name" required>
                </div>
                <div class="form-group col-md-6">
                  <label for="name">Your Email</label>
                  <input type="email" class="form-control" name="email" id="email" required>
                </div>
              </div>
              <div class="form-group">
                <label for="name">Subject</label>
                <input type="text" class="form-control" name="subject" id="subject" required>
              </div>
              <div class="form-group">
                <label for="name">Message</label>
                <textarea class="form-control" name="message" rows="10" required></textarea>
              </div>
          <!--   <button  type="submit" class="btn btn-primary">Update</button> -->
          <br><br>
              <div class="text-center"><button type="submit" class="btn btn-primary">Send Message</button></div>
            </form>
          </div>
        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= 
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; W <strong><span>iPortfolio</span></strong>
      </div>
      
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer>
   -->
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/typed.js/typed.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>