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

import Models.Flight_Seat_Availability;
import Models.Flight_list;

import Models.Flight_list;
import Models.Source;

public class SourceDao 
{
	public List<Flight_Seat_Availability> ListSeat(String source,String destination) throws ClassNotFoundException, SQLException  

	{
		List<Flight_Seat_Availability> Seatavailabilitylist = new ArrayList<>();
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			
			String sql = " SELECT b.flight_id,b.flight_name,b.source,b.destination,a.flight_departure_date,a.ecomomy_seats,a.premium_economy_Seats,a.business_seats FROM Flight_Seats_availabilty a join Flight_details b on a.flight_id = b.flight_id WHERE b.source = ? AND b.destination  = ? ";
			
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, source);
			pst.setString(2, destination);
		    System.out.println(source);
		    System.out.println(destination);
			ResultSet rs1 = pst.executeQuery();
			
				System.out.println("Valid");
				while (rs1!=null && rs1.next()) {
				{
					System.out.println("hello1");
					int Flight_id = rs1.getInt("flight_id");
					
					String Flight_name = rs1.getString("flight_name");
					String Source = rs1.getString("Source");
					String flight_destination = rs1.getString("Destination");
				   Date Departure_Time = rs1.getDate("Flight_Departure_date");
					int economyClass = rs1.getInt("Ecomomy_seats");
					int premiumeconomyclass = rs1.getInt("Business_Seats");
					int businessClass = rs1.getInt("Premium_Economy_Seats");
					
					Flight_Seat_Availability objFlightseat = new Flight_Seat_Availability(Flight_id,Flight_name,Source, flight_destination, Departure_Time, economyClass,  premiumeconomyclass, businessClass);
					
					Seatavailabilitylist.add(objFlightseat);
					
					
					
				
			       
			}
		
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
return Seatavailabilitylist;
	}

	public List<Source> ListSource() throws ClassNotFoundException, SQLException  

	{
		List<Source> SourceList = new ArrayList<>();
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			System.out.println("connection established"+con);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from flight_details");
			//out.println("123");
			while(rs.next())
			{
				
				String Source = rs.getString("Source");
				String destination = rs.getString("Destination");
				
				
				Source objFlight = new Source(Source, destination);
				
				SourceList.add(objFlight);
				
				
			}
		       
		}
		catch(Exception e)
		{
			//out.println("connection established qqww");
		}
return SourceList;
	}

}
