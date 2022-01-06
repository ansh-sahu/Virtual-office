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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class head_update
 */
public class head_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public head_update() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 PrintWriter out = response.getWriter();
		String email;
		String dept_id=request.getParameter("dept_id");
		Integer orgid=Integer.parseInt(request.getParameter("orgid"));
		if(request.getParameter("dept_name")!=null)
		{
		   email=(String)(request.getParameter("emp_name"));
		   System.out.print(email);
		   try {
			   Class.forName("com.mysql.jdbc.Driver");
	     		  Connection con=DriverManager.getConnection(  
	    		 "jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");
	     		  PreparedStatement pre=con.prepareStatement("update departments set dept_head=? where dept_id=? and orgid=?");
	     		 pre.setString(1, email);
	     		 pre.setString(2, dept_id);
	     		 pre.setInt(3, orgid);
	     		  
	    		  int rs=pre.executeUpdate();
	    		  if(rs>0)
	    		  {
	    			  out.println("<html><body><script>alert(\"Head of Departments is Update\");\n" +
	                          "window.location='department.jsp'\n</script></body><html>");
	    			  
	    		  }
	    		  else
	    		  {
	    			  out.println("<html><body><script>alert(\"Head of Departments is Not Update!!!...\");\n" +
	                          "window.location='department.jsp'\n</script></body><html>");
	    			  
	    		  }
		   }catch (Exception e) {
			// TODO: handle exception
			   e.printStackTrace();
		}
		   
	}
	}

}
