package com.servlets;
import javax.servlet.http.*; 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class connectiongoogle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public connectiongoogle() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        PrintWriter out = response.getWriter();
		
		 int flag=Integer.parseInt(request.getParameter("flag"));
		  int vo;
		  String userid;
		if(flag==1)
		{
		 try {
	            String name = request.getParameter("your_name");
	            String date=request.getParameter("date");
				Date dob = new SimpleDateFormat("yyyy-MM-dd").parse(date);
	            String email = request.getParameter("email");
	            String pass=request.getParameter("your_pass");
	            String re_pass=request.getParameter("re_pass");
	            String typeof=request.getParameter("typeof");
	            System.out.print(typeof);
	            if(pass.equals(re_pass)) 
	            {
	            Class.forName("com.mysql.jdbc.Driver");
	        	   Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
	        	   PreparedStatement p1=con.prepareStatement("select email from client where email=?");
	        	   p1.setString(1,email);
	        	   ResultSet r=p1.executeQuery();
	        	   if(r.next())
	        	   {
	        		   out.println("<html><body><script>alert(\"Email Id Already Exists\");\n" +
		                          "window.location='Signup.jsp'\n</script></body><html>");
	        	   }else
	        	   {
	           if(typeof.equals("admin"))
	           {
		            
	        	   String sql = "SELECT vo_users FROM client where sno=(SELECT max(sno) from client)";
		              PreparedStatement ps=(PreparedStatement) con.prepareStatement(sql);
		              ResultSet rs=ps.executeQuery();
		              if(rs.next()) {
		              System.out.print(rs.getInt("vo_users"));
		              userid="VO"+rs.getInt("vo_users");
		              vo=rs.getInt("vo_users")+1;}
		              else {userid="VO1";
		              vo=1;
		              }
		              String sql1 = "insert into client(username,userid,email,password,dob,vo_users,admin,employee,visit)values(?,?,?,?,?,?,?,?,?)";
		              PreparedStatement ps1=(PreparedStatement) con.prepareStatement(sql1);
		              ps1.setString(1,name);
		              ps1.setString(2,userid);
		              ps1.setString(3,email);
		              ps1.setString(4,pass);
		              ps1.setDate(5,new java.sql.Date(dob.getTime()));
		              ps1.setInt(6,vo);
		              ps1.setString(7, "Y");
		              ps1.setString(8, "N");
		              ps1.setInt(9, 0);
		              int i=ps1.executeUpdate();
		              if(i>0)
		              { 
		                  
//		                  System.out.print("Inserted");
		            	  out.println("<html><body><script>alert(\"Signup Successfully\");\n" +
		                          "window.location='Login.jsp'\n</script></body><html>");
//		                  response.sendRedirect("Login.jsp");
		                  
		              }else
		                  {
		            	  out.println("<html><body><script>alert(\"Signup Unsuccessfully!!--\");\n" +
		                          "window.location='Signup.jsp'\n</script></body><html>");
//		                  System.out.print("NOT Inserted");
//		                  response.sendRedirect("Signup.jsp");
		              
		               }
	        	   }
	           else if(typeof.equals("emp")) {
	            System.out.println("User name: " + name);
	            System.out.println("User dob: " + dob);
	            System.out.println("User email: " + email);
	            System.out.println("User pass: " + pass);
	              String sql = "SELECT vo_users FROM client where sno=(SELECT max(sno) from client)";
	              PreparedStatement ps=(PreparedStatement) con.prepareStatement(sql);
	              ResultSet rs=ps.executeQuery();
	              if(rs.next()) {
	              System.out.print(rs.getInt("vo_users"));
	              userid="VO"+rs.getInt("vo_users");
	              vo=rs.getInt("vo_users")+1;}
	              else {userid="VO1";
	              vo=1;
	              }
	              
	              ps=(PreparedStatement) con.prepareStatement("insert into client(username,userid,email,password,dob,vo_users,admin,employee,visit)values(?,?,?,?,?,?,?,?,?)");
	              
	              ps.setString(1,name);
	               ps.setString(2,userid);
	              ps.setString(3,email);
	              ps.setString(4,pass);
	              ps.setDate(5,new java.sql.Date(dob.getTime()));
	              ps.setInt(6,vo);
	              ps.setString(7,"N");
	              ps.setString(8,"Y");
	              ps.setInt(9, 0);
	              int i=ps.executeUpdate();
	              if(i>0)
	              { 
	            	  out.println("<html><body><script>alert(\"Signup Successfully\");\n" +
	                          "window.location='Login.jsp'\n</script></body><html>");
	                  //response.sendRedirect("Login.jsp");
	                  
	              }else
	                  {
	                  System.out.print("NOT Inserted");
	                  out.println("<html><body><script>alert(\"Signup Unsuccessfully!!!---\");\n" +
	                		  "window.location='Signup.jsp'\n</script></body><html>");
	              
	               }
		 }
	
	        	   }
		 }else
		 {
			 out.println("<html><body><script>alert(\"Password not matched!!!---\");\n" +
           		  "window.location='Signup.jsp'\n</script></body><html>"); 
		 }
	            }
	          catch(Exception e)
	    		{
	    			e.printStackTrace();
	    		} 
	}
		else
		{
			try {
		String name=request.getParameter("name");	
		String email=request.getParameter("email");	
				userid=request.getParameter("userid");	
		String imageurl=request.getParameter("imageurl");
		
		
		Class.forName("com.mysql.jdbc.Driver");
        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
        
        PreparedStatement ps=(PreparedStatement) con.prepareStatement("Select * from client where userid="+userid);
        ResultSet rs1=ps.executeQuery();
       
        boolean i=rs1.next();
        if(!i)
        {
        
        String sql = "SELECT vo_users FROM client where sno=(SELECT max(sno) from client)";
         ps=(PreparedStatement) con.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
        rs.next();
        ps=(PreparedStatement) con.prepareStatement("insert into client(username,userid,email,imageurl,vo_users,visit)values(?,?,?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, userid);
        ps.setString(3, email);
        ps.setString(4, imageurl);
        ps.setInt(5, rs.getInt("vo_users"));
        ps.setInt(6, 0);
        int j=ps.executeUpdate();
        if(j>0)
        { 
        	HttpSession session=request.getSession();  
            session.setAttribute("email",email);
            session.setAttribute("username",name);
            session.setAttribute("userid",userid);
            session.setAttribute("imageurl",imageurl);
            
        	System.out.print("Inserted using Login");
        	 out.println("<html><body><script>alert(\"Signin Successfully\");\n" +
                     "window.location='index.jsp'\n</script></body><html>");
        	//response.sendRedirect("index.jsp");  
            
        }else
            {
        	out.println("<html><body><script>alert(\"Signin Unsuccessfully!!--\");\n" +
                    "window.location='Login.jsp'\n</script></body><html>");
        	
        	//System.out.print("Not Inserted using Login");
        
         }
        }
        
        else
        {
        	HttpSession session=request.getSession();  
            session.setAttribute("email",rs1.getString("email"));
            session.setAttribute("username",rs1.getString("username"));
            session.setAttribute("userid",rs1.getString("userid"));
            session.setAttribute("imageurl",rs1.getString("imageurl"));

        	response.sendRedirect("index.jsp");  
        	
        }
     
			}	
		catch (Exception e) 
			{

    			e.printStackTrace();
			}
		
		}
	
	}

}