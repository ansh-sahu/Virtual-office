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
 * Servlet implementation class feeddata
 */
public class feeddata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public feeddata() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
      
        int userid=0;
        String username="";
          String Companyname=request.getParameter("company");
          HttpSession session=request.getSession();
    	  String email=(String)session.getAttribute("email");
//          String email="aakash@gmail.com";
          System.out.println(Companyname);
          try{
        	  Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
        	  String sql = "SELECT orgid FROM organizations WHERE org_name = ?";
              PreparedStatement statement = con.prepareStatement(sql);
              statement.setString(1, Companyname);
            
              
              ResultSet result = statement.executeQuery();

              if (result.next()) {
            	   userid=result.getInt("orgid");
            	   PreparedStatement p=con.prepareStatement("update client set visit=?,orgid=? where email=?");
           	     p.setInt(1,1);
           	     p.setInt(2, userid);
           	     p.setString(3,(String)session.getAttribute("email"));
           	     int i=p.executeUpdate();
           	     System.out.print(i);
            	  System.out.println("UserID"+userid);
              
			
              }	 
              
          }catch(Exception e)
  		{
  			e.printStackTrace();
  		}
          try{
        	  Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
        	  String sql = "SELECT username FROM client WHERE email = ?";
              PreparedStatement statement = con.prepareStatement(sql);
              statement.setString(1, email);
            

              ResultSet result = statement.executeQuery();

              if (result.next()) {
            	 username=result.getString("username");
            	  System.out.println("Username"+username);
              
                 
              }	 
              
          }catch(Exception e)
  		{
  			e.printStackTrace();
  		}
          
          
          try{

              
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
              PreparedStatement ps=con.prepareStatement("insert into permission (orgid,username,useremail,org_name)values(?,?,?,?)");
              
              ps.setInt(1,userid);
              ps.setString(2,username);
              ps.setString(3,email);
              ps.setString(4,Companyname);
             
              
              int i=ps.executeUpdate();
              if(i>0)
              { 
                  session.invalidate();
                  out.println("<html><body><script>alert(\"Your Data is Recorded\");\n" +
                          "window.location='Login.jsp'\n</script></body><html>");
                  
              }else
                  {
            	  session.invalidate();
                  out.println("<html><body><script>alert(\" Your Data is not Recorded!!!!----\");\n" +
      			          "window.location='Signup.jsp'\n</script></body><html>");
              
               }
              
          }catch(Exception e)
  		{
  			e.printStackTrace();
  		}
          
	}

}
