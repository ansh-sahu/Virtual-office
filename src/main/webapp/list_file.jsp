
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File List</title>
        <style>
            tr,td,th{
                padding: 20px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <br><br><br>
   
      
        <table border="2">
            <tr>
                <th>Employee id</th><th>File Name</th><th>Added Date</th><th>Added Time</th><th>Download</th>
            </tr>
            <%
            try
            {
            	Class.forName("com.mysql.jdbc.Driver");  
            	Connection con=DriverManager.getConnection(  
            	"jdbc:mysql://localhost:3306/virtualOffice?useSSL=false","root","");  
            	PreparedStatement p1=con.prepareStatement("select * from uploadwork where deptid=? and orgid=?");
            /* 	p1.setString(1, (String)session.getAttribute("email")); */
            p1.setString(1, "loan-48");
            p1.setInt(2, 48);
            PreparedStatement p2=con.prepareStatement("select org_name from organizations where orgid=?");
            p2.setInt(1,48);
            ResultSet r2=p2.executeQuery();
            r2.next();
            String d="Work/"+r2.getString("org_name")+"/"+"loan"+"/";
            	ResultSet rs=p1.executeQuery();
            while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("empid")%></td>
                <td><%=rs.getString("filename")%></td>
                <td><%=rs.getString("date")%></td>
                <td><%=rs.getString("time")%></td>
                <td><a href="DownloadServlet?fileName=<%=d%>+<%=rs.getString("filename")%>">Download</a></td>
            </tr>
            <%
                }}catch(Exception e)
            {
                	e.printStackTrace();
            }
            %>
            
        </table><br>
        <a href="index.jsp">Home</a>
  
    </body>
</html>