<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.io.PrintWriter,javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="session2" id="myform">
<input type="hidden" id="id" name="idr" value="b"> 
<input type="hidden" id="name" name="receiver" value="a">
<table>
<tr><th>username:</th></tr>
<% 
try{
PrintWriter printWriter=response.getWriter();
String sender=(String)session.getAttribute("username");
String ids=(String)session.getAttribute("userid");
System.out.println("sender:"+sender);
System.out.println("ids:"+ids);
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","");
PreparedStatement statement1 = con.prepareStatement("SELECT username,userid FROM client where username!="+"'"+sender+"' && dept_id=?");
statement1.setString(1,(String)session.getAttribute("dept_id"));
ResultSet rs = statement1.executeQuery();

while(rs.next()){
PreparedStatement statement2=con.prepareStatement("SELECT COUNT(*) as count from chat where receiverid="+"'"+ids+"'"+" and senderid="+"'"+rs.getString("userid")+"'"+" and decider=0");
ResultSet rs1 = statement2.executeQuery();
rs1.next();
%>
<tr><td><button type="submit"  value="<%=rs.getString("username") %>|<%=rs.getString("userid") %>" onclick="getval(this.value)"><%=rs.getString("username") %></button></td>
<%if(rs1.getInt("count")>0){%>
<td><%=rs1.getInt("count") %></td><%} %>
</tr>
<% } }
catch (Exception e) 
			{

    			e.printStackTrace();
			}%>
</table>
<input type="hidden" name="sender" value="user">
</form>
<script type="text/javascript">
function getval(val){
	const myarr=val.split("|");
	console.log(myarr[0]);
	console.log(myarr[1]);
	var valuee=document.getElementById('id');
	var name=document.getElementById('name');
	var form=document.getElementById('myform');
	valuee.setAttribute('value',myarr[1]);
	name.setAttribute('value',myarr[0]);
	//document.form.submit();
}
</script>


</body>
</html>