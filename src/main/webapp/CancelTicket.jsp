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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

<a href="FlightSearch.jsp"class="btn btn-primary" style="font-style: italic"> Back </a> <br > <br />



<%  
		List<Passenger_details> objcancellist = (List<Passenger_details>)request.getAttribute("CancelList");
		%>
<%!
private static Date getcurrentdate()
{
	java.util.Date today = new java.util.Date();
	return new java.sql.Date(today.getTime());
}



%>
		
		
		
		
		   		<table border="2" class="table">
			<h1 align="center"><b>Flight List</b></h1>
			<thead>
				<tr class="info">
				   <th  >S.no</th>
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
										
					
					<td class="success"> <%=objcancel.getSeatno()%></td>
					<td class="danger"> <%=objcancel.getStatus()%></td>
					<td> <%=objcancel.getBookingdate()%></td>
					<td> <%=objcancel.getMode()%></td>
					<td class="warning"> <%=objcancel.getAmount()%></td>
					
					
					
					
					
					<%
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
	&Class=<%=objcancel.getClass_details()%>&Amount=<%=objcancel.getAmount()%>&Seatno=<%=objcancel.getSeatno()%>"
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