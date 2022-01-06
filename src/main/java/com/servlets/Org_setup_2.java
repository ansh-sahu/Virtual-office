package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Org_setup_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Org_setup_2() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();  

        PrintWriter out = response.getWriter();

		System.out.println("INSIDE ORG SETUP2==1");
		int n=(int)session.getAttribute("no_depts");
		System.out.println("INSIDE ORG SETUP2==2"+n);
		String userid=(String)session.getAttribute("userid");
		int orgid=(int)session.getAttribute("orgid");
		System.out.println("INSIDE ORG SETUP 2"+orgid);
		//Integer n=(Integer)session.getAttribute("no_depts");
		
		for(int i=0;i<n;i++)
		{
			String dept_name=request.getParameter("dept_name_"+i);
			String deptid=dept_name+"-"+orgid;
			int dept_mem=Integer.parseInt(request.getParameter("dept_mem_"+i));
			String dept_head=request.getParameter("dept_head_"+i);
			try {
				System.out.println(dept_name);
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
		    PreparedStatement ps=(PreparedStatement) con.prepareStatement("insert into departments(dept_name,dept_mem,dept_head,orgid,userid,dept_id)values(?,?,?,?,?,?)");
		    ps.setString(1,dept_name);
            ps.setInt(2,dept_mem);
            ps.setString(3,dept_head);
            ps.setInt(4,orgid);
            ps.setString(5,userid);
            ps.setString(6,deptid);
           
            int k=ps.executeUpdate();
            if(k>0)
            { 
            	 session.setAttribute("head", "1");
                out.println("<html><body><script>alert(\"Departments are Created\");\n" +
                        "window.location='department.jsp'\n</script></body><html>");
                
            }else
                {
                out.println("<html><body><script>alert(\"User already exist...\");\n" +
    			          "window.location='department.jsp'\n</script></body><html>");
            
             }
            
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		
	}

}
