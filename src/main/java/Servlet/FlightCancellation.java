package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AddFlightDao;
import Dao.Passenger_detailsDao;

/**
 * Servlet implementation class FlightCancellation
 */
@WebServlet("/FlightCancellation")
public class FlightCancellation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightCancellation() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String  seat_no  = request.getParameter("seatno");
		int seatno = Integer.parseInt(seat_no);
				Passenger_detailsDao cancelflight = new Passenger_detailsDao();
				try {
					cancelflight.Updatecancelstatus(seatno);
					response.getWriter().print("Flight Cancelled");
					   
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("FlightSearch.jsp");
					requestDispatcher.forward(request, response);

				} catch (Exception e) {
					e.printStackTrace();
				}
	}

}
