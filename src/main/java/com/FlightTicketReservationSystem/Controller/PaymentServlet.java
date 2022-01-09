package com.FlightTicketReservationSystem.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.FlightTicketReservationSystem.DaoImpl.WalletDao;

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
		String ticketno = request.getParameter("ticketno");
		int TicketNo = Integer.parseInt(ticketno);
		String Amount = request.getParameter("Amount");
		int Price = Integer.parseInt(Amount);
		String mode = request.getParameter("yesCheck");
		System.out.println(mode);
		System.out.println("inside  111");

		if(mode.equalsIgnoreCase("Wallet"))
		{
			int walletamount = wallet.checkusername(Username);
			if(walletamount > 0 &&  walletamount > Price)
			{
				int Closingbalance = walletamount - Price;
				wallet.updatebalance(Username,Closingbalance);
				
				wallet.InserPaymentdetails(FlightId, TicketNo, Closingbalance, mode, Username);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
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
			wallet.InserPaymentdetails(FlightId, TicketNo, Price, mode, Username);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
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
//		try
//		{
//			System.out.println("method come inside");
//		HttpSession session = request.getSession();
//		WalletDao wallet = new WalletDao();
//		String Username = (String)session.getAttribute("LOGGED_IN_USER");
//		System.out.println("method come outsidehcvbsv");
//
//	System.out.println("inside  111");
//		String flightid = request.getParameter("flightid");
//		int FlightId = Integer.parseInt(flightid);
//		String ticketno = request.getParameter("ticketno");
//		int TicketNo = Integer.parseInt(ticketno);
//		String Amount = request.getParameter("Amount");
//		int Price = Integer.parseInt(Amount);
//		String mode = request.getParameter("yesCheck");
//		System.out.println(mode);
//		System.out.println("inside  111");
//
//		if(mode.equalsIgnoreCase("Wallet"))
//		{
//			int walletamount = wallet.checkusername(Username);
//			if(walletamount > 0 &&  walletamount > Price)
//			{
//				int Closingbalance = walletamount - Price;
//				wallet.updatebalance(Username,Closingbalance);
//				
//				wallet.InserPaymentdetails(FlightId, TicketNo, Closingbalance, mode, Username);
//				RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
//				requestDispatcher.forward(request, response);
//			}
//			else
//			{
//				String someMessage = "Not Having Sufficient Amount !";
//				out.println("<script type='text/javascript'>");
//				out.println("alert(" + "'" + someMessage + "'" + ");</script>");
//				out.println("</head><body></body></html>");
//				System.out.println("inside  111");
//
//				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Mywallet.jsp");
//				requestDispatcher.forward(request, response);
//			}
//
//
//			
//		
//		}
//		
//		else 
//		{
//			System.out.println(Username);
//			System.out.println("cjccbalwaidhinsertded");
//			wallet.InserPaymentdetails(FlightId, TicketNo, Price, mode, Username);
//			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
//			requestDispatcher.forward(request, response);
//		}
//		
//		
//		}
//		catch(Exception e)
//		{
//			System.out.println(e.getMessage());
//			System.out.println(e);
//		}
//		
//	}
//
//}
}
	}