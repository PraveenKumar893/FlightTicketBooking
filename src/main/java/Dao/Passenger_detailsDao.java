package Dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import Models.Flight_list;
import Models.Passenger_details;

public class Passenger_detailsDao 
{
	public void PassengerDetails(Passenger_details obj,int ticketno,String username)
	{
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
		System.out.println("inside 11");
		String sql = "insert into passenger_details (PASSENGER_NAME,CLASS,MOBILE_NUMBER,SOURCE,DESTINATION,FLIGHT_ID,BOOKING_DATE,Ticket_no,Status,User_name) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1,obj.getPassenger_name());
		System.out.println("inside 1");
		stmt.setString(2,obj.getClass_details());
		stmt.setLong(3,obj.getMobile_number());
		stmt.setString(4, obj.getSource());
		System.out.println("Inside2 ");
		stmt.setString(5, obj.getDestination());
		stmt.setInt(6,obj.getFlight_id());
		System.out.println("inside foldr");
//		  String str = obj.getArrival_date().toString();
//		  System.out.println(str);
//		    java.sql.Date format = java.sql.Date.valueOf(str);
//		  System.out.println(format);
//		stmt.setDate(7,  format);
		stmt.setDate(7,java.sql.Date.valueOf( obj.getArrival_date()));
		stmt.setInt(8,ticketno);
		stmt.setString(9, "Booked");
		stmt.setString(10, username);

		int str2 = stmt.executeUpdate();
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		
	}
}
	private static java.sql.Date getcurrentdate()
	{
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}
	
	public List<Passenger_details> Bookinglist()
	{
		List<Passenger_details> booklist = new ArrayList<>();
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			System.out.println("connection established"+con);
			
			//out.println("connection established"+con);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from passenger_details");
			//out.println("123");
			while(rs.next())
			{
				String  name = rs.getString(1);
				String classdetails = rs.getString(2);
				System.out.println("Coming method inside");
				long mobno  = rs.getLong(3);
				String Source = rs.getString(4);
				String destination = rs.getString(5);

				LocalDate Bookingdate = rs.getDate(6).toLocalDate();
				int flightid = rs.getInt(7);
				int seatno = rs.getInt(8);
				int ticketno = rs.getInt(9);
				



				
				
				Passenger_details passenegr = new Passenger_details(name, classdetails, mobno, Source, destination,ticketno,seatno,flightid,Bookingdate);
				booklist.add(passenegr);

				
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
return booklist;
				   
	}
	
	public  void Updatepassenger(int economyseats , int premiumseats, int businessseats,String Coach, int Flightid) 
	{
		 try
		 {
			 System.out.println("hi");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			System.out.println("inside 11");
			String sql = "";

			if(Coach.equalsIgnoreCase("Economy"))
					{
				System.out.println(economyseats);
				 sql = "update flight_seats_availabilty set ECOMOMY_SEATS = ?   where FLIGHT_ID = ?";
					PreparedStatement stmt = con.prepareStatement(sql);
					stmt.setInt(1,economyseats);
					stmt.setInt(2,Flightid);
					stmt.executeUpdate();





					}
			else if(Coach.equalsIgnoreCase("premium"))
			{
				 sql = "update flight_seats_availabilty set PREMIUM_ECONOMY_SEATS = ?   where FLIGHT_ID = ?";
					PreparedStatement stmt = con.prepareStatement(sql);
					stmt.setInt(1,premiumseats);
					stmt.setInt(2,Flightid);
					 stmt.executeUpdate();




			}
			else if(Coach.equalsIgnoreCase("Bussiness"))
			{
				 sql = "update flight_seats_availabilty set BUSINESS_SEATS = ?   where FLIGHT_ID = ?";
					PreparedStatement stmt = con.prepareStatement(sql);
					stmt.setInt(1,businessseats);
					stmt.setInt(2,Flightid);
					 stmt.executeUpdate();



			}
		 }
		 catch(Exception e)
		 {
			 System.out.println(e.getMessage());
		 }

			
			



			
			

		
	}
	
	public List<Passenger_details> CancelTicket(String Username)
	{
		List<Passenger_details> canceldetails = new ArrayList<>();
		try 
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
		System.out.println("Weleocme to add flight ");
		String sql = "SELECT * FROM passenger_details WHERE user_name = ? ";
		
		PreparedStatement pst = connection.prepareStatement(sql);
		pst.setString(1, Username);
		ResultSet rs = pst.executeQuery();
		if(rs != null)
		{
			System.out.println("Valid");
			while (rs.next()) 
			{
				String  Class =  rs.getString(2);
				long  mobno =  rs.getLong(3);
				String  source =  rs.getString(4);
				String  destination =  rs.getString(5);
				LocalDate  bookingdate =  rs.getDate(6).toLocalDate();
				int  flightid =  rs.getInt(7);
				int  seatno =  rs.getInt(8);
				int  ticketno =  rs.getInt(9);
				String  status =  rs.getString(10);
				System.out.println(status);
				
				
				Passenger_details passenegr = new Passenger_details(Class, mobno, source, destination, bookingdate, ticketno, seatno, flightid,status);
				canceldetails.add(passenegr);
				}
		
	}
	
	
	
	}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return canceldetails;
}
	public  void Updatecancelstatus(int seatno) 
	{
		 try
		 {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			System.out.println("inside 11");
			String sql = "";

			

				 sql = "update passenger_details set status = ?   where Seat_no = ?";
					PreparedStatement stmt = con.prepareStatement(sql);
					stmt.setString(1,"Cancelled");
					stmt.setInt(2,seatno);
					stmt.executeUpdate();





					
		
		 }
		 catch(Exception e)
		 {
			 System.out.println(e.getMessage());
		 }

			
			



			
			

		
	}
	
}

	
				   
	





