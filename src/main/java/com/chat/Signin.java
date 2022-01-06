package com.chat;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class signin
 */
@WebServlet("/Signin")
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user=request.getParameter("username");
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
		PreparedStatement statement1 = con.prepareStatement("SELECT userid FROM client where username="+"'"+user+"'");
		ResultSet rs = statement1.executeQuery();
		rs.next();
		String ids=rs.getString("userid");
		HttpSession session=request.getSession();  
		session.setAttribute("sender", user);
		session.setAttribute("ids", ids);
		response.sendRedirect("chat.jsp");
		}
		catch (Exception e) 
		{

			e.printStackTrace();
		}
	}

}

