<%@page import="Models.Passenger_details"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Passenger_details passengers  = (Passenger_details) request.getAttribute("Passenger_Deatils");
		
		%>
		
		   		<form action="AddPassenger" method="post">
		
 
            <label for="username">UserName</label> 
				<input type="text" name="username" id="username" value="<%=passengers.getPassenger_name()%>"readonly /> 
				<br/>
				<br>
				<br>
            
				
				
				 <label for="coach">CoachDetails</label> 
            
			<input type="text"
				name="coach" id="flightId" value="<%=passengers.getClass_details()%>"
				readonly /> <br /> <br /> 
				
				
				 <label for="MobileNumber">MobileNumber</label> 
            
			<input type="text"
				name="MobileNumber" id="MobileNumber" value="<%=passengers.getMobile_number()%>"
				readonly /> <br /> <br /> 
				
				
				 <label for="source">Source</label> 
            
			<input type="text"
				name="source" id="flightId" value="<%=passengers.getSource()%>"
				readonly /> <br /> <br /> 
				
				
				 <label for="destination">Destination</label> 
            
			<input type="text"
				name="destination" id="flightId" value="<%=passengers.getDestination()%>"
				readonly /> <br /> <br /> 
				
				 <label for="bookingDate">BookingDate</label> 
            
			<input type="text"
				name="bookingDate" id="flightId" value="<%=passengers.getArrival_date()%>"
				readonly /> <br /> <br /> 
				
				 <label for="numberOfPassengers">NoOfPassengers</label> 
            
			<input type="text"
				name="numberOfPassengers" id="flightId" value="<%=passengers.getNoOfPassengers()%>"
				readonly /> <br /> <br /> 
				
				
				            <label for="flightId">Flight Id:</label>
			<input type="text"
				name="flightId" id="flightId" value="<%=passengers.getFlight_id()%>"
				readonly /> <br /> <br /> 
				
				
				
				<button type="submit">Submit</button>
				
				
		</form>		
				
				
				
</body>
</html>