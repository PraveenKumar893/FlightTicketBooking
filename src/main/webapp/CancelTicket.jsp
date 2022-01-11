<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@page import="com.FlightTicketReservationSystem.Models.Passenger_details"%>
    <%@page import="java.util.List"%>
            <%@ page import="java.time.LocalDate"%> 
                <%@ page import="java.sql.Date"%>
                            <%@page import="com.FlightTicketReservationSystem.DaoImpl.Passenger_detailsDao"%>
                 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CANCEL LIST</title>
</head>
<style>

a:link, a:visited {
  background-color: #f44336;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: navy;
}




</style>
<body>

<a href="FlightSearch.jsp"class="btn btn-primary" style="font-style: italic;"> Back </a> <br > <br />



<%  
		List<Passenger_details> objcancellist = (List<Passenger_details>)request.getAttribute("CancelList");
/* 		String Mode  = (String)request.getAttribute("Mode");
		System.out.println("Mode cfsdf " + Mode);
 */ 
		%>
<%!
private static Date getcurrentdate()
{
	java.util.Date today = new java.util.Date();
	return new java.sql.Date(today.getTime());
}



%>
		
		
		
		
		   		<table border="2">
			<h1><b>Flight List</b></h1>
			<thead>
				<tr>
				   <th >S.no</th>
					<th>Class Details</th>
					<th>MobileNumber</th>
					<th>Source</th>
					<th>Destination</th>
					<th>FlightID</th>
					<th>DeparturedDate</th>
					<th>TicketNo</th>
					<th>SeatNo</th>
					<th>Status</th>
					<th>BookingDate</th>
					<th>ModeStatus</th>
					<th>TotalAmount</th>
					<th>CancelFlight</th>
					
					
					
					</tr>
			</thead>
			<br>
			<br>
			
			<tbody>
				<%
					int i = 0;
					for (Passenger_details objcancel : objcancellist) {
						i++;
				%>
				<tr>
				
					
					<td><%=i%></td>
					<td><%=objcancel.getClass_details()%></td>
					<%System.out.println("class" +  objcancel.getClass_details());%>
					<td><%=objcancel.getMobile_number()%></td>
					
					<td><%=objcancel.getSource()%></td>
					
					<td> <%=objcancel.getDestination()%></td>
										<td> <%=objcancel.getFlight_id()%></td>
															<td> <%=objcancel.getArrival_date()%></td>
					
					<td> <%=objcancel.getTicketNo()%></td>
										
					
					<td> <%=objcancel.getSeatno()%></td>
					<td> <%=objcancel.getStatus()%></td>
					<td> <%=objcancel.getBookingdate()%></td>
					<td> <%=objcancel.getMode()%></td>
					<td> <%=objcancel.getAmountpaid()%></td>
					
					
					
					
					
					<%
					String modeof = objcancel.getMode();
					System.out.println(modeof);
					LocalDate  date  = objcancel.getArrival_date();
					Date local = java.sql.Date.valueOf(date);
					String status =  objcancel.getStatus();
					%>
				
				
				<%
			if (local.after(getcurrentdate())){
			%>
					
					
							<%
							 if(status.equals("Cancelled"))
								{
								%>
								<td>CANCELLED</td>
								<%}
							 else
							 {%>
								 	<td><a href="FlightCancellation.jsp?seatno=<%=objcancel.getSeatno()%>&Flightid=<%=objcancel.getFlight_id()%>&Departuredate=<%=objcancel.getArrival_date()%>
	&Class=<%=objcancel.getClass_details()%>"
		class="btn btn-primary" >CancelTicket</a></td>
							</tr>
								 
							<%  }
							%>
					<% }
				
			else
			{%>
				<td>DEPARTURED</td>
			<%}
				
				%>			
							<%
				}
				%>
			
					</tbody>
		           </table>
			
</body>

</html>