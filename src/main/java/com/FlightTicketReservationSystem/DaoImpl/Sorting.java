package com.FlightTicketReservationSystem.DaoImpl;

import java.util.Comparator;

import com.FlightTicketReservationSystem.Models.Flight_Seat_Availability;


public class Sorting implements Comparator<Flight_Seat_Availability>
{

	@Override
	public int compare(Flight_Seat_Availability o1, Flight_Seat_Availability o2) 
	{
		if(o1.getEconomy_class()==o2.getEconomy_class())
		{
			return 0;
		}
		else if(o1.getEconomy_class()>o2.getEconomy_class())
		{
			return 1;

		}
		else
		{

		return -1;
		}
	}

	

}
