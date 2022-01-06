package com.servlets;

import java.io.IOException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

/**
 * Servlet implementation class RegisterServlet
 */
//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		  out.println("hyy");
		try {
			 HttpSession session=request.getSession();  
//	         session.setAttribute("userid","111");
//	         String userid=(String)session.getAttribute("userid");
			 String userid="111";
			String res=request.getParameter("register");
			out.println(res);
			 Class.forName("com.mysql.jdbc.Driver");
		     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
			 String sql;
		      if(res.contentEquals("employee")) {
				 sql = "UPDATE client SET admin = 'N', employee= 'Y' WHERE userid ="+userid;
				 PreparedStatement statement1 = con.prepareStatement(sql);
			       statement1.executeUpdate();
			      out.println("hyy");
			      response.sendRedirect("adminform.jsp");
			       
			      
			}
		      else {
		    	  sql = "UPDATE client SET admin = 'N', employee= 'Y' WHERE userid ="+userid;
		    	  PreparedStatement statement1 = con.prepareStatement(sql);
			       statement1.executeUpdate();
			       out.println("h");
		      }
			 
		}
		catch (Exception e) {
			  System.out.print(e);
		}
	}

}