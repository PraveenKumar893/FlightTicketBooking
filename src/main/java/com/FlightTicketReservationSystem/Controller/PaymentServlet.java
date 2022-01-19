package com.FlightTicketReservationSystem.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.FlightTicketReservationSystem.DaoImpl.WalletDao;
import com.FlightTicketReservationSystem.DaoImpl.FlightRegisterDao;
import com.FlightTicketReservationSystem.DaoImpl.Passenger_detailsDao;
import com.FlightTicketReservationSystem.Models.Flight;
import com.FlightTicketReservationSystem.Models.Flight_list;
import com.FlightTicketReservationSystem.Models.Passenger_details;
import com.FlightTicketReservationSystem.Models.Source;


/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/**
	 *
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
	        PrintWriter out=response.getWriter();

			System.out.println("method come inside");
		HttpSession session = request.getSession();
		WalletDao wallet = new WalletDao();
		String Username = (String)session.getAttribute("LOGGED_IN_USER");
		System.out.println("method come outsidehcvbsv");

	System.out.println("inside  111");
		String flightid = request.getParameter("flightid");
		int FlightId = Integer.parseInt(flightid);
		System.out.println("Flightd idkjhsjdda"+FlightId);
		String ticketno = request.getParameter("ticketno");
		int TicketNo = Integer.parseInt(ticketno);
		System.out.println(TicketNo);
		String Amount = request.getParameter("Amount");
		int Price = Integer.parseInt(Amount);
		
		
	int noofflightpassengers = (int)session.getAttribute("logpass");
	
	System.out.println("noofpassemnehfeg"+noofflightpassengers);
	
	
 int splitprice =  Price/noofflightpassengers;
 
 System.out.println("lldjhdsjghdsgdggsdg"+splitprice);
 
 
		
		System.out.println(Price);
		String mode = request.getParameter("yesCheck");
		System.out.println(mode);
		
		String seat_no = request.getParameter("seatno");
		System.out.println("seatno"+seat_no);
		String str = seat_no.replaceAll("\\[", "").replaceAll("\\]", "");
		str=str.replaceAll("\\s", "");
		System.out.println(str);

		String[] res = str.split(",",0);
		
		System.out.println("Stringresvalue"+res);

	    int passvalue = (int)session.getAttribute("logpass");
	      
	       
		int seatstatus = 0;
		
	     String economy = (String) session.getAttribute("Economy");
	     
	     System.out.println("Economyclass fir;leel   "+economy);
	      String pre = (String)session.getAttribute("Premium");
	    String bus = (String)  session.getAttribute("Bussiness");
	    
		String coach = (String)session.getAttribute("ClassDetails");
	     System.out.println("Classs Details value  "+coach);

       Passenger_detailsDao pass =  new Passenger_detailsDao();

		if(mode.equalsIgnoreCase("Wallet"))
		{
			System.out.println("vnhvhcvdhg12122");
			int walletamount = wallet.checkusername(Username);
			if(walletamount > 0 &&  walletamount > Price)
			{
				int Closingbalance = walletamount - Price;
				System.out.println("dnfvgfdsdghwdhdghdf");

				wallet.updatebalance(Username,Closingbalance);
				String noofpassengers = (String)request.getAttribute("noofpass");
				System.out.println("Comeinside:"+passvalue);
				for(String mystr:  res)
				{
					System.out.println("seatno integeegcfcdg"+mystr);
					 seatstatus = Integer.parseInt(mystr);
					 System.out.println("Seadhdhdhv"+seatstatus);
				wallet.InserPaymentdetails(FlightId, TicketNo, splitprice, mode, Username,seatstatus);
				

			}
				pass.Updatepassenger(Integer.parseInt(economy), Integer.parseInt(pre), Integer.parseInt(bus),coach,FlightId);

				RequestDispatcher requestDispatcher = request.getRequestDispatcher("FlightSearch.jsp");
				requestDispatcher.forward(request, response);
			}
			else
			{
				String someMessage = "Not Having Sufficient Amount !";
				out.println("<script type='text/javascript'>");
				out.println("alert(" + "'" + someMessage + "'" + ");</script>");
				out.println("</head><body></body></html>");
				System.out.println("inside  111");

				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Mywallet.jsp");
				requestDispatcher.forward(request, response);
			}


			
		
		}
		
		else 
		{
			System.out.println(Username);
			System.out.println("cjccbalwaidhinsertded");
			for(String mystr:  res)
			{
				System.out.println("seatno integeegcfcdg"+mystr);
				 seatstatus = Integer.parseInt(mystr);
					wallet.InserPaymentdetails(FlightId, TicketNo, splitprice, mode, Username,seatstatus);

			}
			pass.Updatepassenger(Integer.parseInt(economy), Integer.parseInt(pre), Integer.parseInt(bus),coach,FlightId);

			System.out.println("Seatstststgadcgdcdaddagcdacsavalue  "+seatstatus);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("FlightSearch.jsp");
			requestDispatcher.forward(request, response);
		}
		
		
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			System.out.println(e);
		}
		
	}


		// TODO Auto-generated method stub
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		 response.setContentType("text/html");
	        PrintWriter out=response.getWriter();

}
	}