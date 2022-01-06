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
//System.out.println(session.getAttribute("orgid"));
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
	PreparedStatement p2=con.prepareStatement("select no_depts from organizations where orgid=?");
	p2.setInt(1, r.getInt("orgid"));
	ResultSet r2=p2.executeQuery();
	r2.next();
	session.setAttribute("no_depts", r2.getInt("no_depts"));
		 session.setAttribute("orgid", r.getInt("orgid"));
		 System.out.print(r.getInt("orgid"));
		 System.out.print(r2.getInt("no_depts"));
}catch(Exception e)
{
	e.printStackTrace();
	}
}
else
{
	try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");  

System.out.println("Inside else");
 String sql="select org_name,no_depts from organizations where orgid=?";
 PreparedStatement p=con.prepareStatement(sql);
 p.setInt(1,(int)session.getAttribute("orgid"));

 System.out.println("Inside else");
 ResultSet rs=p.executeQuery();
 rs.next();%>
  <div class="profile">
       <!--  <img src="assets/img/profile-img.jpg" alt="" class="img-fluid rounded-circle">
        -->
        <br><br> 
        <h1 class="text-light"><%=rs.getString("org_name") %></h1>
        <%
        session.setAttribute("org_name", rs.getString("org_name"));
        session.setAttribute("no_depts", rs.getInt("no_depts"));
        System.out.println(rs.getString("org_name"));
        System.out.println(rs.getString("no_depts"));
	//System.out.print((int)session.getAttribute("no_depts"));
}catch(Exception e)
	{
	e.printStackTrace();
	}
}
%>
        
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
         <%if((String)session.getAttribute("head")=="1"){ %>
          <li><a href="#DepartmentHead" class="nav-link scrollto"><i class="bi bi-diamond"></i><span>Department Head</span></a></li>      
          <%} 
          else
          {%>
           <li><a href="#Department" class="nav-link scrollto"><i class="bx bx-chat"></i><span>Department</span></a></li> 
          <%} %>
          
          <li><a href="#Employees" class="nav-link scrollto"><i class="bi bi-person-check"></i> <span>Employees</span></a></li>
          <li><a href="#NewEmployee" class="nav-link scrollto"><i class="bi bi-bell"></i> <span>New Employee</span></a></li>
          
          
          <li><a href="#Profile" class="nav-link scrollto"><i class="bi bi-person-square"></i> <span>Profile</span></a></li>
          <li><a href="Logout" class="nav-link scrollto"><i class="bi bi-door-closed"></i> <span>Logout</span></a></li>
        </ul>
      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->
  <section id="hero r" class="d-flex flex-column justify-content-center align-items-center r">
    <div class="hero-container-r" style="background-image: url('../img/hero-bg.jpg')" data-aos="fade-in">
      <h1><b>Virtual Office</b></h1>
      <p>It contains <span class="typed" data-typed-items="Video Conferrencing,Chats,Upload works,Task add"></span></p>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <%if((String)session.getAttribute("head")=="1"){ %>
    <section id="DepartmentHead" class="facts">
      <div class="container">

        <div class="section-title">
          <h2>Department Head</h2>
           </div>

<%if(request.getParameter("dept_name")==null){ %>
<label for="dept_name">Department Name</label>
    <form action="department_head" method="post">
<%
System.out.println("inside dropdown");
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");  

 String sql="select dept_name,dept_id from departments where orgid=?";
 PreparedStatement pr=con.prepareStatement(sql);
 pr.setInt(1,(int)session.getAttribute("orgid"));
 ResultSet rs=pr.executeQuery();

System.out.println("inside dropdown");
 %>   <select name="dept_name" id="boldish" required>
     <option>Please choose Department</option>
     <%
 while(rs.next())
 {
     String name=rs.getString(1);

     String id=rs.getString(2);
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
System.out.print(e);
}
%>
  <br/>
    <br/>
    <input type="Submit" class="btn btn-primary">
    </form>
    <%}

else
{
	String id=request.getParameter("dept_name");////dept_id
	String[] words=request.getParameter("dept_name").split("-");//dept_name

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
		  p1.setString(1, r.getString("dept_head"));

	 		 ResultSet r1=p1.executeQuery();
		  while(r1.next()){
	  
	  %>
  <tr>
    <td><%=r.getString("dept_id")%></td>
    <td><%=r.getString("dept_name")%></td>
    <td><%=r1.getString("dept_head")%></td>
    <td><%=r.getInt("dept_mem")%></td>
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
<label for="emp_name">Employee Name</label>
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
    <input type="hidden" value="<%=(int)session.getAttribute("orgid") %>" name="orgid"><!--  CHANGE IT EXAMPLE_______________-----------------------______ -->
    <input type="Submit" class="btn btn-primary">
    </form>
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
if((int)session.getAttribute("no_depts")!=0){

 n=(int)session.getAttribute("no_depts");
}
else
{
	try

{
    Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection(  
	 "jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");
	  PreparedStatement p=con.prepareStatement("select no_depts from organizations where  orgid=?");
	  p.setString(1,(String)session.getAttribute("orgid") );
	
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
<br>
<label>Department Name</label>
<br>
<input type="text" name="dept_name_<%=i%>">
<br>
<label>No of Members in department</label>
<br>
<input type="text" name="dept_mem_<%=i%>">
<br>
<br>
<%if(i+1!=n)
	{%>
****************************************************
<% }}%>
<br>
<input type="Submit" id="button" value="submit">
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
 p.setInt(1,(int)session.getAttribute("orgid"));/* EXAMPOLEEEEEEEEEEEEEEEEEEEEEE  */
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
     <select name="ndept_name" id="boldish" required>
     <option>Please choose Employee</option>
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
</select></td>

    <td>  <input type="hidden" name="email" value="<%=r.getString("useremail")%>">
     <input type="Submit"  value="Accept">
     
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
----------------------------------
<%

    
int n=(int)session.getAttribute("no_depts");
System.out.print("value"+n);

%>

</body>
</html>