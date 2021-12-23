package Servlet;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.FlightRegisterDao;
import Dao.LoginDao;
import Models.Flight;

/**
 * Servlet implementation class Loginservlet
 */
@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {
	
	protected void doget(HttpServletRequest request, HttpServletResponse response) throws Exception 	{
	
		} 
		 
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			

		//response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		HttpSession session = request.getSession();
		LoginDao login = new LoginDao();
		 Boolean  loginvalidation ;
		 try {
			 System.out.println(username);
			loginvalidation = login.Loginfile( username, password);
			System.out.println(username);
			//out.println(loginvalidation);
			if(loginvalidation)
			{
				String Check_Admin = login.CheckAdmin(username, password);
				if(Check_Admin == "yes")
				{
					System.out.println("Weleocme to add flight ");

					session.setAttribute("LOGGED_IN_ADMIN", username);
					response.sendRedirect("FlightSearch");  
					System.out.println("User Details");
RequestDispatcher requestDispatcher = request.getRequestDispatcher("FlightList.jsp");
System.out.println("Userlist1");
requestDispatcher.forward(request, response);

				}
				else 
				{
					System.out.println("Weleocme to add1 flight ");

					session.setAttribute("LOGGED_IN_USER", username);
					
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("FlightSearch.jsp");
					requestDispatcher.forward(request, response);

				}
				
				
				response.getWriter().print("Data success");
			}
			else
			{
				response.getWriter().print("Data failed");

				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO Auto-generated catch block
		}
			
	}

}
