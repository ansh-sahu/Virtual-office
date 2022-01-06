
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

  <link href="css/tablecss.css" rel="stylesheet">
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
      <%try
{
	 Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
     PreparedStatement pstmt = null;
     String SQL = "Select username,orgid,dept_id,filename from client where email=?";
     pstmt = con.prepareStatement(SQL);
     pstmt.setString(1,(String)session.getAttribute("email"));
     //HttpSession session=request.getSession();
     ResultSet rs=pstmt.executeQuery();  
     while(rs.next()){  
    	 int orgid=rs.getInt(2);
    	 session.setAttribute("dept_id", rs.getString("dept_id"));
    	 String d[]=rs.getString("dept_id").split("-");
    	 String s= "Select org_name from organizations where orgid=?";
         pstmt = con.prepareStatement(s);
         pstmt.setInt(1,orgid);
         ResultSet r=pstmt.executeQuery();  
         while(r.next()){
    	 
     //System.out.println(rs.getString(1)+" "+rs.getDate(2)); 
     String hpath="Profile_images/"+r.getString(1)+"/"+d[0]+"/"+rs.getString("filename");
    %>
        
     <%--      <img src="<%=hpath%> alt="Not found" class="img-fluid rounded-circle"> --%>
     <br>
     <br>
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
          <li><a href="#hero" class="nav-link scrollto active"><i class="bx bx-home"></i> <span>Home</span></a></li>
          <li><a href="#facts" class="nav-link scrollto"><i class="bx bx-video"></i> <span>Video Calling</span></a></li>
          <li><a href="#portfolio" class="nav-link scrollto"><i class="bx bx-chat"></i><span>Chat</span></a></li>
          <li><a href="#todo" class="nav-link scrollto"><i class="bx bx-task"></i> <span>TODO</span></a></li>
          <li><a href="#Upload" class="nav-link scrollto"><i class="bx bx-folder-plus"></i> <span>Upload Work</span></a></li>
          <li><a href="#about" class="nav-link scrollto"><i class="bx bx-user"></i> <span>Profile</span></a></li>
          <li><a href="#organization" class="nav-link scrollto"><i class="bi-people"></i> <span>Organization</span></a></li>
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

    <section id="facts" class="facts">
      <div class="container">

        <div class="section-title">
        
          <h2>Meetings</h2>
         </div> 
         <div data-aos="fade-up" data-aos-delay="100">
         <p><h3 style="color:#173b6c; line-height: 200%;">Enabling the Hybrid Workforce</h3>
Explore how the Virtual Office platform seamlessly brings together remote and in-person teams,<br> for work that goes wherever you do. Explore hybrid solutions.

<br><br>
<h3 style="color:#173b6c;line-height: 200%;">More Than Just Meetings</h3>
Engage new audiences, elevate customer experiences, and get more done together with our all-in-one communications platform</p>
      <br>
          
<a href="zoom.html" target="_blank"><button class="btn btn-primary">Launch Meeting</button></a>

     </div>   </div>
    </section>
    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio section-bg">
      <div class="container">

        <div class="section-title" >
          <h2>Chat</h2>
          </div>
<form method="post" action="session2" id="myform" target="_blank">
<input type="hidden" id="id" name="idr" value="b"> 
<input type="hidden" id="name" name="receiver" value="a">

<tr><th>username:</th></tr><br>
<% 
try{
PrintWriter printWriter=response.getWriter();
String sender=(String)session.getAttribute("username");
String ids=(String)session.getAttribute("userid");
//System.out.println("sender:"+sender);
//System.out.println("ids:"+ids);
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
PreparedStatement statement1 = con.prepareStatement("SELECT username,userid FROM client where username!="+"'"+sender+"' && dept_id=?");
statement1.setString(1,(String)session.getAttribute("dept_id"));
ResultSet rs = statement1.executeQuery();

while(rs.next()){
PreparedStatement statement2=con.prepareStatement("SELECT COUNT(*) as count from chat where receiverid="+"'"+ids+"'"+" and senderid="+"'"+rs.getString("userid")+"'"+" and decider=0");
ResultSet rs1 = statement2.executeQuery();
rs1.next();
%>
<tr><td><button target="_blank" class="btn btn-primary" type="submit"  value="<%=rs.getString("username") %>|<%=rs.getString("userid") %>" onclick="getval(this.value)"><%=rs.getString("username") %></button><br><br></td>
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
    </section><!-- End Portfolio Section -->

    <!-- ======= todo Section ======= -->
    <section id="todo" class="todo">
      <div class="container">

        <div class="section-title">
          <h2>To-Do</h2>
          </div>
          <div data-aos="fade-up" data-aos-delay="100">
          
       <p> <h3 style="color:#173b6c; line-height: 200%;">A smart daily planner</h3>
Set yourself up for success with My Day, intelligent and personalized suggestions to <br>update your daily or weekly to do list. It is easy to stay on task all day long.</p>
          
          
         
          <a href="FetchTodo?action=todoList"><button  type="submit" class="btn btn-primary">Todo's</button></a>
          
 </div>
      </div>
    </section><!-- End todo Section -->
    
     

    <!-- ======= Testimonials Section ======= -->
    <section id="Upload" class="Upload section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Upload Work</h2>
          </div>
          <div data-aos="fade-up" data-aos-delay="100">
          <p><h3 style="color:#173b6c; line-height: 200%;">Make it easy..</h3>You can store any file in Virtual Office: pictures, drawings, pdf, documents and more.</p>
		<div class="uploadwork">
		<form method="post" action="upload_docs" enctype="multipart/form-data">
		<input type="file" name="file">
		<input type="submit" class="btn btn-primary">
		</form>
		
		</div>
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
     if(rs.next()){  
    	 
    	 String a[]=rs.getString("dept_id").split("-");
    	 String s= "Select org_name from organizations where orgid=?";
         pstmt = con.prepareStatement(s);
         pstmt.setInt(1,rs.getInt("orgid"));
         ResultSet r=pstmt.executeQuery();  
         if(r.next()){
    	String org_name=r.getString("org_name");
    	// String temp;
    	 session.setAttribute("temp",rs.getInt("orgid")); /* 
    	 out.print(session.getAttribute("temp")); */
    	 String path="Profile_images/"+org_name+"/"+a[0]+"/"+rs.getString("filename");
     %>
        <div class="section-title">
          <h2>Profile</h2>
          <!-- <p>Some TEXT !!!! 
          </p> -->
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
             <input type="hidden" name="flag" value="index">
             <br>  <br>
             <input type="submit" class="btn btn-primary" value="Upload" >
             </form>
          </div>
          <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
            <h3>DETAIL OF EMPLOYEEE </h3>
            <p class="fst-italic">
              
            </p>
            <%String city;
            if(rs.getString("city")!=null){ %> 
                  <% city=rs.getString("city").toUpperCase();
                  }
            else{ city="";}%>
            <div class="row">
              <div class="col-lg-6">
                <ul>
                  <li><i class="bi bi-chevron-right"></i> <strong>Name :</strong> <span><%=rs.getString("username").toUpperCase() %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Dob :</strong> <span><%=rs.getDate("dob") %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Phone :</strong> <span> <%=rs.getString("mobile")%></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>City :</strong> <span></span><%=city %></li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul>
                
         <li><i class="bi bi-chevron-right"></i> <strong>Company Name :</strong> <span><%=org_name %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Department Id :</strong> <span><%=rs.getString("dept_id") %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Department Name :</strong> <span><%=a[0] %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Email Id :</strong> <span><%=rs.getString("email").toUpperCase() %></span></li> 
                  
                </ul>
              </div>
            </div><h3>Update Profile</h3>
                   <a href="update_profile.jsp"><button  type="submit" class="btn btn-primary">Update</button></a>
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
          public String epath;
          public String epath2;%>
<%

try
{ Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  
	String sql="select dept_id,orgid from client where email=? ";
	  
	PreparedStatement ps=con.prepareStatement(sql);
	 ps.setString(1,(String)session.getAttribute("email"));
	 ResultSet rs=ps.executeQuery();
	 if(rs.next())
	 {
	 String dept_name[]=rs.getString(1).split("-");
	 int orgid=rs.getInt(2);
	 PreparedStatement p=con.prepareStatement("select org_name,org_email,no_depts from organizations where orgid=? ");
	 p.setInt(1,orgid);
	 ResultSet r=p.executeQuery();
	 while(r.next()){
		 epath="Profile_images/"+r.getString(1)+"/";
		 PreparedStatement pre=con.prepareStatement("select filename from client where orgid=? and admin=? ");
		 pre.setInt(1,orgid);
		 pre.setString(2,"Y");
		 ResultSet res=pre.executeQuery();
		 res.next();
		 epath2="Profile_images/"+r.getString(1)+"/"+res.getString("filename");
	 %>
        <div class="row">
          <div class="col-lg-4" data-aos="fade-right">
            <img src=<%=epath2%> class="img-fluid" alt="">
          </div>
          <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
            <h3><%=r.getString(1).toUpperCase() %> ON <%=dept_name[0] %></h3>
            <!-- <p class="fst-italic">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua.
            </p> -->
            <%PreparedStatement pr=con.prepareStatement("select dept_name from departments where orgid=?");
            pr.setInt(1,Integer.parseInt(dept_name[1]));
            ResultSet rr=pr.executeQuery();
            
            %>
            <div class="row">
              <div class="col-lg-6">
                <ul>
                 <li><i class="bi bi-chevron-right"></i> <strong>Company Name:</strong> <span><%=r.getString("org_name").toUpperCase() %></span></li>
                  <li><i class="bi bi-chevron-right"></i> <strong>Company Email_Id:</strong> <span><%=r.getString("org_email").toUpperCase() %></span></li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul>
                <li><i class="bi bi-chevron-right"></i> <strong>Department Name</strong> <%=dept_name[0] %><span></span></li>
                   <li><i class="bi bi-chevron-right"></i> <strong>Departments:</strong><br><%int i=1; while(rr.next()){ %><span><%=i+". "+rr.getString("dept_name") %>,<%i++;} %></span></li>
                  
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
			
	 <br><br>
	 
	 <table id="customers" >
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
		 if(r2.getString("dept_id")==null){continue;}
		 String b[]=r2.getString("dept_id").split("-");
		  
		 String t=epath+b[0]+"/"+r2.getString("filename");
		 
	 %>
	 <tr>
	 
    <td><img src=<%=t %> alt="Image Not Available"style="max-height: 190px;
    min-height: 190px;
    max-width: 190px;
    min-width: 190px;"><!-- class="img-thumbnail" --></td>
    <td><%=r2.getString("username") %></td>
    <td><%=r2.getString("email") %></td>
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
          <input type="hidden" value="index" name="trigger">
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