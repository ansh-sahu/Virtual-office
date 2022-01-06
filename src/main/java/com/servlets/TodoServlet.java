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
import javax.servlet.http.HttpSession;


public class TodoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TodoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
      
      
 
          
          try{

        	  String title=request.getParameter("title");
        	  String description=request.getParameter("description"); 
        	  String target_Date=request.getParameter("targetDate");
        	  String is_Done=request.getParameter("isDone");
        	  //String username=request.getParameter("username");

        	  HttpSession session=request.getSession();
        	  String usesname=(String)session.getAttribute("email");
        	



              
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
              PreparedStatement ps=con.prepareStatement("insert into todos(description,is_Done,target_Date,username,title)values(?,?,?,?,?)");
              
              ps.setString(1,description);
              ps.setString(2,is_Done);
              ps.setString(3,target_Date);
              ps.setString(4,usesname);
              ps.setString(5,title);
         
              
            
              int i=ps.executeUpdate();
              if(i>0)
              { 
                //out.println(f);out.println(m);
                  
                  out.println("<html><body><script>alert(\"Task is Added!!!\");\n" +
                          "window.location='FetchTodo?action=todoList'\n</script></body><html>");
                  
             // response.sendRedirect("User_Login.html");  
              }else
                  {
                  out.println("<html><body><script>alert(\"User already exist...\");\n" +
      			          "window.location='UserSignup.jsp'\n</script></body><html>");
                  
              
               }
              
          }catch(Exception e)
  		{
  			e.printStackTrace();
  		}
	}

}
