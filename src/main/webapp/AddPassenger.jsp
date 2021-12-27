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
   
 <style>
body {
	background-image: url(image/image_register.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
form {
  border: 3px solid #f1f1f1;
  width:41%;
  align:"center";
}
form {
  border: 3px solid #f1f1f1;
  width:41%;
  align:"center";
}

/* Full-width inputs */
input[type=text], input[type=password],input[type=date],input[type=number],input[type=tel] {
  width: 40%;
  padding: 7px 20px;
  left:80px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
  position : relative;
}

input[type=radio] {
  width: 18%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 62%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}

/* Extra style for the cancel button (red) */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the avatar image inside this container */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

/* Avatar image */
img.avatar {
  width: 23%;
  border-radius: 50%;
}

/* Add padding to containers */
.container {
  padding: 16px;
}

/* The "Forgot password" text */
span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
    display: block;
    float: none;
  }
  .cancelbtn {
    width: 100%;
  }

</style>
   
   	<main class="container-fluid">
		<h3 align="center">Booking Details </h3>
		<div align="center">
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
				<label for="departuredate">Departure Date:</label> 
			<input type="text"
				name="departuredate" id="destination" value="<%=request.getParameter("Departure_Date")%>"
				readonly /> <br /> <br /> 
				
				
				
				
				
			
			<input type="hidden"
				name="Economyclass" id="Economy" 
				readonly /> 
			
			
				
				<input type="hidden"
				name="PremiumEconomyclass" id="PremiumEconomy" 
				readonly  /> 
				
								
				
				<input type="hidden"
				name="Bussinessclass" id="Bussiness" 
				readonly /> 
				
				
			<input type="hidden"
				name="Economyclass" id="Economyclass" value="<%=request.getParameter("Economy_class")%>"
				readonly /> 
			
			
				
				<input type="hidden"
				name="PremiumEconomyclass" id="PremiumEconomyclass" value="<%=request.getParameter("Premium_Economy_class")%>"
				readonly  />  
				
								
				
				<input type="hidden"
				name="Bussinessclass" id="Bussinessclass" value="<%=request.getParameter("Bussiness_class")%>"
				readonly />  
				
				
				<label for="username">Passenger
				Name:</label> 
				<input type="text" name="username" id="username" required autofocus /> <br />
				
				 <br /> <br /> 
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
			
		
			  
					<label for="numberOfPassengers">Economy Price</label>
			
			<input type="text" id="firstClassPrice"
				value="<%=firstClassRate%>" readonly /> <br /> <br /> 
				
					<label for="numberOfPassengers">Premium Economy Price:</label>
				<input
				type="text" id="economyClassPrice" value="<%=economyClassRate%>"
				readonly /> <br /> <br /> 
					<label for="numberOfPassengers">Business Class Price:</label>
				<input type="text"
				id="businessClassPrice" value="<%=businessClassRate%>" readonly />
			<br /> <br /> <label for="price">Price:</label> <input
				type="number" id="price" name="price" readonly /> <br /> <br />
			<div style="text-align: center">
			 
               	 
			<button type="submit">ConfirmDetails</button>
			
				   	 
       
   
       
			</div>
		</form>
		</div>
		</main>
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
				document.getElementById("PremiumEconomy").value = seats;
               console.log(seats);
				
				break;
			}
			case "Economy": {
				price = numberOfPassengers * economyClassPrice;
				document.getElementById("price").value = price;
				
			
					  seats = economyseats - numberOfPassengers ;
					  console.log(seats);
					 // }
				document.getElementById("Economy").value = seats;




				break;
			}
			case "Bussiness": {
				price = numberOfPassengers * businessClassPrice;
				document.getElementById("price").value = price;
				seats  = Businesseats-numberOfPassengers;
			document.getElementById("Bussiness").value = seats;

				break;
			}
			}
			
		
			
		}	
		
		
	</script>
</body>
</html>