package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	      
	      String economyseats = request.getParameter("Economyclass");
	     
	      System.out.println(economyseats);
			String premiumeconomyseats = request.getParameter("PremiumEconomyclass");
			
	      String businesseats = request.getParameter("Bussinessclass");
	      
	      long mobileno = Long.parseLong(mobno);
	      System.out.println(mobno);
			String class_details = request.getParameter("coach");
			//String seat  = request.getParameter("SEAT_NO");
			//int seat_no = Integer.parseInt(seat);
	       String noofpassengers = request.getParameter("numberOfPassengers");
	       System.out.println(noofpassengers);
	       int noofpass = Integer.parseInt(noofpassengers);
	       System.out.println(noofpass);
//	       String Price_details = request.getParameter("price");
//	     int price = Integer.parseInt(Price_details);

	       int ticketno = generator();
	       
	       System.out.println(ticketno);
	       HttpSession session = request.getSession();
	       String loggedInAsUser = (String) session.getAttribute("LOGGED_IN_USER");
     System.out.println(loggedInAsUser);
	     Passenger_details passenger = new Passenger_details(name, class_details, mobileno, Source, Destination, 0,flightid,local);
			Passenger_detailsDao pass = new Passenger_detailsDao();
			
			for(int i=0;i<noofpass;i++)
			{
				pass.PassengerDetails(passenger,ticketno,loggedInAsUser);
			}
			pass.Updatepassenger(Integer.parseInt(economyseats), Integer.parseInt(premiumeconomyseats), Integer.parseInt(businesseats),class_details,flightid);
			
			
			//response.getWriter().print("Data Registered");
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Ticket Booked Successfully');");
			   out.println("location='AddPassenger.jsp';");
			   out.println("</script>");
			   
			 
				   RequestDispatcher requestDispatcher = request.getRequestDispatcher("FlightSearch.jsp");
					requestDispatcher.forward(request, response);
			  
			
				
				
			//response.sendRedirect("Login.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("Register.jsp?errorMessage=" + e.getMessage());
		}

			
		
			}
	public int generator()
	{
		Random r = new Random(System.currentTimeMillis());
		return 100 + r.nextInt(1200);
	}

	}


