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
 * Servlet implementation class feedback
 */
public class feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public feedback() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out=response.getWriter();
		try {
			
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String sub=request.getParameter("subject");
		String msg=request.getParameter("message");
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","root@123");  
		String sql="insert into feedback(name,email,sub,msg)values(?,?,?,?) ";
		  
		PreparedStatement ps=con.prepareStatement(sql);
		 ps.setString(1,email);
		 ps.setString(2,name);
		 ps.setString(3,sub);
		 ps.setString(4,msg);
		 int rs=ps.executeUpdate();
		 String trigger=request.getParameter("trigger");
		 System.out.print(trigger);
		 if(rs>0) {
			 if(trigger.equals("head"))
			 out.println("<html><body><script>alert(\"Feedback Submitted---\");\n" +
	           		  "window.location='head.jsp'\n</script></body><html>");
			 if(trigger.equals("index"))
				 out.println("<html><body><script>alert(\"Feedback Submitted---\");\n" +
		           		  "window.location='index.jsp'\n</script></body><html>"); 
			 if(trigger.equals("department"))
				 out.println("<html><body><script>alert(\"Feedback Submitted---\");\n" +
		           		  "window.location='department.jsp'\n</script></body><html>"); 
		 }else
		 {
			 out.println("<html><body><script>alert(\"Not Submitted---\");\n" +
	           		  "window.location='index.jsp'\n</script></body><html>"); 
		 }
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
