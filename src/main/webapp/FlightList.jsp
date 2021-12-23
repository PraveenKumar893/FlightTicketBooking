<%@page import="Models.Flight_list"%>
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

	<%
			if (loggedInAsAdmin != null) {
			%>
					<a href="UserServlet" class="btn btn-primary">List all User Details</a>
					<a href="Addflight.jsp" class="btn btn-primary">Add Flight</a>
			         <a href="login.jsp" class="btn btn-primary">BACK</a>
			        <a href="bookinglist.jsp" class="btn btn-primary">BOOKINGDETAILS</a>
			         
					
			
				<% }
			
									%>
   

    

	<%
		List<Flight_list> flights = (List<Flight_list>)request.getAttribute("Flight_List");
		if (flights != null) {
		%>
		
		
		<table border="2">
			<h1><b>Flight List</b></h1>
			<thead>
				<tr>
				   <th >S.no</th>
					<th>Flight Id</th>
					<th>Flight name</th>
					<th>Departing From</th>
					<th>Departing To</th>
					<th>First Class</th>
					<th>Economy Class</th>
					<th>Business Class</th>
					
					
					<%
			if (loggedInAsAdmin != null) {
			%>
					<th scope= "col">UpdateFlight </th>
				<%}
				%>
					<%
			if (loggedInAsAdmin != null) {
			%>
					<th scope= "col">DeleteFlight </th>
				<%}
				%>
					
					
				</tr>
			</thead>
			<br>
			<br>
			
			<tbody>
				<%
					int i = 0;
					for (Flight_list flight : flights) {
						i++;
				%>
				<tr>
				
					
					<td><%=i%></td>
					<td><%=flight.getFlight_id()%></td>
					<td><%=flight.getFlight_name()%></td>
					<td><%=flight.getSource()%></td>
					<td><%=flight.getDestination()%></td>
					
					<td> <%=flight.getEconomy_class()%></td>
					<td> <%=flight.getPremium_Economy_class()%></td>
					<td> <%=flight.getBussiness_class()%></td>
					
					
					
						<%
			if (loggedInAsAdmin != null) {
			%>
					<td><a href="Updateflight.jsp?flightId=<%=flight.getFlight_id() %>" class="btn btn-primary">UpdateFlight</a></td>
				</tr>
				<% }
			
									%>
						<%
			if (loggedInAsAdmin != null) {
			%>
					<td><a href="Deleteflight.jsp?flightId=<%=flight.getFlight_id() %>" class="btn btn-primary">DeleteFlight</a></td>
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