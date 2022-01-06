
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html lang="en">

<head>
<style>
table, th, td {
  border: 1px solid black;
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
  <link href="css/tablecss.css" rel="stylesheet">

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
      <%try
{
	 Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
     PreparedStatement pstmt = null;
     String SQL = "Select username,orgid,dept_id,filename,userid from client where email=?";
     pstmt = con.prepareStatement(SQL);
     pstmt.setString(1,(String)session.getAttribute("email"));
     ResultSet rs=pstmt.executeQuery();  
     while(rs.next()){  
    	 int orgid=rs.getInt(2);
    	 session.setAttribute("dept_id",rs.getString("dept_id"));
    	 session.setAttribute("userid",rs.getString("userid"));
    	 session.setAttribute("username",rs.getString("username"));
     	
    	 String d[]=rs.getString(3).split("-");
    	 String s= "Select org_name from organizations where orgid=?";
         pstmt = con.prepareStatement(s);
         pstmt.setInt(1,orgid);
         ResultSet r=pstmt.executeQuery();  
         while(r.next()){
    	 
     //System.out.println(rs.getString(1)+" "+rs.getDate(2)); 
     String hpath="Profile_images/"+r.getString(1)+"/"+d[0]+"/"+rs.getString("filename");
    %>
        
         <%--  <img src="<%=hpath%> alt="Not found" class="img-fluid rounded-circle">
         --%><br><br>
          <h1 class="text-light"><%=rs.getString(1).toUpperCase() %></h1>
         
        <div class="social-links mt-3 text-center">
          <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
          <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div>
        <%}
    		 }}catch(Exception e)
     		{
    	 e.printStackTrace();
     }%>
      </div>

      <nav id="navbar" class="nav-menu navbar">
        <ul>
          <li><a href="#facts" class="nav-link scrollto"><i class="bx bx-video"></i> <span>Video Calling</span></a></li>
          <li><a href="#chat" class="nav-link scrollto"><i class="bx bx-chat"></i><span>Chat</span></a></li>
          <li><a href="#tasks" class="nav-link scrollto"><i class="bx bx-task"></i> <span>Assign Tasks</span></a></li>
          <li><a href="#Upload" class="nav-link scrollto"><i class="bx bx-folder-plus"></i> <span>Check Uploaded Work</span></a></li>
          <li><a href="#about" class="nav-link scrollto"><i class="bx bx-user"></i> <span>Profile</span></a></li>
          <li><a href="#organization" class="nav-link scrollto"><i class="bi-people"></i> <span>Organization</span></a></li>
          <li><a href="#contact" class="nav-link scrollto"><i class="bx bxs-contact"></i> <span>Contact</span></a></li>
          <li><a href="Logout" class="nav-link scrollto"><i class="bx bxs-contact"></i> <span>Logout</span></a></li>
        </ul>
      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero r" class="d-flex flex-column justify-content-center align-items-center r">
    <div class="hero-container-r" style="background-image: url('../img/hero-bg.jpg')" data-aos="fade-in">
      <h1><b>Virtual Office</b></h1>
      <p>It contains <span class="typed" data-typed-items="Video Conferrencing,Chats,Upload Works,Task Add"></span></p>
    </div>
  </section><!-- End Hero -->

  <main id="main">
<div class="section-title">
          <center><h2>Welcome to Department Head</h2></center>
         </div>
    
    <!-- ======= Facts Section ======= -->
    <section id="facts" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>Meetings</h2>
         </div>
<!-- 
        <div class="row no-gutters">

          <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch" data-aos="fade-up">
            <div class="count-box">
              <i class="bi bi-emoji-smile"></i>
              <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"></span>
              <p><strong>Happy Clients</strong> consequuntur quae</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="count-box">
              <i class="bi bi-journal-richtext"></i>
              <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter"></span>
              <p><strong>Projects</strong> adipisci atque cum quia aut</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch" data-aos="fade-up" data-aos-delay="200">
            <div class="count-box">
              <i class="bi bi-headset"></i>
              <span data-purecounter-start="0" data-purecounter-end="1453" data-purecounter-duration="1" class="purecounter"></span>
              <p><strong>Hours Of Support</strong> aut commodi quaerat</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch" data-aos="fade-up" data-aos-delay="300">
            <div class="count-box">
              <i class="bi bi-people"></i>
              <span data-purecounter-start="0" data-purecounter-end="32" data-purecounter-duration="1" class="purecounter"></span>
              <p><strong>Hard Workers</strong> rerum asperiores dolor</p>
            </div>
          </div>

        </div> -->
<a href="zoom.html">Meeting</a>
      </div>
    </section><!-- End Facts Section -->


    <!-- ======= chat Section ======= -->
    <section id="chat" class="portfolio section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Chat</h2>
          </div>
<form method="post" action="session2" id="myform">
<input type="hidden" id="id" name="idr" value="b"> 
<input type="hidden" id="name" name="receiver" value="a">

<tr><th>username:</th></tr>
<% 
try{
PrintWriter printWriter=response.getWriter();
String sender=(String)session.getAttribute("username");
String ids=(String)session.getAttribute("userid");
//System.out.println("sender:"+sender);
//System.out.println("ids:"+ids);
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
PreparedStatement statement1 = con.prepareStatement("SELECT username,userid FROM client where username!="+"'"+sender+"' and dept_id=?");
statement1.setString(1, (String)session.getAttribute("dept_id"));
ResultSet rs = statement1.executeQuery();

while(rs.next()){
PreparedStatement statement2=con.prepareStatement("SELECT COUNT(*) as count from chat where receiverid="+"'"+ids+"'"+" and senderid="+"'"+rs.getString("userid")+"'"+" and decider=0");
ResultSet rs1 = statement2.executeQuery();
rs1.next();
%>
<tr><td><button type="submit" class="btn btn-primary"  value="<%=rs.getString("username") %>|<%=rs.getString("userid") %>" onclick="getval(this.value)"><%=rs.getString("username") %></button></td>
<%if(rs1.getInt("count")>0){%>
<td><%=rs1.getInt("count") %></td><%} %>
</tr>
<% } }
catch (Exception e) 
			{

    			e.printStackTrace();
			}%>
</table>
<input type="hidden" name="sender" value="user">
</form>
<script type="text/javascript">
function getval(val){
	const myarr=val.split("|");
	console.log(myarr[0]);
	console.log(myarr[1]);
	var valuee=document.getElementById('id');
	var name=document.getElementById('name');
	var form=document.getElementById('myform');
	valuee.setAttribute('value',myarr[1]);
	name.setAttribute('value',myarr[0]);
	//document.form.submit();
}
</script>



      </div>
    </section><!-- End chat Section -->

    <!-- ======= todo Section ======= -->
    <section id="tasks" class="todo">
      <div class="container">

        <div class="section-title">
          <h2>Assign Tasks</h2>
         </div>

        <div class="row">
        <form action="assigntask" method="post">
        <br>
          <div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
           <input type="text" name="task_des" placeholder="Enter title of task">
        	<br>
           </div>
          <div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up" data-aos-delay="100">
            <br><select name="emp_name" id="boldish" required>
     <option>Please choose Employee</option>
     <%try
     { 
    	 Class.forName("com.mysql.jdbc.Driver");  
    	 Connection con=DriverManager.getConnection(  
    	 "jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  

    	  String sql="select username,userid from client where dept_id=?";
    	  PreparedStatement pr=con.prepareStatement(sql);
    	  pr.setString(1,(String)session.getAttribute("dept_id"));
    	 
    	  ResultSet rs=pr.executeQuery();
    	 while(rs.next()){
     %>     
     <option value=<%=rs.getString("userid") %>><%=rs.getString("username") %></option>
     <%}}catch(Exception e)
     {
    	 e.printStackTrace();
     }%>
     </select><br><br>
           </div>
          <div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up" data-aos-delay="200">
            <input type="Submit" value="Assign task" class="btn btn-primary">
            </div>
          <!-- <div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up" data-aos-delay="300">
            <div class="icon"><i class="bi bi-binoculars"></i></div>
            <h4 class="title"><a href="">Magni Dolores</a></h4>
            <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up" data-aos-delay="400">
            <div class="icon"><i class="bi bi-brightness-high"></i></div>
            <h4 class="title"><a href="">Nemo Enim</a></h4>
            <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
          </div>
          <div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up" data-aos-delay="500">
            <div class="icon"><i class="bi bi-calendar4-week"></i></div>
            <h4 class="title"><a href="">Eiusmod Tempor</a></h4>
            <p class="description">Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi</p>
          </div> -->
          </form>
        </div>

      </div>
    </section><!-- End tasks Section -->
    
     

    <!-- ======= Testimonials Section ======= -->
    <section id="Upload" class="Upload section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Upload Work</h2>
         </div>
		<div class="uploadwork">
		 <table id="customers">
         <tr>
             <th>Employee id</th><th>File Name</th><th>Added Date</th><th>Added Time</th><th>Download</th>
         </tr>
         <%
         try
         {
         	Class.forName("com.mysql.jdbc.Driver");  
         	Connection con=DriverManager.getConnection(  
         	"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  
         PreparedStatement p1=con.prepareStatement("select * from uploadwork where deptid=? and orgid=?");
         p1.setInt(2, (int)session.getAttribute("orgid")); 
         p1.setString(1, (String)session.getAttribute("dept_id"));
       //  System.out.println("P1");
         PreparedStatement p3=con.prepareStatement("select * from departments where dept_id=? and orgid=?");
         p3.setInt(2, (int)session.getAttribute("orgid")); 
         p3.setString(1, (String)session.getAttribute("dept_id"));
      //   System.out.println("P3");
         ResultSet r3=p3.executeQuery();
         r3.next();
        // p1.setInt(2, 48);
         PreparedStatement p2=con.prepareStatement("select org_name from organizations where orgid=?");
         p2.setInt(1,(int)session.getAttribute("orgid"));
         ResultSet r2=p2.executeQuery();
         r2.next();
         //String d="Work/"+r2.getString("org_name")+"/"+"loan"+"/";
         	ResultSet rs=p1.executeQuery();
         while (rs.next()) {
        	 String d="Work/"+r2.getString("org_name")+"/"+r3.getString("dept_name")+"/";
        	 String d1="C:\\Users\\dev\\Downloads\\virtual-office\\src\\main\\webapp\\"+d;
         %>
         <tr>
             <td><%=rs.getString("empid")%></td>
             <td><%=rs.getString("filename")%></td>
             <td><%=rs.getString("date")%></td>
             <td><%=rs.getString("time")%></td>
              <td><a href="DownloadServlet?fileName=<%=rs.getString("filename")%>&filePath=<%=d1%>">Download</a></td>
         </tr>
         <%
             }}catch(Exception e)
         {
             	e.printStackTrace();
         }
         %>
         
     </table><br>
		
		</div>

      </div>
    </section><!-- End Testimonials Section -->
    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">
 <%try
{
	 Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
     PreparedStatement pstmt = null;
     String SQL = "Select * from client where email=?";
     pstmt = con.prepareStatement(SQL);
     pstmt.setString(1,(String)session.getAttribute("email"));
     ResultSet rs=pstmt.executeQuery();  
     while(rs.next()){  
    	 
    	 String a[]=rs.getString(11).split("-");
    	 String s= "Select org_name from organizations where orgid=?";
         pstmt = con.prepareStatement(s);
         pstmt.setInt(1,rs.getInt("orgid"));
         ResultSet r=pstmt.executeQuery();  
         while(r.next()){
    	String org_name=r.getString(1);
    	// String temp;
    	 session.setAttribute("temp",rs.getInt(12)); 
    	 String path="Profile_images/"+org_name+"/"+a[0]+"/"+rs.getString("filename");
    	 String city;
         if(rs.getString("city")!=null){
               city=rs.getString("city").toUpperCase();
               }
         else{ city="";}
     %>
        <div class="section-title">
          <h2>Profile</h2>
          
        </div>
        <div class="row">
          <div class="col-lg-4" data-aos="fade-right">
            <!-- <img src="assets/img/profile-img.jpg" class="img-fluid" alt="Image not found">
             -->
             <img src=<%=path%> class="img-fluid" alt="" >
             <form action="upload_profile_img" method="post" enctype="multipart/form-data">
             <label class="fst-italic">Upload Profile Image</label>
             <br/><br/>
             <input type="file" name="profile_img" >
             <input type="hidden" name="flag" value="0">
             <input type="submit" class="btn btn-primary" value="Upload" >
             </form>
          </div>
          <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
            <h3>POST OF EMPLOYEEE </h3>
            <!-- <p class="fst-italic">
              About POST DETAILS
            </p> -->
            <div class="row">
              <div class="col-lg-6">
                <ul>
                  <li><i class="bi bi-chevron-right"></i> <strong>Name:</strong> <span><%=rs.getString("username").toUpperCase() %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Birthday:</strong> <span><%=rs.getDate("dob") %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Phone:</strong> <span> <%=rs.getString("mobile")%></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>City:</strong> <span> <%=city.toUpperCase() %> </span></li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul>
         <li><i class="bi bi-chevron-right"></i> <strong>Company Id:</strong> <span><%=rs.getString(12) %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Department Id:</strong> <span><%=rs.getString("dept_id") %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Department Name:</strong> <span><%=a[0]%></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>PhEmailone:</strong> <span><%=rs.getString("email").toUpperCase() %></span></li> 
                  
                </ul>
              </div>
            </div><h3>Update Profile</h3>
            <form action="update_profile">
   <input type"submit" value="Update" class="btn btn-primary">
          <!--  <button class="button button1" >Update</button> -->
           </form>
          </div>
        </div>
<% }  
     }

}catch(Exception e)
{
e.printStackTrace();
} %>
      </div>
    </section><!-- End About Section -->
    


<!-- ======= organization Section ======= -->
    <section id="organization" class="organization">
      <div class="container">

        <div class="section-title">
          <h2>Organization</h2>
          </div>
          <%!
          public String epath;%>
<%

try
{ Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  
	String sql="select dept_id,orgid from client where email=? ";
	  
	PreparedStatement ps=con.prepareStatement(sql);
	 ps.setString(1,(String)session.getAttribute("email"));
	 ResultSet rs=ps.executeQuery();
	 while(rs.next())
	 {
	 String dept_name[]=rs.getString(1).split("-");
	 int orgid=rs.getInt(2);
	 PreparedStatement p=con.prepareStatement("select org_name,org_email,no_depts from organizations where orgid=? ");
	 p.setInt(1,orgid);
	 ResultSet r=p.executeQuery();
	 while(r.next()){
		 epath="Profile_images/"+r.getString(1)+"/";
	 %>
        <div class="row">
          <div class="col-lg-4" data-aos="fade-right">
            <img src="assets/img/profile-img.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
            <h3><%=r.getString(1).toUpperCase() %> ON <%=dept_name[0] %></h3>
            <!-- <p class="fst-italic">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua.
            </p> -->
            <div class="row">
            <%PreparedStatement pr=con.prepareStatement("select dept_name from departments where orgid=?");
            pr.setInt(1, orgid);
       	 	ResultSet rr=pr.executeQuery();
       	 
            %>            
              <div class="col-lg-6">
                <ul>
                <%--  <li><i class="bi bi-chevron-right"></i> <strong>Company Id:</strong> <span><%=dept_name[1] %></span></li> --%>
                  <li><i class="bi bi-chevron-right"></i> <strong>Company Name:</strong> <span><%=r.getString(1).toUpperCase() %></span></li>
                  <%-- <li><i class="bi bi-chevron-right"></i> <strong>Department Id:</strong> <span><%=rs.getString(1).toUpperCase() %></span></li>
                   --%>
                   <li><i class="bi bi-chevron-right"></i> <strong>Department:</strong><%while(rr.next()){ %> <span><%=rr.getString("dept_name") %>,</span><%} %></li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul>
                  <!-- <li><i class="bi bi-chevron-right"></i> <strong>Age:</strong> <span>30</span></li>
                  --> <li><i class="bi bi-chevron-right"></i> <strong>Number of Departments:</strong> <span><%=r.getString(3) %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Company Email_Id:</strong> <span><%=r.getString(2).toUpperCase() %></span></li>
  <!--                 <li><i class="bi bi-chevron-right"></i> <strong>Freelance:</strong> <span>Available</span></li> -->
                </ul>
              </div>
            </div>
            
           
          </div>
        </div>
        <%}
	 } }catch(Exception e)
	 {
		 e.printStackTrace();
	 }
	 %>
	 <table id="customers">
            <tr>
            <th>Image</th>
            <th>Employee Name</th>
            <th>Email</th>
            <th>Department Name</th>
            </tr>
            <%
            try{
            Class.forName("com.mysql.jdbc.Driver");  
        	Connection con=DriverManager.getConnection(  
        	"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  
            PreparedStatement p2=con.prepareStatement("select username,email,dept_id,filename from client where orgid=? order by dept_id ");
	 p2.setInt(1,(int)session.getAttribute("temp"));
	 ResultSet r2=p2.executeQuery();
	 while(r2.next())
	 {
		 String b[]=r2.getString(3).split("-");

		    String t=epath+b[0]+"/"+r2.getString(4);
	 %>
	 <tr>
	 
    <td><img src=<%=t %> alt="Image Not Available"style="max-height: 190px;
    min-height: 190px;
    max-width: 190px;
    min-width: 190px;"><!-- class="img-thumbnail" --></td>
    <td><%=r2.getString(1) %></td>
    <td><%=r2.getString(2) %></td>
    <td><%=b[0] %></td>
  </tr>
  <%
  }}
  catch(Exception e)
  {
	  e.printStackTrace();
  }%>
            </table>
	 

      </div>
    </section><!-- End organization Section -->
    

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
                <p>46,Tilak Nagar Indore</p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>virtual.office.aapv@gmail.com</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>Call:</h4>
                <p>+91 95890-82610</p>
              </div>

            </div>

          </div>

          <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
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
              <div class="my-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
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