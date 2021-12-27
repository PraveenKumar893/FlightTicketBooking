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

<style>
body {
	background-image: url(image/image_register.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
form {
  border: 3px solid #f1f1f1;
  width:30%;
  align:"center";
}
form {
  border: 3px solid #f1f1f1;
  width:30%;
  align:"center";
}

/* Full-width inputs */
input[type=text], input[type=password],input[type=email],input[type=radio],input[type=tel] {
  width: 43%;
  padding: 12px 20px;
  margin: 5px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
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

<%
Passenger_details passengers  = (Passenger_details) request.getAttribute("Passenger_Deatils");
		
		%>
		<main class="container-fluid">
		<h3 align="center">Confirm Details</h3>
		<div align="center">
		
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
				
				<input type="hidden"
				name="Economyclass" id="Economyclass" value="<%=passengers.getEconomyseat()%>"
				readonly /> 
			
			
				
				<input type="hidden"
				name="PremiumEconomyclass" id="PremiumEconomyclass" value="<%=passengers.getPremiumeconomyseats()%>"
				readonly  /> 
				
								
				
				<input type="hidden"
				name="Bussinessclass" id="Bussinessclass" value="<%=passengers.getBusinessseats()%>"
				readonly />  
				
				<input type="hidden"
				name="ticketno" id="ticketno" value="<%=passengers.getTicketNo()%>"
				readonly /> 
				
			<input type="hidden"
				name="amount" id="amount" value="<%=passengers.getAmount()%>"
				readonly /> <br /> <br /> 
				
				  <button type="submit">Submit</button>
				
				
				
				
		</form>		
				</div>
				</main>>
				
				
</body>
</html>