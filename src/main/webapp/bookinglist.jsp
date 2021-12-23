<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="Models.Passenger_details"%>
    <%@page import="java.util.List"%>
            <%@page import="Dao.Passenger_detailsDao"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%  
		List<Passenger_details> bookobject = (List<Passenger_details>)request.getAttribute("Bookinglist");
 
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
					
					</tr>
			</thead>
			<br>
			<br>
			
			<tbody>
				<%
					int i = 0;
					for (Passenger_details object : bookobject) {
						i++;
				%>
				<tr>
				
					
					<td><%=i%></td>
					<td><%=object.getPassenger_name()%></td>
					<td><%=object.getClass_details()%></td>
					<td><%=object.getMobile_number()%></td>
					
					<td><%=object.getSource()%></td>
					
					<td> <%=object.getDestination()%></td>
					<td> <%=object.getSeatno()%></td>
					<td> <%=object.getArrival_date()%></td>
					
					<td> <%=object.getFlight_id()%></td>
					
			</tr>
					
					<%
				}
				%>
					</tbody>
		           </table>
			
			
		


</body>
</html>