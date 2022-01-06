<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.FlightTicketReservationSystem.Models.Passenger_details"%>
    <%@page import="java.util.List"%>
            <%@page import="com.FlightTicketReservationSystem.DaoImpl.Passenger_detailsDao"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%  
		List<Passenger_details> objbookinglist = (List<Passenger_details>)request.getAttribute("Bookinglist");
 
		%>
		
		   		<table border="2">
			<h1><b>Flight List</b></h1>
			<thead>
				<tr>
				   <th >S.no</th>
					<th>Passenger Name</th>
					<th>Class Details</th>
					<th>MobileNumber</th>
					<th>Source</th>
					<th>Destination</th>
					<th>FlightID</th>
					<th>BookingDate</th>
					<th>TicketNo</th>
					<th>SeatNo</th>
					
					
					</tr>
			</thead>
			<br>
			<br>
			
			<tbody>
				<%
					int i = 0;
					for (Passenger_details objbook : objbookinglist) {
						i++;
				%>
				<tr>
				
					
					<td><%=i%></td>
					<td><%=objbook.getPassenger_name()%></td>
					<td><%=objbook.getClass_details()%></td>
			  	<td><%=objbook.getMobile_number()%></td> 
					
					<td><%=objbook.getSource()%></td>
					
					<td> <%=objbook.getDestination()%></td>
										<td> <%=objbook.getFlight_id()%></td>
															<td> <%=objbook.getArrival_date()%></td>
					
					<td> <%=objbook.getTicketNo()%></td>
										
					
					<td> <%=objbook.getSeatno()%></td>
					
					
			</tr>
					
					<%
				}
				%>
					</tbody>
		           </table>
			
			
		


</body>
</html>