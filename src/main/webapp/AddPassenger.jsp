<%@page import="Models.Flight_list"%>
<%@page import="Dao.FlightSearchDao"%>
<%@page import="Services.FlightService"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FlightApp - Add Passengers details</title>
</head>
<body>
   
   		<form action="ConfirmDetails" method="post">
			<h1>Booking Details</h1>
			<label for="flightId">Flight Id:</label> 
			<input type="text"
				name="flightId" id="flightId" value="<%=request.getParameter("flightId")%>"
				readonly /> <br /> <br /> 
				<label for="source">Source:</label> 
			<input type="text"
				name="source" id="source" value="<%=request.getParameter("source")%>"
				readonly /> <br /> <br /> 
				<label for="destination">Destination:</label> 
			<input type="text"
				name="destination" id="destination" value="<%=request.getParameter("destination")%>"
				readonly /> <br /> <br /> 
				<label for="departuredate">DEPARTURE DATE:</label> 
			<input type="text"
				name="departuredate" id="destination" value="<%=request.getParameter("Departure_Date")%>"
				readonly /> <br /> <br /> 
				<label for="Economy_class">Economy_class:</label> 
			<input type="number"
				name="Economyclass" id="Economyclass" value="<%=request.getParameter("Economy_class")%>"
				readonly /> <br /> <br /> 
			
			<label for="Premium_Economy_class">Premium_Economy_class:</label> 
				
				<input type="number"
				name="PremiumEconomyclass" id="PremiumEconomyclass" value="<%=request.getParameter("Premium_Economy_class")%>"
				readonly /> <br /> <br /> 
				
								<label for="Bussiness_class">Bussiness_class:</label> 
				
				<input type="number"
				name="Bussinessclass" id="Bussinessclass" value="<%=request.getParameter("Bussiness_class")%>"
				readonly /> <br /> <br /> 
				
				
				<label for="username">Passenger
				Name:</label> 
				<input type="text" name="username" id="username" required autofocus /> <br />
				
				<label for="bookingDate">Booking Date:</label> <input
				type="date" name="bookingDate" id="bookingDate" placeholder="Enter booking date"
				min="<%=LocalDate.now()%>" required autofocus /> <br /> <br /> 
				<label for="MobileNumber">Mobile No:</label> <input
				type="text" name="MobileNumber"  placeholder="Enter mobile number"
				 required autofocus /> <br /> <br />
				 
				 				<label for="coach">Coach:</label> 
				  
				<select name="coach" id="coach"  >
                
                <option value="Bussiness">Business Class</option>
                <option value="Economy">economy</option>
                <option value="premium">Premium Economy</option>
              </select>
             
			 <br>
			
			<label for="numberOfPassengers">Number of passengers:</label>
			<input type="number" id="numberOfPassengers"
				name="numberOfPassengers"  min="0" max="8"
				placeholder="Enter passengers count" oninput="calc()" required autofocus /> <br />
				
			<br />
			
			
			 
			<%
			
			String flightId = request.getParameter("flightId");
			
			int Flight_Id = Integer.parseInt(flightId);
			FlightSearchDao flightDao = new FlightSearchDao();
			Flight_list flight = flightDao.getRecordById(Flight_Id);
			int businessClassRate = flight.getBussiness_class();
			int economyClassRate = flight.getPremium_Economy_class();
			int firstClassRate = flight.getEconomy_class();
			
			
			
			%>
			
		
			  
				
			
			<input type="text" id="firstClassPrice"
				value="<%=firstClassRate%>" readonly /> <br /> <br /> <input
				type="text" id="economyClassPrice" value="<%=economyClassRate%>"
				readonly /> <br /> <br /> <input type="text"
				id="businessClassPrice" value="<%=businessClassRate%>" readonly />
			<br /> <br /> <label for="price">Price:</label> <input
				type="number" id="price" name="price" readonly /> <br /> <br />
			<div style="text-align: center">
			 
               	 
			<button type="submit">ConfirmDetails</button>
			
				   	 
       
   
       
			</div>
		</form>
   	<script>
		function calc() {
			event.preventDefault();
			
			
			let coach = document.getElementById("coach").value;
				console.log(coach);
				
				
				
			let numberOfPassengers = document.getElementById("numberOfPassengers").value;
			let economyClassPrice = document.getElementById("economyClassPrice").value;
			let businessClassPrice = document.getElementById("businessClassPrice").value;
			let firstClassPrice = document.getElementById("firstClassPrice").value;
			let premiumseats = document.getElementById("PremiumEconomyclass").value;
			let Businesseats = document.getElementById("Bussinessclass").value;
			let economyseats = document.getElementById("Economyclass").value;
			
			let price = 0;
			let seats = 0;
			
			switch (coach) {
			case "premium": {
				price = numberOfPassengers * firstClassPrice;
				document.getElementById("price").value = price;
				seats  = premiumseats-numberOfPassengers;
				document.getElementById("PremiumEconomyclass").value = seats;
				
				break;
			}
			case "Economy": {
				price = numberOfPassengers * economyClassPrice;
				document.getElementById("price").value = price;
				seats  = economyseats-numberOfPassengers;
				document.getElementById("Economyclass").value = seats;


				break;
			}
			case "Bussiness": {
				price = numberOfPassengers * businessClassPrice;
				document.getElementById("price").value = price;
				seats  = Businesseats-numberOfPassengers;
			document.getElementById("Bussinessclass").value = seats;

				break;
			}
			}
		}	
		
		
	</script>
</body>
</html>