
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
<title>Insert title here</title>
</head>
<body>

    <h1 style="text-align: center;">
				<b>UPDATE  FLIGHT DETAILS</b></h1>
		<form name="addflight" action="UpdateFlight" method="post"  >
		
						    <input type="number"  name="Flightid" value="<%=request.getParameter("flightId")%>" readonly   placeholder="Flight_id"  
				style="position: relative; left:38px; height: 31px; top: -14px;width: 250px" />
		<br>
			
			<%
			
			String flightId = request.getParameter("flightId");
			
			int Flight_Id = Integer.parseInt(flightId);
			
			FlightSearchDao flightDao = new FlightSearchDao();
			Flight_list flight = flightDao.getRecordById(Flight_Id);
			int businessClassRate = flight.getBussiness_class();
			int economyClassRate = flight.getPremium_Economy_class();
			int firstClassRate = flight.getEconomy_class();
			String source = flight.getSource();
			String destination = flight.getDestination();
			String flightname = flight.getFlight_name();
			
			
			%>
			
			
			<br /> <input type="text" name="Flightname" value="<%=flightname%>" 
				placeholder="FLIGHT_NAME"  autofocus
				style="position: relative; left: 40px; height: 30px; top: -2px; width: 230px" />
				
			<br> <input type="text" id="text" name="source" value="<%=source%>"  
				placeholder="Enter Source"  
				style="position: relative; left: 41px; height: 33px; top: 17px; width: 228px" />
			
			
			<br> <input type="text" name="Destination" value="<%=destination%>"  
			  placeholder="Enter Destination " 
				autofocus  
				style="position: relative; left: 40px; height: 30px; top: 39px; width: 230px" />
				<br>
				
				<input type="number" name="Economyclass"placeholder="ECONOMY_CLASS" value="<%=economyClassRate%>"  
				style="position: relative; left: 40px; height: 30px; top: 62px; width: 230px" />
				
			<br> <input type="number" name="PremiumEconomyclass" value="<%=businessClassRate%>"  
				placeholder="PREMIUM_ECONOMY_CLASS " 
				style="position: relative; left: 40px; height: 30px; top: 77px; width: 230px" /><br>
				
			<input type="number"  name="Bussinessclass" placeholder="Bussinessclass" value="<%=firstClassRate%>"  
				value="Male" style="position: relative; left: 39px;height: 31px; top: 99px;width: 229px">
				<br> 
				
				
				
				
			<br> 
			
			
			
			
               



			<div style="text-align: center">
				<button type="Submit"  required 
					style="position: relative; left: 40px; height: 30px; top: 110px; width: 230px">
				SIGNUp	</button>
			</div>
		</form>
		
    

</body>
</html>

