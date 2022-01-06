package com.servlets;

import java.text.SimpleDateFormat;  
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
      
      
 
          
          try{

        	  String name=request.getParameter("your_name");
        	  String date=request.getParameter("date");
        	 // Date date=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
        	  String mobile=request.getParameter("mobile"); 
        	  String address=request.getParameter("Address");
        	  String city=request.getParameter("City");
        	  String state=request.getParameter("State");
              String email=request.getParameter("Mail");  
              String password=request.getParameter("your_pass");
//             
//System.out.println(name);
//System.out.println(date);
//System.out.println(mobile);
//System.out.println(address);
//System.out.println(city);
//System.out.println(state);
//System.out.println(email);
//System.out.println(password);


              
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
              PreparedStatement ps=con.prepareStatement("insert into UserDetail(name,date,mobile,address,city,state,email,password,s_code)values(?,?,?,?,?,?,?,?,?)");
              
              ps.setString(1,name);
              ps.setString(2,date);
              ps.setString(3,mobile);
              ps.setString(4,address);
              ps.setString(5,city);
              ps.setString(6,state);
              ps.setString(7,email);
              ps.setString(8,password);
              ps.setInt(9,0);
              
              int i=ps.executeUpdate();
              if(i>0)
              { 
                  
                  out.println("<html><body><script>alert(\"Your Data is Recorded\");\n" +
                          "window.location='Login.html'\n</script></body><html>");
                  
              }else
                  {
                  out.println("<html><body><script>alert(\"User already exist...\");\n" +
      			          "window.location='UserSignup.jsp'\n</script></body><html>");
              
               }
              
          }catch(Exception e)
  		{
  			e.printStackTrace();
  		}
          
      }
      }
	
         
		
      
	
	

