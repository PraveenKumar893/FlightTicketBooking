package Servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.script.ScriptEngine;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AddFlightDao;
import Models.AddFlight;

/**
 * Servlet implementation class UpdateFlight
 */
@WebServlet("/UpdateFlight")
public class UpdateFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFlight() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Call update method");

			try {
				String Flight_id  = request.getParameter("Flightid");

				String flight_name = request.getParameter("Flightname");
				String source = request.getParameter("source");

				System.out.println("Call update1 method");
				
				String Destination = request.getParameter("Destination");
				String   Economy_class = request.getParameter("Economyclass");
				String   premium_Economy_class =request.getParameter("PremiumEconomyclass");
				String   Bussiness_class = request.getParameter("Bussinessclass");
				
				System.out.println("Call update2  method");
//	        java.util.Date date = new java.util.Date();
//            String  Arrival_time  = request.getParameter("ArrivalTime"); 
//	 LocalDate local = LocalDate.parse(Arrival_time);
//	String Departure_time  =  request.getParameter("DepartureTime");
//	 LocalDate loca1 = LocalDate.parse(Departure_time);
				int Flightid = Integer.parseInt(Flight_id);
				int Economyclass = Integer.parseInt(Economy_class);
				int premiumclass = Integer.parseInt(premium_Economy_class);
				int Bussinessclass = Integer.parseInt(Bussiness_class);
				
					AddFlightDao update = new AddFlightDao();
					System.out.println("Call update4  method");
					UpdateFlight flightupdate = new UpdateFlight();
					 update.updateFlight(Flightid,flight_name,source,Destination,Economyclass,premiumclass,Bussinessclass);
					System.out.println("Call update2  method");
					System.out.println("update 2 completed ");
					
					response.getWriter().print("Data Updated ");
					
					

				 
				//RequestDispatcher requestDispatcher = request.getRequestDispatcher("Addflight.jsp");
				//requestDispatcher.forward(request, response);

			} catch (Exception e) {
				System.out.println(e);
				e.printStackTrace();
			}
			
		}


	


	}

