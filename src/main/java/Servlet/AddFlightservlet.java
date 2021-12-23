package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AddFlightDao;
import Dao.FlightRegisterDao;
import Models.AddFlight;
import Models.Flight;

/**
 * Servlet implementation class AddFlightservlet
 */
@WebServlet("/AddFlightservlet")
public class AddFlightservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFlightservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response,AddFlight flight) throws ServletException, IOException 
	{

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        try {
			String flightname = request.getParameter("Flightname");
			String source = request.getParameter("source");
         System.out.println("Debuf");
			String Destination = request.getParameter("Destination");
			System.out.println("Debug");
			//int age = Integer.parseInt(request.getParameter("age"));
			int   Economyclass = Integer.parseInt(request.getParameter("Economyclass"));
			int   premiumEconomyclass = Integer.parseInt(request.getParameter("PremiumEconomyclass"));
			int   Bussinessclass = Integer.parseInt(request.getParameter("Bussinessclass"));
			System.out.println("Class Details");
	String  Arrival_time  = request.getParameter("ArrivalDate"); 
 LocalDate local = LocalDate.parse(Arrival_time);
			String Departure_time  =  request.getParameter("DepartureDate");
			 LocalDate loca1 = LocalDate.parse(Departure_time);

			   DateFormat parseFormat = new SimpleDateFormat("HH:mm:SS");


      String   ArrivalTime  =  request.getParameter("Arrivaltime");
     
      
   LocalTime  time = LocalTime.parse(ArrivalTime,DateTimeFormatter.ofPattern("HH:mm"));
      
   System.out.println(time);
//  String str = time.toString();
//  System.out.println(str);
             AddFlightDao adddao = new AddFlightDao();
             AddFlight flight = new AddFlight(flightname, source, Destination, Economyclass, premiumEconomyclass, Bussinessclass,local,loca1,time);             

             adddao.AddFlightDetails(flight);
             //adddao.Addseats(flyid, source, Destination);
             
             
			response.getWriter().print("Data Registered");
			   			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
				requestDispatcher.forward(request, response);
			
				
			//response.sendRedirect("Login.jsp");
		} catch (Exception e) {
			//e.printStackTrace();
			//response.sendRedirect("Register.jsp?errorMessage=" + e.getMessage());
			System.out.println(e);
			response.getWriter().print("Invalid");

		}

			
		

       
	}

	private void AddSeats() {
		// TODO Auto-generated method stub
		
	}

}
