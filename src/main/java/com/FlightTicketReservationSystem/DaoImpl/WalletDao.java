package com.FlightTicketReservationSystem.DaoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.FlightTicketReservationSystem.Dao.WalletInterface;

public class WalletDao implements WalletInterface
{
	public  int getclosingbalance( String username) throws Exception
	{
		
		int Closing_balance = 0;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
		System.out.println("Weleocme to add flight ");
		String sql = "SELECT wallet_amount FROM wallet_details WHERE user_name = ?";
		
		PreparedStatement pst = connection.prepareStatement(sql);
		pst.setString(1, username);
		
	    System.out.println(username);
	   
		ResultSet rs = pst.executeQuery();
		if(rs != null)
		{
			
			while (rs.next()) {
				Closing_balance =  rs.getInt("wallet_amount");
				 System.out.println(Closing_balance);
				
				
			}
		       
		}
		
	      return Closing_balance;
			
	}
	public  int checkusername( String username) throws Exception
	{
		
		int Closing_balance =0;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
		System.out.println("Weleocme to add flight ");
		
           String sql = "SELECT wallet_amount FROM wallet_details WHERE user_name = ?";
		
		PreparedStatement pst = connection.prepareStatement(sql);
		pst.setString(1, username);
		
	    System.out.println(username);
	   
		ResultSet rs = pst.executeQuery();
		if(rs != null)
		{
			
			while (rs.next()) {
				 Closing_balance = rs.getInt("wallet_amount");
			}
		}
			
		
		return Closing_balance;
	}
		
	public  void insetbalance( String username,int Amount) throws Exception
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
		System.out.println("Weleocme to add flight ");
		String query =  "insert into wallet_details (user_name,wallet_amount)values(?,?)";
		System.out.println(query);

		PreparedStatement pst = connection.prepareStatement(query);
		pst.setString(1, username);
		pst.setInt(2, Amount);
	    System.out.println(username);
	   
	    pst.executeUpdate();
		
	      
	}
	
	public  void updatebalance( String username,int Amount) throws Exception
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
		System.out.println("Weleocme to add flight ");
		 String sql = "update wallet_details set wallet_amount = ?   where user_name = ?";
		

		PreparedStatement pst = connection.prepareStatement(sql);
		pst.setInt(1, Amount);
		pst.setString(2, username);
	    System.out.println(username);
	   
	    pst.executeUpdate();
		
	      
	}
	
	public void InserPaymentdetails(int Flightid, int Ticketno , int totalamount , String modeoftransaction,String username) throws ClassNotFoundException, SQLException

	{
		System.out.println(username);
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
		String sql = "insert into PaymentDetails (FLIGHTID,TICKETNO,TOTALAMOUNT,MODEOFTRANSACTION,Username) values(?,?,?,?,?)";
		PreparedStatement pst = connection.prepareStatement(sql);
		pst.setInt(1, Flightid);
		System.out.println("ckhfjfgffhfhsfhf");
		pst.setInt(2, Ticketno);
		pst.setInt(3, totalamount);
		pst.setString(4, modeoftransaction);
		pst.setString(5, username);
	    pst.executeUpdate();





		
	}

}
