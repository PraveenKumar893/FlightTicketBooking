package Models;

import java.sql.Date;
import java.time.LocalDate;
import java.sql.*;
import java.util.*;


public class Passenger_details 
{
	private String  Passenger_name;
	private String Class_details;
	private long  Mobile_number;
	
	private String Source;
	private String Destination ;
	private LocalDate Arrival_date;
	private int seatno;
	public Passenger_details(String passenger_name, String class_details, long mobile_number, String source,
			String destination, int seatno, int flight_id,LocalDate bookingdate) {
		super();
		Passenger_name = passenger_name;
		Class_details = class_details;
		Mobile_number = mobile_number;
		Source = source;
		Destination = destination;
		this.seatno = seatno;
		Flight_id = flight_id;
		Arrival_date = bookingdate;

	}
	public int getSeatno() {
		return seatno;
	}
	public void setSeatno(int seatno) {
		this.seatno = seatno;
	}
	public int getNoOfPassengers() {
		return NoOfPassengers;
	}
	public void setNoOfPassengers(int noOfPassengers) {
		NoOfPassengers = noOfPassengers;
	}
	private int Flight_id;
	private int NoOfPassengers;
	public String getPassenger_name() {
		return Passenger_name;
	}
	public void setPassenger_name(String passenger_name) {
		Passenger_name = passenger_name;
	}
	public String getClass_details() {
		return Class_details;
	}
	public void setClass_details(String class_details) {
		Class_details = class_details;
	}
	public long getMobile_number() {
		return Mobile_number;
	}
	public void setMobile_number(long mobile_number) {
		Mobile_number = mobile_number;
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
	public  LocalDate getArrival_date() {
		return Arrival_date;
	}
	public void setArrival_date(LocalDate arrival_date) {
		Arrival_date = arrival_date;
	}
	public int getFlight_id() {
		return Flight_id;
	}
	public void setFlight_id(int flight_id) {
		Flight_id = flight_id;
	}
	public Passenger_details(String passenger_name, String class_details, long mobile_number, String source,
			String destination, LocalDate arrival_date, int seatno, int flight_id, int noOfPassengers) {
		super();
		Passenger_name = passenger_name;
		Class_details = class_details;
		Mobile_number = mobile_number;
		Source = source;
		Destination = destination;
		Arrival_date = arrival_date;
		this.seatno = seatno;
		Flight_id = flight_id;
		NoOfPassengers = noOfPassengers;
	}
				
}
