package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Org_setup_1
 */
//@WebServlet("/Org_setup_1")
public class Org_setup_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Org_setup_1() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		  out.println("hyy");
		try {

			String hidden=request.getParameter("hiddened");
			 HttpSession session=request.getSession();  
	        // session.setAttribute("userid","1195");	//example
	         String userid=(String)session.getAttribute("userid");
	         
			String org_name=request.getParameter("org _name");
			int no_depts=Integer.parseInt(request.getParameter("no_of_depts"));
			String date_creation=request.getParameter("creation_date");
			System.out.print(date_creation);
			int no_employee=Integer.parseInt(request.getParameter("no_of_employees"));
			String email_org=request.getParameter("org_email");
			
			session.setAttribute("no_depts",no_depts);
			 Class.forName("com.mysql.jdbc.Driver");
		      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
		
		      PreparedStatement ps=(PreparedStatement) con.prepareStatement("insert into organizations(userid,org_name,no_depts,no_employee,org_date,org_email)values(?,?,?,?,?,?)");
		      //java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(date_creation);
              ps.setString(1,userid);
               ps.setString(2,org_name);
              ps.setInt(3,no_depts);
              ps.setInt(4,no_employee);
              ps.setString(5, date_creation);
              //ps.setDate(5,new java.sql.Date(date.getDate()));
              ps.setString(6,email_org);
              ps.executeUpdate();
              PreparedStatement p1=(PreparedStatement) con.prepareStatement("Select MAX(orgid) from organizations");
              ResultSet rs=p1.executeQuery();
              rs.next();
              int orgid=rs.getInt("MAX(orgid)");
              System.out.print(orgid);
              System.out.print(hidden);
              session.setAttribute("orgid",orgid);
              session.setAttribute("hidden",hidden);
              session.setAttribute("dept_name", null);
              PreparedStatement ps1=(PreparedStatement) con.prepareStatement("Update client set admin=?,employee=?,orgid=? where email=?");
		      ps1.setString(1, "Y");
		      ps1.setString(2, "N");
		      ps1.setInt(3,orgid);
		      ps1.setString(4, (String)(session.getAttribute("email")));
		      ps1.executeUpdate();
		      PreparedStatement p=con.prepareStatement("update client set visit=? where email=?");
	    	     p.setInt(1,1);
	    	     p.setString(2,(String)session.getAttribute("email"));
	    	     int i=p.executeUpdate();
	    	     System.out.print(i);
             
              response.sendRedirect("department.jsp");
	
		}
		catch (Exception e) {
			  System.out.print(e);
		}

}
}