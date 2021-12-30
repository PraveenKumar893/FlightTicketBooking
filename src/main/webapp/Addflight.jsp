<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <h1 style="text-align: center;">
				<b>ADD FLIGHT DETAILS</b></h1>
		<form name="addflight" action="AddFlightservlet" method="post"  >
			
			<br /> <input type="text" name="Flightname"  
				placeholder="FLIGHT_NAME" required autofocus
				style="position: relative; left: 40px; height: 30px; top: -2px; width: 230px" />
				
			<br> <input type="text" id="text" name="source" 
				placeholder="Enter Source" required 
				style="position: relative; left: 41px; height: 33px; top: 17px; width: 228px" />
			
			
			<br> <input type="text" name="Destination"
			  placeholder="Enter Destination " required
				autofocus  
				style="position: relative; left: 40px; height: 30px; top: 39px; width: 230px" />
				<br>
				
				<input type="number" name="Economyclass"placeholder="ECONOMY_CLASS" required
				style="position: relative; left: 40px; height: 30px; top: 62px; width: 230px" />
				
			<br> <input type="number" name="PremiumEconomyclass"
				placeholder="PREMIUM_ECONOMY_CLASS " required
				style="position: relative; left: 40px; height: 30px; top: 77px; width: 230px" /><br>
				
			<input type="number"  name="Bussinessclass" placeholder="Bussinessclass"
				value="Male" style="position: relative; left: 39px;height: 31px; top: 99px;width: 229px">
				<br> 
				
								<input type="date" name="ArrivalDate" placeholder = "ArrivalDate" required
				style="position: relative; left: 40px; height: 30px; top:120px; width: 230px" />
				<br>
				
								<input type="date" name="DepartureDate" placeholder = "ArrivalDate" required
				style="position: relative; left: 45px; height: 30px; top: 130px; width: 230px" />
				<br>
				
				<input type="time" name="Arrivaltime" placeholder = "ArrivalTime" required
				style="position: relative; left: 382px; height: 30px; top: -54px; width: 230px" />
				<br>
				
				
				
				<input type="number" name="ecomomy_seats" placeholder = "ecomomy_seats" required
				style="position: relative; left: 384px; height: 30px; top: -33px; width: 230px" />
				<br>
				
				
				<input type="number" name="premium_economy_seats" placeholder = "premium_economy_seats" required
				style="position: relative; left: 384px; height: 30px; top: -7px; width: 230px" />
				<br>
				
								<input type="number" name="business_seats" placeholder = "business_seats" required
				style="position: relative; left: 384px; height: 30px; top: 15px; width: 230px" />
				<br>
				
			
               



			<div style="text-align: center">
				<button type="Submit"  required 
					style="position: relative; left: 40px; height: 30px; top: 110px; width: 230px">
				AddFlight	</button>
			</div>
		</form>
    
</body>
</html>