<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html lang="en">

<head>
<link rel=\"stylesheet\" href=\"css/tableUser.css\">
<link rel=\"stylesheet\" href=\"css/style.css\">
<style> 
table, th, td,tr {
  border:1px solid black;
}
#boldish
{
width: 40%;
}
input{
width: 40%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid black;
  border-radius: 4px;
}
label
{
width:40%;
 margin: 8px 0;
  padding: 12px 20px;
    font-weight: bold;
}
#button
{
width: 40%;
 background-color:  #87ceeb; 
  color: black; 
  border: 2px solid #008CBA;
   border-radius: 12px;
       font-weight: bold;
       padding-left: 10px;
}


#button:hover {
  background-color: #00FF7F;
  color: black;
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

  <link href="assets/css/style.css" rel="stylesheet">

</head>

<body style="background-image: url('../img/hero-bg.jpg')">

  <!-- ======= Mobile nav toggle button ======= -->
  <i class="bi bi-list mobile-nav-toggle d-xl-none"></i>

  <!-- ======= Header ======= -->
  <header id="header">
    <div class="d-flex flex-column">
<%
System.out.println("Email id comapny "+(String)session.getAttribute("email"));
System.out.println("Org id"+session.getAttribute("orgid"));
if(session.getAttribute("orgid")==null)
{
try
{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");  
	PreparedStatement p1=con.prepareStatement("select orgid from client where email=?");
	p1.setString(1, (String)session.getAttribute("email"));
	ResultSet r=p1.executeQuery();
	r.next();
	session.setAttribute("orgid", r.getInt("orgid"));
	System.out.print(r.getInt("orgid"));
}catch(Exception e)
{
	e.printStackTrace();
	}
}
else
{

	 System.out.print("Inside else department org not null ");
	try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");  

 String sql="select org_name,no_depts from organizations where orgid=?";
 PreparedStatement p=con.prepareStatement(sql);
 p.setString(1,(String)session.getAttribute("orgid"));
 ResultSet rs=p.executeQuery();
 System.out.print("Inside WHile ");
 rs.next();%>
 
      <div class="profile">
       <!--  <img src="assets/img/profile-img.jpg" alt="" class="img-fluid rounded-circle">
        -->
        <br><br> 
        <h1 class="text-light"><%=rs.getString("org_name") %></h1>
        <%
        session.setAttribute("org_name", rs.getString("org_name"));
        session.setAttribute("no_depts", rs.getString("no_depts"));
        System.out.println(rs.getString("org_name"));
        System.out.println(rs.getString("no_depts"));
       	//System.out.print((int)session.getAttribute("no_depts"));
       }catch(Exception e)
       	{
       	e.printStackTrace();
       	}
       }%>
        
        <div class="social-links mt-3 text-center">
          <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
          <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div>
      </div>

      <nav id="navbar" class="nav-menu navbar">
        <ul>
          <li><a href="#hero" class="nav-link scrollto active"><i class="bx bx-home"></i> <span>Home</span></a></li>
         <%
         try{
        	 Class.forName("com.mysql.jdbc.Driver");  
        	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");  

        	  String sql="select dept_id from departments where orgid=?";
        	  PreparedStatement p=con.prepareStatement(sql);
        	  p.setString(1,(String)session.getAttribute("orgid"));
        	  ResultSet rs=p.executeQuery();
        	  System.out.println("Inside WHile in nothead");
        	  rs.next();
         }catch(Exception e){e.printStackTrace();}
          %>
          <li><a href="#DepartmentHead" class="nav-link scrollto"><i class="bi bi-diamond"></i><span>Department Head</span></a></li>      
  
          
          <li><a href="#Employees" class="nav-link scrollto"><i class="bi bi-person-check"></i> <span>Employees</span></a></li>
          <li><a href="#NewEmployee" class="nav-link scrollto"><i class="bi bi-bell"></i> <span>New Employee</span></a></li>
          
          
          <li><a href="#Profile" class="nav-link scrollto"><i class="bi bi-person-square"></i> <span>Profile</span></a></li>
          <li><a href="Logout" class="nav-link scrollto"><i class="bi bi-door-closed"></i> <span>Logout</span></a></li>
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

    
   
 <!-- ======= DepartmentHead Section ======= -->
    <section id="DepartmentHead" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>Department Head</h2>
           </div>
   
    <%

	String id="loan-48";//request.getParameter("dept_name");////dept_id
	String[] words=id.split("-");//request.getParameter("dept_name").split("-");//dept_name

	try
    {
	      Class.forName("com.mysql.jdbc.Driver");
		  Connection con=DriverManager.getConnection(  
		 "jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");
		  PreparedStatement p=con.prepareStatement("select dept_id,dept_name,dept_head,dept_mem from departments where dept_id=? and orgid=?");
 		  p.setString(1, id);
 		  p.setString(2,words[1]);
 		 ResultSet r=p.executeQuery();
 		  
%>
<table style="width:100%">
  <tr>
    <th>Department Id</th>
    <th>Department Name</th>
    <th>Department Head</th>
    <th>Number of Members</th>
  </tr>
  <%while(r.next())
	  {
	  PreparedStatement p1=con.prepareStatement("select username from client where email=?");
		  p1.setString(1, r.getString(3));

	 		 ResultSet r1=p1.executeQuery();
		  while(r1.next()){
	  
	  %>
  <tr>
    <td><%=r.getString(1)%></td>
    <td><%=r.getString(2)%></td>
    <td><%=r1.getString(1)%></td>
    <td><%=r.getString(4)%></td>
  </tr>
  <%
	  }
		  }%>
</table>
<label for="dept_name">Department Name</label>
<form action="head_update" method="post">
<select name="dept_name" id="boldish" required>

     <option><%=words[0]%></option>
     </select>
     <%
     		  PreparedStatement pre=con.prepareStatement("select username,email from client where dept_id=?");
     		  pre.setString(1, id);
     		  
    		  ResultSet rs=pre.executeQuery();
    	 
     %>
     <br>
<label for="emp_name">Employee Name</label>
<br>
     <select name="emp_name" id="boldish" required>
     <option>Please choose Employee</option>
     <%
 while(rs.next())
 {
     String name=rs.getString("username");
     String email=rs.getString("email");
    %>
    
    <option value="<%=email%>"><%=name%></option>

    <%
        }
%>
</select>
<%
}
catch(Exception e)
{
System.out.println(e);
}
 %>

    <br/>
    <br/>
    <input type="hidden" name="dept_id" value="<%= request.getParameter("dept_name")%>">
    <input type="hidden" value="<%=(String)session.getAttribute("orgid") %>" name="orgid"><!--  CHANGE IT EXAMPLE_______________-----------------------______ -->
    <input type="Submit" class="btn btn-primary">
    </form>
 
      </div>
    </section>

   
    <!-- ======= Employees Section ======= -->
    <section id="Employees" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>Employees</h2>
           </div>
  <table style="width:100%">
  <tr>
    <th>Employee Name</th>
    <th>Employee Id</th>
    <th>Employee Email_Id</th>
    <th>Date of Birth</th>
    <th>Department Id</th>
  </tr>
           <%
try
{ 
	Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");
PreparedStatement p=con.prepareStatement("select * from client where orgid=? order by dept_id");
 p.setString(1,(String)session.getAttribute("orgid"));/* EXAMPOLEEEEEEEEEEEEEEEEEEEEEE  */
ResultSet r=p.executeQuery();
 String d;
while(r.next()){
	System.out.println(r.getString("admin").equals("Y"));
	if(r.getString("dept_id")==null && r.getString("admin").equals("Y"))
	{
		d="ADMIN";
		System.out.print("inside Admin");
	}
	else if(r.getString("dept_id")==null)
	{
		continue;
	}
	else{
		d=r.getString("dept_id");
	}
%>
<tr>
    <td><%=r.getString("username")%></td>
    <td><%=r.getString("userid")%></td>
    <td><%=r.getString("email")%></td>
    <td><%=r.getString("dob")%></td>
    <td><%=d%></td>
  </tr>
  <%
	  }
		  }catch(Exception e)
		  {
			  e.printStackTrace();
		  }%>
</table>

      </div>
    </section><!-- End Employee Section -->
    
    
    
    <!-- ======= NewEmployee Section ======= -->
    <section id="NewEmployee" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>New Employee</h2>
           </div>
  <table id ="customers">
  <tr>
    <th>Organization Id</th>
    <th>Organization Name</th>
    <th>Username</th>
    <th>Email</th>
    <th>Department Name </th>
    <th>Action</th>
  </tr>
           <%
try
{ 
	Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");
PreparedStatement p=con.prepareStatement("select * from permission WHERE orgid = ?");
 p.setString(1,(String)session.getAttribute("orgid"));/* EXAMPOLEEEEEEEEEEEEEEEEEEEEEE  */
ResultSet r=p.executeQuery();
while(r.next()){%>
<tr>
    <td><%=r.getInt("orgid")%></td>
    <td><%=r.getString("org_name")%></td>
    <td><%=r.getString("username")%></td>
    <td><%=r.getString("useremail")%></td>
    
     <td>     
   <form action="Activated" method="post">
     <select name="ndept_name" id="boldish" required>
     <option>Please choose Employee</option>
     <%
     String ids;
     PreparedStatement p1=con.prepareStatement("select dept_id,dept_name from departments where orgid=?");
          p1.setString(1, (String) session.getAttribute("orgid"));
     		ResultSet r1 = p1.executeQuery();
     		while (r1.next()) {
     	String name = r1.getString("dept_name");
     	 ids = r1.getString("dept_id");
     	
     %>
    
    <option value="<%=ids%>"><%=name%></option>

    <%
        }
%>
</select></td>

    <td>  <input type="hidden" name="email" value="<%=r.getString("useremail")%>">
     <input type="Submit"  value="Accept">
     <a href="#"><button class="button button1">Reject</button></a>
     
     </td>
       </form>
  </tr>

  <%
	  }
		  }catch(Exception e)
		  {
			  e.printStackTrace();
		  }%>
</table>

      </div>
    </section><!-- End NewEmployee Section -->
    
    
     <!-- ======= Profile Section ======= -->
    <section id="Profile" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>Profile</h2>
           </div>
            <div class="row">
            <div class="col-lg-4" data-aos="fade-right">
            <%try
            {
            	Class.forName("com.mysql.jdbc.Driver");  
            	Connection con=DriverManager.getConnection(  
            	"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");  

            	 String sql="select filename from client where email=?";
            	 PreparedStatement pr=con.prepareStatement(sql);
            	 pr.setString(1,(String)session.getAttribute("email"));
            	 ResultSet rs=pr.executeQuery();
            	 rs.next();
            	 String path="";
            	 if(rs.getString("filename")!=null)
            	 {
            		  path="Profile_images/"+session.getAttribute("org_name")+"/"+rs.getString("filename");
            	 } %> 
             <img src=<%=path%> class="img-fluid" alt="" >
            <%}catch(Exception e)
            {
            	e.printStackTrace();
            }%>
			<form action="upload_org_profile" method="post" enctype="multipart/form-data">
             <label class="fst-italic">Upload Profile Image</label>
             <br/><br/>
             <input type="file" name="profile_img" >
             <input type="submit" class="btn btn-primary" value="Upload" >
             </form>
             </div>
<br>
<br>
<%
try
{ 
	Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");
PreparedStatement p=con.prepareStatement("select * from organizations where userid=?");
 p.setString(1, (String)session.getAttribute("userid"));
ResultSet r=p.executeQuery();
while(r.next()){%>

              <div class="col-lg-6">
                <ul>
                  <li><i class="bi bi-chevron-right"></i> <strong>Administration Id:</strong> <span><%=r.getString("userid").toUpperCase() %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Organization Id:</strong> <span><%=r.getInt("orgid") %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Organization Name:</strong> <span><%=r.getString("org_name").toUpperCase() %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Organization Email_Id:</strong> <span><%=r.getString("org_email").toUpperCase() %></span></li>
               <!--  </ul>
              </div>
              <div class="col-lg-6">
                <ul> -->
                  <li><i class="bi bi-chevron-right"></i> <strong>Number of Departments:</strong> <span><%=r.getInt("no_depts") %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Number of Employees:</strong> <span><%=r.getInt("no_employee") %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Date of Creation:</strong> <span><%=r.getString("org_date") %></span></li><!-- 
                  <li><i class="bi bi-chevron-right"></i> <strong>Freelance:</strong> <span>Available</span></li> -->
                </ul>
              </div>
              
            </div>
  <%}}catch(Exception e)
{
	  e.printStackTrace();}%>
	  <div class="col-log-2">
<form action="update_dept" >
<input type="button" value="Update" class="btn btn-primary">
</form>
</div>
      </div>
    </section><!-- End Profile Section -->
    
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
                <p>+91 95859082610</p>
              </div>

             </div>

          </div>

          <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="name" class="fst-italic">Your Name</label>
                  <input type="text" name="name" class="form-control" id="name" required>
                </div>
                <div class="form-group col-md-6">
                  <label for="name" class="fst-italic">Your Email</label>
                  <input type="email" class="form-control" name="email" id="email" required>
                </div>
              </div>
              <div class="form-group">
                <label for="name" class="fst-italic">Subject</label>
                <input type="text" class="form-control" name="subject" id="subject" required>
              </div>
              <div class="form-group">
                <label for="name" class="fst-italic">Message</label>
                <textarea class="form-control" name="message" rows="10" required></textarea>
              </div>
              <div class="text-center"><input type="submit" class="btn btn-primary"></div>
           
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