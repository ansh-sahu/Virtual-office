package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.FetchTodoDto;

import com.service.FetchTodoService;

public class FetchTodo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String value = request.getParameter("action");
		System.out.println(value);
		if (value.equalsIgnoreCase("todo")) {
			try {
				System.out.println("fetchTodo");
				getTodo(request, response);
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else if (value.equalsIgnoreCase("todoList")) {
			try {
				getTodoList(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}	protected void doPost(HttpServletRequest request1, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
      
      
 
          
          try{

        	  String title=request1.getParameter("title");
        	  String description=request1.getParameter("description"); 
        	  String target_Date=request1.getParameter("targetDate");
        	  String is_Done=request1.getParameter("isDone");
        	
              HttpSession session=request1.getSession(false);  
              int id=(int)session.getAttribute("id");  



              
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualOffice","root","root@123");
              PreparedStatement ps=con.prepareStatement("update todos set description=?,is_done=?,target_date=?,title=? where t_id=?");
              
              ps.setString(1,description);
              ps.setString(2,is_Done);
              ps.setString(3,target_Date);
              ps.setString(4,title);
              ps.setInt(5,id);
         
              
            
             
              int i=ps.executeUpdate();
              if(i>0)
              { 
               
                  System.out.println("Successfully registered");
                  
                  out.println("<html><body><script>alert(\"Your task is updated...!!!\");\n" +
                          "window.location='FetchTodo?action=todoList'\n</script></body><html>");
                  
             // response.sendRedirect("User_Login.html");  
              }else
                  {
                  out.println("<html><body><script>alert(\"User already exist...\");\n" +
      			          "window.location='UserSignup.jsp'\n</script></body><html>");
                  
              
               }
              
          }catch(Exception e)
  		{
  			e.printStackTrace();
  		}
	}

	private void getTodoList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {

			// HttpSession session = request.getSession(false);
			// String email = (String) session.getAttribute("email");
			// String buyerPassword = (String) session.getAttribute("buyerPassword");
		   	  HttpSession session=request.getSession();
        	  String email=(String)session.getAttribute("email");
			//String email = "Mohan@gmail.com";
			List<FetchTodoDto> fetchTodoList = FetchTodoService.getBuyerCart(email);

			PrintWriter out = response.getWriter();
			out.print("<html><head> <link rel=\"stylesheet\" href=\"css/tableUser.css\"><link rel=\"stylesheet\" href=\"css/style.css\"></head><body>\n" + "\n");
			out.print(" <a href=\"index.jsp\"><button class=\"button button2\" id=\"1\">Back to Home Page</button></a><table id = customers>");
			out.print(
					"<caption><b><h1 style=\" color:#008CBA;\">Todo List<hr><br><a href=\"todoform.jsp\"><button class=\"button button2\" style=\"margin-right:940px;\">Add Todo</button></a></h1></b></caption>");
			out.print("<tr>");
//<link rel="stylesheet" href="style.css">
			out.print(" <th> Title</th>");
			out.print(" <th> Description </th>");
			out.print("<th> Target Date </th>");
			out.print("<th>Status </th>");
			out.print("<th> Action </th>");

			out.print("</tr>");
                     
			
			for (int i = 0; i < fetchTodoList.size(); i++) {
				String s = fetchTodoList.get(i).getIsDone();
                String sp="Progress..";
				
				
				
				if( s.equals(sp) ){
				out.print("<tr>");
				out.print("<td>" + fetchTodoList.get(i).getTiltle() + "</td>");
				out.print("<td>" + fetchTodoList.get(i).getDescription() + "</td>");
				out.print("<td>" + fetchTodoList.get(i).getTargetDate() + "</td>");
				out.print("<td>" + fetchTodoList.get(i).getIsDone() + "</td>");
				out.print("<td><center><a href=\"FetchTodo?action=todo&id=" + fetchTodoList.get(i).getId()
						+ "\"><button class=\"button button2\" id=\"1\">Edit</button></a>\n"
						+ "</center></td>");          //<a href=\"Login.html\"><button class=\"button button1\">Completed Task</button></a>
					
				out.print("</tr>");
				}
			}
			out.print("</table>");
			out.print("</body></html>");
			
			
			
			
			
			out.print("<html><head> <link rel=\"stylesheet\" href=\"css/tableUser.css\"><link rel=\"stylesheet\" href=\"css/style.css\"></head><body>\n" + "\n");
			out.print("<table id = customers>");
			out.print("<br><br><br><h1 style=\" color:#008CBA;\">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<u>Completed Task</u></h1>");
			out.print("<tr>");
//<link rel="stylesheet" href="style.css">
			out.print(" <th> Title</th>");
			out.print(" <th> Description </th>");
			out.print("<th> Target Date </th>");
			out.print("<th>Status </th>");
			out.print("<th> Action </th>");

			out.print("</tr>");
                     
			
			for (int i = 0; i < fetchTodoList.size(); i++) {
				String s = fetchTodoList.get(i).getIsDone();
                String sp="Complete";
				
				
				
				if( s.equals(sp) ){

				
				
				out.print("<tr>");
				out.print("<td>" + fetchTodoList.get(i).getTiltle() + "</td>");
				out.print("<td>" + fetchTodoList.get(i).getDescription() + "</td>");
				out.print("<td>" + fetchTodoList.get(i).getTargetDate() + "</td>");
				out.print("<td>" + fetchTodoList.get(i).getIsDone() + "</td>");
				out.print("<td><center><a href=\"RemoveTodo?id=" + fetchTodoList.get(i).getId()
						+ "\"><button class=\"button button2\" >Remove</button></a>\n"
						+ "</center></td>");

				out.print("</tr>");
				}
			}
			

		
			out.print("</table>");
			out.print("</body></html>");

		} catch (SQLException e) {
		}

	}

	private void getTodo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Todo");
		try {

			// HttpSession session = request.getSession(false);
			// String email = (String) session.getAttribute("email");
			// String buyerPassword = (String) session.getAttribute("buyerPassword");
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			
	        HttpSession session=request.getSession();  
	        session.setAttribute("id",id);  
			FetchTodoDto fetchTodo = FetchTodoService.getTodo(id);
			
			PrintWriter out = response.getWriter();

			System.out.println(fetchTodo.getTiltle());
			out.print("<html><link rel=\"stylesheet\"\n"
					+ "	href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\"\n"
					+ "	integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\"\n"
					+ "	crossorigin=\"anonymous\">\n"
					+ "<body><header>\n"
					
					+ "			<b><h1 style=\" color:#008CBA;margin-left:380px;margin-right:380px;margin-top:40px;text-align:center;\">Edit Todo <hr></h1></b>\n"
					+ "			<div>\n"
								
					+ "			</div>\n"
					+ "\n"
					+ "		\n"
					+ "			\n"
					
					+ "		<br><br><br>\n"
					+ "	</header><div style=\"margin-left:530px;margin-right:380px;border: 1px solid;\r\n"
					+ "  padding: 10px;\r\n"
					+ "  box-shadow: 5px 10px #888888; \" class=\"containTodoServleter col-md-5\">\n"
					+ "		<div class=\"card\">\n"
					+ "			<div class=\"card-body\">\n"
					+ "				\n"
					+ "				<caption>\n"
					+ "					<h2>\n"
					+ "					\n"
					+ "            			Edit Todo\n"
					+ "            		\n"
					+ "					</h2>\n"
					+ "				</caption>\n"
					+ "				<form action=\"FetchTodo\" method=\"post\">\n"
					+ "				<fieldset class=\"form-group\">\n"
					+ "					<label>Todo Title</label> <input type=\"text\" value=\n"+"'"+fetchTodo.getTiltle()+"'"+" class=\"form-control\"\n"
					+ "						name=\"title\" required=\"required\" minlength=\"5\">\n"
					+ "				</fieldset>\n"
					+ "\n"
					+ "				<fieldset class=\"form-group\">\n"
					+ "					<label>Todo Decription</label> <input type=\"text\"\n"
					+ "						value=\n"+"'"+fetchTodo.getDescription()+"'"+
					" class=\"form-control\"\n"
					+ "						name=\"description\" minlength=\"5\">\n"
					+ "				</fieldset>\n"
					+ "\n"
					+ "				<fieldset class=\"form-group\">\n"
					+ "					<label>Todo Status</label> <select class=\"form-control\"\n"
					+ "						name=\"isDone\">\n"
					+ "						<option value=\"Progress..\">In Progress</option>\n"
					+ "						<option value=\"Complete\">Complete</option>\n"
					+ "					</select>\n"
					+ "				</fieldset>\n"
					+ "\n"
					+ "				<fieldset class=\"form-group\">\n"
					+ "					<label>Todo Target Date</label> <input type=\"date\"\n"
					+ "						value=\n"+fetchTodo.getTargetDate()
					+ "					class=\"form-control\"\n"
					+ "						name=\"targetDate\" required=\"required\">\n"
					+ "				</fieldset>\n"
					+ "\n"
					+ "				<button type=\"submit\""
					+ "class=\"btn btn-success\">Save</button>\n"
					
					+ "				</form>\n"
					+ "			</div>\n"
					+ "		</div>\n"
					+ "	</div><body></html>");

		} catch (SQLException e) {
		}
		
	
		

	}
}
