package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Passenger_detailsDao;
import Models.Passenger_details;

/**
 * Servlet implementation class ConfirmDetails
 */
@WebServlet("/ConfirmDetails")
public class ConfirmDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmDetails() {
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
		
		try
		{
		  String Flight_Id =request.getParameter("flightId");
		  int flightid = Integer.parseInt(Flight_Id);
		  System.out.println(flightid);
		String name = request.getParameter("username");
		String date = request.getParameter("bookingDate");
       LocalDate local = LocalDate.parse(date);

		System.out.println(local);
		String Source = request.getParameter("source");
		String Destination = request.getParameter("destination");
      String mobno = request.getParameter("MobileNumber");
      long mobileno = Long.parseLong(mobno);
      System.out.println(mobileno);
		String class_details = request.getParameter("coach");
		//String seat  = request.getParameter("SEAT_NO");
		//int seat_no = Integer.parseInt(seat);
       String noofpassengers = request.getParameter("numberOfPassengers");
       System.out.println(noofpassengers);
       int noofpass = Integer.parseInt(noofpassengers);
       System.out.println(noofpass);
       String economyseats = request.getParameter("Economyclass");
       int ecoseats = 0;
		if 	(economyseats != null && economyseats != "") 
		{
			ecoseats = Integer.parseInt(economyseats);
		System.out.println(ecoseats);
		}

	     
			String premiumeconomyseats = request.getParameter("PremiumEconomyclass");
			int premiumecoseats = 0;
		if 	(premiumeconomyseats != null && premiumeconomyseats != "") 
			{
			 premiumecoseats = Integer.parseInt(premiumeconomyseats);
			System.out.println(premiumecoseats);
			}
		
	      String businesseats = request.getParameter("Bussinessclass");
	      
			int bussseats = 0;
		if 	(businesseats != null && businesseats != "") 
			{
			bussseats = Integer.parseInt(businesseats);
			System.out.println(bussseats);
			}

///       String Price_details = request.getParameter("price");
      
     //  Date Bookingdate =(Date) new SimpleDateFormat("yyyy-mm-dd").parse(date);
       
      // Date Bookingdate = (Date) sdf.parse(date);
     //int price = Integer.parseInt(Price_details);
       
      
       
     Passenger_details passenger = new Passenger_details(name, class_details, mobileno, Source, Destination,local,ecoseats,premiumecoseats,bussseats,flightid,noofpass);
     System.out.println(passenger);
     request.setAttribute("Passenger_Deatils", passenger);
     
     RequestDispatcher requestDispatcher = request.getRequestDispatcher("ConfirmDetails.jsp");
		requestDispatcher.forward(request, response);
		
		}
		catch(Exception e)
		{
			
			 System.out.println(e.getMessage());
		}
	}

	
	
}
