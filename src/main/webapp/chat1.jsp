<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.io.PrintWriter,javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

:root { 
	--grad: linear-gradient(to bottom right, #8bc34a, #ff9800); 
	--clip: polygon(52% 65%, 100% 38%, 100% 0, 0 0, 0% 38%); 
	--shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px, rgba(0, 0, 0, 0.3)
		0px, 18px, 36px, -18px; 
	--c: #eaeaea; 
	--g: #74d800;
}

@font-face {
	scr: url("q.ttf");
	font-family: f;
}

.top {
	height: 100vh;
	background-image: var(--grad);
	widht: 100%;
	clip-path: var(--clip);
}

.box {
	width: 1000px;
	height: 650px;
	border-radius: 5px;
	box-shadow: var(--shadow);
	background: white;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background:white;
}

.left {
	width: 280px;
	height: 600px;
	border-right: 1px solid var(--c);
}

.right {
	height: 600px;
	width: calc(1000px-280px);
}

.h2 {
	font-family: f;
}

.topp {
	width: 280px;
	height: 50px;
	display: flex;
	border-bottom: 1px solid var(--c);
	justify-content: space-around;
	align-items: center;
	justify-content: space-around;
}

.search {
	width: 280px;
	height: 50px;
	display: flex;
	border-bottom: 1px solid var(--c);
	justify-content: space-around;
	align-items: center;
}

.ico {
	background: var(--g);
	padding: 5px;
	border-radius: 5px;
}

.icon1 {
	widht: 23px;
	height: 23px;
}

.in {
	border: none;
	outline: none;
	background: var(--c);
	padding: 10px 15px;
	border-radius: 5px;
	width: 220px;
}

.ava {
	height: 40px;
	widht: 40px;
	margin-left: 7px;
	border-radius: 50px;
}

li {
	list-style: none;
}

.friend {
	display: flex;
	align-items: center;
	height: 60px;
	transition:0.5s ease;
	justify-content: space-between;
	border-bottom: 1px solid var(--c);
}

.img_name {
	display: flex;
	align-items: center;
}

h3 {
	font-size: 14px;
	font-family: f;
	margin-left: 7px;
}

p {
	margin-left: 7px;
	color: grey;
	font-size: 12px;
	font-family:f;
}
.p{
margin-right: 10px;
}
.friend:hover{
background: var(--c);
}
ul{
height:calc(600px-100px);
overflow-y:auto; 
}
span{
color:green;
}
.right_top{
height:50px;
border-bottom: 1px solid var(--c);
width:calc(1000px-2	80px);
display:flex;
align-items: center;
justify-content: space-between;
}
.mid{
width:100%;
overflow-y:auto;
border-bottom:1px solid var(--c);
height:calc(600px-100px);
}
.btm{
display:flex;
justify-content:center;
align-items:center;
height:50px;
width:100%;
}
form{
width:40%;
display:flex;
align-items: center;
justify-content: space-between;
height:40px;
border-radius: 5px;
border:1px solid lightgrey;

}
.ico3,form div{
background: var(--g);
padding: 7px;
color:white;
border-radius: 5px;
display:flex;
align-items: center;justify-content: center;

}.send_svg{
height:23px;
width:23px;
}
.in2{
border:none;
outline:none;
background: transparent;
font-family: f;
width:600px;
}
.me{
margin:10px;
background:var(--g);
border-radius:5px;
display:table;
clear:both;
padding:10px;max-width: 80%;
float:right;

}
.u{
margin:10px;
background:grey;
display:table;
clear:both;
border-radius:5px;
padding:10px;max-width: 80%;
float:left;
}.me p{
color:white;
font-size:15px;}
.u p{
color:white;
font-size:15px;}


</style>
</head>
<body>

	<div class="top"></div>
	<div class="box">
		<div class="left">
			<div class="topp">
				<h2>Whatsapp</h2>
			</div>
			<div class="search">
				<input class="in" type="text" placeholder="Search Buddy....">
				<div class="ico">
					<img src="search.svg" class="icon1">
				</div>
			</div>
			
			
			<%
			try{
				PrintWriter printWriter=response.getWriter();
				
				String sender=(String)session.getAttribute("sender");
				String ids=(String)session.getAttribute("ids");
				System.out.println("sender:"+sender);
				System.out.println("ids:"+ids);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","");
				PreparedStatement statement1 = con.prepareStatement("SELECT username,userid FROM client where username!="+"'"+sender+"'");
				ResultSet rs = statement1.executeQuery();

				while(rs.next()){
				PreparedStatement statement2=con.prepareStatement("SELECT COUNT(*) as count from chat where receiverid="+"'"+ids+"'"+" and senderid="+"'"+rs.getString("userid")+"'"+" and decider=0");
				ResultSet rs1 = statement2.executeQuery();
				rs1.next();
				%>
              
               <ul>
			     <li>
					<div class="friend">
						<div class="img_name">
							<img src="images/signin-image.jpg" class="ava">
							<div>
							
							<form method="post" action="session2"><input type="hidden" id="id" name="idr" value="b"> 
<input type="hidden" id="name" name="receiver" value="a"> <button type="submit"  value="<%=rs.getString("username") %>|<%=rs.getString("userid") %>" onclick="getval(this.value)"><h3><%=rs.getString("username") %></h3></button></form>
							<p>Hi dude</p>
							</div> 
						</div>
						<div class="time"><p class="p">Today</p></div>
					</div>
				</li>
			</ul>
		
		<%if(rs1.getInt("count")>0){%>
<td><%=rs1.getInt("count") %></td><%} %>
</tr>
<% } }
catch (Exception e) 
			{

    			e.printStackTrace();
			}
			%>		</div>
					<div class="right" >
					
					<div class="right_top">
					<div class="img_name">
							<img src="img/WIN_20210915_13_00_20_Pro.jpg" class="ava">
							<div>
							<h3>Varun Yadav</h3>
							<p>active 30 seconds ago..</p>
							</div> 
						</div>
					</div>
					<div class="mid">
					<div class="me"> 
					<p>Hi duder how r u?</p>
					</div>
					<div class="u">
					<p>I am not dude i am rude?</p>
					</div>
					<div class="me"> 
					<p>Hi duder how r u?</p>
					</div>
					<div class="u">
					<p>I am not dude i am rude?</p>
					</div>
					<div class="me"> 
					<p>Hi duder how r u?</p>
					</div>
					<div class="u">
					<p>I am not dude i am rude?</p>
					</div>
					<div class="me"> 
					<p>Hi duder how r u?</p>
					</div>
					<div class="u">
					<p>I am not dude i am rude?</p>
					</div>
					
					</div>
					<div class="btm">
					<form>
					<div>+</div>
					<input type="text" name="" placeholder="What on your mind..?" class="in2">
					<div class="ico3"><img src="send.svg" class="send_svg"></div>
					</form>
	</div>
</div>
</div>


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