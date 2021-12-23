package Models;

import java.sql.*;

public class Flight_list 
{
	private int Flight_id;
	private String Flight_name;
	private String Source;
	private String Destination;
	private int Economy_class;
	private int premium_Economy_class;
	private int Bussiness_class;
	private Date Arrival_Time;
	private Date Departure_time;

		public Flight_list(int flight_id, String flight_name,Date arrival_Time, Date departure_time
				,String source, String destination, int economy_class,
			int premium_Economy_class, int bussiness_class) {
		super();
		Flight_id = flight_id;
		Flight_name = flight_name;
		Source = source;
		Destination = destination;
		Economy_class = economy_class;
		this.premium_Economy_class = premium_Economy_class;
		Bussiness_class = bussiness_class;
		Arrival_Time = arrival_Time;
		Departure_time = departure_time;
	}
		public int getFlight_id() {
		return Flight_id;
	}
	public void setFlight_id(int flight_id) {
		this.Flight_id = flight_id;
	}
	public String getFlight_name() {
		return Flight_name;
	}
	public void setFlight_name(String flight_name) {
		Flight_name = flight_name;
	}
	public Date getArrival_Time() {
		return Arrival_Time;
	}
	public void setArrival_Time(Date arrival_Time) {
		Arrival_Time = arrival_Time;
	}
	public Date getDeparture_time() {
		return Departure_time;
	}
	public void setDeparture_time(Date departure_time) {
		Departure_time = departure_time;
	}
	public String getSource() {
		return Source;
	}
	public void setSource(String source) {
		Source = source;
	}
	public String getDestination() {
		return Destination;
	}
	public void setDestination(String destination) {
		Destination = destination;
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
	public Flight_list() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	
	

}