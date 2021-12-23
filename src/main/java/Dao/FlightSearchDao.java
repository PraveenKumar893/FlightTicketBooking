
package Dao;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.*;
import java.time.LocalDate;

import Models.Flight_list; 

public class FlightSearchDao 
{
	public List<Flight_list> FlightList()
	{
		List<Flight_list> flightList = new ArrayList<>();

		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
		System.out.println("connection established"+con);
		
		//out.println("connection established"+con);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from flight_details");
		//out.println("123");
		while(rs.next())
		{
			int  flightId = rs.getInt("flight_id");
			String airlines = rs.getString("Flight_name");
			String Source = rs.getString("Source");
			String destination = rs.getString("Destination");
			int economyClass = rs.getInt("Economy_Class");
			int premiumeconomyclass = rs.getInt("premium_Economy_class");
			int businessClass = rs.getInt("Bussiness_class");
			//Date Arrival_Time = rs.getDate("Arrival_Time");
			//Date Departure_Time = rs.getDate("Departure_Time");

			
			Flight_list objFlight = new Flight_list(flightId, airlines,  null, null, Source, destination, economyClass, premiumeconomyclass, businessClass);
			
			flightList.add(objFlight);
			
			
		}
	}
	catch(Exception e)
	{
		//out.println("connection established qqww");
	}
return flightList;
			   
				   
	}
				   
	

		public Flight_list getRecordById(int flightId) {
		Flight_list flight = null;
	
		try {
			
			System.out.println("connection established"+ flightId);

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			System.out.println("connection established"+con);
			
				String sql = "SELECT * FROM flight_details WHERE flight_Id = ? ";
			
			
			
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, flightId);
			ResultSet rs = pst.executeQuery();	
			if(rs != null)
			{
				while(rs.next())
				{
					System.out.println("Time");
					int id = rs.getInt("flight_Id");
					String airlines = rs.getString("flight_name");
					String source = rs.getString("source");
					String destination = rs.getString("destination");
//					Date Arrival_Time = rs.getDate("Arrival_Date");
//					Date Departure_Time = rs.getDate("Departure_Date");				
					int firstClass= rs.getInt("economy_class");
					int economyClass = rs.getInt("premium_economy_class");
					System.out.println("Class file ");
					int businessClass = rs.getInt("bussiness_class");
					System.out.println("Bssiness class");
					Date Arrival_Time = rs.getDate("Arrival_Date");
					Date Departure_Time = rs.getDate("Departure_Date");				


					// Store the data in model
					flight = new Flight_list(id, airlines,Arrival_Time,Departure_Time,source,destination,firstClass,economyClass,businessClass);

					
					
				}
			}
			

			
		} 
		catch (SQLException | ClassNotFoundException e) {
			
		} 
		return flight;
	}
//	public int getBookedTickets(int flightId,String coach,String strDate) {
//	
//	int Seat_Available = 0;
//		System.out.println(coach);
//	
//		try {
//			String Coach_Name = coach;
//			System.out.println(Coach_Name);
//			
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
//			System.out.println("connection established"+con);
//			
//			//out.println("connection established"+con);
//			//Statement stmt = con.createStatement();
//			
//		
//			
//					
//				String sql = "SELECT * FROM flight_seats_availabilty WHERE flight_id=? and FLIGHT_DEPARTURE_DATE= ? ";
//				
//				
//			
//			PreparedStatement pst = con.prepareStatement(sql);
//			
//		
//			
//			
//			pst.setInt(1, flightId);
//			pst.setString(2, strDate);	
//		
//			ResultSet rs = pst.executeQuery();
//			while(rs.next())
//				{
//					int eco_Seat_Available= rs.getInt("ecomomy_seats");
//					System.out.println(eco_Seat_Available);
//					System.out.println("hello");
//					
//					 int premiumeconomyseats = rs.getInt("PREMIUM_ECONOMY_SEATS");
//					System.out.println(premiumeconomyseats);
//			int bussinessseats  = rs.getInt("BUSINESS_SEATS");
//			System.out.println(bussinessseats);
//		
//         
//			System.out.println(Coach_Name);
//			if(Coach_Name.equalsIgnoreCase("Economy"))
//			{
//				Seat_Available = eco_Seat_Available;
//				//Seat_Available= rs.getInt("ecomomy_seats");
//										System.out.println("hello");
//				
//				}
//			else if(Coach_Name.equalsIgnoreCase("premium"))
//			{
//			Seat_Available = premiumeconomyseats;
//					System.out.println("hello2");
//				}
//			else if(Coach_Name.equalsIgnoreCase("Bussiness"))
//			{
//				Seat_Available = bussinessseats;
//					System.out.println("hello3");
//				}
//
//					
//				}
//				     
//
//			
//		} 
//		catch (SQLException | ClassNotFoundException e) {
//			System.out.println(e.getMessage());
//		} 
//		return Seat_Available ;
//	}

}
