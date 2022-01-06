package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class forgetservlet
 */
public class forgetservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgetservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
		String email=request.getParameter("email");
		String dob=request.getParameter("dob");
		String ntype=request.getParameter("ntype");
		String pass=request.getParameter("pass");
		System.out.print(email+""+ntype+""+dob);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
            PreparedStatement ps2=con.prepareStatement("update client set password=? where (email=? and dob=?)");
            ps2.setString(1,pass);
            ps2.setString(2,email);
            ps2.setString(3,dob);
            int i=ps2.executeUpdate();
            if(i>0)
            	out.println("<html><body><script>alert(\"Your Password is Reset!!...\");\n" +
                        "window.location='Login.jsp'\n</script></body><html>");
            else 
            	out.println("<html><body><script>alert(\"Data Not Matched!!...\");\n" +
                        "window.location='forget_pass.jsp'\n</script></body><html>");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
