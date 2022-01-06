package com.FlightTicketReservationSystem.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.FlightTicketReservationSystem.DaoImpl.FlightSearchDao;
import com.FlightTicketReservationSystem.DaoImpl.LoginDao;
import com.FlightTicketReservationSystem.DaoImpl.SourceDao;
import com.FlightTicketReservationSystem.Models.Flight_Seat_Availability;
import com.FlightTicketReservationSystem.Models.Flight_list;

/**
 * Servlet implementation class SearchFlight
 */
@WebServlet("/SearchFlight")
public class SearchFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchFlightServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		

		
	}
		
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        PrintWriter out=response.getWriter();
       SourceDao objsearchflight = new SourceDao();
     
       	try
		{
		
	        out.println("hello");
			String Source = request.getParameter("source");
			String Destination = request.getParameter("destination");
			System.out.println(Source);
			System.out.println(Destination);
		
			
			
			
			List<Flight_Seat_Availability> objavailability = objsearchflight.ListSeat(Source, Destination);
			System.out.println(objavailability);
			request.setAttribute("Flight_List", objavailability);
		
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("FlightSearchList.jsp");
			requestDispatcher.forward(request, response);
			
			
		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}
		
	}

}
