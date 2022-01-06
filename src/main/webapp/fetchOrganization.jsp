<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%ResultSet resultset =null;%>

<HTML>
<HEAD>
    <TITLE>Select element drop down box</TITLE>
</HEAD>

<BODY BGCOLOR=##f89ggh>
<form action="feeddata" method="post">

<%
    try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/virtualOffice","root","");

       Statement statement = connection.createStatement() ;
       
       resultset =statement.executeQuery("select org_name from organizations") ;
%>

<center>
    <h1> Drop down box or select element</h1>
        <select name="orgname">
        <%  while(resultset.next()){ %>
            <option ><%= resultset.getString("org_name")%></option>
        <% } %>
        </select>
       <button  type="submit" class="btn btn-success">Save</button>
</center>
</form>
<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

</BODY>
</HTML>