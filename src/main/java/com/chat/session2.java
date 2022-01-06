package  com.chat;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserNameServlet
 */

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserNameServlet
 */
@WebServlet("/session2")
public class session2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String receiver=request.getParameter("receiver");
		//String user="abc";
		PrintWriter printWriter=response.getWriter();
		if (receiver!=null) 
			generateChatroomPage(printWriter, receiver, request); 
		

		
	}
	 private void generateChatroomPage (PrintWriter printwriter, String receiver, HttpServletRequest request)
	 {
		 HttpSession session=request.getSession(true); 
		 String idr=request.getParameter("idr");
		 String id="abc";
		 String ids=(String)session.getAttribute("userid");
		 session.setAttribute("receiver", receiver);
		 String sender=(String)session.getAttribute("username");

		 try {
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualoffice","root","root@123");
		 PreparedStatement statement = con.prepareStatement("SELECT message FROM chat where receiverid="+"'"+ids+"'"+" and senderid="+"'"+idr+"'"+" and decider=1");
		 ResultSet rs = statement.executeQuery();
		 PreparedStatement statement1 = con.prepareStatement("SELECT message FROM chat where receiverid="+"'"+ids+"'"+" and senderid="+"'"+idr+"'"+" and decider=0");
		 ResultSet rs1 = statement1.executeQuery();
		 printwriter.println("<html>");
		 printwriter.println(" <head><title>Chat</title></head>");
		 printwriter.println(" <body>");
		 
	     printwriter.println("<mark>receiver: "+receiver+"</mark><br>");
	     printwriter.println("<mark>Sender: "+sender+" </mark><br>");
	     printwriter.println("<div id=\"di\" style='border:1px solid black; display:inline-block; width:500px; height:450px; overflow:auto;'>");
	     printwriter.println("<p id=\"a\" > ");
	     printwriter.println("");
	     printwriter.println("</p>");
	     printwriter.println("</div>");
	     printwriter.println("<br>");
	     printwriter.println("<br>");
		printwriter.println("<input type=\"text\" id=\"messageText\" size=\"58\"/>"+
				"<input type=\"button\" value=\"Send\" onclick=\"sendMessage();\" />");
		printwriter.println("<script>");
		printwriter.println("var mta=document.getElementById(\"a\");");
		printwriter.println("var mtb=document.getElementById(\"di\");");
		printwriter.println("mtb.scrollTop = mtb.scrollHeight;");
		printwriter.println("var websocket=new WebSocket(\"ws://localhost:8080/virtual-office/serverend/"+idr+"\");");
		printwriter.println("console.log(document.location.pathname);");
		printwriter.println("websocket.onmessage=function processMessage (message) {");
		printwriter.println( "var jsonData = JSON.parse(message.data);");
		printwriter.println("if(jsonData.message!= null) mta.innerHTML+=\"<br><br>\"+\"<span style='display:inline-block; color:white; padding:5px; background-color:blue; border-radius:20px;'>\"+ jsonData.message+\"<span>\"+\"<br>\";");
		printwriter.println("mtb.scrollTop = mtb.scrollHeight;");
		printwriter.println("}");
		printwriter.println("function sendMessage() {");
		printwriter.println("websocket.send (messageText.value); ");
		printwriter.println("messageText.value=\"\";");
		printwriter.println("}");
		
		while(rs.next()) {
			String message=rs.getString("message");
			printwriter.println("mta.innerHTML+=\"<br><br>\"+\"<span style='display:inline-block; color:white; padding:5px; background-color:blue; border-radius:20px '>"+receiver+":"+message+"</span>\";");
			System.out.println(message);		}
		if(rs1.next()) {
			printwriter.println("mta.innerHTML+=\"NEW MESSAGES<br>\";");
			do {
				String message=rs1.getString("message");
				System.out.println(message);
				printwriter.println("mta.innerHTML+=\"<br><br>\"+\"<span style='display:inline-block; color:white; padding:5px; background-color:blue; border-radius:20px '>"+receiver+":"+message+"</span>\";");
			}while(rs1.next());
			PreparedStatement statement2 = con.prepareStatement("UPDATE chat SET decider=1 where receiverid="+"'"+ids+"'"+" and senderid="+"'"+idr+"'");
			statement2.executeLargeUpdate();
		}
		printwriter.println("</script>");
		printwriter.println("</body>");
		printwriter.println("</html>");
	 	 
	 }
		 catch (Exception e) 
			{

 			e.printStackTrace();
			}
	
	
}}