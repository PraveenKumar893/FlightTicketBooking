<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@page import="Models.Passenger_details"%>
    <%@page import="java.util.List"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  
		List<Passenger_details> objcancellist = (List<Passenger_details>)request.getAttribute("CancelList");
 
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
					<th>BookingDate</th>
					<th>TicketNo</th>
					<th>SeatNo</th>
					<th>Status</th>
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
					<td><%=objcancel.getMobile_number()%></td>
					
					<td><%=objcancel.getSource()%></td>
					
					<td> <%=objcancel.getDestination()%></td>
										<td> <%=objcancel.getFlight_id()%></td>
															<td> <%=objcancel.getArrival_date()%></td>
					
					<td> <%=objcancel.getTicketNo()%></td>
										
					
					<td> <%=objcancel.getSeatno()%></td>
					
										<td> <%=objcancel.getStatus()%></td>
										
					<td><a href="FlightCancellation.jsp?seatno=<%=objcancel.getSeatno()%>" class="btn btn-primary">CancelTicket</a></td>
										
				
					
					
					
			</tr>
					
					<%
				}
				%>
					</tbody>
		           </table>
			
			
		



</body>
</html>