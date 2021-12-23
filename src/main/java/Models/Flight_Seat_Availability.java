package Models;

import java.sql.Date;

public class Flight_Seat_Availability 
{
	private int flightId;
	private String flightname;
	public int getFlightId() {
		return flightId;
	}
	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}
	public String getFlightname() {
		return flightname;
	}
	public void setFlightname(String flightname) {
		this.flightname = flightname;
	}
	private String source;
	private String destination;
	private Date Departure_Date;
	private int Economy_class;
	private int premium_Economy_class;
	private int Bussiness_class;
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public Date getDeparture_Date() {
		return Departure_Date;
	}
	public void setDeparture_Date(Date departure_Date) {
		Departure_Date = departure_Date;
	}
	public int getEconomy_class() {
		return Economy_class;
	}
	public void setEconomy_class(int economy_class) {
		Economy_class = economy_class;
	}
	public int getPremium_Economy_class() {
		return premium_Economy_class;
	}
	public void setPremium_Economy_class(int premium_Economy_class) {
		this.premium_Economy_class = premium_Economy_class;
	}
	public int getBussiness_class() {
		return Bussiness_class;
	}
	public void setBussiness_class(int bussiness_class) {
		Bussiness_class = bussiness_class;
	}
	public Flight_Seat_Availability(int flightId, String flightname, String source, String destination,
			Date departure_Date, int economy_class, int premium_Economy_class, int bussiness_class) {
		super();
		this.flightId = flightId;
		this.flightname = flightname;
		this.source = source;
		this.destination = destination;
		Departure_Date = departure_Date;
		Economy_class = economy_class;
		this.premium_Economy_class = premium_Economy_class;
		Bussiness_class = bussiness_class;
	}
	public Flight_Seat_Availability() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
