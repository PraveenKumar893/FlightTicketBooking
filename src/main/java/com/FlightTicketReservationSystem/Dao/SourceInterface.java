package com.FlightTicketReservationSystem.Dao;

import java.sql.SQLException;
import java.util.List;

import com.FlightTicketReservationSystem.Models.Flight_Seat_Availability;
import com.FlightTicketReservationSystem.Models.Source;

public interface SourceInterface 
{
	public List<Flight_Seat_Availability> ListSeat(String source,String destination) throws ClassNotFoundException, SQLException ;
	
	public List<Source> ListSource() throws ClassNotFoundException, SQLException ;  



}
