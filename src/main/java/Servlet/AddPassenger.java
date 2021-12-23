package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.FlightRegisterDao;
import Dao.Passenger_detailsDao;
import Models.Flight;
import Models.Flight_list;
import Models.Passenger_details;
import Models.Source;

/**
 * Servlet implementation class AddPassenger
 */
@WebServlet("/AddPassenger")
public class AddPassenger extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPassenger() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 response.setContentType("text/html");
	        PrintWriter out=response.getWriter();
//	       String gender = "Female";
	    		try {
			  String Flight_Id =request.getParameter("flightId");
			  int flightid = Integer.parseInt(Flight_Id);
			  System.out.println(flightid);
			String name = request.getParameter("username");
			System.out.println(name);
			String date = request.getParameter("bookingDate");
			LocalDate local = LocalDate.parse(date);


			String Source = request.getParameter("source");
			String Destination = request.getParameter("destination");
	      String mobno = request.getParameter("MobileNumber");
	      long mobileno = Long.parseLong(mobno);
	      System.out.println(mobno);
			String class_details = request.getParameter("coach");
			//String seat  = request.getParameter("SEAT_NO");
			//int seat_no = Integer.parseInt(seat);
	       String noofpassengers = request.getParameter("numberOfPassengers");
	       int noofpass = Integer.parseInt(noofpassengers);
//	       String Price_details = request.getParameter("price");
//	     int price = Integer.parseInt(Price_details);

			
	     Passenger_details passenger = new Passenger_details(name, class_details, mobileno, Source, Destination, noofpass,flightid,local);
			Passenger_detailsDao pass = new Passenger_detailsDao();
			
			pass.PassengerDetails(passenger);
			
			//response.getWriter().print("Data Registered");
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Ticket Booked Successfully');");
			   out.println("location='AddPassenger.jsp';");
			   out.println("</script>");
			   
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
				requestDispatcher.forward(request, response);
				
				
			//response.sendRedirect("Login.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("Register.jsp?errorMessage=" + e.getMessage());
		}

			
		
			}

	}


