package com.work;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@MultipartConfig
public class upload_docs extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public upload_docs() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
		try {
			ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> multifiles=sf.parseRequest(request);
			for(FileItem item:multifiles)
			{
				 HttpSession session=request.getSession();  
				 session.setAttribute("fileName",item.getName());  
				   Class.forName("com.mysql.jdbc.Driver");
		              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
		              PreparedStatement ps2=con.prepareStatement("select dept_id,orgid,userid from client where email=?");
		              ps2.setString(1,(String)session.getAttribute("email"));///////EXAMPLE CHANGE IT_______---------------------
		              PreparedStatement ps1=con.prepareStatement("select dept_name from departments where dept_id=? AND orgid=?");
		              PreparedStatement ps3=con.prepareStatement("select org_name from organizations where orgid=?");
		              String dept_id="";
		              String orgid="";
		              String userid="";
		              ResultSet rs2=ps2.executeQuery();
		              while(rs2.next())
		              {
		               dept_id=rs2.getString(1);
		               orgid=rs2.getString(2);
		               userid=rs2.getString(3);
		              ps1.setString(1,dept_id);
		              ps1.setString(2,orgid);
		              ResultSet rs1=ps1.executeQuery();
			              //System.out.println("orgid:-"+orgid);
			              while(rs1.next())
		              {
			            	  String dept_name=rs1.getString(1);
			            	  ps3.setString(1, orgid);
				              ResultSet rs3=ps3.executeQuery();
				              while(rs3.next())
				              {
				            	  String org_name=rs3.getString(1);
				            	  File f1 = new File("C:/Users/dev/Downloads/virtual-office/src/main/webapp/Work/"+org_name+"/"+dept_name );
				            	  f1.mkdirs();
				            	  //System.out.print(f1.mkdirs());
				            	  item.write(new File("C:/Users/dev/Downloads/virtual-office/src/main/webapp/Work/"+org_name+"/"+dept_name+"/"      +item.getName()));
				  				
				              }
		              }
		              }
//		              PreparedStatement ps1=con.prepareStatement("select dept_name from departments where dept_id=? AND orgid=?");
//		              ps1.setString(1,dept_id);
//		              ps1.setString(2,orgid);
//		              ResultSet rs1=ps2.executeQuery();
//		              while(rs1.next())
//		              {
//		            	  String dept_name=rs.getString(1);
//		            	  System.out.println(dept_name);
//		              }
//		              
		             
				//item.write(new File("C:/Users/Jaiswalji/Downloads/virtual-office/virtual-office/src/main/webapp/Work/"      +item.getName()));
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy ");
				SimpleDateFormat time= new SimpleDateFormat("HH:mm:ss");
					Date date = new Date();
					String current_date=formatter.format(date);
					String current_time=time.format(date);
			
	              PreparedStatement ps=con.prepareStatement("insert into uploadwork(filename,date,time,empid,deptid,orgid)values(?,?,?,?,?,?)");
	              
	              ps.setString(1,item.getName());
	              ps.setString(2,current_date);
	              ps.setString(3,current_time);
	              ps.setString(4,userid);
	              ps.setString(5,dept_id);
	              ps.setString(6,orgid);
	              
	              int i=ps.executeUpdate();
	              if(i>0)
	              { 
	                  
	                  out.println("<html><body><script>alert(\"Your Data is Uploaded!!...\");\n" +
	                          "window.location='index.jsp'\n</script></body><html>");
	                  
	              }else
	                  {
	                  out.println("<html><body><script>alert(\"Not Uploaded!!...\");\n" +
	      			          "window.location='index.jsp'\n</script></body><html>");
	              
	               }
	              
	          }
		}catch(Exception e)
	  		{
	  			e.printStackTrace();
	  		}
		
		
		
	}

}
