package Servlet;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Models.Flight_list;
import Dao.FlightSearchDao;

/**
 * Servlet implementation class FlightSearch
 */
@WebServlet("/FlightSearch")
public class FlightSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 String page="FlightList.jsp";
	    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param departureTime 
	 * @param res 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        out.println("helpp");
       // List<Flight_list> flightList = new ArrayList<>();
try
{
	
	FlightSearchDao flightDao = new FlightSearchDao();
	
	
	List<Flight_list> flightInfo = flightDao.FlightList();
	//request.getRequestDispatcher("DisplaySearchFlight.jsp?").forward(request, response);
	request.setAttribute("Flight_List", flightInfo);
	System.out.println("Inside 1");
	RequestDispatcher requestDispatcher = request.getRequestDispatcher("FlightList.jsp");
	requestDispatcher.forward(request, response);
	
	
}
catch(Exception e)
{
	out.println("connection established ");
}

		
	}	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
