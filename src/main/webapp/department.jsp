<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="css/tablecss.css">
<link rel="stylesheet" href="css/style.css">
<style> 

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
.vo{width: 80%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid black;
  border-radius: 4px;}
label
{
width:40%;
 margin: 8px 0;
  padding: 12px 20px;
    font-weight: bold;
}

table, th, td {

border-collapse: collapse;
}
th, td {
padding: 5px;
text-align: left;
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
<script> 
function welcome() { 
window.open("https://www.javatpoint.com/");
} 
</script> 
</head>

<body style="background-image: url('../img/hero-bg.jpg')">

  <!-- ======= Mobile nav toggle button ======= -->
  <i class="bi bi-list mobile-nav-toggle d-xl-none"></i>

  <!-- ======= Header ======= -->
  <header id="header">
    <div class="d-flex flex-column">
<%
//System.out.println("Email id comapny "+(String)session.getAttribute("email"));
//System.out.println("Org id"+session.getAttribute("orgid"));
if(session.getAttribute("orgid")==null)
{
try
{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  
	PreparedStatement p1=con.prepareStatement("select orgid from client where email=?");
	p1.setString(1, (String)session.getAttribute("email"));
	ResultSet r=p1.executeQuery();
	r.next();
	session.setAttribute("orgid", r.getInt("orgid"));
	//System.out.print(r.getInt("orgid"));
}catch(Exception e)
{
	e.printStackTrace();
	}
}
else
{

	 //System.out.print("Inside else department org not null ");
	try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  

 String sql="select org_name,no_depts from organizations where orgid=?";
 PreparedStatement p=con.prepareStatement(sql);
 p.setInt(1,(int)session.getAttribute("orgid"));
 ResultSet rs=p.executeQuery();
 //System.out.print("Inside WHile ");
 rs.next();%>
 
      <div class="profile">
       <!--  <img src="assets/img/profile-img.jpg" alt="" class="img-fluid rounded-circle">
        -->
        <br><br> 
        <h1 class="text-light"><%=rs.getString("org_name") %></h1>
        <%
        session.setAttribute("org_name", rs.getString("org_name"));
        session.setAttribute("no_depts", rs.getInt("no_depts"));
       // System.out.println(rs.getString("org_name"));
      //  System.out.println(rs.getInt("no_depts"));
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
        	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  

        	  String sql="select dept_id from departments where orgid=?";
        	  PreparedStatement p=con.prepareStatement(sql);
        	  p.setInt(1,(int)session.getAttribute("orgid"));
        	  ResultSet rs=p.executeQuery();
        	 // System.out.println("Inside WHile in nothead");
        	  rs.next();
        	  session.setAttribute("dept_id",rs.getString("dept_id"));
         if((String)session.getAttribute("head")=="1"||rs.next()){ %>
          <li><a href="#DepartmentHead" class="nav-link scrollto"><i class="bi bi-diamond"></i><span>Department Head</span></a></li>      
          <%} 
          else
          {%>
           <li><a href="#Department" class="nav-link scrollto"><i class="bx bx-chat"></i><span>Department</span></a></li> 
          <%}}catch(Exception e){e.printStackTrace();} %>
          
          <li><a href="#Employees" class="nav-link scrollto"><i class="bi bi-person-check"></i> <span>Employees</span></a></li>
          <li><a href="#NewEmployee" class="nav-link scrollto"><i class="bi bi-bell"></i> <span>New Employee</span></a></li>
          
          
          <li><a href="#Profile" class="nav-link scrollto"><i class="bi bi-person-square"></i> <span>Profile</span></a></li>
          
          <li><a href="#contact" class="nav-link scrollto"><i class="bx bxs-contact"></i> <span>Contact</span></a></li>
          <li><a href="Logout" class="nav-link scrollto"><i class="bi bi-box-arrow-left"></i> <span>Logout</span></a></li>
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
  <%if((String)session.getAttribute("head")=="1"||session.getAttribute("dept_id")!=null){ %>
    <section id="DepartmentHead" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>Department Head</h2>
           </div>

<%if(request.getParameter("dept_name")==null){ %>
<label for="dept_name">Department Name</label>
    <form action="department_head" method="post">
<%
//System.out.println("inside dropdown");
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  

 String sql="select dept_name,dept_id from departments where orgid=?";
 PreparedStatement pr=con.prepareStatement(sql);
 pr.setInt(1,(int)session.getAttribute("orgid"));
 ResultSet rs=pr.executeQuery();

//System.out.println("inside dropdown");
 %>   <select name="dept_name" id="boldish" required>
     <option>Please choose Department</option>
     <%
 while(rs.next())
 {
     String name=rs.getString("dept_name");

     String id=rs.getString("dept_id");
    %>
    
    <option value="<%=id%>"><%=name%></option>

    <%
        }
%>
</select>
<%
}
catch(Exception e)
{
//.out.print(e);
}
%>
  <br/>
    <br/>
    <button class="button button1">Submit</button>
             <br><br>
           
             <!-- <a href="department_head?value=dept_name">hello</a> </form>
 -->    <%}

else
{
	String id=request.getParameter("dept_name");////dept_id
	String[] words=request.getParameter("dept_name").split("-");//dept_name

	try
    {
	      Class.forName("com.mysql.jdbc.Driver");
		  Connection con=DriverManager.getConnection(  
		 "jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");
		  PreparedStatement p=con.prepareStatement("select dept_id,dept_name,dept_head,dept_mem from departments where dept_id=? and orgid=?");
 		  p.setString(1, id);
 		  p.setString(2,words[1]);
 		 ResultSet r=p.executeQuery();
 		  
%>
<label for="dept_name">Department Name</label>
<form action="head_update" method="post">
<select name="dept_name" id="boldish" required>

     <option><%=words[0]%></option>
     </select><br><br>
<table id="customers">
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
//System.out.println(e);
}
 %>

    <br/>
    <br/>
    <input type="hidden" name="dept_id" value="<%= request.getParameter("dept_name")%>">
    <input type="hidden" value="<%=(int)session.getAttribute("orgid") %>" name="orgid"><!--  CHANGE IT EXAMPLE_______________-----------------------______ -->
    <button class="button button1">Submit</button>
    </form>
    <br>
    <br>
    <%} %>
      </div>
    </section>
<%}else
	{%>
	
 <!-- ======= Department Section ======= -->
    <section id="Department" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>Department</h2>
           </div>

         <form action="Org_setup_2" method="POST">
       
<% int n=0;
if(session.getAttribute("no_depts")!=null){

 n=(int)(session.getAttribute("no_depts"));
}
else
{
	try

{
    Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection(  
	 "jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");
	  PreparedStatement p=con.prepareStatement("select no_depts from organizations where  orgid=?");
	  p.setInt(1,(int)session.getAttribute("orgid") );
	
	 ResultSet r=p.executeQuery();
	 r.next();
	 n=r.getInt("no_depts");
	}catch(Exception e)
{
		e.printStackTrace();
}
}
for(int i=0;i<n;i++){ %>
<h2>Department Details for <%=i+1%></h2>
<br>
<br><!-- 
<label>Department Name</label> -->
<br>
<input type="text" placeholder="Department Name" name="dept_name_<%=i%>">
<br><!-- 
<label>No of Members in department</label> -->
<br>
<input type="text" placeholder="No of Members in department" name="dept_mem_<%=i%>">
<br>

<br>
<%if(i+1!=n)
	{%>
****************************************************
<% }}%>
<br> <button class="button button1">Submit</button>
</form>
      </div>
    </section><!-- End Department Section -->
    <%} %>
   
    <!-- ======= Employees Section ======= -->
    <section id="Employees" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>Employees</h2>
           </div>
  <table id="customers">
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
"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");
PreparedStatement p=con.prepareStatement("select * from client where orgid=? order by dept_id");
 p.setInt(1,(int)session.getAttribute("orgid"));/* EXAMPOLEEEEEEEEEEEEEEEEEEEEEE  */
ResultSet r=p.executeQuery();
 String d;
while(r.next()){
	//System.out.println(r.getString("admin").equals("Y"));
	if(r.getString("dept_id")==null && r.getString("admin").equals("Y"))
	{
		d="ADMIN";
		//System.out.print("inside Admin");
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
<br><br>
      </div>
    </section><!-- End Employee Section -->
    
    
    
    <!-- ======= NewEmployee Section ======= -->
    <section id="NewEmployee" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>New Employee</h2>
           </div>
  <table id ="customers" style="width:100%">
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
"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");
PreparedStatement p=con.prepareStatement("select * from permission WHERE orgid = ?");
 p.setInt(1,(int)session.getAttribute("orgid"));/* EXAMPOLEEEEEEEEEEEEEEEEEEEEEE  */
ResultSet r=p.executeQuery();
while(r.next()){%>
<tr>
    <td><%=r.getInt("orgid")%></td>
    <td><%=r.getString("org_name")%></td>
    <td><%=r.getString("username")%></td>
    <td><%=r.getString("useremail")%></td>
    
     <td>     
   <form action="Activated" method="post">
   <fieldset class="form-group">
					 <select class="form-control"
						name="ndept_name" required="required" "> 
						
   <!--  <select name="ndept_name" id="boldish" required> -->
<!--   <option>Please choose Department</option> -->
     <%
     String id;
     PreparedStatement p1=con.prepareStatement("select dept_id,dept_name from departments where orgid=?");
          p1.setInt(1, (int) session.getAttribute("orgid"));
     		ResultSet r1 = p1.executeQuery();
     		while (r1.next()) {
     	String name = r1.getString("dept_name");
     	 id = r1.getString("dept_id");
     	
     %>
    
    <option value="<%=id%>"><%=name%></option>

    <%
        }
%>
					</select>
				</fieldset>
<!-- </select> --></td>

    <td>  <input type="hidden" name="email" value="<%=r.getString("useremail")%>">
     <button class="button button2">Accept</button>
     <button class="button button1" onclick="welcome()">Reject</button>
     
     
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
<br><br>
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
            	"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  

            	 String sql="select filename from client where email=?";
            	 PreparedStatement pr=con.prepareStatement(sql);
            	 pr.setString(1,(String)session.getAttribute("email"));
            	 ResultSet rs=pr.executeQuery();
            	 rs.next();
            	 String path="";
            	 if(rs.getString("filename")!=null)
            	 {
            		  path="Profile_images/"+(String)session.getAttribute("org_name")+"/"+rs.getString("filename");
            		 
            	 } %> 
             <img src=<%=path%> class="img-fluid" alt="Upload Profile Image" >
            <%}catch(Exception e)
            {
            	e.printStackTrace();
            }%>
            <br><br>
			<form action="upload_org_profile" method="post" enctype="multipart/form-data">
             
             <br>
         
             <input id="vo" type="file" name="profile_img" style="width:415px;">
             <br>
             <button class="button button1">Upload</button>
             <br><br>
            </form>
            </div>
             
<br>
<br>
<%
try
{ 
	Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");
PreparedStatement p=con.prepareStatement("select * from organizations where userid=?");
 p.setString(1, (String)session.getAttribute("userid"));
ResultSet r=p.executeQuery();
while(r.next()){%>

              <div class="col-lg-6">
              
                <table style="width:100%">
                <tr><th><i class="bi bi-chevron-right"></i> <strong>Administration Id:</strong></th><td><span><%=r.getString("userid").toUpperCase() %></span></td></tr>
                <tr> <th><i class="bi bi-chevron-right"></i> <strong>Organization Id:</strong></th> <td><span><%=r.getInt("orgid") %></span></td>   </tr>
                   <tr><th><i class="bi bi-chevron-right"></i>  <strong>Organization Name:</strong></th><td> <span><%=r.getString("org_name").toUpperCase() %></span></td></tr>
                    <tr><th><i class="bi bi-chevron-right"></i> <strong>Organization Email_Id:</strong></th><td> <span><%=r.getString("org_email").toUpperCase() %></span></td>
               </tr> 
              </div>
              <div class="col-lg-6">
               
                 <tr><th><i class="bi bi-chevron-right"></i>   <strong>Number of Departments:</strong></th><td> <span><%=r.getInt("no_depts") %></span></td></tr>
                <%--  <tr><th><i class="bi bi-chevron-right"></i>  <strong>Number of Employees:</strong></th><td>  <span><%=r.getInt("no_employee") %></span></td></tr> --%>
                 <tr><th><i class="bi bi-chevron-right"></i>  <strong>Date of Creation:</strong></th><td>  <span><%=r.getString("org_date") %></span></td></tr><!-- 
                  <li><i class="bi bi-chevron-right"></i> <strong>Freelance:</strong> <span>Available</span></li> -->
              
               </table>
                </br>
        <!--         <form action="update_dept" >
<button style="margin-left:150px;" class="button button1">Update</button>
</form> -->
           <br><br>   </div></div>
              
              
            </div>
  <%}}catch(Exception e)
{
	  e.printStackTrace();}%>
	  <div class="col-log-2">

<br><br>
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
                <p>+91 9589082610</p>
              </div>

            <!--   <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" style="border:0; width: 100%; height: 290px;" allowfullscreen></iframe>
             --></div>

          </div>

          <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
            <form action="feedback" method="post" role="form"  >
              <div class="row">
                <div class="form-group col-md-6">
                  <input type="text" name="name" class="form-control" placeholder="Your Name" id="name" required>
                </div>
                <div class="form-group col-md-6">
                  <input type="email" class="form-control" placeholder="Your Email" name="email" id="email" required>
                </div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject"placeholder="Subject" id="subject" required>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="message" rows="10" required placeholder="Message"></textarea>
              </div>
          <!--   <button  type="submit" class="btn btn-primary">Update</button> -->
          <br><br>
          <input type="hidden" value="department" name="trigger">
              <div class="text-center"><button type="submit" class="button button1">Send Message</button></div>
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