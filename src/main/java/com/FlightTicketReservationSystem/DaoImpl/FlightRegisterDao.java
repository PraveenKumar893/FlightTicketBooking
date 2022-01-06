package com.FlightTicketReservationSystem.DaoImpl;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.FlightTicketReservationSystem.Dao.FlightRegisterInterface;
import com.FlightTicketReservationSystem.Models.AddFlight;
import com.FlightTicketReservationSystem.Models.Flight;

public class FlightRegisterDao implements FlightRegisterInterface
{
	public void Registration( Flight objFlightRegister) throws ClassNotFoundException 
	{
		try
		{
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			
			String sql = "insert into register (Names,Email_id,User_name,Password,gender,Phone_number,Registered_date) values(?,?,?,?,?,?,?)";
			//System.out.println(objFlightRegister.getName());
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, objFlightRegister.getName());
			stmt.setString(2, objFlightRegister.getEmailid());
			stmt.setString(3, objFlightRegister.getUsername());
			stmt.setString(4, objFlightRegister.getPassword());
			stmt.setString(5, objFlightRegister.getGender());
			stmt.setLong(6, objFlightRegister.getPhonenumber());
			stmt.setDate(7, getcurrentdate());
			int str = stmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();

		}
	}
		private static Date getcurrentdate()
		{
			java.util.Date today = new java.util.Date();
			return new java.sql.Date(today.getTime());
		}
			
	}

	

	


	

			
			
			
			


	


