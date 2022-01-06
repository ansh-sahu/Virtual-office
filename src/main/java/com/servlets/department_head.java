package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class department_head
 */
public class department_head extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public department_head() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectedItem;
		if(request.getParameter("dept_name")!=null)
		{
		   selectedItem=(String)(request.getParameter("dept_name"));
		   System.out.print(selectedItem+"selectedItem");
		   HttpSession session=request.getSession();
		   session.setAttribute("dept_name",selectedItem);
		   response.sendRedirect("department.jsp?dept_name="+selectedItem);
		   
	}
	}

}
