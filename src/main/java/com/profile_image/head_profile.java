package com.profile_image;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class head_profile
 */
public class head_profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public head_profile() {
        super();
        // TODO Auto-generated constructor stub
    }



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
		try {
//			String flag=request.getParameter("imgflag");
//			System.out.print(flag);
//			
			ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> multifiles=sf.parseRequest(request);
		
			for(FileItem item:multifiles)
			{
				if(item.getName()!=null) {
				 HttpSession session=request.getSession();  
				 session.setAttribute("fileName",item.getName());
				 Class.forName("com.mysql.jdbc.Driver");
	              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
	              PreparedStatement ps2=con.prepareStatement("select dept_id,orgid from client where email=?");
	              ps2.setString(1,(String)session.getAttribute("email"));///////EXAMPLE CHANGE IT_______---------------------
	              PreparedStatement ps1=con.prepareStatement("select dept_name from departments where dept_id=? AND orgid=?");
	              PreparedStatement ps3=con.prepareStatement("select org_name from organizations where orgid=?");
	             
	              ResultSet rs2=ps2.executeQuery();
	              if(rs2.next())
	              {
	              String dept_id=rs2.getString(1);
	              int orgid=rs2.getInt(2);
	              ps1.setString(1,dept_id);
	              ps1.setInt(2,orgid);
	              ResultSet rs1=ps1.executeQuery();
		              //System.out.println("orgid:-"+orgid);
		              if(rs1.next())
	              {
		            	  String dept_name=rs1.getString(1);
		            	  ps3.setInt(1, orgid);
			              ResultSet rs3=ps3.executeQuery();
			              if(rs3.next())
			              {
			            	  String org_name=rs3.getString(1);
			            	  File f1 = new File("C:/Users/dev/Downloads/virtual-office/src/main/webapp/Profile_images/"+org_name+"/"+dept_name );
			            	  f1.mkdirs();
			            	  //System.out.print(f1.mkdirs());
			            	  item.write(new File("C:/Users/dev/Downloads/virtual-office/src/main/webapp/Profile_images/"+org_name+"/"+dept_name+"/" +item.getName()));
			  				
			              }
	              }
	              }
				  
				//item.write(new File("C:/Users/Jaiswalji/Downloads/virtual-office/virtual-office/src/main/webapp/Profile_images/"+item.getName()));
				 PreparedStatement ps=con.prepareStatement("update client set filename=? where email=?");
	              
	            ps.setString(1,item.getName());
	            ps.setString(2,(String)session.getAttribute("email"));
	              System.out.print("File name="+item.getName());
	            int i=ps.executeUpdate();
	            if(i>0)
	              { 
	                  
	                  out.println("<html><body><script>alert(\"Your Profile is Uploaded!!...\");\n" +
	                          "window.location='head.jsp'\n</script></body><html>");
	                  
	              }else
	                  {
	                  out.println("<html><body><script>alert(\"Profile not Uploaded!!...\");\n" +
	      			          "window.location='head.jsp'\n</script></body><html>");
	              
	               }
			}
			
			}
		}catch(Exception e)
		{
			e.printStackTrace();}
	}

}
