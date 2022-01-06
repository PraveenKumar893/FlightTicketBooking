<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="cancelflight.form" action="FlightCancellation" method="post"  >
			
			<br /> <input type="number" name="seatno" value= "<%=request.getParameter("seatno")%>" readonly
				 required autofocus
				style="position: relative; left: 40px; height: 30px; top: -2px; width: 230px" />
				
				<input type="number" name="Flightid" value= "<%=request.getParameter("Flightid")%>" readonly
				 required autofocus
				style="position: relative; left: 40px; height: 30px; top: -2px; width: 230px" /><br><br>
				
				<input type="date" name="DepartureDate" value= "<%=request.getParameter("Departuredate")%>" readonly
				 required autofocus
				style="position: relative; left: 40px; height: 30px; top: -2px; width: 230px" /><br><br>
				
								<input type="text" name="Class" value= "<%=request.getParameter("Class")%>" readonly
				 required autofocus
				style="position: relative; left: 40px; height: 30px; top: -2px; width: 230px" /><br><br>
				
				
				
				<button type="Submit"  required 
					style="position: relative; left: 40px; height: 30px; top: 110px; width: 230px">
				Cancel	</button>
				
  
 
</body>
</html>