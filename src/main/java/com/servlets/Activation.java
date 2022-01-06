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
 * Servlet implementation class Activation
 */
public class Activation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Activation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
//		int org_id=44;//Example
	HttpSession session=request.getSession();
	int org_id=(int)session.getAttribute("orgid");
		 try{
       	  Class.forName("com.mysql.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
       	  String sql = "SELECT * FROM permission WHERE orgid = ?";
             PreparedStatement statement = con.prepareStatement(sql);
             statement.setInt(1, org_id);
             	ResultSet result = statement.executeQuery();
             	PrintWriter out = response.getWriter();
        		out.print("<html><head> <link rel=\"stylesheet\" href=\"css/tableUser.css\"><link rel=\"stylesheet\" href=\"css/style.css\"></head><body>\n" + "\n");
        		out.print("<table id = customers>");
        		out.print(
        				"<caption><b><h1 style=\" color:#008CBA;\">Todo List<hr><br><a href=\"todoform.html\"><button class=\"button button2\" style=\"margin-right:940px;\">Add Todo</button></a></h1></b></caption>");
        		out.print("<tr>");
        //<link rel="stylesheet" href="style.css">
        		out.print(" <th> Organization Id</th>");
        		out.print(" <th> Username </th>");
        		out.print("<th> Email </th>");
        		out.print("<th>Organization Name </th>");
        		out.print("<th> Department Name </th>");
        		out.print("<th> Action </th>");

        		out.print("</tr>");
                         
        		while(result.next()) {
            	 out.print("<tr>");
     			out.print("<td>" +result.getInt("orgid") + "</td>");
     			out.print("<td>" + result.getString("username") + "</td>");
     			out.print("<td>" + result.getString("useremail") + "</td>");
     			out.print("<td>" + result.getString("org_name") + "</td>");
     			out.print("<td> </td>");
     			out.print("<td><center><a href=\"Activated?id=1&email=" + result.getString("useremail")
     					+ "\"><button class=\"button button2\" id=\"1\">Accept</button></a>\n"
     					+ "<a href=\"#\"><button class=\"button button1\">Reject</button></a></center></td>");        
     				
     			out.print("</tr>");
             
			
             }	 out.print("</table>");
     		out.print("</body></html>");
    		
             
         }catch(Exception e)
 		{
 			e.printStackTrace();
 		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
