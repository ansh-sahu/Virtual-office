package com.work;

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
 * Servlet implementation class assigntask
 */
public class assigntask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public assigntask() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title=request.getParameter("task_des");
		String emp_id=request.getParameter("emp_name");

        PrintWriter out = response.getWriter();
		try
		  {
		  HttpSession session=request.getSession();
		  String dept_id=(String)session.getAttribute("dept_id");
		  String head_id=(String) session.getAttribute("userid");
		  Class.forName("com.mysql.jdbc.Driver");
	      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
		  String sql = "insert into tasks (dept_id,head_id,task,userid)values(?,?,?,?)";
	      PreparedStatement statement = con.prepareStatement(sql);
	      statement.setString(1, dept_id);
	      statement.setString(2, head_id);
	      statement.setString(3, title);
	      statement.setString(4, emp_id);
	      int result = statement.executeUpdate();
	      if(result>0)
	      {System.out.print("Inserted Task");
	      //String sql = ;
	      PreparedStatement ss = con.prepareStatement("select email from client where userid=?");
	      ss.setString(1, emp_id);
	      ResultSet rr=ss.executeQuery();
	      if(rr.next())
	      {
	      
	      PreparedStatement s = con.prepareStatement("insert into todos(is_Done,target_Date,username,title)values(?,?,?,?)");
s.setString(1, "Progress..");
s.setString(2,"2021-11-25");
s.setString(3,rr.getString("email"));
s.setString(4, title);
	      int r= s.executeUpdate();
	      if(r>0)  out.println("<html><body><script>alert(\"Task added in employees task\");\n" +
                  "window.location='head.jsp'\n</script></body><html>");
          
	      }
	      
	    	  }
	      else
	      {
	    	  out.println("<html><body><script>alert(\"Task not added\");\n" +
                      "window.location='head.jsp'\n</script></body><html>");
              
	      }
	      }catch (Exception e) {
			// TODO: handle
	    	  e.printStackTrace();
		}
	}

}
