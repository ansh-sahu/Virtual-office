package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Activated
 */
public class Activated extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Activated() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
      
    //  String email="Vijay@gmail.com";
 
        int id = 1;
			System.out.println(id);
			String email=request.getParameter("email");
			String selectedItem="";
			
				selectedItem =(String)(request.getParameter("ndept_name"));
			   System.out.print("dept-----"+selectedItem);
			
          try{
 
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
              PreparedStatement ps=con.prepareStatement("update client set s_code=?,dept_id=? where email=?");
              
              ps.setInt(1,id);
              ps.setString(2, selectedItem);
              ps.setString(3,email);
              
              
          	System.out.println("Inside loop"+email);
              
             int i=ps.executeUpdate();
             System.out.println("Inside"+i);
              if(i>0)
              { 
               
                  System.out.println("Successfully registered");
                  PreparedStatement p1=con.prepareStatement("delete from permission where useremail=?");
                  p1.setString(1,email);
                  int j=p1.executeUpdate();
                  if(j>0) {
                  out.println("<html><body><script>alert(\"User Authenticated...!!!\");\n" +
                          "window.location='department.jsp'\n</script></body><html>");
                  }
                  else
                  {
                	  out.println("<html><body><script>alert(\"Not delete from permission tabble...!!!\");\n" +
                              "window.location='department.jsp'\n</script></body><html>");
                  }
             // response.sendRedirect("User_Login.html");  
              
              }else
                  {
                  out.println("<html><body><script>alert(\"User already exist...\");\n" +
      			          "window.location='department.jsp'\n</script></body><html>");
                  
              
               }
              
              
          }catch(Exception e)
  		{
  			e.printStackTrace();
  		}
	}



}
