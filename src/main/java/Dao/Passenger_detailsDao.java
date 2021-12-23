package Dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import Models.Flight_list;
import Models.Passenger_details;

public class Passenger_detailsDao 
{
	public void PassengerDetails(Passenger_details obj)
	{
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
		System.out.println("inside 11");
		String sql = "insert into passenger_details (PASSENGER_NAME,CLASS,MOBILE_NUMBER,SOURCE,DESTINATION,FLIGHT_ID,BOOKING_DATE) values(?,?,?,?,?,?,?)";
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
				int ticketno = rs.getInt(6);

				LocalDate Bookingdate = rs.getDate(7).toLocalDate();
				int flightid = rs.getInt(8);


				
				
				Passenger_details passenegr = new Passenger_details(name, classdetails, mobno, Source, destination, flightid, ticketno, Bookingdate);
				booklist.add(passenegr);

				
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
return booklist;
				   
	}
}

	
				   
	





