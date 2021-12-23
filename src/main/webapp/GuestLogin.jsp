<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GUESTLOGIN</title>
</head>
<body>
    		<form name="GuestForm" action="GuestLogin" method="post" >
    		
    		
    		      <input type="tel" id="phoneNumber" name="phoneNumber" pattern = "[6-9][0-9]{9}" 
				 placeholder="Enter Mobile Number" required  
				style="position: relative; left 46px; height: 30px; top: 35px; width: 230px" />
				
				
			<br> 
			
			
			 <input type="email" id="email" name="email" pattern = "[a-zA-z][A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}" 
				placeholder="Enter email address" required 
				style="position: relative; left: 1px; height: 33px; top: 55px; width: 228px" />
			
						<div style="text-align: center">
				<button type="Submit"  required 
					style="position: relative; left: 40px; height: 30px; top: 110px; width: 230px"><a href="FlightSearch.jsp">SIGNUp
					</a>
				
			</div>
			</form>
    		
    




</body>
</html>