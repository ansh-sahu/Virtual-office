package com.servlets;
import javax.servlet.http.*;  
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
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();

	try
	  {
	  String email=request.getParameter("email");
	  String pass=request.getParameter("pass");
	  
	  Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
	  String sql = "SELECT * FROM client WHERE email = ? and password = ?";
      PreparedStatement statement = con.prepareStatement(sql);
      statement.setString(1, email);
      statement.setString(2, pass);

      ResultSet result = statement.executeQuery();

      if (result.next()) {
    	  HttpSession session=request.getSession();  
          session.setAttribute("email",email);
          session.setAttribute("username",result.getString("username"));
          session.setAttribute("userid",result.getString("userid"));
          
          String sql2 = "SELECT admin,visit,s_code,orgid FROM client WHERE email = ? and password = ?";
          PreparedStatement statement2 = con.prepareStatement(sql2);
          statement2.setString(1, email);
          statement2.setString(2, pass);
          ResultSet res = statement2.executeQuery();
          if (res.next())
          { 
        	  session.setAttribute("orgid", res.getInt("orgid"));
        	  int visit = res.getInt("visit");
        	  String admin = res.getString("admin");
        	  if(visit==0) {
        		  response.sendRedirect("one-index.jsp");
        	  }
        	  else if(visit!=0)
        	  {
        		  if(admin.equals("Y")||admin.isEmpty())
        		  { 
        			  PreparedStatement s = con.prepareStatement("Select no_depts from organizations where orgid=?");
                  statement2.setString(1, email);
        			  
        			  response.sendRedirect("department.jsp");  
        		  }
        		  else
        		  {
        			  PreparedStatement p3=con.prepareStatement("Select * from departments where dept_head=?");
        	          p3.setString(1, email);
        	          ResultSet r3=p3.executeQuery();
        	          if(r3.next())
        	          {
        	        	  session.setAttribute("dept_id", r3.getString("dept_id"));
        	        	  response.sendRedirect("head.jsp");
        	          }
        			  if(res.getInt("s_code")!=0)
        		  response.sendRedirect("index.jsp");  
        			  else 
        			  {
        				    out.println("<html><body><script>alert(\"Wait for Admin Authenticaton....\");\n" +
        	                          "window.location='Login.jsp'\n</script></body><html>");
        				 // out.print("Wait for Admin Accept");
        			  }
        		  }
        	  }
          }
         
      }
      else
      {
			/*
			 * out.println("<script type=\"text/javascript\">");
			 * out.println("alert('User or password incorrect');");
			 * out.println("</script>");
			 */
    	    out.println("<html><body><script>alert(\"Username or Password incorrect!!!!\");\n" +
                    "window.location='Login.jsp'\n</script></body><html>");
         // response.sendRedirect("Login.jsp");
      }
	  
      
	  
	  
  }catch (Exception e) {
	  System.out.print(e);
}
  
  }

}

