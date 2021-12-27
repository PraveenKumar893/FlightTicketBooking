<%@page import="Models.Flight_Seat_Availability"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Flight List</title>
<style type="text/css">
table, td, th {
	text-align: center;
}
</style>
</head>

<body>
<%
String loggedInAsAdmin = (String) session.getAttribute("LOGGED_IN_ADMIN");
String loggedInAsUser = (String) session.getAttribute("LOGGED_IN_USER");

%>

 <jsp:include page="Header.jsp"></jsp:include>

	<%
		List<Flight_Seat_Availability> flights = (List<Flight_Seat_Availability>)request.getAttribute("Flight_List");
		if (flights != null) {
		%>
		
		<a href="FlightSearch.jsp" style="position: relative;left:339px;top:70px;width: 140px;height: 29px; font-style: italic;  " class="btn btn-primary"> Back </a> <br > <br /> 
 
		<table border="2">
			<h1><b>Flight List</b></h1>
			<thead>
				<tr>
				   <th >S.no</th>
					<th>Flight Id</th>
					<th>Flight name</th>
					<th>DepartingFrom</th>
					<th>Departing To</th>
					<th>DepartureDate</th>
					<th>Economy Class</th>
					<th>PremiumEconomyClass</th>
					<th>Business Class</th>
					<%
			if (loggedInAsUser != null) {
			%>
					<th scope= "col">Book Ticket </th>
				<%}
				%>
					
					
				</tr>
			</thead>
			<br>
			<br>
			
			<tbody>
				<%
					int i = 0;
					for (Flight_Seat_Availability flight : flights) {
						i++;
				%>
				<tr>
				
					
					<td><%=i%></td>
					<td><%=flight.getFlightId()%></td>
					<td><%=flight.getFlightname()%></td>
					<td><%=flight.getSource()%></td>
					<td><%=flight.getDestination()%></td>
					<td> <%=flight.getDeparture_Date()%></td>
					<td> <%=flight.getEconomy_class()%></td>
					<td><%=flight.getPremium_Economy_class()%></td>
					<td> <%=flight.getBussiness_class()%></td>
					
					<%
			if (loggedInAsUser != null) {
			%>
					<td><a href="AddPassenger.jsp?flightId=<%=flight.getFlightId() %>&source=<%=flight.getSource()%>&destination=<%=flight.getDestination()%>
					&Departure_Date=<%=flight.getDeparture_Date()%>&Economy_class=<%=flight.getEconomy_class()%>&Premium_Economy_class=<%=flight.getPremium_Economy_class()%>
&Bussiness_class=<%=flight.getBussiness_class()%>" 
					class="btn btn-primary">BOOK NOW</a></td>
				</tr>
				<% }
			
					
					
					%>
					
				
			
				<%
				}
				%>

			</tbody>
		</table>
		<%} %>
</body>
</html>