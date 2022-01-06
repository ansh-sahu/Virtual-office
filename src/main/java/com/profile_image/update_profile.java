package com.profile_image;

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
 * Servlet implementation class update_profile
 */
public class update_profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_profile() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  PrintWriter out = response.getWriter();
		String city=request.getParameter("city");
		String add=request.getParameter("add");		
		try
		  {
			String mob=request.getParameter("mob");
			HttpSession session=request.getSession();
		  
		  
		  Class.forName("com.mysql.jdbc.Driver");
	      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
		  
	      PreparedStatement p = con.prepareStatement("update client set address=?,city=?,mobile=? where email=?");
	      p.setString(1, add);
	      p.setString(2, city);
	      p.setString(3, mob);
	      p.setString(4, (String)session.getAttribute("email"));
	      int r=p.executeUpdate();
	      if(r>0)
	      {
	    	  out.println("<html><body><script>alert(\"Updated Successfully\");\n" +
                      "window.location='index.jsp'\n</script></body><html>");
	      }
	      else
	      {
	    	  out.println("<html><body><script>alert(\"Not Updated!!---\");\n" +
                      "window.location='update_profile.jsp'\n</script></body><html>");
	      }
	      }catch (Exception e) {
			// TODO: handle exception
	    	  e.printStackTrace();
		}
	}

}
