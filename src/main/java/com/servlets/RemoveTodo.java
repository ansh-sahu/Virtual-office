package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RemoveTodo extends HttpServlet {

 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
          PrintWriter out = response.getWriter();
          int id = Integer.parseInt(request.getParameter("id"));
             
           
          try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
                 PreparedStatement ps=con.prepareStatement("delete from todos where t_id=?");
                 
                ps.setInt(1,id);
               
               
                 int i=ps.executeUpdate();
                 if(i>0)
                 { 
                   out.println("<script> alert('Task Deleted')</script>\";\n" +
                        "<script>window.location='FetchTodo?action=todoList'</script>\";");
                  
                 }else
                     {
                               out.println("<script> alert('Task not found')</script>\";\n" +
                            "<script>window.location='FetchTodo?action=todoList'</script>\";");
                     }
                 
                   
             }catch (        ClassNotFoundException | SQLException e2) {System.out.println(e2);}
      

    }

 
}
