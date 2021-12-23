<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 
  		<form name="addflight.form" action="DeleteFlight" method="post"  >
			
			<br /> <input type="number" name="Flight_id" value= "<%=request.getParameter("flightId")%>" readonly
				placeholder="FLIGHT_ID" required autofocus
				style="position: relative; left: 40px; height: 30px; top: -2px; width: 230px" />
				
				
				<button type="Submit"  required 
					style="position: relative; left: 40px; height: 30px; top: 110px; width: 230px">
				DELETE	</button>
				
  
 
 
</body>
</html>